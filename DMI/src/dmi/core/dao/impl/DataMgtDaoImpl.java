
package dmi.core.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.SQLTimeoutException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;














import app.db.DBPool;
import dmi.core.config.DateMGConfigurator;
import dmi.core.config.model.DMField;
import dmi.core.config.model.DMTable;
import dmi.core.dao.IDataMgtDao;
import dmi.core.model.DataImportPromptMessage;





public class DataMgtDaoImpl implements IDataMgtDao {
	
	@Override
	public String saveOrUpdateDatas(List<Object> dataList, String type, DataImportPromptMessage promtMsg, String operateType,int gid) {
		
		DMTable dmTable= DateMGConfigurator.getDMTableByType(type);
		String tableName = dmTable.getName();
		String sqlFields = DateMGConfigurator.generateSqlPartStr(dmTable, DateMGConfigurator.SQL_FIELD);
		String sqlParams = DateMGConfigurator.generateSqlPartStr(dmTable, DateMGConfigurator.SQL_PARAMS);
		String sqlupdate = DateMGConfigurator.generateUpdateSqlPartStr(dmTable);
		
        PreparedStatement ps = null;
        ResultSet rs = null;
        Connection conn = null;
        try
        {
        	conn = DBPool.getInstance().getConnection();
            conn.setAutoCommit(false);
            for(int i = 0; i < dataList.size(); i++){
            	Object obj =  dataList.get(i);
            	Class<?> cl= Class.forName(dmTable.getClasspath());
            	
            	String sql = "";
            	sql = "INSERT INTO "+ tableName + sqlFields +" VALUES "+sqlParams;
            	
            	
            	List<Object> paramsValueList = new ArrayList<Object>();
            	String name = null;
            	double objX = 0, objY =0;
            	for(int j = 0; j < dmTable.getFields().size(); j++){
            		DMField dmField = dmTable.getFields().get(j);
            		//通过reflect获取属性值
            		Object rst = cl.getDeclaredMethod(DateMGConfigurator.getGetMethodByFieldStr(dmField.getName()), new Class[]{}).invoke(obj, new Object[]{});
            		
            		if(dmField.getName().equals("name")){ //插入spatial表的名称
            			name = (String)rst;
            		}
            		if(dmField.getName().equals("x")){  //spatial表经纬度值
            			objX = (double)rst;
            			continue;
            		}
            		if(dmField.getName().equals("y")){  //spatial表经纬度值
            			objY = (double)rst;
            			continue;
            		}
            		
            		if("update".equals(operateType)&&("true").equals(dmField.getNotEditFlag())){
            			continue;
            		}
            		
            		paramsValueList.add(rst);
            	}
            	

            	if("update".equals(operateType)){
            		sql = "UPDATE "+ tableName + sqlupdate +" where gid='"+gid+"'";
            	}
            	int link_id = this.updateBatch(conn, sql, paramsValueList.toArray(),true); //spatial表的link_id
            	

		        promtMsg.addSuccessNum();
            }
            conn.commit();
            conn.setAutoCommit(true);
            
        }
        catch (SQLException e) {

			promtMsg.addSysExceptionMsgList(e.getMessage());
			try {
				if (!conn.isClosed()) {
					conn.rollback();
					conn.setAutoCommit(true);
				}
			} catch (SQLException e1) {

				promtMsg.addSysExceptionMsgList(e1.getMessage());
			}
			return "error";
		} catch (Exception e) {

			promtMsg.addSysExceptionMsgList(e.getMessage());
			try {
				if (!conn.isClosed()) {
					conn.rollback();
					conn.setAutoCommit(true);
				}
			} catch (SQLException e1) {
		
				promtMsg.addSysExceptionMsgList(e1.getMessage());
			}
			return "error";
		} finally {
			try {
				DBPool.getInstance().close(rs, ps,conn);
			} catch (SQLException exc) {
				
				
			}
		}
		return "success";
	}
	

    
    private int updateBatch(Connection conn, String sql, Object[] args, boolean isGeneralKey) throws SQLException 
    {
        PreparedStatement ps = null;
        ResultSet rs = null;
        int key = -1;
        try
        {
            ps = (isGeneralKey ? conn.prepareStatement(sql,Statement.RETURN_GENERATED_KEYS) : conn.prepareStatement(sql));


            if (args.length > 0)
            {
                for (int i = 0; i < args.length; i++)
                    ps.setObject(i + 1, args[i]);
            }

            
            if(true == isGeneralKey){
                int row = ps.executeUpdate();
                rs = ps.getGeneratedKeys ();
                if ( rs.next() ) {  
                    key = rs.getInt(row);  

                 }  
            }

        }
	
		catch (SQLTimeoutException exc) {
	

		}
	
		catch (SQLException exc) {

		} finally {
			if(ps!=null){
				ps.close();
			}
			if(rs!=null){
				rs.close();
			}
		}
        return key;
    }

	
	@Override
	public List<Object> queryObjects(String type, String condition) {
		
		DMTable dmTable= DateMGConfigurator.getDMTableByType(type);
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        List<Object> results = new ArrayList<Object>();
        try
        {
        	conn = DBPool.getInstance().getConnection();
            conn.setAutoCommit(false);
            
            String sql = DateMGConfigurator.generateQuerySqlStr(dmTable,type);
            if(condition!=null || !condition.equals("")){
            	sql += condition;
            }
            
            
            
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();

            Object obj = null;
            while (rs.next())
            {
            	
    	    	Class<?> cl= Class.forName(dmTable.getClasspath());
    	    	obj= cl.newInstance();
    	    	
    	    	for(int i = 0; i < dmTable.getFields().size(); i++){
    	    		DMField dmField = dmTable.getFields().get(i);
    	    		Object[] objArrs = null;
    	    		Class<?>[] classObjArrs = null;

    	    			
    	    		switch (dmField.getType()){
	    	    		case "String":
	    	    			objArrs = rs.getString(i+1)==null ? new Object[]{""} :new Object[]{rs.getString(i+1)};
	    	    			classObjArrs = new Class[]{String.class};
	    	    			break;
	    	    		case "double":
	    	    			objArrs = new Object[]{rs.getDouble(i+1)};
	    	    			classObjArrs = new Class[]{Double.TYPE};  //基本类型用该方式
	    	    			break;
	    	    		case "int":
	    	    			objArrs = new Object[]{rs.getInt(i+1)};
	    	    			classObjArrs = new Class[]{Integer.TYPE}; 
	    	    			break;
	    	    		case "Integer":
	    	    			objArrs = new Object[]{rs.getObject(dmField.getName())};
	    	    			classObjArrs = new Class[]{Integer.class}; 
	    	    			break;
	    	    		case "float":
	    	    			objArrs = new Object[]{rs.getFloat(i+1)};
	    	    			classObjArrs = new Class[]{Float.TYPE};  
	    	    			break;
	    	    		default:
	    	    			objArrs = new Object[]{rs.getString(i+1)};	
    	    		}
    	    		cl.getDeclaredMethod(DateMGConfigurator.getSetMethodByFieldStr(dmField.getName()), classObjArrs).invoke(obj, objArrs);
	    		
     	

    	    	}
 
                results.add(obj);
            }
            
            
            conn.commit();
            conn.setAutoCommit(true);
            return results;
        }
        catch (SQLException e) {
	
			try {
				if (!conn.isClosed()) {
					conn.setAutoCommit(false);
					conn.rollback();
					conn.setAutoCommit(true);
				}
			} catch (SQLException e1) {
				
			}
		} catch (Exception e) {
			
			try {
				if (!conn.isClosed()) {
					conn.setAutoCommit(false);
					conn.rollback();
					conn.setAutoCommit(true);
				}
			} catch (SQLException e1) {
			

			}

		} finally {
			try {
				DBPool.getInstance().close(rs, ps,conn);
			} catch (SQLException exc) {
				
				
			}  
		}
        return results;
	}

