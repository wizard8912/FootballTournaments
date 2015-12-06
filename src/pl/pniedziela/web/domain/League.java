package pl.pniedziela.web.domain;

public class League {

	private int id;
	private String fullname;
	private String shortname;
	private int country;
	private int level;
	private String logo;
	private String countryName;
	private boolean onlyForMe;
	private int numberOfGroups;
	private int numberOfTeams;
	private String system;
	private boolean doubleGroupMatches;
	private boolean doubleCupMatches;
	private boolean doubleFinalMatches;

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

	public boolean getOnlyForMe() {
		return onlyForMe;
	}

	public void setOnlyForMe(boolean onlyForMe) {
		this.onlyForMe = onlyForMe;
	}

	public int getNumberOfGroups() {
		return numberOfGroups;
	}

	public void setNumberOfGroups(int numberOfGroups) {
		this.numberOfGroups = numberOfGroups;
	}

	public int getNumberOfTeams() {
		return numberOfTeams;
	}

	public void setNumberOfTeams(int numberOfTeams) {
		this.numberOfTeams = numberOfTeams;
	}

	public String getSystem() {
		return system;
	}

	public void setSystem(String system) {
		this.system = system;
	}

	public boolean getDoubleGroupMatches() {
		return doubleGroupMatches;
	}

	public void setDoubleGroupMatches(boolean doubleGroupMatches) {
		this.doubleGroupMatches = doubleGroupMatches;
	}

	public boolean getDoubleCupMatches() {
		return doubleCupMatches;
	}

	public void setDoubleCupMatches(boolean doubleCupMatches) {
		this.doubleCupMatches = doubleCupMatches;
	}

	public boolean getDoubleFinalMatches() {
		return doubleFinalMatches;
	}

	public void setDoubleFinalMatches(boolean doubleFinalMatches) {
		this.doubleFinalMatches = doubleFinalMatches;
	}

	@Override
	public String toString() {
		return "League [id=" + id + ", fullname=" + fullname + ", shortname=" + shortname + ", country=" + country
				+ ", level=" + level + ", logo=" + logo + ", countryName=" + countryName + ", onlyForMe=" + onlyForMe
				+ ", numberOfGroups=" + numberOfGroups + ", numberOfTeams=" + numberOfTeams + ", system=" + system
				+ ", doubleGroupMatches=" + doubleGroupMatches + ", doubleCupMatches=" + doubleCupMatches
				+ ", doubleFinalMatches=" + doubleFinalMatches + "]";
	}

}
