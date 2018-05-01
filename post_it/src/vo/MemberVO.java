package vo;

public class MemberVO {
	private String email;
	private String password;
	private String name;
	private int point;
	private int post_id;

	public MemberVO() {
		super();
	}

	public MemberVO(String email, String password, String name, int point, int post_id) {
		super();
		this.email = email;
		this.password = password;
		this.name = name;
		this.point = point;
		this.post_id = post_id;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

	public int getPost_id() {
		return post_id;
	}

	public void setPost_id(int post_id) {
		this.post_id = post_id;
	}

	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return email + " " + password + " " + name + " " + point + " " + post_id;
	}

	public int hashCode() {
		System.out.println("In hashcode");
		int hashcode = post_id;
        return hashcode;
	}

	public boolean equals(Object obj) {
		System.out.println("In equals");
		if (obj instanceof MemberVO) {
			MemberVO vo = (MemberVO) obj;
			return (vo.getPost_id()==this.post_id);
		} else {
			return false;
		}
	}
}
