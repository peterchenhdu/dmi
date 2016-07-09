package cn.edu.hdu.dmi.app.action;

import java.io.File;
import java.io.InputStream;
import java.util.Map;

import org.apache.struts2.ServletActionContext;

import cn.edu.hdu.dmi.core.config.DateMGConfigurator;
import cn.edu.hdu.dmi.core.config.model.DMConfiger;
import cn.edu.hdu.dmi.core.model.DataImportPromptMessage;
import cn.edu.hdu.dmi.core.model.RstObject;
import cn.edu.hdu.dmi.core.service.IDataMgtService;
import cn.edu.hdu.dmi.core.service.impl.DataMgtServiceImpl;

/**
 * 
 * @author cp_hdu@163.com
 * @version dmi V1.0.0, 2015-10-12
 * @see
 * @since dmi V1.0.0
 */
public class DataMgtAction extends BaseAction {

	private File myFile;
	private String myFileFileName;
	private String myFileFileContentType;

	private InputStream excelStream;
	private String exportFileName;

	private IDataMgtService dataMgtService = new DataMgtServiceImpl();

	/**
	 * 导入数据
	 * 
	 */
	public void importData() {
		try {
			DataImportPromptMessage promtMsg = new DataImportPromptMessage();
			dataMgtService.importData(this.getStrParameter("tableId"), myFile,
					promtMsg);
			this.print(promtMsg);
		} catch (Exception e) {
			this.logger.error(e.toString(), e);
		}
		this.print(ERROR);
	}

	/**
	 * 下载模板
	 * 
	 * @return
	 */
	public String downloadTemplate() {
		try {
			String tableId = this.getStrParameter("tableId");
			excelStream = dataMgtService.downloadTemplate(tableId);
			exportFileName = tableId + "-template.xls";
			return SUCCESS;
		} catch (Exception e) {
			this.logger.error(e.toString(), e);
		}
		return ERROR;
	}

	/**
	 * 导出数据
	 * 
	 * @return
	 */
	public String exportDBDate() {
		try {
			String tableId = this.getStrParameter("tableId");
			excelStream = dataMgtService.exportData(tableId);
			exportFileName = tableId + "-dataExport.xls";
			return SUCCESS;
		} catch (Exception e) {
			this.logger.error(e.toString(), e);
		}
		return ERROR;
	}

	/**
	 * 获取配置文件信息
	 */
	public void getDataMgtCfg() {
		try {
			DMConfiger dmConfiger = DateMGConfigurator.getMDConfiger();
			this.print(dmConfiger);
		} catch (Exception e) {
			this.logger.error(e.toString(), e);
		}
		this.print(ERROR);
	}

	/**
	 * 新增数据
	 */
	public void addData() {
		try {
			String tableId = this.getStrParameter("tableId");
			DataMgtServiceImpl dataMgtService = new DataMgtServiceImpl();
			DataImportPromptMessage promtMsg = new DataImportPromptMessage();
			dataMgtService.saveOrUpdateSingleData(ServletActionContext.getRequest(), tableId, promtMsg,
					"save", -1);
			String result = promtMsg.getWarnList().size() > 0 ? "exist"
					: "success";
			this.print(result);
		} catch (Exception e) {
			this.logger.error(e.toString(), e);
		}
		this.print(ERROR);
	}

	/**
	 * 加载数据
	 */
	public void loadData() {
		try {
			String tableId = this.getStrParameter("tableId");
			int gid = this.getIntParameter("gid");
			DataMgtServiceImpl dataMgtService = new DataMgtServiceImpl();
			Object obj = dataMgtService.querySingleDataByGid(tableId, gid);
			this.print(obj);
		} catch (Exception e) {
			this.logger.error(e.toString(), e);
		}
		this.print(ERROR);
	}

	/**
	 * 修改数据
	 */
	public void editData() {
		try {
			String tableId = this.getStrParameter("tableId");
			DataMgtServiceImpl dataMgtService = new DataMgtServiceImpl();
			RstObject obj = dataMgtService.saveOrUpdateSingleData(request,
					tableId, new DataImportPromptMessage(), "update",
					this.getIntParameter("gid"));
			this.print(obj);
		} catch (Exception e) {
			this.logger.error(e.toString(), e);
		}
		this.print(ERROR);
	}

	/**
	 * 删除数据
	 * 
	 *
	 */
	public void deleteData() {
		try {
			int gid = this.getIntParameter("gid");
			String tableId = request.getParameter("tableId");
			String outStr = dataMgtService.deleteData(tableId, gid);
			this.print(outStr);
		} catch (Exception e) {
			this.logger.error(e.toString(), e);
		}
		this.print(ERROR);
	}

	/**
	 * 查询数据
	 * 
	 *
	 */
	public void queryData() {
		try {
			int offset = this.getIntParameter("offset");
			int pagesize = this.getIntParameter("pagesize");
			String searchCondition = this.getStrParameter("searchCondition");
			String tableId = this.getStrParameter("tableId");
			Map<String, Object> map = dataMgtService.queryDataByName(tableId,
					searchCondition, offset, pagesize);
			this.print(map);
		} catch (Exception e) {
			this.logger.error(e.toString(), e);
		}
		this.print(ERROR);
	}

	public File getMyFile() {
		return myFile;
	}

	public void setMyFile(File myFile) {
		this.myFile = myFile;
	}

	public String getMyFileFileName() {
		return myFileFileName;
	}

	public void setMyFileFileName(String myFileFileName) {
		this.myFileFileName = myFileFileName;
	}

	public String getMyFileFileContentType() {
		return myFileFileContentType;
	}

	public void setMyFileFileContentType(String myFileFileContentType) {
		this.myFileFileContentType = myFileFileContentType;
	}

	public InputStream getExcelStream() {
		return excelStream;
	}

	public void setExcelStream(InputStream excelStream) {
		this.excelStream = excelStream;
	}

	public String getExportFileName() {
		return exportFileName;
	}

	public void setExportFileName(String exportFileName) {
		this.exportFileName = exportFileName;
	}

}
