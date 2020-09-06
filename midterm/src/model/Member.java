package model;
import java.sql.Date;
public class Member {
	  private String member_id; 
	  private String member_password; 
	  private String member_name; 
	  private String member_tel;
	  private String member_email; 
	  private Date member_reg_date; 
	  private String member_del;
	
	  public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getMember_password() {
		return member_password;
	}
	public void setMember_password(String member_password) {
		this.member_password = member_password;
	}
	public String getMember_name() {
		return member_name;
	}
	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}
	public String getMember_tel() {
		return member_tel;
	}
	public void setMember_tel(String member_tel) {
		this.member_tel = member_tel;
	}
	public String getMember_email() {
		return member_email;
	}
	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}
	public Date getMember_reg_date() {
		return member_reg_date;
	}
	public void setMember_reg_date(Date member_reg_date) {
		this.member_reg_date = member_reg_date;
	}
	public String getMember_del() {
		return member_del;
	}
	public void setMember_del(String member_del) {
		this.member_del = member_del;
	} 
	  
}
