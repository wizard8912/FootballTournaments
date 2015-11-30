package pl.pniedziela.web.domain;

public class UserStats {

	private String username;
	private String registerDate;
	private String lastSuccessLogin;
	private String lastFailedLogin;
	private int loginCount;

	public UserStats(String username, String registerDate, String lastSuccessLogin, String lastFailedLogin,
			int loginCount) {
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

	public String getRegisterDate() {
		return registerDate;
	}

	public void setRegisterDate(String registerDate) {
		this.registerDate = registerDate;
	}

	public String getLastSuccessLogin() {

		return lastSuccessLogin;
	}

	public void setLastSuccessLogin(String lastSuccessLogin) {
		this.lastSuccessLogin = lastSuccessLogin;
	}

	public String getLastFailedLogin() {
		return lastFailedLogin;
	}

	public void setLastFailedLogin(String lastFailedLogin) {
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
