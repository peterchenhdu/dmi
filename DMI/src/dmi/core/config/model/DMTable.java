
package dmi.core.config.model;

import java.util.List;



public class DMTable{
	private String name;
	private String title;
	private String type;
	private String classpath;
	private String hasXYValue;
	private List<DMField> fields;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getClasspath() {
		return classpath;
	}
	public void setClasspath(String classpath) {
		this.classpath = classpath;
	}
	public List<DMField> getFields() {
		return fields;
	}
	public void setFields(List<DMField> fields) {
		this.fields = fields;
	}
	public String getHasXYValue() {
		return hasXYValue;
	}
	public void setHasXYValue(String hasXYValue) {
		this.hasXYValue = hasXYValue;
	}
	
	public String getTitle() {
		return title;
	}
	
	public void setTitle(String title) {
		this.title = title;
	}
}