package duy.miniblog.entity;


import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;


public class Customer {

	@Size(min=2, max=30) 
    private String name;
     
    @NotEmpty @Email
    private String email;    
    
    /*
    @DateTimeFormat(pattern="yyyy/MM/dd")
    @NotNull @Past
    private Date birthday;
*/
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
/*
	public Date getBirthday() {
		return birthday;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}   */ 
}
