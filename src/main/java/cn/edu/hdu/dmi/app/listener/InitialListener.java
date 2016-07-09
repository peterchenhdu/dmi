package cn.edu.hdu.dmi.app.listener;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.apache.log4j.xml.DOMConfigurator;

import cn.edu.hdu.dmi.app.utils.ProPathUtil;

/**
 * 
 * @author cp_hdu@163.com
 * @version dmi V1.0.0, 2016年7月9日
 * @see
 * @since dmi V1.0.0
 */
public class InitialListener implements ServletContextListener {
	private static final String LOG4J_CONFIG_PATH = "config/log4j.xml";

	@Override
	public void contextDestroyed(ServletContextEvent arg0) {

	}

	@Override
	public void contextInitialized(ServletContextEvent arg0) {
		DOMConfigurator.configureAndWatch(ProPathUtil.getProjectPath()
				+ LOG4J_CONFIG_PATH);
	}

}
