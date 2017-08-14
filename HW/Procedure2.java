package com.eeit9728;

import java.sql.*;

public class Procedure2 {

	public static void main(String[] args) {
		Connection conn = null;

		

		try {
			String connUrl = "jdbc:sqlserver://localhost:1433;databaseName=DB01";
			conn = DriverManager.getConnection(connUrl, "sa", "P@ssw0rd");

			conn.setAutoCommit(false);
			
			
			String sql = "{call gen_seats(?,?,?)}";
			CallableStatement cst = conn.prepareCall(sql);  //CallableStatement呼叫SQL檔案
			cst.setString(1, "2016-12-25 13:00");
			cst.setInt(2, 1);
			cst.setString(3, "A廳");
			cst.execute();

			conn.commit();
			conn.setAutoCommit(true);
			
//			if (cst.execute()) {
//				conn.rollback();
//			} else {
//				conn.commit();
//			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (conn != null)
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
		}

	}
}