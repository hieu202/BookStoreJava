package com.devpro.javaweb22.controller.customer;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.devpro.javaweb22.controller.BaseController;
import com.devpro.javaweb22.model.Cart;
import com.devpro.javaweb22.model.CartItem;
import com.devpro.javaweb22.model.Product;
import com.devpro.javaweb22.services.ProductService;
import com.devpro.javaweb22.services.SaleOrderService;
import com.devpro.javaweb22.model.SaleOrder;
import com.devpro.javaweb22.model.SaleOrderProducts;
@Controller
public class CartController extends BaseController {
	@Autowired
	ProductService productService;
	@Autowired
	SaleOrderService saleOrderService;
	// màn hình thanh toán
	@RequestMapping(value = { "/cart" }, method = RequestMethod.GET)
	public String cart(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response)
			throws IOException {
		
		return "customer/cart";
	}
	@RequestMapping(value = { "/cart/checkInfo" }, method = RequestMethod.GET)
	public String cart_checkInfo(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response)
			throws IOException {
		
		return "customer/cart_checkinfo";
	}
	// tạo hóa đơn
		@RequestMapping(value = { "/cart/checkInfo" }, method = RequestMethod.POST)
		public String cartFinished(final Model model, 
							   		final HttpServletRequest request, 
						   			final HttpServletResponse response) throws IOException {
			
			// Lấy thông tin khách hàng
			String customerFullName = request.getParameter("customerFullName");
			String customerEmail 	= request.getParameter("customerEmail");
			String customerPhone 	= request.getParameter("customerPhone");
			String customerAddress 	= request.getParameter("customerAddress");
			String total = request.getParameter("totalPriceEnd");
			BigDecimal totalDecimal = null;
			SaleOrder saleOrder = new SaleOrder();

			try {
			    String totalStr = (String)total.replaceAll(" ", ""); // Thay thế chuỗi này bằng biến chứa giá trị thực tế
			    if (totalStr.matches("\\d+(\\.\\d+)?")) {
			        totalDecimal = new BigDecimal(totalStr);
			        saleOrder.setTotal(totalDecimal);
			    } else {
			        // Xử lý trường hợp chuỗi không hợp lệ ở đây
			    }
			} catch (NumberFormatException e) {
			    // Xử lý ngoại lệ NumberFormatException ở đây
			}

			
			// tạo hóa đơn + với thông tin khách hàng lấy được
			
			saleOrder.setCustomerName(customerFullName);
			saleOrder.setCustomerEmail(customerEmail);
			saleOrder.setCustomerAddress(customerAddress);
			saleOrder.setCustomerPhone(customerPhone);	
			saleOrder.setCode(String.valueOf(System.currentTimeMillis())); // mã hóa đơn: HD20230314
			
			
			// lấy giỏ hàng
			HttpSession session = request.getSession();
			Cart cart = (Cart) session.getAttribute("cart");
			session.setAttribute("totalPrice", calculateTotalPrice(request));

			
			// lấy sản phẩm trong giỏ hàng
			for (CartItem cartItem : cart.getCartItems()) {
				SaleOrderProducts saleOrderProducts = new SaleOrderProducts();
				saleOrderProducts.setProduct(productService.getById(cartItem.getProductId()));
				saleOrderProducts.setQuality(cartItem.getQuanlity());

				// sử dụng hàm tiện ích add hoặc remove đới với các quan hệ onetomany
				saleOrder.addSaleOrderProducts(saleOrderProducts);
			}
			
			// lưu hóa đơn vào database
			saleOrderService.saveOrUpdate(saleOrder);
			
			// thực hiện reset lại giỏ hàng của Session hiện tại
			session.setAttribute("cart", null);
			session.setAttribute("TongSoLuongSanPhamTrongGioHang", 0);
			session.setAttribute("totalPriceEnd", 0);
			return "customer/cart_success"; // -> đường dẫn tới View.
			
		}
	@RequestMapping(value = { "/ajax/addToCart" }, method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> ajax_AddToCart(final Model model,
														       final HttpServletRequest request,
														       final HttpServletResponse response, 
														       final @RequestBody CartItem cartItem) {

		System.out.println("How to debug code in eclipse ide");
		
		// để lấy session sử dụng thông qua request
		// session tương tự như kiểu Map và được lưu trên main memory.
		// mỗi trình duyệt sẽ có các session khác nhau
		HttpSession session = request.getSession();

		// Lấy thông tin giỏ hàng. Đầu tiên giả sử giỏ hàng là null(chưa có giỏ hàng)
		Cart cart = null;
		
		// kiểm tra xem session có tồn tại đối tượng nào tên là "cart"
		if (session.getAttribute("cart") != null) { // tồn tại 1 giỏ hàng trên session
			cart = (Cart) session.getAttribute("cart");
		} else {// chưa có giỏ hàng nào trên session
			cart = new Cart(); //khởi tạo giỏ hàng mới
			session.setAttribute("cart", cart);
		}

		// Lấy danh sách sản phẩm đang có trong giỏ hàng
		List<CartItem> cartItems = cart.getCartItems();

		// kiểm tra nếu sản phẩm muốn bổ sùng vào giỏ hàng có trong giỏ hàng nếu có thì tăng số lượng
		boolean isExists = false;
		for (CartItem item : cartItems) {
			if (item.getProductId() == cartItem.getProductId()) {
				isExists = true;
				// tăng số lượng sản phẩm lên
				item.setQuanlity(item.getQuanlity() + cartItem.getQuanlity());
			}
		}

		// nếu sản phẩm chưa có trong giỏ hàng thì thực hiện add sản phẩm đó vào giỏ hàng
		if (!isExists) {
			// trước khi thêm mới thì lấy sản phẩm trong db
			// và thiết lập tên + đơn giá cho cartitem
			Product productInDb = productService.getById(cartItem.getProductId());

			cartItem.setProductName(productInDb.getTitle());
			cartItem.setPriceUnit(productInDb.getPriceSale());
			cartItem.setAvatar(productInDb.getAvatar());

			cart.getCartItems().add(cartItem); // thêm mới sản phẩm vào giỏ hàng
		}

		// tính tổng tiền
//		this.calculateTotalPrice(request);
		session.setAttribute("totalPrice", calculateTotalPrice(request));

		// trả về kết quả
		Map<String, Object> jsonResult = new HashMap<String, Object>();
		jsonResult.put("code", 200);
		jsonResult.put("status", "TC");
		jsonResult.put("totalItems", getTotalItems(request));
		
		// lưu totalItems vào session
		// tất cả các giá trị lưu trên session đều có thể truy cập được từ View
		session.setAttribute("TongSoLuongSanPhamTrongGioHang", getTotalItems(request));
		
		return ResponseEntity.ok(jsonResult);
	}
	@RequestMapping(value = { "/ajax/updateToCart" }, method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> ajax_UpdateToCart(final Model model,
														       final HttpServletRequest request,
														       final HttpServletResponse response, 
														       final @RequestBody CartItem cartItem) {

		
		
		// để lấy session sử dụng thông qua request
		// session tương tự như kiểu Map và được lưu trên main memory.
		// mỗi trình duyệt sẽ có các session khác nhau
		HttpSession session = request.getSession();

		// Lấy thông tin giỏ hàng. Đầu tiên giả sử giỏ hàng là null(chưa có giỏ hàng)
		Cart cart = null;
		
		// kiểm tra xem session có tồn tại đối tượng nào tên là "cart"
		if (session.getAttribute("cart") != null) { // tồn tại 1 giỏ hàng trên session
			cart = (Cart) session.getAttribute("cart");
		} else {// chưa có giỏ hàng nào trên session
			cart = new Cart(); //khởi tạo giỏ hàng mới
			session.setAttribute("cart", cart);
		}

		// Lấy danh sách sản phẩm đang có trong giỏ hàng
		List<CartItem> cartItems = cart.getCartItems();

		// kiểm tra nếu có trong giỏ hàng thì tăng số lượng
		int currentProductQuality = 0;
		for(CartItem item : cartItems) {
			if(item.getProductId() == cartItem.getProductId()) {
				currentProductQuality = item.getQuanlity() + cartItem.getQuanlity();
				item.setQuanlity(currentProductQuality);
			}
		}

		// tính tổng tiền
//		this.calculateTotalPrice(request);
		
		// trả về kết quả
		Map<String, Object> jsonResult = new HashMap<String, Object>();
		jsonResult.put("code", 200);
		jsonResult.put("status", "TC");
		jsonResult.put("totalItems", getTotalItems(request));
		jsonResult.put("currentProductQuality", currentProductQuality);
		// lưu totalItems vào session
		// tất cả các giá trị lưu trên session đều có thể truy cập được từ View
		session.setAttribute("TongSoLuongSanPhamTrongGioHang", getTotalItems(request));
		session.setAttribute("totalPrice", calculateTotalPrice(request));

		return ResponseEntity.ok(jsonResult);
	}
	
	@RequestMapping(value = { "/ajax/deleteToCart" }, method = RequestMethod.DELETE)
	public ResponseEntity<Map<String, Object>> ajax_DeleteToCart(final Model model,
														       final HttpServletRequest request,
														       final HttpServletResponse response, 
														       final @RequestBody CartItem cartItem) {

		
		
		// để lấy session sử dụng thông qua request
		// session tương tự như kiểu Map và được lưu trên main memory.
		// mỗi trình duyệt sẽ có các session khác nhau
		HttpSession session = request.getSession();

		// Lấy thông tin giỏ hàng. Đầu tiên giả sử giỏ hàng là null(chưa có giỏ hàng)
		Cart cart = null;
		
		// kiểm tra xem session có tồn tại đối tượng nào tên là "cart"
		if (session.getAttribute("cart") != null) { // tồn tại 1 giỏ hàng trên session
			cart = (Cart) session.getAttribute("cart");
		} else {// chưa có giỏ hàng nào trên session
			cart = new Cart(); //khởi tạo giỏ hàng mới
			session.setAttribute("cart", cart);
		}

		// Lấy danh sách sản phẩm đang có trong giỏ hàng
		List<CartItem> cartItems = cart.getCartItems();

		// kiểm tra nếu có trong giỏ hàng thì tăng số lượng
		int currentProductQuality = 0;
		Iterator<CartItem> iterator = cartItems.iterator();
//		for(CartItem item : cartItems) {
//			if(item.getProductId() == cartItem.getProductId()) {
//				cartItems.remove(item);
//			}
//		}
		while (iterator.hasNext()) {
        if(iterator.next().getProductId() == cartItem.getProductId()) {
        	iterator.remove();
        }
    }

		// tính tổng tiền
		
//		this.calculateTotalPrice(request);
		this.calculateTotalPrice(request);
		
		// trả về kết quả
		Map<String, Object> jsonResult = new HashMap<String, Object>();
		jsonResult.put("code", 200);
		jsonResult.put("status", "TC");
		jsonResult.put("totalItems", getTotalItems(request));
		jsonResult.put("currentProductQuality", currentProductQuality);
		// lưu totalItems vào session
		// tất cả các giá trị lưu trên session đều có thể truy cập được từ View
		session.setAttribute("TongSoLuongSanPhamTrongGioHang", getTotalItems(request));
		session.setAttribute("totalPrice", calculateTotalPrice(request));
		return ResponseEntity.ok(jsonResult);
	}

	private double calculateTotalPrice(HttpServletRequest request) {
		// TODO Auto-generated method stub
		HttpSession httpSession = request.getSession();

		if (httpSession.getAttribute("cart") == null) {
			return 0;
		}
		Cart cart = (Cart) httpSession.getAttribute("cart");
		List<CartItem> cartItems = cart.getCartItems();
		double totalPrice = 0;
		for (CartItem item : cartItems) {
			totalPrice += (double)(item.getQuanlity() * item.getPriceUnit().doubleValue());
		}
		return totalPrice;
		
	}
	private int getTotalItems(final HttpServletRequest request) {
		HttpSession httpSession = request.getSession();

		if (httpSession.getAttribute("cart") == null) {
			return 0;
		}

		Cart cart = (Cart) httpSession.getAttribute("cart");
		List<CartItem> cartItems = cart.getCartItems();

		int total = 0;
		for (CartItem item : cartItems) {
			total += item.getQuanlity();
		}

		return total;
	}
}
