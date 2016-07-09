package cn.edu.hdu.dmi.app.action;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import cn.edu.hdu.dmi.core.model.Dictionary;
import cn.edu.hdu.dmi.core.service.DictionaryService;

/**
 * 
 * @author cp_hdu@163.com
 * @version dmi V1.0.0, 2016年7月9日
 * @see
 * @since dmi V1.0.0
 */
public class DataMgtSupportAction extends BaseAction{

	private DictionaryService dictionaryService = new DictionaryService();
	
	
	public void getValueByType(){
		try {
	        String type = this.getStrParameter("type");
	        List<Dictionary> dictionaryList = dictionaryService.getDictionaryListByType(type);
	        Map<String, String> map = new HashMap<String, String>();
	        for(int i = 0; i < dictionaryList.size(); i++){
	        	map.put(dictionaryList.get(i).getValue(), dictionaryList.get(i).getDescription());
	        }
	        this.print(map);
		} catch (Exception e) {
			this.logger.error(e.toString(), e);
		}
		this.print(ERROR);

	}
}
