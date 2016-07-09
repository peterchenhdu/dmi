package cn.edu.hdu.dmi.app.model;

import java.io.Serializable;

/**
 * 
 * @author cp_hdu@163.com
 * @version dmi V1.0.0, 2016年7月9日
 * @see
 * @since dmi V1.0.0
 */
public class Hotel implements Serializable {

	private static final long serialVersionUID = 2005430855147907057L;

	private int gid;

	private String name;
	private String address;
	private String legalperson;
	private String worktime;
	private String phone;
	private String recommendation;
	private String avgprice;
	private String businessscope;
	private int maxpeoplenum;
	private String haswifi;
	private String score;
	private String image;

	private int clickcount;
	private int monitorid;
	private String monitortype;
	private String description;

	public int getGid() {
		return gid;
	}

	public void setGid(int gid) {
		this.gid = gid;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getLegalperson() {
		return legalperson;
	}

	public void setLegalperson(String legalperson) {
		this.legalperson = legalperson;
	}

	public String getWorktime() {
		return worktime;
	}

	public void setWorktime(String worktime) {
		this.worktime = worktime;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getRecommendation() {
		return recommendation;
	}

	public void setRecommendation(String recommendation) {
		this.recommendation = recommendation;
	}

	public String getAvgprice() {
		return avgprice;
	}

	public void setAvgprice(String avgprice) {
		this.avgprice = avgprice;
	}

	public String getBusinessscope() {
		return businessscope;
	}

	public void setBusinessscope(String businessscope) {
		this.businessscope = businessscope;
	}

	public int getMaxpeoplenum() {
		return maxpeoplenum;
	}

	public void setMaxpeoplenum(int maxpeoplenum) {
		this.maxpeoplenum = maxpeoplenum;
	}

	public String getHaswifi() {
		return haswifi;
	}

	public void setHaswifi(String haswifi) {
		this.haswifi = haswifi;
	}

	public String getScore() {
		return score;
	}

	public void setScore(String score) {
		this.score = score;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public int getClickcount() {
		return clickcount;
	}

	public void setClickcount(int clickcount) {
		this.clickcount = clickcount;
	}

	public int getMonitorid() {
		return monitorid;
	}

	public void setMonitorid(int monitorid) {
		this.monitorid = monitorid;
	}

	public String getMonitortype() {
		return monitortype;
	}

	public void setMonitortype(String monitortype) {
		this.monitortype = monitortype;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

}
