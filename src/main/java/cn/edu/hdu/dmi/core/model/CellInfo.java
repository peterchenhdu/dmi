package cn.edu.hdu.dmi.core.model;

/**
 * 
 * @author cp_hdu@163.com
 * @version dmi V1.0.0, 2016年7月9日
 * @see
 * @since dmi V1.0.0
 */
public class CellInfo {

	private int rowNum;

	private int columnNum;
	private String errorMsg;

	public CellInfo(int i, int j, String msg) {
		this.rowNum = i;
		this.columnNum = j;
		this.errorMsg = msg;
	}

	public int getRowNum() {
		return rowNum;
	}

	public int getColumnNum() {
		return columnNum;
	}

	public String getErrorMsg() {
		return errorMsg;
	}

	public void setRowNum(int rowNum) {
		this.rowNum = rowNum;
	}

	public void setColumnNum(int columnNum) {
		this.columnNum = columnNum;
	}

	public void setErrorMsg(String errorMsg) {
		this.errorMsg = errorMsg;
	}

}
