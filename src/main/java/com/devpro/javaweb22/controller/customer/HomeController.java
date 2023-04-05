package com.devpro.javaweb22.controller.customer;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.devpro.javaweb22.controller.BaseController;
import com.devpro.javaweb22.dto.ProductSearch;
import com.devpro.javaweb22.model.Categories;
import com.devpro.javaweb22.model.Product;
import com.devpro.javaweb22.services.BaseService;
import com.devpro.javaweb22.services.CategoriesService;
import com.devpro.javaweb22.services.PagerData;
import com.devpro.javaweb22.services.ProductService;

@Controller
public class HomeController extends BaseController {
	@Autowired
	private ProductService productService;
	@Autowired 
	private CategoriesService categoriesService;
	@RequestMapping(value = { "/home" }, method = RequestMethod.GET)
	public String home(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response)
			throws IOException {
		// khởi tạo 1 product(entity) mới
		// lấy product trong database theo productid
		List<Product> products = productService.findAll();
		model.addAttribute("products", products); // đẩy data xuống view
		return "customer/home";
	}

	@RequestMapping(value = { "/home/{productId}" }, method = RequestMethod.GET)
	public String detail_product(final Model model, final HttpServletRequest request,
			final HttpServletResponse response, @PathVariable("productId") Integer productId) throws IOException {
		// lấy product trong database theo productid
		Product product = productService.getById(productId);
		model.addAttribute("product", product); // đẩy data xuống view

		// trả về view
		return "customer/detail_product";
	}

	@RequestMapping(value = { "/category/{parentcategoryId}" }, method = RequestMethod.GET)
	public String product_category_parent(final Model model, final HttpServletRequest request,
			final HttpServletResponse response, @PathVariable("parentcategoryId") Integer parentcategoryId) throws IOException {
		// khởi tạo 1 product(entity) mới
		// lấy product trong database theo categoryId
		Integer currentPage = BaseService.NO_PAGING;
		try {
			currentPage = Integer.parseInt(request.getParameter("page"));
		} catch (Exception e) {

		}
		;
		ProductSearch productSearch = new ProductSearch();
		productSearch.setCurrentPage(currentPage);
		Categories categoryByID = categoriesService.getById(parentcategoryId);
		List<Categories> cateoryBYParentID = categoriesService.getCategoryByParentId(parentcategoryId);
		PagerData<Product> products = productService.searchProductbyParentCategory(parentcategoryId, productSearch);
		model.addAttribute("productSearch", productSearch);
		model.addAttribute("products", products); // đẩy data xuống view
		model.addAttribute("categoryByID", categoryByID);
		model.addAttribute("cateoryBYParentID", cateoryBYParentID);
		return "customer/product_category";
	}
	
	@RequestMapping(value = { "/category/{parentcategoryId}/{categoryId}" }, method = RequestMethod.GET)
	public String product_category(final Model model, final HttpServletRequest request,
			final HttpServletResponse response, @PathVariable("parentcategoryId") Integer parentcategoryId
			, @PathVariable("categoryId") Integer categoryId) throws IOException {
		// khởi tạo 1 product(entity) mới
		// lấy product trong database theo categoryId
		Integer currentPage = BaseService.NO_PAGING;
		try {
			currentPage = Integer.parseInt(request.getParameter("page"));
		} catch (Exception e) {

		}
		;
		ProductSearch productSearch = new ProductSearch();
		productSearch.setCurrentPage(currentPage);
		Categories categoryByID = categoriesService.getById(parentcategoryId);
		List<Categories> cateoryBYParentID = categoriesService.getCategoryByParentId(parentcategoryId);
		PagerData<Product> products = productService.searchProductCategory(parentcategoryId, categoryId, productSearch);
		model.addAttribute("productSearch", productSearch);
		model.addAttribute("products", products); // đẩy data xuống view
		model.addAttribute("categoryByID", categoryByID);
		model.addAttribute("cateoryBYParentID", cateoryBYParentID);
		return "customer/product_category1";
	}
}
