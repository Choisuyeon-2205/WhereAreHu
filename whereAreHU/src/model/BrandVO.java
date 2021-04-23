package model;

public class BrandVO {
	//브랜드매장VO
	private int brand_seq; //pk 브랜드seq
	private String brand_id; //브랜드id
	private String brand_name; //브랜드명
	private String brand_text; //브랜드 설명
	private String brand_start; //오픈시간
	private String brand_end; //마감시간
	private String area_num;  //휴게소id
	
	public BrandVO() {
		super();
	}

	
	public BrandVO(String brand_id, String brand_name, String brand_text, String brand_start,
			String brand_end, String area_num) {
		super();
		this.brand_id = brand_id;
		this.brand_name = brand_name;
		this.brand_text = brand_text;
		this.brand_start = brand_start;
		this.brand_end = brand_end;
		this.area_num = area_num;
	}

	public int getBrand_seq() {
		return brand_seq;
	}


	public void setBrand_seq(int brand_seq) {
		this.brand_seq = brand_seq;
	}


	public String getBrand_id() {
		return brand_id;
	}

	public void setBrand_id(String brand_id) {
		this.brand_id = brand_id;
	}

	public String getBrand_name() {
		return brand_name;
	}

	public void setBrand_name(String brand_name) {
		this.brand_name = brand_name;
	}

	public String getBrand_text() {
		return brand_text;
	}

	public void setBrand_text(String brand_text) {
		this.brand_text = brand_text;
	}

	public String getBrand_start() {
		return brand_start;
	}

	public void setBrand_start(String brand_start) {
		this.brand_start = brand_start;
	}

	public String getBrand_end() {
		return brand_end;
	}

	public void setBrand_end(String brand_end) {
		this.brand_end = brand_end;
	}

	public String getArea_num() {
		return area_num;
	}

	public void setArea_num(String area_num) {
		this.area_num = area_num;
	}

	@Override
	public String toString() {
		return "BrandVO [brand_seq=" + brand_seq + ", brand_id=" + brand_id + ", brand_name=" + brand_name
				+ ", brand_text=" + brand_text + ", brand_start=" + brand_start + ", brand_end=" + brand_end
				+ ", area_num=" + area_num + "]";
	}

	
}
