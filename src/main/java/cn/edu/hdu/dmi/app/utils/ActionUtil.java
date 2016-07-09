package cn.edu.hdu.dmi.app.utils;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import cn.edu.hdu.dmi.utils.Logger;

public class ActionUtil {
	private static final Logger LOGGER = Logger.getLogger(ActionUtil.class);
	public static void print(HttpServletResponse response, String outStr){
    	PrintWriter out = null;
		try {
			 out = response.getWriter();
			 out.print(outStr); 
		} catch (IOException e) {
			e.printStackTrace();
			LOGGER.error("print string error.");
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
}
