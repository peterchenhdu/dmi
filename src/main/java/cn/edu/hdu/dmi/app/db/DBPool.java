package cn.edu.hdu.dmi.app.db;

import java.io.FileInputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;

import javax.sql.DataSource;

import cn.edu.hdu.dmi.app.utils.ProPathUtil;
import cn.edu.hdu.dmi.utils.Logger;

import com.mchange.v2.c3p0.DataSources;

/**
 * 
 * @author cp_hdu@163.com
 * @version dmi V1.0.0, 2016年7月9日
 * @see
 * @since dmi V1.0.0
 */
public class DBPool {
	protected Logger logger = Logger.getLogger(DBPool.class);
	// 配置文件的所有信息
	private static Properties c3p0Pro = null;
	// 配置文件中关于C3P0的信息
	private static Properties c3propes = null;
	// 配置文件中关于JDBC的信息
	private static Properties jdbcpropes = null;

	private static final String JDBC_DRIVER = "driverClass";
	private static final String JDBC_URL = "jdbcUrl";

	// 数据库连接配置信息
	Connection dbConnection = null;
	ResultSet dbResultSet = null;
	Statement dbStatement = null;
	DataSource ds = null;

	boolean isConfigured = false;
	boolean isDriverLoaded = false;
	boolean isConnected = false;
	boolean isStatementCreated = false;

	private DBPool() {
		c3p0Pro = new Properties();
		try {
			// 加载配置文件
			c3p0Pro.load(new FileInputStream(ProPathUtil.getWebInfRealPath()
					+ "config/c3p0.properties"));
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}
		jdbcpropes = new Properties();
		c3propes = new Properties();

		for (Object key : c3p0Pro.keySet()) {
			String skey = (String) key;
			if (skey.startsWith("c3p0.")) {
				c3propes.put(skey, c3p0Pro.getProperty(skey));
			} else {
				jdbcpropes.put(skey, c3p0Pro.getProperty(skey));
			}
		}

		String driverClass = c3p0Pro.getProperty(JDBC_DRIVER);
		if (driverClass != null) {
			try {
				// 加载驱动类
				Class.forName(driverClass);
			} catch (ClassNotFoundException e) {
				logger.error(e.toString(), e);
			}
		}

		// 建立连接池
		DataSource unPooled;
		try {
			unPooled = DataSources.unpooledDataSource(
					c3p0Pro.getProperty(JDBC_URL), jdbcpropes);
			ds = DataSources.pooledDataSource(unPooled, c3propes);
		} catch (SQLException e) {
			logger.error(e.toString(), e);
		}

	}

	private static class DBPoolHolder {
		public final static DBPool instance = new DBPool();
	}

	public static DBPool getInstance() {
		return DBPoolHolder.instance;
	}

	public void close(ResultSet rs, PreparedStatement ps, Connection conn)
			throws SQLException {
		try {
			if (rs != null)
				rs.close();
		} catch (SQLException e1) {
			logger.error(e1.toString(), e1);
			throw new SQLException("ResultSet close failed", e1);
		} finally {
			try {
				if (ps != null) {
					ps.close();
				}
			} catch (SQLException e2) {
				logger.error(e2.toString(), e2);
				throw new SQLException("PreparedStatement close failed", e2);
			} finally {
				if (conn != null) {
					try {
						conn.close();
					} catch (Exception e3) {
						logger.error(e3.toString(), e3);
						throw new SQLException("Connection close failed", e3);
					}
				}
			}
		}
	}

	public Connection getConnection() throws Exception {
		dbConnection = ds.getConnection();
		return dbConnection;
	}

	public void closeConnection(Connection conn) throws SQLException {
		if (conn != null) {
			try {
				conn.close();
			} catch (Exception e) {
				logger.error(e.toString(), e);
				throw new SQLException("Connection close failed", e);
			}
		}
	}
}