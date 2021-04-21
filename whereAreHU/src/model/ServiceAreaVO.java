package model;

public class ServiceAreaVO {
  
    private String area_num;       // 휴게소id(기본키) 
    private String area_name;       //휴게소이름
    private String address;    // 주소
    private String area_phone;       //대표전화번호
    private String route;      // 노선이름
    private String fname;       //지사명
    private int isGas;  // 휴게소/주유소구분코드(0:휴게소/1:주유소)
    private int descend;       // 상하행구분코드(0:상행/1:하행)
    private int minicar;       // 소형차주차대수
    private int largecar;      // 대형차주차대수
    private int othercar;       // 장애인주차대수
    private int thumbsup;
    
    
	public ServiceAreaVO() {
		super();
	}

	public ServiceAreaVO(String area_num, String area_name, String address, String area_phone, String route,
			String fname, int isGas, int descend, int minicar, int largecar, int othercar, int thumbsup) {
		super();
		this.area_num = area_num;
		this.area_name = area_name;
		this.address = address;
		this.area_phone = area_phone;
		this.route = route;
		this.fname = fname;
		this.isGas = isGas;
		this.descend = descend;
		this.minicar = minicar;
		this.largecar = largecar;
		this.othercar = othercar;
		this.thumbsup = thumbsup;
	}

	public String getArea_num() {
		return area_num;
	}

	public void setArea_num(String area_num) {
		this.area_num = area_num;
	}

	public String getArea_name() {
		return area_name;
	}

	public void setArea_name(String area_name) {
		this.area_name = area_name;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getArea_phone() {
		return area_phone;
	}

	public void setArea_phone(String area_phone) {
		this.area_phone = area_phone;
	}

	public String getRoute() {
		return route;
	}

	public void setRoute(String route) {
		this.route = route;
	}

	public String getFname() {
		return fname;
	}

	public void setFname(String fname) {
		this.fname = fname;
	}

	public int getIsGas() {
		return isGas;
	}

	public void setIsGas(int isGas) {
		this.isGas = isGas;
	}

	public int getDescend() {
		return descend;
	}

	public void setDescend(int descend) {
		this.descend = descend;
	}

	public int getMinicar() {
		return minicar;
	}

	public void setMinicar(int minicar) {
		this.minicar = minicar;
	}

	public int getLargecar() {
		return largecar;
	}

	public void setLargecar(int largecar) {
		this.largecar = largecar;
	}

	public int getOthercar() {
		return othercar;
	}

	public void setOthercar(int othercar) {
		this.othercar = othercar;
	}

	public int getThumbsup() {
		return thumbsup;
	}

	public void setThumbsup(int thumbsup) {
		this.thumbsup = thumbsup;
	}

	@Override
	public String toString() {
		return "ServiceAreaVO [area_num=" + area_num + ", area_name=" + area_name + ", address=" + address
				+ ", area_phone=" + area_phone + ", route=" + route + ", fname=" + fname + ", isGas=" + isGas
				+ ", descend=" + descend + ", minicar=" + minicar + ", largecar=" + largecar + ", othercar=" + othercar
				+ ", thumbsup=" + thumbsup + "]";
	}

}
