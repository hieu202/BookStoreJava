package com.devpro.javaweb22.services;

import org.springframework.stereotype.Service;

import com.devpro.javaweb22.model.Role;
@Service
public class RoleService extends BaseService<Role>{
	@Override
	protected Class<Role> clazz() {
		return Role.class;
	}
}
