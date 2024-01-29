package dto;

//book 클래스의 정보를 DB에 저장 및 로드하기 위한 매개 클래스
public class BookVo {

	private	String title;
	private int bkSeq;
	private String bkCategory;
	private int orCount;
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public int getBkSeq() {
		return bkSeq;
	}
	public void setBkSeq(int bkSeq) {
		this.bkSeq = bkSeq;
	}
	public String getBkCategory() {
		return bkCategory;
	}
	public void setBkCategory(String bkCategory) {
		this.bkCategory = bkCategory;
	}
	public int getOrCount() {
		return orCount;
	}
	public void setOrCount(int orCount) {
		this.orCount = orCount;
	}
	
	@Override
	public String toString() {
		return "BookVo [title=" + title + ", bkSeq=" + bkSeq + ", bkCategory=" + bkCategory + ", orCount=" + orCount
				+ "]";
	}
}
