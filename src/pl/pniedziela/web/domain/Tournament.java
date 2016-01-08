package pl.pniedziela.web.domain;

public class Tournament {

	private int id;
	private League league;
	private int forUser;
	private String addedTime;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public League getLeague() {
		return league;
	}

	public void setLeague(League league) {
		this.league = league;
	}

	public int getForUser() {
		return forUser;
	}

	public void setForUser(int forUser) {
		this.forUser = forUser;
	}

	public String getAddedTime() {
		return addedTime;
	}

	public void setAddedTime(String string) {
		this.addedTime = string;
	}
}
