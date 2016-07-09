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
public interface IProfileParser {

	public Object read(File file);

	public Object read(String marshalledData);

	public void write(Object obj, String path) throws IOException;

	public String write(Object obj);

	public String get(String key, String path);

	public void set(String key, String value, String path);

}
