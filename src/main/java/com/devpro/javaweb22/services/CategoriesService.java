package com.devpro.javaweb22.services;

import java.util.List;

import org.springframework.stereotype.Service;

import com.devpro.javaweb22.model.Categories;
import com.devpro.javaweb22.services.BaseService;

@Service
public class CategoriesService extends BaseService<Categories> {

	@Override
	protected Class<Categories> clazz() {
		// TODO Auto-generated method stub
		return Categories.class;
	}
	public List<Categories> getCategoryByParentIdNull() {
		String sql = "SELECT * From tbl_category where parent_id is null";
		return getEntitiesByNativeSQL(sql);
	}
	public List<Categories> getCategoryByParentId(Integer parentID) {
		String sql = "SELECT * From tbl_category where parent_id = " + parentID;
		return getEntitiesByNativeSQL(sql);
	}
}
