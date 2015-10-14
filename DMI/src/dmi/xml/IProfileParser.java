
package dmi.xml;

import java.io.File;
import java.io.IOException;



public interface IProfileParser
{
    
    public Object read(File file);
    
    public Object read(String marshalledData);

    
    public void write(Object obj, String path) throws IOException;

    
    public String write(Object obj);
    
    
    public String get(String key,String path);
    
    
    public void set(String key,String value,String path);

}
