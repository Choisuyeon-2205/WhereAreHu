package model;

public class GoodVO {
	//좋아요 VO
	private String user_id; //fk pk 사용자ID
	private String area_num; //fk pk 휴게소ID
	private int isGood; //좋아요여부(1/0)
	
	public GoodVO() {
		super();
	}

	public GoodVO(String user_id, String area_num, int isGood) {
		super();
		this.user_id = user_id;
		this.area_num = area_num;
		this.isGood = isGood;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getArea_num() {
		return area_num;
	}

	public void setArea_num(String area_num) {
		this.area_num = area_num;
	}

	public int getIsGood() {
		return isGood;
	}

	public void setIsGood(int isGood) {
		this.isGood = isGood;
	}

	@Override
	public String toString() {
		return "GoodVO [user_id=" + user_id + ", area_num=" + area_num + ", isGood=" + isGood + "]";
	}
	
	
}
