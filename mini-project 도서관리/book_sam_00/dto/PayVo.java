package dto;

public class PayVo {
	
	private int orderNumer;
	private int price;
	private String id;
	private String date;
	public int getOrderNumer() {
		return orderNumer;
	}
	public void setOrderNumer(int orderNumer) {
		this.orderNumer = orderNumer;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	@Override
	public String toString() {
		return "PayVo [orderNumer=" + orderNumer + ", price=" + price + ", id=" + id + ", date=" + date + "]";
	}
	

	
}
