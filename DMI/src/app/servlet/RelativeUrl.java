
package app.servlet;

public class RelativeUrl
{

    
    public static final String DATA_MGT = "dataMgt";
    public static final String DATA_MGT_URL = "dmi/dataMgt.jsp";
    


    
    public static String getPageUrl(String page)
    {

        if (page.equals(DATA_MGT))
            return DATA_MGT_URL;


        return DATA_MGT_URL;

    }
}
