package cn.edu.hdu.dmi.core.config;

import java.io.File;
import java.util.List;

import cn.edu.hdu.dmi.app.utils.ProPathUtil;
import cn.edu.hdu.dmi.core.config.model.DMConfiger;
import cn.edu.hdu.dmi.core.config.model.DMField;
import cn.edu.hdu.dmi.core.config.model.DMTable;
import cn.edu.hdu.dmi.xml.XmlProfileParser;

/**
 * 
 * @author cp_hdu@163.com
 * @version dmi V1.0.0, 2016年7月9日
 * @see
 * @since dmi V1.0.0
 */
public class DateMGConfigurator {
	private final static String PATH_STRING = "config/data-config.xml";

	public final static String SQL_FIELD = "0";
	public final static String SQL_PARAMS = "1";
	public final static String HAS_XY_VALUE = "yes";

	public static DMConfiger getMDConfiger() {
		XmlProfileParser parser = new XmlProfileParser();
		parser.alias(IDMProfileLabel.DATA_MGT, DMConfiger.class);
		parser.alias(IDMProfileLabel.TABLE, DMTable.class);
		parser.alias(IDMProfileLabel.FIELD, DMField.class);

		parser.aliasAttribute(DMConfiger.class, IDMProfileLabel.VERSION,
				IDMProfileLabel.VERSION);
		parser.aliasAttribute(DMConfiger.class, IDMProfileLabel.DESCRIPTION,
				IDMProfileLabel.DESCRIPTION);
		parser.aliasAttribute(DMConfiger.class, IDMProfileLabel.TABLES,
				IDMProfileLabel.TABLES);

		parser.aliasAttribute(DMTable.class, IDMProfileLabel.NAME,
				IDMProfileLabel.NAME);
		parser.aliasAttribute(DMTable.class, IDMProfileLabel.TYPE,
				IDMProfileLabel.TYPE);
		parser.aliasAttribute(DMTable.class, IDMProfileLabel.TITLE,
				IDMProfileLabel.TITLE);
		parser.aliasAttribute(DMTable.class, IDMProfileLabel.CLASS_PATH,
				IDMProfileLabel.CLASS_PATH);
		parser.aliasAttribute(DMTable.class, IDMProfileLabel.FIELDS,
				IDMProfileLabel.FIELDS);

		parser.aliasAttribute(DMField.class, IDMProfileLabel.DB_NAME,
				IDMProfileLabel.DB_NAME);
		parser.aliasAttribute(DMField.class, IDMProfileLabel.NAME,
				IDMProfileLabel.NAME);
		parser.aliasAttribute(DMField.class, IDMProfileLabel.TYPE,
				IDMProfileLabel.TYPE);
		parser.aliasAttribute(DMField.class, IDMProfileLabel.TITLE,
				IDMProfileLabel.TITLE);
		parser.aliasAttribute(DMField.class, IDMProfileLabel.IS_NULL,
				IDMProfileLabel.IS_NULL);
		parser.aliasAttribute(DMField.class, IDMProfileLabel.MAX_LENGTH,
				IDMProfileLabel.MAX_LENGTH);
		parser.aliasAttribute(DMField.class, IDMProfileLabel.NOT_EDIT_FLAG,
				IDMProfileLabel.NOT_EDIT_FLAG);
		parser.aliasAttribute(DMField.class, IDMProfileLabel.INPUT_TYPE,
				IDMProfileLabel.INPUT_TYPE);
		parser.aliasAttribute(DMField.class, IDMProfileLabel.VALUE_FROM,
				IDMProfileLabel.VALUE_FROM);
		parser.aliasAttribute(DMField.class, IDMProfileLabel.VALUE_PARAM,
				IDMProfileLabel.VALUE_PARAM);
		parser.aliasAttribute(DMField.class, IDMProfileLabel.VALUE_SOURCE,
				IDMProfileLabel.VALUE_SOURCE);
		parser.aliasAttribute(DMField.class, IDMProfileLabel.IS_PRIMARY_KEY,
				IDMProfileLabel.IS_PRIMARY_KEY);

		File f = new File(ProPathUtil.getWebInfRealPath() + PATH_STRING);
		return (DMConfiger) parser.read(f);
	}

	public static DMTable getDMTableByType(String type) {
		DMConfiger dmConfiger = DateMGConfigurator.getMDConfiger();
		List<DMTable> tables = dmConfiger.getTables();
		for (int i = 0; i < tables.size(); i++) {
			if (tables.get(i).getType().equals(type)) {
				return tables.get(i);
			}
		}
		return null;
	}

	public static String getSetMethodByFieldStr(String filedStr) {

		return "set"
				+ filedStr.replaceFirst(filedStr.substring(0, 1), filedStr
						.substring(0, 1).toUpperCase());
	}

	public static String getGetMethodByFieldStr(String filedStr) {

		return "get"
				+ filedStr.replaceFirst(filedStr.substring(0, 1), filedStr
						.substring(0, 1).toUpperCase());
	}

	public static String generateSqlPartStr(DMTable dmTable, String type) {

		StringBuffer sqlFields = new StringBuffer(" ( ");
		StringBuffer sqlParams = new StringBuffer(" ( ");

		for (int i = 0; i < dmTable.getFields().size(); i++) {
			DMField filed = dmTable.getFields().get(i);
			if (filed.getDbName().equals("null"))
				continue;// null由xml文件中定义，表示该字段不插入该表数据库
			sqlFields.append(filed.getDbName() + ",");
			sqlParams.append("?,");
		}
		sqlFields.setCharAt(sqlFields.length() - 1, ')');
		sqlParams.setCharAt(sqlParams.length() - 1, ')');
		if (SQL_FIELD.equals(type)) {
			return sqlFields.toString();
		} else if (SQL_PARAMS.equals(type)) {
			return sqlParams.toString();
		}
		return sqlFields.toString();

	}

	public static String generateUpdateSqlPartStr(DMTable dmTable) {

		StringBuffer sqlFields = new StringBuffer(" SET ");

		for (int i = 0; i < dmTable.getFields().size(); i++) {
			DMField filed = dmTable.getFields().get(i);
			if (filed.getDbName().equals("null"))
				continue;// null由xml文件中定义，表示该字段不插入该表数据库
			if (("true").equals(filed.getNotEditFlag()))
				continue;

			sqlFields.append(filed.getDbName() + "=?,");

		}
		sqlFields.deleteCharAt(sqlFields.length() - 1);
		return sqlFields.toString();

	}

	public static String generateQuerySqlStr(DMTable dmTable, String type) {

		StringBuffer querySql = new StringBuffer("select ");

		for (int i = 0; i < dmTable.getFields().size(); i++) {
			DMField filed = dmTable.getFields().get(i);

			querySql.append("obj." + filed.getDbName() + ",");

		}

		querySql.setCharAt(querySql.length() - 1, ' ');
		querySql.append("from " + dmTable.getName() + " obj ");

		return querySql.toString();
	}

}
