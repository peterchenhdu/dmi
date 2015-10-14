
package app.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;




import com.google.gson.Gson;
import com.opensymphony.xwork2.ActionSupport;

import dmi.core.model.Dictionary;
import dmi.core.service.DictionaryService;



public class DataMgtSupportAction extends ActionSupport{
	/**
	 * 
	 */
	private static final long serialVersionUID = 5829307696144617887L;
	private DictionaryService dictionaryService = new DictionaryService();
	
	
	public void getValueByType(){
    	HttpServletRequest request = ServletActionContext.getRequest();
        HttpServletResponse response = ServletActionContext.getResponse();
        response.setContentType("text/html;charset=UTF-8");
        
        String type = request.getParameter("type");
        List<Dictionary> dictionaryList = dictionaryService.getDictionaryListByType(type);
        Map<String, String> map = new HashMap<String, String>();
        for(int i = 0; i < dictionaryList.size(); i++){
        	map.put(dictionaryList.get(i).getValue(), dictionaryList.get(i).getDescription());
        }
        
    	PrintWriter out = null;
    	Gson gson = new Gson();
    	String jsonData = gson.toJson(map);
		try {
			out = response.getWriter();
			out.print(jsonData);
		} catch (IOException e) {
			
			e.printStackTrace();
		} finally{
			out.flush();
			out.close();
		}
	}
}
