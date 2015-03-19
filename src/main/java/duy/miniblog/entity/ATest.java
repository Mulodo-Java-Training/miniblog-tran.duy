package duy.miniblog.entity;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.Email;

public class ATest {

	@NotNull
	@Size(min = 6, max = 32)
	private String userName;
	
	@NotNull
	@Size(min = 6, max = 16)
	private String firstName;
	
	@Email
	private String email;

	
	public String getUserName() {
		return userName;
	}


	public void setUserName(String userName) {
		this.userName = userName;
	}


	public String getFirstName() {
		return firstName;
	}


	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	@Override
    public String toString() {
        return "EmployeeVO [firstName=" + userName + ", lastName=" + firstName + ", email=" + email + "]";
    }
}
