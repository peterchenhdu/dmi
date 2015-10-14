
package dmi.xml;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;

import com.thoughtworks.xstream.XStream;


public class XmlProfileParser extends AbstractXmlProfileParser
{
    XStream xStream = null;

    public XmlProfileParser()
    {
        // use xpp3 driver
        xStream = new XStream();
        // use default dom driver
        // xStream = new XStream(new DomDriver());
    }
    
    public XmlProfileParser(Class<?> clazz)
    {
        xStream = new XStream();
        // enable class annotation
        xStream.processAnnotations(clazz);
    }
    
    
    @Override
    public Object read(File file)
    {
        // TODO Auto-generated method stub
        return xStream.fromXML(file);
    }

    
    @Override
    public Object read(String marshalledData)
    {
        // TODO Auto-generated method stub
        return xStream.fromXML(marshalledData);
    }

    
    @Override
    public void write(Object obj, String path) throws IOException
    {
        // TODO Auto-generated method stub
        xStream.toXML(obj, new FileWriter(path));
    }

    
    @Override
    public String write(Object obj)
    {
        // TODO Auto-generated method stub
        return xStream.toXML(obj);
    }

    @Override
    public void alias(String name, Class<?> type)
    {
        // TODO Auto-generated method stub
        xStream.alias(name, type);
    }

    @Override
    public void useAttributeFor(String fieldName, Class<?> type)
    {
        // TODO Auto-generated method stub
        xStream.useAttributeFor(fieldName, type);
    }

    public void aliasAttribute(Class<?> type, String attributeName, String alias)
    {
        xStream.aliasAttribute(type, attributeName, alias);
    }
    
    public void aliasField(String alias, Class<?> definedIn, String fieldName)
    {
        xStream.aliasField(alias, definedIn, fieldName);
    }
    public void addImplicitCollection(Class<?> ownerType, String fieldName)
    {
        xStream.addImplicitCollection(ownerType, fieldName);
    }
    
    public void addImplicitCollection(Class<?> ownerType, String fieldName, Class<?> itemType)
    {
        xStream.addImplicitCollection(ownerType, fieldName,itemType);
    }

}
