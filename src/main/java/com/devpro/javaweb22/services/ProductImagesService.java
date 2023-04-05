package com.devpro.javaweb22.services;

import org.springframework.stereotype.Service;

import com.devpro.javaweb22.model.ProductImages;
import com.devpro.javaweb22.services.BaseService;

@Service
public class ProductImagesService extends BaseService<ProductImages> {

	@Override
	protected Class<ProductImages> clazz() {
		return ProductImages.class;
	}

}
