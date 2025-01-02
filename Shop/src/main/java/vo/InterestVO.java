package vo;

public class InterestVO {

    int interest_idx, user_idx, product_idx, cart_idx, price, discount, inventory;
    String name, filepath;
    
    
    public int getInterest_idx() {
        return interest_idx;
    }
    public void setInterest_idx(int interest_idx) {
        this.interest_idx = interest_idx;
    }
    public int getUser_idx() {
        return user_idx;
    }
    public void setUser_idx(int user_idx) {
        this.user_idx = user_idx;
    }
    public int getProduct_idx() {
        return product_idx;
    }
    public void setProduct_idx(int product_idx) {
        this.product_idx = product_idx;
    }
    public int getCart_idx() {
        return cart_idx;
    }
    public void setCart_idx(int cart_idx) {
        this.cart_idx = cart_idx;
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
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
    public String getFilepath() {
        return filepath;
    }
    public void setFilepath(String filepath) {
        this.filepath = filepath;
    }

}
