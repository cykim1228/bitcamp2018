package homepage;

import java.util.Date;

public class MemberInfo {

	private String id;
	private String password;
	private String name;
	private Date birthDate;
	private String gender;
	private String email;
	private String phoneNumber;
	private Date regDate;
	
	
	public MemberInfo() {
		// TODO Auto-generated constructor stub
	}

	
	public MemberInfo(String id, String password, String name, Date birthDate, String gender, String email,
			String phoneNumber, Date regDate) {
		this.id = id;
		this.password = password;
		this.name = name;
		this.birthDate = birthDate;
		this.gender = gender;
		this.email = email;
		this.phoneNumber = phoneNumber;
		this.regDate = regDate;
	}


	public String getId() {
		return id;
	}


	public void setId(String id) {
		this.id = id;
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


	public Date getBirthDate() {
		return birthDate;
	}


	public void setBirthDate(Date birthDate) {
		this.birthDate = birthDate;
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


	public String getPhoneNumber() {
		return phoneNumber;
	}


	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}


	public Date getRegDate() {
		return regDate;
	}


	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}


	@Override
	public String toString() {
		return "MemberInfo [id=" + id + ", password=" + password + ", name=" + name + ", birthDate=" + birthDate
				+ ", gender=" + gender + ", email=" + email + ", phoneNumber=" + phoneNumber + ", regDate=" + regDate
				+ "]";
	}
	
}
