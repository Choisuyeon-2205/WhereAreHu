package model;

public class FoodVO {
	//대표음식 VO
	private int food_id; //음식 seq번호
	private String food_name; //음식명
	private String food_context; //음식설명
	private String food_best; //음식 best여부("N"/"Y")
	private int food_cost; //가격
	private String area_num; //휴게소ID
	
	public FoodVO() {
		super();
	}

	public FoodVO(int food_id, String food_name, String food_context, String food_best, int food_cost,
			String area_num) {
		super();
		this.food_id = food_id;
		this.food_name = food_name;
		this.food_context = food_context;
		this.food_best = food_best;
		this.food_cost = food_cost;
		this.area_num = area_num;
	}

	public int getFood_id() {
		return food_id;
	}

	public void setFood_id(int food_id) {
		this.food_id = food_id;
	}

	public String getFood_name() {
		return food_name;
	}

	public void setFood_name(String food_name) {
		this.food_name = food_name;
	}

	public String getFood_context() {
		return food_context;
	}

	public void setFood_context(String food_context) {
		this.food_context = food_context;
	}

	public String getFood_best() {
		return food_best;
	}

	public void setFood_best(String food_best) {
		this.food_best = food_best;
	}

	public int getFood_cost() {
		return food_cost;
	}

	public void setFood_cost(int food_cost) {
		this.food_cost = food_cost;
	}

	public String getArea_num() {
		return area_num;
	}

	public void setArea_num(String area_num) {
		this.area_num = area_num;
	}

	@Override
	public String toString() {
		return "FoodVO [food_id=" + food_id + ", food_name=" + food_name + ", food_context=" + food_context
				+ ", food_best=" + food_best + ", food_cost=" + food_cost + ", area_num=" + area_num + "]";
	}
	
	
}
