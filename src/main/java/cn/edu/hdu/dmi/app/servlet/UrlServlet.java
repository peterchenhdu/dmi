package cn.edu.hdu.dmi.app.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 
 * @author cp_hdu@163.com
 * @version dmi V1.0.0, 2016年7月9日
 * @see
 * @since dmi V1.0.0
 */
@WebServlet("/UrlServlet")
public class UrlServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public UrlServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/jsp/"
				+ RelativeUrl.getPageUrl("index"));
		String page = request.getParameter("page");

		rd = request.getRequestDispatcher("/WEB-INF/jsp/"
				+ RelativeUrl.getPageUrl(page));

		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
