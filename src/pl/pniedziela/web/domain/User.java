package pl.pniedziela.web.domain;

import java.util.Date;

import javax.validation.constraints.Past;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotBlank;
import org.springframework.format.annotation.DateTimeFormat;

public class User {

	@NotBlank
	@Size(min = 3, max = 30)
	private String username;
	@NotBlank
	@Size(min = 6, max = 40)
	private String password;
	@Size(min = 3, max = 45)
	private String firstname;
	@Size(min = 3, max = 45)
	private String lastname;
	private int country;
	@Size(min = 3, max = 30)
	private String city;
	@DateTimeFormat(pattern = "dd-MM-yyyy")
	@Past(message = "Data urodzenia nie mo¿e byæ z przysz³oœci!")
	private Date birthdate;
	@Email
	private String email;
	@NotBlank
	@Size(min = 10, max = 200)
	private String forgotPassQ;
	@NotBlank
	@Size(min = 6, max = 100)
	private String forgotPassA;

	public User(String username, String password, String firstname, String lastname, int country, String city,
			Date birthdate, String email, String forgotPassQ, String forgotPassA) {
		super();
		this.username = username;
		this.password = password;
		this.firstname = firstname;
		this.lastname = lastname;
		this.country = country;
		this.city = city;
		this.birthdate = birthdate;
		this.email = email;
		this.forgotPassQ = forgotPassQ;
		this.forgotPassA = forgotPassA;
	}

	public User() {
		// TODO Auto-generated constructor stub
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getFirstname() {
		return firstname;
	}

	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}

	public String getLastname() {
		return lastname;
	}

	public void setLastname(String lastname) {
		this.lastname = lastname;
	}

	public int getCountry() {
		return country;
	}

	public void setCountry(int country) {
		this.country = country;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public Date getBirthdate() {
		return birthdate;
	}

	public void setBirthdate(Date birthdate) {
		this.birthdate = birthdate;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getForgotPassQ() {
		return forgotPassQ;
	}

	public void setForgotPassQ(String forgotPassQ) {
		this.forgotPassQ = forgotPassQ;
	}

	public String getForgotPassA() {
		return forgotPassA;
	}

	public void setForgotPassA(String forgotPassA) {
		this.forgotPassA = forgotPassA;
	}

	@Override
	public String toString() {
		return "User [username=" + username + ", password=" + password + ", firstname=" + firstname + ", lastname="
				+ lastname + ", country=" + country + ", city=" + city + ", birthdate=" + birthdate + ", email=" + email
				+ ", forgotPassQ=" + forgotPassQ + ", forgotPassA=" + forgotPassA + "]";
	}
}
