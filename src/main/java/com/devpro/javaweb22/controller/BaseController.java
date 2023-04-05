package com.devpro.javaweb22.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.devpro.javaweb22.model.Categories;
import com.devpro.javaweb22.services.CategoriesService;
import com.devpro.javaweb22.model.User;

public class BaseController {
	@Autowired
	private CategoriesService categoriesService;
	
	/**
	 * tất cả các request-mapping của child-controller extends từ basecontroller
	 * sẽ tự động gọi các hàm có sử dụng @ModelAttribute
	 * kết quả của hàm sẽ tự động đẩy xuống view
	 */
	@ModelAttribute("categories")
	public List<Categories> getAllCategories() {
		return categoriesService.findAll();
	}
	
	@ModelAttribute("parentCategories")
	public List<Categories> getAllCategoriesByParentIdNULL() {
		return categoriesService.getCategoryByParentIdNull();
	}
	
	@ModelAttribute("categories1")
	public List<Categories> getAllCategories1() {
		return categoriesService.getCategoryByParentId(1);
	}
	
	
	
	/**
	 * trả về entity User chính là user logined
	 * User logined có thể truy cập thông qua class SecurityContextHolder
	 * @return
	 */
	@ModelAttribute("userLogined")
	public User getUserLogined() {
		Object userLogined = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		if(userLogined != null && userLogined instanceof UserDetails)
			return (User) userLogined;
		
		return new User();
	}
	
	/**
	 * Kiểm tra xem người dùng đã đăng nhập chưa?
	 * User logined có thể truy cập thông qua class SecurityContextHolder
	 * @return true|false, true nếu đã login ngược lại trả về false
	 */
	@ModelAttribute("isLogined")
	public boolean isLogined() {
		boolean isLogined = false;
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		if (principal != null && principal instanceof UserDetails) {
			isLogined = true;
		}
		
		return isLogined;
	}
}
