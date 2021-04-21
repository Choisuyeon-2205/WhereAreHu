package model;

import java.sql.Date;

public class ReviewVO {
	private int review_id;
	private int user_id;
	private String area_num;
	private String review;
	private String photo;
	private double rate;
	private Date write_day;
	
	public ReviewVO() {
		super();
	}
	
	public ReviewVO(int review_id, int user_id, String area_num, String review, String photo, double rate,
			Date write_day) {
		super();
		this.review_id = review_id;
		this.user_id = user_id;
		this.area_num = area_num;
		this.review = review;
		this.photo = photo;
		this.rate = rate;
		this.write_day = write_day;
	}

	public int getReview_id() {
		return review_id;
	}

	public void setReview_id(int review_id) {
		this.review_id = review_id;
	}

	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	public String getArea_num() {
		return area_num;
	}

	public void setArea_num(String area_num) {
		this.area_num = area_num;
	}

	public String getReview() {
		return review;
	}

	public void setReview(String review) {
		this.review = review;
	}

	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}

	public double getRate() {
		return rate;
	}

	public void setRate(double rate) {
		this.rate = rate;
	}

	public Date getWrite_day() {
		return write_day;
	}

	public void setWrite_day(Date write_day) {
		this.write_day = write_day;
	}

	@Override
	public String toString() {
		return "ReviewVO [review_id=" + review_id + ", user_id=" + user_id + ", area_num=" + area_num + ", review="
				+ review + ", photo=" + photo + ", rate=" + rate + ", write_day=" + write_day + "]";
	}
	
	
}
