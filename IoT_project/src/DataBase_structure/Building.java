package DataBase_structure;

public class Building {
	private String building_name;

	public Building() {
		this("");
	}
	
	public Building(String building_name) {
		this.building_name = building_name;
	}

	public String getId() {
		return building_name;
	}

	public void setId(String id) {
		this.building_name = id;
	}

	public String toString() {
		return this.building_name + " / ";
	}
	
}
