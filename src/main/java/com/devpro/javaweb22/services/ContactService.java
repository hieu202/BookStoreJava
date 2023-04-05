package com.devpro.javaweb22.services;

import org.springframework.stereotype.Service;

import com.devpro.javaweb22.model.Contact;

/**
 * Tạo một bean Service. Các bean Services được tạo dùng để thao tác với Entities.
 */
@Service
public class ContactService extends BaseService<Contact> {

	@Override
	protected Class<Contact> clazz() {
		return Contact.class;
	}
	
}
