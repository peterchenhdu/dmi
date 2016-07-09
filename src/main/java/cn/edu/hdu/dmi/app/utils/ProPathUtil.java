
package cn.edu.hdu.dmi.app.utils;

import java.net.URL;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import cn.edu.hdu.dmi.utils.Logger;


/**
 * 
 * @author cp_hdu@163.com
 * @version dmi V1.0.0, 2016年7月9日
 * @see
 * @since dmi V1.0.0
 */
public class ProPathUtil {
	protected static Logger logger = Logger.getLogger(ProPathUtil.class);
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
        	logger.error(e.toString(), e);
        }
        return realPath;
    }
}
