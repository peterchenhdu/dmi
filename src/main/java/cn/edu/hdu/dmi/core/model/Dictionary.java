
package cn.edu.hdu.dmi.core.model;

import java.io.Serializable;





public class Dictionary implements Serializable{

	
	private static final long serialVersionUID = 3705385883755662782L;
	private Long gid;
	private String type;
	private String name;
	private String value;
	private String valuelimit;
	private String description;
	private int rewritable;
	
	public Long getGid() {
		return gid;
	}
	
	public void setGid(Long gid) {
		this.gid = gid;
	}
	
	public String getType() {
		return type;
	}
	
	public void setType(String type) {
		this.type = type;
	}
	
	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	public String getValue() {
		return value;
	}
	
	public void setValue(String value) {
		this.value = value;
	}
	
	public String getValuelimit() {
		return valuelimit;
	}
	
	public void setValuelimit(String valuelimit) {
		this.valuelimit = valuelimit;
	}
	
	public String getDescription() {
		return description;
	}
	
	public void setDescription(String description) {
		this.description = description;
	}
	
	public int getRewritable() {
		return rewritable;
	}
	
	public void setRewritable(int rewritable) {
		this.rewritable = rewritable;
	}


}
