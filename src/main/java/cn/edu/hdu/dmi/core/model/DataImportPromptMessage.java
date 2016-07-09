
package cn.edu.hdu.dmi.core.model;

import java.util.ArrayList;
import java.util.List;



public class DataImportPromptMessage {

	
	private String filenameExtensionError = "";
	
	private String templateError = "";
	
	private int errorNum = 0;
	private int warnNum = 0;
	private int successNum = 0;
		
	private List<CellInfo> errorList = new ArrayList<CellInfo>();
	private List<CellInfo> warnList = new ArrayList<CellInfo>();
	private List<String> sysExceptionMsgList = new ArrayList<String>();
	

	
	public String getFilenameExtensionError() {
		return filenameExtensionError;
	}
	
	public String getTemplateError() {
		return templateError;
	}
	
	public void setFilenameExtensionError(String filenameExtensionError) {
		this.filenameExtensionError = filenameExtensionError;
		addErrorNum();
	}
	
	public void setTemplateError(String templateError) {
		this.templateError = templateError;
		addErrorNum();
	}
	
	
	
	public int getErrorNum() {
		return errorNum;
	}
	private void addErrorNum(){
		this.errorNum++;
	}
	 
	public void addErrorToList(CellInfo cellError){
		this.errorList.add(cellError);
		addErrorNum();
	}
	
	public List<CellInfo> getErrorList() {
		return errorList;
	}
	
	public List<String> getSysExceptionMsgList() {
		return sysExceptionMsgList;
	}

	public void addSysExceptionMsgList(String ExceptionMsg) {
		this.sysExceptionMsgList.add(ExceptionMsg);
		addErrorNum();
	}
	
	public List<CellInfo> getWarnList() {
		return warnList;
	}
	
	public void addWarnMsg(CellInfo warn) {
		this.warnList.add(warn);
		this.warnNum++;
	}
	
	public int getWarnNum() {
		return warnNum;
	}
	
	public int getSuccessNum() {
		return successNum;
	}

	public void addSuccessNum() {
		this.successNum++;
	}

	
}
