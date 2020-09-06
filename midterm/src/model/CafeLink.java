package model;

public class CafeLink {
	private int cafe_link_id;
	private int hash_id;
	private int cafe_id;
	private String member_id;
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public int getCafe_link_id() {
		return cafe_link_id;
	}
	public void setCafe_link_id(int cafe_link_id) {
		this.cafe_link_id = cafe_link_id;
	}
	public int getHash_id() {
		return hash_id;
	}
	public void setHash_id(int hash_id) {
		this.hash_id = hash_id;
	}
	public int getCafe_id() {
		return cafe_id;
	}
	public void setCafe_id(int cafe_id) {
		this.cafe_id = cafe_id;
	}
	
}
