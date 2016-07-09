package cn.edu.hdu.dmi.xml;

import java.io.File;
import java.io.IOException;

/**
 * 
 * @author cp_hdu@163.com
 * @version dmi V1.0.0, 2016年7月9日
 * @see
 * @since dmi V1.0.0
 */
public abstract class AbstractXmlProfileParser implements IProfileParser {

	public AbstractXmlProfileParser() {

	}

	abstract public Object read(File file);

	abstract public Object read(String marshalledData);

	abstract public void write(Object obj, String path) throws IOException;

	abstract public String write(Object obj);

	abstract public void alias(String name, Class<?> type);

	abstract public void useAttributeFor(String fieldName, Class<?> type);

	@Override
	public String get(String key, String path) {
		return null;
	}

	@Override
	public void set(String key, String value, String path) {

	}

}
