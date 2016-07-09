package cn.edu.hdu.dmi.core.service;

import java.util.ArrayList;
import java.util.List;

import cn.edu.hdu.dmi.core.dao.IDataMgtDao;
import cn.edu.hdu.dmi.core.dao.impl.DataMgtDaoImpl;
import cn.edu.hdu.dmi.core.model.Dictionary;

/**
 * 
 * @author cp_hdu@163.com
 * @version dmi V1.0.0, 2016年7月9日
 * @see
 * @since dmi V1.0.0
 */
public class DictionaryService {
	private IDataMgtDao dataMgtDao = new DataMgtDaoImpl();

	public Dictionary getDictionaryByTypeAndName(String type, String name) {
		List<Object> list = dataMgtDao.queryObjects("dictionary",
				"where obj.name='" + name + "' and obj.type='" + type + "'");
		if (list.size() > 0) {
			return (Dictionary) list.get(0);
		} else {
			return null;
		}
	}

	public List<Dictionary> getDictionaryListByType(String type) {
		List<Object> list = dataMgtDao.queryObjects("dictionary",
				"where obj.type='" + type + "'");
		List<Dictionary> listDictionary = new ArrayList<Dictionary>();
		for (Object obj : list) {
			listDictionary.add((Dictionary) obj);
		}
		return listDictionary;
	}
}
