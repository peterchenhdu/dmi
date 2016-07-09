package cn.edu.hdu.dmi.core.config.model;

import java.util.List;

/**
 * 
 * @author cp_hdu@163.com
 * @version dmi V1.0.0, 2016年7月9日
 * @see
 * @since dmi V1.0.0
 */
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
