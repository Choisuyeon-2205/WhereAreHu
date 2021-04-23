package model;

public class OilVO {
	private String oil_id;
	private String oil_name;
	private String oil_dire; 
	private String oil_tel;
	private String oil_firm; 
	private String oislpg; 
	private String gprice;   
	private String dprice;
	private String lprice; 
	private String oil_start;
	private String oil_end;
	private String area_num;
	
	public OilVO() {
		super();
	}

	public OilVO(String oil_start, String oil_end, String area_num) {
		super();
		this.oil_start = oil_start;
		this.oil_end = oil_end;
		this.area_num = area_num;
	}

	public OilVO(String oil_id, String oil_name, String oil_dire, String oil_tel, String oil_firm, String oislpg,
			String gprice, String dprice, String lprice, String area_num) {
		super();
		this.oil_id = oil_id;
		this.oil_name = oil_name;
		this.oil_dire = oil_dire;
		this.oil_tel = oil_tel;
		this.oil_firm = oil_firm;
		this.oislpg = oislpg;
		this.gprice = gprice;
		this.dprice = dprice;
		this.lprice = lprice;
		this.area_num = area_num;
	}

	public OilVO(String oil_id, String oil_name, String oil_dire, String oil_tel, String oil_firm, String oislpg,
			String gprice, String dprice, String lprice, String oil_start, String oil_end, String area_num) {
		super();
		this.oil_id = oil_id;
		this.oil_name = oil_name;
		this.oil_dire = oil_dire;
		this.oil_tel = oil_tel;
		this.oil_firm = oil_firm;
		this.oislpg = oislpg;
		this.gprice = gprice;
		this.dprice = dprice;
		this.lprice = lprice;
		this.oil_start = oil_start;
		this.oil_end = oil_end;
		this.area_num = area_num;
	}

	public String getOil_id() {
		return oil_id;
	}

	public void setOil_id(String oil_id) {
		this.oil_id = oil_id;
	}

	public String getOil_name() {
		return oil_name;
	}

	public void setOil_name(String oil_name) {
		this.oil_name = oil_name;
	}

	public String getOil_dire() {
		return oil_dire;
	}

	public void setOil_dire(String oil_dire) {
		this.oil_dire = oil_dire;
	}

	public String getOil_tel() {
		return oil_tel;
	}

	public void setOil_tel(String oil_tel) {
		this.oil_tel = oil_tel;
	}

	public String getOil_firm() {
		return oil_firm;
	}

	public void setOil_firm(String oil_firm) {
		this.oil_firm = oil_firm;
	}

	public String getOislpg() {
		return oislpg;
	}

	public void setOislpg(String oislpg) {
		this.oislpg = oislpg;
	}

	public String getGprice() {
		return gprice;
	}

	public void setGprice(String gprice) {
		this.gprice = gprice;
	}

	public String getDprice() {
		return dprice;
	}

	public void setDprice(String dprice) {
		this.dprice = dprice;
	}

	public String getLprice() {
		return lprice;
	}

	public void setLprice(String lprice) {
		this.lprice = lprice;
	}

	public String getOil_start() {
		return oil_start;
	}

	public void setOil_start(String oil_start) {
		this.oil_start = oil_start;
	}

	public String getOil_end() {
		return oil_end;
	}

	public void setOil_end(String oil_end) {
		this.oil_end = oil_end;
	}

	public String getArea_num() {
		return area_num;
	}

	public void setArea_num(String area_num) {
		this.area_num = area_num;
	}

	@Override
	public String toString() {
		return "OilVO [oil_id=" + oil_id + ", oil_name=" + oil_name + ", oil_dire=" + oil_dire + ", oil_tel=" + oil_tel
				+ ", oil_firm=" + oil_firm + ", oislpg=" + oislpg + ", gprice=" + gprice + ", dprice=" + dprice
				+ ", lprice=" + lprice + ", oil_start=" + oil_start + ", oil_end=" + oil_end + ", area_num=" + area_num
				+ "]";
	}
	

	
}
