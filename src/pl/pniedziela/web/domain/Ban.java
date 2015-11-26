package pl.pniedziela.web.domain;

import java.util.Date;

public class Ban {
	private int userId;
	private Date fromDate;
	private Date toDate;
	private int banAuthor;
	private String reason;
	private String username;
	private String banAuthorName;
	private String userPass;

	public Ban(int userId, Date fromDate, Date toDate, int banAuthor, String reason, String username,
			String banAuthorName, String userPass) {
		super();
		this.userId = userId;
		this.fromDate = fromDate;
		this.toDate = toDate;
		this.banAuthor = banAuthor;
		this.reason = reason;
		this.username = username;
		this.banAuthorName = banAuthorName;
		this.userPass = userPass;
	}

	public Ban() {
		// TODO Auto-generated constructor stub
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public Date getFromDate() {
		return fromDate;
	}

	public void setFromDate(Date fromDate) {
		this.fromDate = fromDate;
	}

	public Date getToDate() {
		return toDate;
	}

	public void setToDate(Date toDate) {
		this.toDate = toDate;
	}

	public int getBanAuthor() {
		return banAuthor;
	}

	public void setBanAuthor(int banAuthor) {
		this.banAuthor = banAuthor;
	}

	public String getReason() {
		return reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getBanAuthorName() {
		return banAuthorName;
	}

	public void setBanAuthorName(String banAuthorName) {
		this.banAuthorName = banAuthorName;
	}

	public String getUserPass() {
		return userPass;
	}

	public void setUserPass(String userPass) {
		this.userPass = userPass;
	}

}
