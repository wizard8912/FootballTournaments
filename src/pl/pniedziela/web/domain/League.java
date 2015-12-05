package pl.pniedziela.web.domain;

public class League {

	private int id;
	private String fullname;
	private String shortname;
	private int country;
	private int level;
	private String logo;
	private String countryName;
	private int onlyForMe;

	public League() {

	}

	public String getFullname() {
		return fullname;
	}

	public void setFullname(String fullname) {
		this.fullname = fullname;
	}

	public String getShortname() {
		return shortname;
	}

	public void setShortname(String shortname) {
		this.shortname = shortname;
	}

	public int getCountry() {
		return country;
	}

	public void setCountry(int country) {
		this.country = country;
	}

	public int getLevel() {
		return level;
	}

	public void setLevel(int level) {
		this.level = level;
	}

	public String getLogo() {
		return logo;
	}

	public void setLogo(String logo) {
		this.logo = logo;
	}

	public String getCountryName() {
		return countryName;
	}

	public void setCountryName(String countryName) {
		this.countryName = countryName;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getOnlyForMe() {
		return onlyForMe;
	}

	public void setOnlyForMe(int onlyForMe) {
		this.onlyForMe = onlyForMe;
	}

	@Override
	public String toString() {
		return "League [fullname=" + fullname + ", shortname=" + shortname + ", country=" + country + ", level=" + level
				+ ", logo=" + logo + ", countryName=" + countryName + "]";
	}

}
