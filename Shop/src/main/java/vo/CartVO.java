package vo;

public class CartVO {
   int cart_idx,user_idx,product_idx,quantity,price,discount,realprice,inventory,checked;
   String status,name,filepath,ordertime,deliveryrequest,deliverymessage,addr;
   long ordernumber;
   private Integer interest_idx;
   
   public Integer getInterest_idx() {
       return null; // 항상 null 반환
   }
   
   public void setInterest_idx(Integer interest_idx) {
       this.interest_idx = null; // 강제로 null 설정
   }
   
   public String getAddr() {
      return addr;
   }
   public void setAddr(String addr) {
      this.addr = addr;
   }
   public String getDeliveryrequest() {
      return deliveryrequest;
   }
   public void setDeliveryrequest(String deliveryrequest) {
      this.deliveryrequest = deliveryrequest;
   }
   public String getDeliverymessage() {
      return deliverymessage;
   }
   public void setDeliverymessage(String deliverymessage) {
      this.deliverymessage = deliverymessage;
   }
   public long getOrdernumber() {
      return ordernumber;
   }
   public void setOrdernumber(long ordernumber) {
      this.ordernumber = ordernumber;
   }
   public String getOrdertime() {
      return ordertime;
   }
   public void setOrdertime(String ordertime) {
      this.ordertime = ordertime;
   }
   public int getChecked() {
      return checked;
   }
   public void setChecked(int checked) {
      this.checked = checked;
   }
   public int getInventory() {
      return inventory;
   }
   public void setInventory(int inventory) {
      this.inventory = inventory;
   }
   public int getRealprice() {
        return (int) (price * (1 - discount / 100.0)); 
    }
   public void setRealprice(int realprice) {
      this.realprice = realprice;
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
   public int getCart_idx() {
      return cart_idx;
   }
   public void setCart_idx(int cart_idx) {
      this.cart_idx = cart_idx;
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
   public int getQuantity() {
      return quantity;
   }
   public void setQuantity(int quantity) {
      this.quantity = quantity;
   }
   public String getStatus() {
      return status;
   }
   public void setStatus(String status) {
      this.status = status;
   }
   
   
}
