package pl.pniedziela.web.domain;

import java.util.Date;

public class UserStats {

	private String username;
	private Date registerDate;
	private Date lastSuccessLogin;
	private Date lastFailedLogin;
	private int loginCount;

	public UserStats(String username, Date registerDate, Date lastSuccessLogin, Date lastFailedLogin, int loginCount) {
		super();
		this.username = username;
		this.registerDate = registerDate;
		this.lastSuccessLogin = lastSuccessLogin;
		this.lastFailedLogin = lastFailedLogin;
		this.loginCount = loginCount;
	}

	public UserStats() {
		// TODO Auto-generated constructor stub
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public Date getRegisterDate() {
		return registerDate;
	}

	public void setRegisterDate(Date registerDate) {
		this.registerDate = registerDate;
	}

	public Date getLastSuccessLogin() {

		return lastSuccessLogin;
	}

	public void setLastSuccessLogin(Date lastSuccessLogin) {
		this.lastSuccessLogin = lastSuccessLogin;
	}

	public Date getLastFailedLogin() {
		return lastFailedLogin;
	}

	public void setLastFailedLogin(Date lastFailedLogin) {
		this.lastFailedLogin = lastFailedLogin;
	}

	public int getLoginCount() {
		return loginCount;
	}

	public void setLoginCount(int loginCount) {
		this.loginCount = loginCount;
	}

	@Override
	public String toString() {
		return "UserStats [username=" + username + ", registerDate=" + registerDate + ", lastSuccessLogin="
				+ lastSuccessLogin + ", lastFailedLogin=" + lastFailedLogin + ", loginCount=" + loginCount + "]";
	}
}
