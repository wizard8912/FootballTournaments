package pl.pniedziela.web.domain;

public class Team {

	private String fullname;
	private String nickname;
	private String shortname;
	private String manager;
	private String address;
	private String logo;
	private String stadium;
	private int founded;
	private int country;
	private int league;

	public Team(String fullname, String nickname, String shortname, String manager, String address, String logo,
			String stadium, int founded, int country, int league) {
		this.fullname = fullname;
		this.nickname = nickname;
		this.shortname = shortname;
		this.manager = manager;
		this.address = address;
		this.logo = logo;
		this.stadium = stadium;
		this.founded = founded;
		this.country = country;
		this.league = league;
	}

	public String getFullname() {
		return fullname;
	}

	public void setFullname(String fullname) {
		this.fullname = fullname;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getShortname() {
		return shortname;
	}

	public void setShortname(String shortname) {
		this.shortname = shortname;
	}

	public String getManager() {
		return manager;
	}

	public void setManager(String manager) {
		this.manager = manager;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getLogo() {
		return logo;
	}

	public void setLogo(String logo) {
		this.logo = logo;
	}

	public String getStadium() {
		return stadium;
	}

	public void setStadium(String stadium) {
		this.stadium = stadium;
	}

	public int getFounded() {
		return founded;
	}

	public void setFounded(int founded) {
		this.founded = founded;
	}

	public int getCountry() {
		return country;
	}

	public void setCountry(int country) {
		this.country = country;
	}

	public int getLeague() {
		return league;
	}

	public void setLeague(int league) {
		this.league = league;
	}

}
