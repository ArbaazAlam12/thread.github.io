package model;

import java.io.File;

import javax.servlet.http.Part;

import resources.MyConstants;

public class Customer {
	private String name;
	private String username;
	private String cotanct_number;
	private String password;
	private String role;
	private String imageUrlFromPart;
	
	public Customer() {
		
	}
	public Customer(String name, String username, String cotanct_number, String password, String role, Part part) {
		super();
		this.name = name;
		this.username = username;
		this.cotanct_number = cotanct_number;
		this.password= password;
		this.role=role;
		this.imageUrlFromPart = getImageName(part, username);
	}

	
	public String getImageUrlFromPart() {
		return imageUrlFromPart;
	}
	
	public void setImageUrlFromPart(Part part, String user) {
		this.imageUrlFromPart = getImageName(part, user);
	}
	
	public String getname() {
		return name;
	}

	public void setname(String name) {
		this.name = name;
	}

	public String getusername() {
		return username;
	}

	public void setusername(String username) {
		this.username = username;
	}

	public String getCotanct_number() {
		return cotanct_number;
	}

	public void setCotanct_number(String cotanct_number) {
		this.cotanct_number = cotanct_number;
	}
		

	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}



	
	private String getImageName(Part part, String user) {
		
		String name=user+"_"+part.getSubmittedFileName();
		return name;
	}
}
