package vo;

import java.util.Objects;

public class ProductVO {
	private int product_idx,price,discount,inventory,selleridx,realprice;
	private String name,explain,filepath,category,division ,details;
	
	public String getDetails() {
		return details;
	}
	public void setDetails(String details) {
		this.details = details;
	}
	public int getRealprice() {
		 return (int) (price * (1 - discount / 100.0)); 
	}
	public void setRealprice(int realprice) {
		this.realprice = realprice;
	}
	public String getDivision() {
		return division;
	}
	public void setDivision(String division) {
		this.division = division;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public int getProduct_idx() {
		return product_idx;
	}
	public void setProduct_idx(int product_idx) {
		this.product_idx = product_idx;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getDiscount() {
		return discount;
	}
	public void setDiscount(int discount) {
		this.discount = discount;
	}
	public int getInventory() {
		return inventory;
	}
	public void setInventory(int inventory) {
		this.inventory = inventory;
	}
	public int getSelleridx() {
		return selleridx;
	}
	public void setSelleridx(int selleridx) {
		this.selleridx = selleridx;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getExplain() {
		return explain;
	}
	public void setExplain(String explain) {
		this.explain = explain;
	}
	public String getFilepath() {
		return filepath;
	}
	public void setFilepath(String filepath) {
		this.filepath = filepath;
	}
	
	 @Override
	    public boolean equals(Object o) {
	        if (this == o) return true;
	        if (o == null || getClass() != o.getClass()) return false;
	        ProductVO productVO = (ProductVO) o;
	        return product_idx == productVO.product_idx;
	    }

	    @Override
	    public int hashCode() {
	        return Objects.hash(product_idx);
	    }
	
}
