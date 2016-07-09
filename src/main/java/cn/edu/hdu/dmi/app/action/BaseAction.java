package cn.edu.hdu.dmi.app.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.google.gson.Gson;
import cn.edu.hdu.dmi.utils.Logger;

/**
 * 
 * @author cp_hdu@163.com
 * @version dmi V1.0.0, 2016年7月9日
 * @see
 * @since dmi V1.0.0
 */
public class BaseAction {
	public final static String SUCCESS = "success";
	public final static String ERROR = "error";
	protected Logger logger = Logger.getLogger(this.getClass());
	protected Gson gson = new Gson();
	protected HttpServletRequest request = ServletActionContext.getRequest();
	protected HttpServletResponse response = ServletActionContext.getResponse();

	protected String getStrParameter(String param) {
		String value = request.getParameter(param);
		return value;
	}

	protected int getIntParameter(String param) {
		int value = Integer.parseInt(request.getParameter(param));
		return value;
	}

	protected long getLongParameter(String param) {
		long value = Long.parseLong(request.getParameter(param));
		return value;
	}

	protected void print(Object obj) {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = null;
		try {
			out = response.getWriter();
			out.print(gson.toJson(obj));

		} catch (IOException e) {
			logger.error(e.toString(), e);
		} finally {
			if (out != null) {
				out.flush();
				out.close();
			}
		}
	}

}
