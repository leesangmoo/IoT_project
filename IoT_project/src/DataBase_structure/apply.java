package DataBase_structure;

public class apply {
	private String human_name;
	private String time_s;
	private String building_sub_name;
	private String text;
	private String sysname;
	private String orgname;

	public apply() {
		this("","","","","","");
	}
	
	public apply(String human_name, String time_s,  String building_sub_name, String text, String sysname,String orgname) {
		this.human_name = human_name;
		this.time_s = time_s;
		this.building_sub_name = building_sub_name;
		this.text = text;
		this.sysname = sysname;
		this.orgname = orgname;
	}

	public String gethuman_name() {
		return human_name;
	}

	public void sethuman_name(String human_name) {
		this.human_name = human_name;
	}
	public String gettime_s() {
		return time_s;
	}

	public void settime_s(String time_s) {
		this.time_s = time_s;
	}
	
	public String getbuilding_sub_name() {
		return building_sub_name;
	}

	public void setbuilding_sub_name(String building_sub_name) {
		this.building_sub_name = building_sub_name;
	}
	
	public String getext() {
		return text;
	}

	public void settext(String text) {
		this.text = text;
	}

	public String getsysname() {
		return sysname;
	}

	public void setsysname(String sysname) {
		this.sysname = sysname;
	}

	public String getorgname() {
		return orgname;
	}

	public void setorgname(String orgname) {
		this.orgname = orgname;
	}
	
	public String toString() {
		return this.human_name + " / " + this.time_s + " / " + this.building_sub_name + " / " + this.text + " / " + this.sysname + " / " 
				+ this.orgname + " / ";
	}
	
}
