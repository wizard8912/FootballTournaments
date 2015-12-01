package pl.pniedziela.web.domain;

import java.util.Date;

import javax.validation.constraints.Past;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotBlank;
import org.springframework.format.annotation.DateTimeFormat;

public class User {

	@NotBlank(message = "validation.user.username.notblank")
	@Size(min = 3, max = 30, message = "validation.user.username.size")
	private String username;
	@NotBlank(message = "validation.user.pass.notblank")
	@Size(min = 6, max = 40, message = "validation.user.pass.size")
	private String password;
	@Size(min = 6, max = 40, message = "validation.user.pass.size")
	private String confPassword;
	@Size(min = 3, max = 45, message = "validation.user.firstname.size")
	private String firstname;
	@Size(min = 3, max = 45, message = "validation.user.lastname.size")
	private String lastname;
	private int country;
	@Size(min = 3, max = 30, message = "validation.user.city.size")
	private String city;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	@Past(message = "validation.user.birthdate.pastdate")
	private Date birthdate;
	@Email(message = "validation.user.email")
	private String email;
	@NotBlank(message = "validation.user.forgotPassQ.notblank")
	@Size(min = 10, max = 200, message = "validation.user.forgotPassQ.size")
	private String forgotPassQ;
	@NotBlank(message = "validation.user.forgotPassA.notblank")
	@Size(min = 6, max = 100, message = "validation.user.forgotPassA.size")
	private String forgotPassA;

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

	public String getConfPassword() {
		return confPassword;
	}

	public void setConfPassword(String confPassword) {
		this.confPassword = confPassword;
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
