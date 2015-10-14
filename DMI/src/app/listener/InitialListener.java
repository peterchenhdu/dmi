
package app.listener;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.apache.log4j.xml.DOMConfigurator;

import app.utils.ProPathUtil;




public class InitialListener implements ServletContextListener
{
    private static final String LOG4J_CONFIG_PATH = "config/log4j.xml";
    
    @Override
    public void contextDestroyed(ServletContextEvent arg0)
    {
        
    }

    
    @Override
    public void contextInitialized(ServletContextEvent arg0)
    {
        DOMConfigurator.configureAndWatch(ProPathUtil.getProjectPath()+LOG4J_CONFIG_PATH);
    }

}
