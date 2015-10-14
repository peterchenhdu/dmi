
package app.utils;

import java.net.URL;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;



public class ProPathUtil {
	
	public static String getWebInfRealPath(){
		HttpServletRequest request = ServletActionContext.getRequest();
		return request.getSession().getServletContext().getRealPath("")+"/WEB-INF/";
	}
    public static String getProjectPath()
    {
        URL fileUrl = ProPathUtil.class.getProtectionDomain().getCodeSource().getLocation();
        String path = fileUrl.getPath();
        int index = path.lastIndexOf("WEB-INF");   
        if (index == -1)
        {
            index = path.lastIndexOf("classes");
        }
        else
        {
            index = index + 8;
        }
        if (index == -1)
        {
            index = path.lastIndexOf("bin");
        }
        if(index == -1)
        {
            index = path.lastIndexOf("lib");
        }
        if(index == -1)
        {
            index = path.lastIndexOf("/") + 1;
        }
        path = path.substring(0, index); 
        
        String realPath = null;
        try
        {
            realPath = java.net.URLDecoder.decode(path, "UTF-8");
        }
        catch (java.io.UnsupportedEncodingException e)
        {
            e.printStackTrace();
        }
        return realPath;
    }
}
