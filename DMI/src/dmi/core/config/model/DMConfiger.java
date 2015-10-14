
package dmi.core.config.model;

import java.util.List;



public class DMConfiger {
	private String version;
	private String description;
    private List<DMTable> tables;
	public String getVersion() {
		return version;
	}
	public void setVersion(String version) {
		this.version = version;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public List<DMTable> getTables() {
		return tables;
	}
	public void setTables(List<DMTable> tables) {
		this.tables = tables;
	}
}