	public String deleteData(String type, int gid) throws  SQLException{
        Connection conn = null;
		try {
			conn = DBPool.getInstance().getConnection();
		} catch (Exception e2) {
			// TODO Auto-generated catch block
			e2.printStackTrace();
		}
        Statement st = null;
 
        DMTable dmTable= DateMGConfigurator.getDMTableByType(type);
        try
        {
            conn.setAutoCommit(false);
            st=conn.createStatement();

            st.addBatch("delete from "+dmTable.getName()+" where gid='"+gid+"'");
            //st.addBatch("delete from t_omot_spatial where type='"+type+"' and link_gid='"+gid+"'");
            st.executeBatch();
            
            conn.commit();
            conn.setAutoCommit(true);

        }
        catch (SQLException e)
        {
            try
            {
                if (!conn.isClosed())
                {
                    conn.rollback();
                    conn.setAutoCommit(true);
                }
            }
            catch (SQLException e1)
            {
                
            }
           
        }
        finally
        {
            try
            {
            	st.close();
            	conn.close();
            }
            catch (SQLException e)
            {
                
            }
        }
        return "success";
	}

	
	@Override
	public int getCount(String type, String condition) {

		DMTable dmTable= DateMGConfigurator.getDMTableByType(type);
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try
        {
        	conn = DBPool.getInstance().getConnection();
            conn.setAutoCommit(false);
            
            String sql = "select count(*) from "+dmTable.getName()+ " obj ";
            		
            if(condition!=null || !condition.equals("")){
            	sql += condition;
            }
            
            
            
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            conn.commit();
            conn.setAutoCommit(true);
            
            rs.next();
            int columnIndex = 1;
            int records = rs.getInt(columnIndex);
            
            return records;
        }
        catch (SQLException e) {

			try {
				if (!conn.isClosed()) {
					conn.setAutoCommit(false);
					conn.rollback();
					conn.setAutoCommit(true);
				}
			} catch (SQLException e1) {

			}
		} catch (Exception e) {
		
			try {
				if (!conn.isClosed()) {
					conn.setAutoCommit(false);
					conn.rollback();
					conn.setAutoCommit(true);
				}
			} catch (SQLException e1) {
	

			}

		} finally {
			try {
				DBPool.getInstance().close(rs, ps,conn);
			} catch (SQLException exc) {
				
				
			}
		}
		return 0;
       
	}


    
}
