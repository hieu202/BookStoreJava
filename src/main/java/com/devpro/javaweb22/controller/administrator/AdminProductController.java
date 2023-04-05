package com.devpro.javaweb22.controller.administrator;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.devpro.javaweb22.controller.BaseController;
import com.devpro.javaweb22.dto.ProductSearch;
import com.devpro.javaweb22.model.Product;
import com.devpro.javaweb22.services.BaseService;
import com.devpro.javaweb22.services.PagerData;
import com.devpro.javaweb22.services.ProductService;

@Controller
public class AdminProductController extends BaseController {

	@Autowired
	private ProductService productService;
	
	@RequestMapping(value = { "/admin/product/management" }, method = RequestMethod.GET)
	public String addOrUpdateView(final Model model, 
								  final HttpServletRequest request,
							  	  final HttpServletResponse response) throws IOException {
		// khởi tạo 1 product(entity) mới
		Product newProduct = new Product();
		model.addAttribute("product", newProduct); // đẩy data xuống view
		
		// trả về view
		return "administrator/product_management";
	}
	
	@RequestMapping(value = { "/admin/product/management/{productId}" }, method = RequestMethod.GET)
	public String addOrUpdateView(final Model model, 
								  final HttpServletRequest request,
							  	  final HttpServletResponse response,
							  	  @PathVariable("productId") Integer productId) throws IOException {
		// lấy product trong database theo productid
		Product product = productService.getById(productId);
		model.addAttribute("product", product); // đẩy data xuống view
		
		// trả về view
		return "administrator/product_management";
	}
	
	/**
	 * do trong springform ko hỗ trợ thẻ file nên phải sử dụng html input
	 * và sử dụng @RequestParam("{name of input tag}" 
	 */
	@RequestMapping(value = { "/admin/product/management/saveOrUpdate" }, method = RequestMethod.POST)
	public String addOrUpdateStore(final Model model, 
							   	   final HttpServletRequest request,
						  	   	   final HttpServletResponse response,
						  	   	   @ModelAttribute("product") Product product,
						  	   	   @RequestParam("productAvatar") MultipartFile productAvatar,
								   @RequestParam("productPictures") MultipartFile[] productPictures) throws IOException {
		if(product.getId() == null || product.getId() <= 0) {
			productService.addProduct(product, productAvatar, productPictures);
		} else {
			productService.editProduct(product, productAvatar, productPictures);
		}
		// trả về view(list), sử dụng redirect để chuyển hướng request.
		return "redirect:/admin/product/list";
	}
	
	@RequestMapping(value = { "/admin/product/list" }, method = RequestMethod.GET)
	public String adminProductList(final Model model, 
								   final HttpServletRequest request,
								   final HttpServletResponse response) throws IOException {
		
		// lấy keyword
		String keyword = request.getParameter("keyword");
		// lấy categoryId
		String categoryId = request.getParameter("categoryId");
		Integer currentPage = BaseService.NO_PAGING;
		try {
			currentPage = Integer.parseInt(request.getParameter("page"));
		}catch(Exception e) {
			
		};
		ProductSearch productSearch = new ProductSearch();
		productSearch.setKeyword(keyword);
		productSearch.setCategoryId(categoryId);
		productSearch.setCurrentPage(currentPage);
		PagerData<Product> products = productService.searchProduct(productSearch);
		model.addAttribute("productSearch", productSearch);
		model.addAttribute("products", products);
		
		return "administrator/product_list";
		
	}
	
	
}
