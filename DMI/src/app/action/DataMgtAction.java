package app.action;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import app.utils.ActionUtil;

import com.google.gson.Gson;
import com.opensymphony.xwork2.ActionSupport;

import dmi.core.config.DateMGConfigurator;
import dmi.core.config.model.DMConfiger;
import dmi.core.model.DataImportPromptMessage;
import dmi.core.service.IDataMgtService;
import dmi.core.service.impl.DataMgtServiceImpl;
import dmi.utils.Logger;

/**
 * 
 * @author    cp_hdu@163.com
 * @version   dmi V1.0.0, 2015-10-12
 * @see       
 * @since     dmi V1.0.0
 */
public class DataMgtAction extends ActionSupport{
	private static final long serialVersionUID = -4338364978140329806L;
    private static final Logger LOGGER = Logger.getLogger(DataMgtAction.class);
    private File myFile;
    private String myFileFileName;
    private String myFileFileContentType;
    private Gson gson = new Gson();
    private InputStream excelStream; 
    private String exportFileName;
    private IDataMgtService dataMgtService = new DataMgtServiceImpl();
    

    
    /**
     * 
     * 
     */
    public void importData(){
        HttpServletRequest request = ServletActionContext.getRequest();
        HttpServletResponse response = ServletActionContext.getResponse();
        response.setContentType("text/html;charset=UTF-8");
        
        DataImportPromptMessage promtMsg = new DataImportPromptMessage();
        
        dataMgtService.importData(request.getParameter("tableId"), myFile, promtMsg);
       
        
    	PrintWriter out = null;
		try {
			out = response.getWriter();

	        String jsonData = gson.toJson(promtMsg);
	        out.print(jsonData);
	
		} catch (IOException e) {

			e.printStackTrace();
		}
        finally
        {
            if (out != null)
            {
                out.flush();
                out.close();
            }
        }
    }
    
    
    public String downloadTemplate(){
        HttpServletRequest request = ServletActionContext.getRequest();

        
        String tableId = request.getParameter("tableId");

		excelStream = dataMgtService.downloadTemplate(tableId); 

		exportFileName=tableId+"-template.xls";
		return SUCCESS;
    }
    
    
    public String exportDBDate(){
    	
        HttpServletRequest request = ServletActionContext.getRequest();

        
        String tableId = request.getParameter("tableId");

		excelStream = dataMgtService.exportData(tableId); 

		exportFileName=tableId+"-dataExport.xls";
		return SUCCESS;
    }
    
    public void getDataMgtCfg(){
        HttpServletResponse response = ServletActionContext.getResponse();
        response.setContentType("text/html;charset=UTF-8");
    	//String tableId = request.getParameter("tableId");
    	DMConfiger dmConfiger = DateMGConfigurator.getMDConfiger();

    	String jsonData = gson.toJson(dmConfiger);
    	PrintWriter out = null;
		try {
			out = response.getWriter();
			out.print(jsonData);
		} catch (IOException e) {

			e.printStackTrace();
		}
        finally
        {
            if (out != null)
            {
                out.flush();
                out.close();
            }
        }
    	
    }
    
    public void addData(){
        HttpServletRequest request = ServletActionContext.getRequest();
        HttpServletResponse response = ServletActionContext.getResponse();
        response.setContentType("text/html;charset=UTF-8");
        String tableId = request.getParameter("tableId");


        
        String result = "success"; 


        DataMgtServiceImpl dataMgtService = new DataMgtServiceImpl();
        DataImportPromptMessage promtMsg = new DataImportPromptMessage();
        dataMgtService.saveOrUpdateSingleData(request, tableId, promtMsg,"save",-1);
        if(promtMsg.getWarnList().size()>0){
        	result="exist";
        }else{
        	result = "success";
        }
    	PrintWriter out = null;
		try {
			out = response.getWriter();
			out.print(result);
		} catch (IOException e) {
	
			e.printStackTrace();
			return;
		}
        finally
        {
            if (out != null)
            {
                out.flush();
                out.close();
            }
        }
        

    }
    
    public void loadData(){
        HttpServletRequest request = ServletActionContext.getRequest();
        HttpServletResponse response = ServletActionContext.getResponse();
        response.setContentType("text/html;charset=UTF-8");
	

        String tableId = request.getParameter("tableId");
        int gid = Integer.parseInt(request.getParameter("gid"));
    	DataMgtServiceImpl dataMgtService = new DataMgtServiceImpl();
    	Object obj = dataMgtService.querySingleDataByGid(tableId,gid);


    	
    	Gson gson = new Gson();
    	String jsonData = gson.toJson(obj);
    	
    	PrintWriter out = null;
		try {
			out = response.getWriter();
			out.print(jsonData);
		} catch (IOException e) {
			
			e.printStackTrace();
			return;
		}	
        finally
        {
            if (out != null)
            {
                out.flush();
                out.close();
            }
        }
    }
    
    public void editData(){
        HttpServletRequest request = ServletActionContext.getRequest();
        HttpServletResponse response = ServletActionContext.getResponse();
        response.setContentType("text/html;charset=UTF-8");

        String tableId = request.getParameter("tableId");
        
        DataMgtServiceImpl dataMgtService = new DataMgtServiceImpl();
        String outStr = dataMgtService.saveOrUpdateSingleData(request, tableId, new DataImportPromptMessage(),"update",Integer.parseInt(request.getParameter("gid")));
        ActionUtil.print(response, outStr);
        
    }
    /**
     * delete data action
     * 
     *
     */
    public void deleteData(){
    	int gid = 0;
    	String tableId = null;
        HttpServletRequest request = ServletActionContext.getRequest();
        HttpServletResponse response = ServletActionContext.getResponse();
        response.setContentType("text/html;charset=UTF-8");
        
        try{
			gid = Integer.parseInt(request.getParameter("gid"));
			tableId = request.getParameter("tableId");
        }catch(Exception e){
        	LOGGER.error("queryData action param error." + "["+e.getMessage()+"]");
        }
         
        String outStr = dataMgtService.deleteData(tableId, gid);
        ActionUtil.print(response, outStr);
    }
    
    /**
     * query data action
     * 
     *
     */
    public void queryData(){
        int offset = 0, pagesize=10;
        String searchCondition = null, tableId = null;
        HttpServletRequest request = ServletActionContext.getRequest();
        HttpServletResponse response = ServletActionContext.getResponse();
        response.setContentType("text/html;charset=UTF-8");

        try{
			offset = Integer.parseInt(request.getParameter("offset"));
			pagesize = Integer.parseInt(request.getParameter("pagesize"));
			searchCondition = request.getParameter("searchCondition");
			tableId = request.getParameter("tableId");
        }catch(Exception e){
        	LOGGER.error("queryData action param error." + "["+e.getMessage()+"]");
        }

        String jsonData = dataMgtService.queryDataByName(tableId,searchCondition,offset,pagesize);
        ActionUtil.print(response, jsonData);
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
