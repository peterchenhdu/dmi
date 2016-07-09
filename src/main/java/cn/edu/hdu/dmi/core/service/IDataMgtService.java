
package cn.edu.hdu.dmi.core.service;

import java.io.File;
import java.io.InputStream;

import javax.servlet.http.HttpServletRequest;

import cn.edu.hdu.dmi.core.model.DataImportPromptMessage;





public interface IDataMgtService {

	public String importData(String typeId, File file, DataImportPromptMessage promtMsg);
	
	public InputStream downloadTemplate(String type);
	
	public InputStream exportData(String type);
	
	public String saveOrUpdateSingleData(HttpServletRequest request, String type, DataImportPromptMessage promtMsg, String operateType, int gid);
	
	public String deleteData(String type, int gid);
	
	public String queryDataByName(String type,String name,int start,int size);
	public int getCountByName(String type,String name);
	
	public Object querySingleDataByGid(String type, int gid);
}
