package vo;

public class BannerVO {

	private int banner_idx;
	String name, explanation, image, filepath, status, new_name, new_explanation, new_image;
	

	public String getNew_image() {
		return new_image;
	}
	public void setNew_image(String new_image) {
		this.new_image = new_image;
	}
	public String getNew_name() {
		return new_name;
	}
	public void setNew_name(String new_name) {
		this.new_name = new_name;
	}
	public String getNew_explanation() {
		return new_explanation;
	}
	public void setNew_explanation(String new_explanation) {
		this.new_explanation = new_explanation;
	}
	public int getBanner_idx() {
		return banner_idx;
	}
	public void setBanner_idx(int banner_idx) {
		this.banner_idx = banner_idx;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getExplanation() {
		return explanation;
	}
	public void setExplanation(String explanation) {
		this.explanation = explanation;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getFilepath() {
		return filepath;
	}
	public void setFilepath(String filepath) {
		this.filepath = filepath;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
	
	
}
