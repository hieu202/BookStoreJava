package com.devpro.javaweb22.services;

import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.devpro.javaweb22.dto.ProductSearch;
import com.devpro.javaweb22.dto.SaleOrderSearch;
import com.devpro.javaweb22.model.Product;
import com.devpro.javaweb22.model.SaleOrder;
import com.devpro.javaweb22.services.BaseService;

@Service
public class SaleOrderService extends BaseService<SaleOrder> {

	@Override
	protected Class<SaleOrder> clazz() {
		return SaleOrder.class;
	}
	public PagerData<SaleOrder> searchSaleOrder(SaleOrderSearch searchModel) {
		// khởi tạo câu lệnh
		String sql = "SELECT * FROM tbl_saleorder s WHERE 1=1";

		if (searchModel != null) {
			
			
		

			// tìm kiếm theo email
			if (!StringUtils.isEmpty(searchModel.getEmail())) {
				sql += " and s.cutomer_email like '%" + searchModel.getEmail() + "%'" ; 
						     
			}
		}
		
		return getEntitiesByNativeSQL(sql, searchModel.getCurrentPage());
	}
}
