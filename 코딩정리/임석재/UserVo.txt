package dto;

public class UserVo {
	
	private String id;
	private int age;
	private boolean orderCount;
	private String  orderRecord;
	
	// user 기본 생성자
		 public void user(String id, int age) {
		        this.id = id;
		        this.age = age;
		  
		    }
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public boolean getOrderCount() {
		return orderCount;
	}
	public void setOrderCount(boolean orderCount) {
		this.orderCount = orderCount;
	}
	public String getOrderRecord() {
		return orderRecord;
	}
	public void setOrderRecord(String orderRecord) {
		this.orderRecord = orderRecord;
	}
	
	@Override
	public String toString() {
		return "UserVo [id=" + id + ", age=" + age + ", orderCount =" + orderCount + ", orderRecord=" + orderRecord
				+ "]";
	}
}
