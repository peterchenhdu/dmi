package cn.edu.hdu.dmi.core.model;

import java.util.HashMap;
import java.util.Map;

/**
 * 
 * @author cp_hdu@163.com
 * @version dmi V1.0.0, 2016年7月9日
 * @see
 * @since dmi V1.0.0
 */
public class RstObject {
	private boolean isExeSuccess;
	private Map<String, Object> dataMap;

	public RstObject() {
		this.isExeSuccess = true;
		this.dataMap = new HashMap<String, Object>();
	}

	public Map<String, Object> getDataMap() {
		return dataMap;
	}

	public void setDataMap(Map<String, Object> dataMap) {
		this.dataMap = dataMap;
	}

	public boolean isExeSuccess() {
		return isExeSuccess;
	}

	public void setExeSuccess(boolean isExeSuccess) {
		this.isExeSuccess = isExeSuccess;
	}
}
