package com.devpro.javaweb22.controller.administrator;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.devpro.javaweb22.dto.ProductSearch;
import com.devpro.javaweb22.dto.SaleOrderSearch;
import com.devpro.javaweb22.model.Product;
import com.devpro.javaweb22.model.SaleOrder;
import com.devpro.javaweb22.model.SaleOrderProducts;
import com.devpro.javaweb22.services.BaseService;
import com.devpro.javaweb22.services.PagerData;
import com.devpro.javaweb22.services.ProductService;
import com.devpro.javaweb22.services.SaleOrderService;
@Controller
public class AdminSaleOrderController {
	@Autowired
	SaleOrderService saleOrderService;
	@Autowired
	ProductService productService;
	@RequestMapping(value = { "/admin/saleorder/list" }, method = RequestMethod.GET)
	public String adminSaleorderList(final Model model, 
								   final HttpServletRequest request,
								   final HttpServletResponse response) throws IOException {
		
		// lấy email
		String email = request.getParameter("email");
		
		Integer currentPage = BaseService.NO_PAGING;
		try {
			currentPage = Integer.parseInt(request.getParameter("page"));
		}catch(Exception e) {
			
		};
		SaleOrderSearch saleOrderSearch = new SaleOrderSearch();
		saleOrderSearch.setEmail(email);
		saleOrderSearch.setCurrentPage(currentPage);
		PagerData<SaleOrder> saleOrders = saleOrderService.searchSaleOrder(saleOrderSearch);
		model.addAttribute("saleOrderSearch", saleOrderSearch);
		model.addAttribute("saleOrders", saleOrders);
		
		return "administrator/sale_order_list";
		
	}
	@RequestMapping(value = { "/admin/saleorder/list/{saleorderId}" }, method = RequestMethod.GET)
	public String adminSaleorderProductList(final Model model, 
								   final HttpServletRequest request,
								   final HttpServletResponse response,
								   @PathVariable("saleorderId") Integer saleorderId) throws IOException {
		
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
				PagerData<Product> products = productService.searchProductBySaleOrderId(saleorderId, productSearch);
				model.addAttribute("productSearch", productSearch);
				model.addAttribute("products", products);				
				return "administrator/product_list";
		
	}
}
