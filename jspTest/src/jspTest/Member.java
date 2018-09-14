package jspTest;

public class Member {
	
	private String name;
	private String email;
	
	@Override
	public String toString() {
		return "Member [name=" + name + ", email=" + email + "]";
	}
	
	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	public String getEmail() {
		return email;
	}
	
	public void setEmail(String email) {
		this.email = email;
	}
	
}
