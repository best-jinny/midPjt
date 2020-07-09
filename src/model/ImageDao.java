package model;

public class ImageDao {
	private int img_id;
	private String img_name;
	private String img_folder;
	private String img_format;
	private int cafe_id;
	public int getImg_id() {
		return img_id;
	}
	public void setImg_id(int img_id) {
		this.img_id = img_id;
	}
	public String getImg_name() {
		return img_name;
	}
	public void setImg_name(String img_name) {
		this.img_name = img_name;
	}
	public String getImg_folder() {
		return img_folder;
	}
	public void setImg_folder(String img_folder) {
		this.img_folder = img_folder;
	}
	public String getImg_format() {
		return img_format;
	}
	public void setImg_format(String img_format) {
		this.img_format = img_format;
	}
	public int getCafe_id() {
		return cafe_id;
	}
	public void setCafe_id(int cafe_id) {
		this.cafe_id = cafe_id;
	}
}
