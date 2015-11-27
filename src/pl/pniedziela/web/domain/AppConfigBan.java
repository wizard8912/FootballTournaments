package pl.pniedziela.web.domain;

public class AppConfigBan {

	private int failedLoginAttemps;
	private long banTime;
	private long checkLast;

	public AppConfigBan(int failedLoginAttemps, long banTime, long checkLast) {
		super();
		this.failedLoginAttemps = failedLoginAttemps;
		this.banTime = banTime;
		this.checkLast = checkLast;
	}

	public AppConfigBan() {

	}

	public int getFailedLoginAttemps() {
		return failedLoginAttemps;
	}

	public void setFailedLoginAttemps(int failedLoginAttemps) {
		this.failedLoginAttemps = failedLoginAttemps;
	}

	public long getBanTime() {
		return banTime;
	}

	public void setBanTime(long banTime) {
		this.banTime = banTime;
	}

	public long getCheckLast() {
		return checkLast;
	}

	public void setCheckLast(long checkLast) {
		this.checkLast = checkLast;
	}

}
