package cn.edu.hdu.dmi.app.servlet;

/**
 * 
 * @author cp_hdu@163.com
 * @version dmi V1.0.0, 2016年7月9日
 * @see
 * @since dmi V1.0.0
 */
public class RelativeUrl {

	public static final String DATA_MGT = "dataMgt";
	public static final String DATA_MGT_URL = "dmi/dataMgt.jsp";

	public static String getPageUrl(String page) {

		if (page.equals(DATA_MGT))
			return DATA_MGT_URL;
		else
			return DATA_MGT_URL;

	}
}
