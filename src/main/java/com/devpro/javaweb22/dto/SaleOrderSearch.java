package com.devpro.javaweb22.dto;

public class SaleOrderSearch {
	private String email;
	private Integer currentPage;
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Integer getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(Integer currentPage) {
		this.currentPage = currentPage;
	}

}
