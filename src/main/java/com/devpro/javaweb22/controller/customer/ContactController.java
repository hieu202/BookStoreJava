package com.devpro.javaweb22.controller.customer;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.devpro.javaweb22.dto.ContactDTO;
import com.devpro.javaweb22.model.Contact;
import com.devpro.javaweb22.services.ContactService;

@Controller

public class ContactController {
	//ịnect một bean vào trong một bean sử dụng @Autowired
		@Autowired
		private ContactService contactService;
	@RequestMapping(value = {"/contact"} , method = RequestMethod.GET ) 
	public String contact(final ModelMap model,
						final HttpServletRequest request,
						final HttpServletResponse response)
						throws IOException{	
		ContactDTO contactDTO = new ContactDTO();
		model.addAttribute("contactDTO", contactDTO);
		return "customer/contact";
	}
	@RequestMapping(value = { "/contact-post-using-spring-form" }, method = RequestMethod.POST)
	public String contact_post_using_spring_form(final Model model, 
									   	  		 final HttpServletRequest request,
								   	  		 	 final HttpServletResponse response, 
								   	  		 	 final @ModelAttribute("contactDTO") ContactDTO contactDTO)
								   	  		 			 throws IOException {
		
		
		// lưu contact entity vào trong database sử dụng service thích hợp
		Contact contact = new Contact();
		contact.setFirstName(contactDTO.getFirstName());
		contact.setLastName(contactDTO.getLastName());
		contact.setEmail(contactDTO.getEmail());
		contact.setMessage(contactDTO.getMessage());
		contactService.saveOrUpdate(contact);
		
		return "customer/contact";
	}
}
