package pl.pniedziela.web.domain;

public class Team {

	private int id;
	private String fullname;
	private String nickname;
	private String shortname;
	private String manager;
	private String address;
	private String logo;
	private String stadium;
	private int founded;
	private int country;
	private String countryName;
	private String city;
	private int league;
	private String leagueName;
	private boolean onlyForMe;

	public Team() {

	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
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

	public String getLeagueName() {
		return leagueName;
	}

	public void setLeagueName(String leagueName) {
		this.leagueName = leagueName;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public boolean getOnlyForMe() {
		return onlyForMe;
	}

	public void setOnlyForMe(boolean onlyForMe) {
		this.onlyForMe = onlyForMe;
	}

	public String getCountryName() {
		return countryName;
	}

	public void setCountryName(String countryName) {
		this.countryName = countryName;
	}

	@Override
	public String toString() {
		return "Team [id=" + id + ", fullname=" + fullname + ", nickname=" + nickname + ", shortname=" + shortname
				+ ", manager=" + manager + ", address=" + address + ", logo=" + logo + ", stadium=" + stadium
				+ ", founded=" + founded + ", country=" + country + ", countryName=" + countryName + ", city=" + city
				+ ", league=" + league + ", leagueName=" + leagueName + ", onlyForMe=" + onlyForMe + "]";
	}

}
