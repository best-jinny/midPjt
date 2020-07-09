package model;

import java.sql.Date;

public class CafeDao {
	private int cafe_id;
	private String cafe_name;
	private int cafe_readcount;
	private String cafe_addr;
	private String cafe_hours;
	private String cafe_tel;
	private String cafe_parking;
	private Date cafe_reg_date;
	private String cafe_del;
	public int getCafe_id() {
		return cafe_id;
	}
	public void setCafe_id(int cafe_id) {
		this.cafe_id = cafe_id;
	}
	public String getCafe_name() {
		return cafe_name;
	}
	public void setCafe_name(String cafe_name) {
		this.cafe_name = cafe_name;
	}
	public int getCafe_readcount() {
		return cafe_readcount;
	}
	public void setCafe_readcount(int cafe_readcount) {
		this.cafe_readcount = cafe_readcount;
	}
	public String getCafe_addr() {
		return cafe_addr;
	}
	public void setCafe_addr(String cafe_addr) {
		this.cafe_addr = cafe_addr;
	}
	public String getCafe_hours() {
		return cafe_hours;
	}
	public void setCafe_hours(String cafe_hours) {
		this.cafe_hours = cafe_hours;
	}
	public String getCafe_tel() {
		return cafe_tel;
	}
	public void setCafe_tel(String cafe_tel) {
		this.cafe_tel = cafe_tel;
	}
	public String getCafe_parking() {
		return cafe_parking;
	}
	public void setCafe_parking(String cafe_parking) {
		this.cafe_parking = cafe_parking;
	}
	public Date getCafe_reg_date() {
		return cafe_reg_date;
	}
	public void setCafe_reg_date(Date cafe_reg_date) {
		this.cafe_reg_date = cafe_reg_date;
	}
	public String getCafe_del() {
		return cafe_del;
	}
	public void setCafe_del(String cafe_del) {
		this.cafe_del = cafe_del;
	}
}
