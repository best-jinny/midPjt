package model;

import java.sql.Date;

public class WishList {
	private int wish_id; 
	private String member_id;
  	private int cafe_id;
  	private Date wish_reg_date;
	
  	public int getWish_id() {
		return wish_id;
	}
	public void setWish_id(int wish_id) {
		this.wish_id = wish_id;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public int getCafe_id() {
		return cafe_id;
	}
	public void setCafe_id(int cafe_id) {
		this.cafe_id = cafe_id;
	}
	public Date getWish_reg_date() {
		return wish_reg_date;
	}
	public void setWish_reg_date(Date wish_reg_date) {
		this.wish_reg_date = wish_reg_date;
	} 
}
