package model;

import java.io.File;

import javax.servlet.http.Part;

import resources.MyConstants;

public class product_detail {
	private String product_name;
	private String cost;
	private String brand;
	private String description;
	private String product_category;
	private String cloth;
	private String quantity;
	private String imageUrlFromPart;
	public product_detail() {
		
	}
	
	public product_detail(String product_name, String cost, String brand, String description, String product_category,
			String cloth, String quantity, Part part) {
		super();
		this.product_name = product_name;
		this.cost = cost;
		this.brand = brand;
		this.description = description;
		this.product_category = product_category;
		this.cloth = cloth;
		this.quantity=quantity;
		this.setImageUrlFromPart(getImageName(part, product_name));
	}

	public String getProduct_name() {
		return product_name;
	}

	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}

	public String getCost() {
		return cost;
	}

	public void setCost(String cost) {
		this.cost = cost;
	}

	public String getBrand() {
		return brand;
	}

	public void setBrand(String brand) {
		this.brand = brand;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getProduct_category() {
		return product_category;
	}

	public void setProduct_category(String product_category) {
		this.product_category = product_category;
	}

	public String getCloth() {
		return cloth;
	}

	public void setCloth(String cloth) {
		this.cloth = cloth;
	}

	public String getQuantity() {
		return quantity;
	}

	public void setQuantity(String quantity) {
		this.quantity = quantity;
	}
	
	public String getImageUrlFromPart() {
		return imageUrlFromPart;
	}

	public void setImageUrlFromPart(String imageUrlFromPart) {
		this.imageUrlFromPart = imageUrlFromPart;
	}
	
private String getImageName(Part part, String pname) {
		
		String name=pname+"_"+part.getSubmittedFileName();
		return name;
	}


	
	
}
