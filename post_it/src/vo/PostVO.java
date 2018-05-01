package vo;

public class PostVO {
	private int post_id;
	private String post_content;
	private int post_level;
	private String post_color;
	
	public PostVO() {
		// TODO Auto-generated constructor stub
	}
	
	public PostVO(int post_id, String post_content, int post_level, String post_color) {
		super();
		this.post_id = post_id;
		this.post_content = post_content;
		this.post_level = post_level;
		this.post_color = post_color;
	}

	public int getPost_id() {
		return post_id;
	}

	public void setPost_id(int post_id) {
		this.post_id = post_id;
	}

	public String getPost_content() {
		return post_content;
	}

	public void setPost_content(String post_content) {
		this.post_content = post_content;
	}

	public int getPost_level() {
		return post_level;
	}

	public void setPost_level(int post_level) {
		this.post_level = post_level;
	}

	public String getPost_color() {
		return post_color;
	}

	public void setPost_color(String post_color) {
		this.post_color = post_color;
	}
	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return post_id+" "+post_content+" "+post_level+" "+post_color;
	}
}
