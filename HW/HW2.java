package com.eeit9728;

import java.sql.*;

public class HW2 {

	public static void main(String[] args) {
		Connection conn = null;

		try {
			String connUrl = "jdbc:sqlserver://localhost:1433;databaseName=DB01";
			conn = DriverManager.getConnection(connUrl, "sa", "P@ssw0rd");
			
			String delStmt = "DELETE playlist WHERE movie=?";
			PreparedStatement delPstmt = conn.prepareStatement(delStmt);
			delPstmt.setInt(1, 1);
			delPstmt.executeUpdate();
			
			String insStm ="INSERT INTO playlist values(?,?,?)";
			PreparedStatement pstmt = conn.prepareStatement(insStm);
			pstmt.setString(1, "2016-12-25 13:00");
			pstmt.setInt(2, 1);
			pstmt.setString(3, "AÆU");
			pstmt.executeUpdate();					
			
			pstmt =conn.prepareStatement("select * from m_room");
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()){
				System.out.print("roomid = " + rs.getString("roomid") + ", ");
				System.out.print("seat_row = " + rs.getInt("seat_row")+ ", ");
				System.out.println("seat_col = " + rs.getInt("seat_col"));												
			}
			
			
			String sel = "SELECT seat_row, seat_col FROM m_room";
			PreparedStatement selPstmt = conn.prepareStatement(sel);
			ResultSet selRs = pstmt.executeQuery();
			selRs.next();
			int row = selRs.getInt("seat_row");
			int col = selRs.getInt("seat_col");
			
			String set ="insert into seats values ('2016-12-25 13:00', 1, ?, '0', NULL);";
			PreparedStatement set2 = conn.prepareStatement(set);
			for(int i=1;i<=row;i++){
				for(int j=1;j<=col;j++){
					set2.setString(1, String.format("%02d-%02d",i,j));
					set2.executeUpdate();
				}
			}
			
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
