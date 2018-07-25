package LoginTask.model;

public class Joiner {
	private String id;
	private String pwd; 
	private String name;
	private String birth_year;
	private String birth_mon;
	private String birth_day;
	private String gender;
	private String email;
	private int phone;
	private String photo;
	
	public Joiner() {
		
	}
	
	public Joiner(String id, String pwd, String name, String birth_year, String birth_mon, String birth_day,
			String gender, String email, int phone) {
		super();
		this.id = id;
		this.pwd = pwd;
		this.name = name;
		this.birth_year = birth_year;
		this.birth_mon = birth_mon;
		this.birth_day = birth_day;
		this.gender = gender;
		this.email = email;
		this.phone = phone;
	}
	

	public Joiner(String id, String pwd, String name, String birth_year, String birth_mon, String birth_day,
			String gender, String email, int phone, String photo) {
		super();
		this.id = id;
		this.pwd = pwd;
		this.name = name;
		this.birth_year = birth_year;
		this.birth_mon = birth_mon;
		this.birth_day = birth_day;
		this.gender = gender;
		this.email = email;
		this.phone = phone;
		this.photo = photo;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getBirth_year() {
		return birth_year;
	}

	public void setBirth_year(String birth_year) {
		this.birth_year = birth_year;
	}

	public String getBirth_mon() {
		return birth_mon;
	}

	public void setBirth_mon(String birth_mon) {
		this.birth_mon = birth_mon;
	}

	public String getBirth_day() {
		return birth_day;
	}

	public void setBirth_day(String birth_day) {
		this.birth_day = birth_day;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getPhone() {
		return phone;
	}

	public void setPhone(int phone) {
		this.phone = phone;
	}
	

	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}

	@Override
	public String toString() {
		return "Joiner [id=" + id + ", pwd=" + pwd + ", name=" + name + ", birth_year=" + birth_year + ", birth_mon="
				+ birth_mon + ", birth_day=" + birth_day + ", gender=" + gender + ", email=" + email + ", phone="
				+ phone + ", photo=" + photo + "]";
	}

	
	
}
