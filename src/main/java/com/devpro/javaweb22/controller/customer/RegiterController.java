package com.devpro.javaweb22.controller.customer;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.devpro.javaweb22.model.Product;
import com.devpro.javaweb22.model.Role;
import com.devpro.javaweb22.model.User;
import com.devpro.javaweb22.services.RoleService;
import com.devpro.javaweb22.services.UserService;
@Controller
public class RegiterController {
	@Autowired 
	UserService userService;
	@Autowired
	RoleService roleService;
	@RequestMapping(value = { "/regiter" }, method = RequestMethod.GET)
	public String home(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response)
			throws IOException {
		
		return "customer/register";
	}
	@RequestMapping(value = { "/regiter/addUser" }, method = RequestMethod.POST)
	public String addUser(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response)
			throws IOException {
		String username = request.getParameter("username");
		String email = request.getParameter("email");
		String shippingAddress = request.getParameter("shippingAddress");
		String phone = request.getParameter("phone");		 
		String password = new BCryptPasswordEncoder(4).encode(request.getParameter("password")) ;
		//String password = request.getParameter("password");
		User user = new User();
		user.setUsername(username);
		user.setPassword(password);
		user.setEmail(email);
		user.setPhone(phone);
		user.setShippingAddress(shippingAddress);
		Role role = roleService.getById(17);
		role.addUsers(user);
		user.addRoles(role);
		userService.saveOrUpdate(user);
		return "redirect:/home";
	}
}
