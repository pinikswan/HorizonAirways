package com.px1.horizonairways.entity;

public class User {

	private String userName;
	private String password;
	private String role;

	public User() {

	}

	public User(String userName, String password, String role) {
		super();
		this.userName = userName;
		this.password = password;
		this.setRole(role);
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

}
