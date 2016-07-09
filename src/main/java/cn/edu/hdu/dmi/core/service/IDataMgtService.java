package cn.edu.hdu.dmi.core.service;

import java.io.File;
import java.io.InputStream;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import cn.edu.hdu.dmi.core.model.DataImportPromptMessage;
import cn.edu.hdu.dmi.core.model.RstObject;

/**
 * 
 * @author cp_hdu@163.com
 * @version dmi V1.0.0, 2016年7月9日
 * @see
 * @since dmi V1.0.0
 */
public interface IDataMgtService {

	public String importData(String typeId, File file,
			DataImportPromptMessage promtMsg);

	public InputStream downloadTemplate(String type);

	public InputStream exportData(String type);

	public RstObject saveOrUpdateSingleData(HttpServletRequest request,
			String type, DataImportPromptMessage promtMsg, String operateType,
			int gid);

	public String deleteData(String type, int gid);

	public Map<String, Object> queryDataByName(String type, String name, int start, int size);

	public int getCountByName(String type, String name);

	public Object querySingleDataByGid(String type, int gid);
}
