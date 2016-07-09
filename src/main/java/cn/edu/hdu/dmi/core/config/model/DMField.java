
package cn.edu.hdu.dmi.core.config.model;



public class DMField{
	private String dbName;
	private String name;
	private String type;
    private String title;
    private String isPrimaryKey;
    private String isNull;
    private String maxLength;
    private String notEditFlag="false";
    private String inputType;
    private String valueFrom;
    private String valueParam;
    private String valueSource;
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
	public String getDbName() {
		return dbName;
	}
	public void setDbName(String dbName) {
		this.dbName = dbName;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	
	public String getIsNull() {
		return isNull;
	}
	
	public String getMaxLength() {
		return maxLength;
	}
	
	public void setIsNull(String isNull) {
		this.isNull = isNull;
	}
	
	public void setMaxLength(String maxLength) {
		this.maxLength = maxLength;
	}
	
	public String getNotEditFlag() {
		return notEditFlag;
	}
	
	public void setNotEditFlag(String notEditFlag) {
		this.notEditFlag = notEditFlag;
	}
	
	public String getInputType() {
		return inputType;
	}
	
	public String getValueFrom() {
		return valueFrom;
	}
	
	public String getValueSource() {
		return valueSource;
	}
	
	public void setInputType(String inputType) {
		this.inputType = inputType;
	}
	
	public void setValueFrom(String valueFrom) {
		this.valueFrom = valueFrom;
	}
	
	public void setValueSource(String valueSource) {
		this.valueSource = valueSource;
	}
	
	public String getValueParam() {
		return valueParam;
	}
	
	public void setValueParam(String valueParam) {
		this.valueParam = valueParam;
	}
	public String getIsPrimaryKey() {
		return isPrimaryKey;
	}
	public void setIsPrimaryKey(String isPrimaryKey) {
		this.isPrimaryKey = isPrimaryKey;
	}

}