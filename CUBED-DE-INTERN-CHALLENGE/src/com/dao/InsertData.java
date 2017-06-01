package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.bean.Bean;
import com.bean.ListBean;

public class InsertData {

	public int insert(ListBean k){
		Connection con=null;
		PreparedStatement ps=null;
		int flag=0;
		con=MyConnection.getConnection();
		for(Bean l:k.getList()){
		try {
			ps=con.prepareStatement("insert into library values (?,?,?,?,?,?)");
			
			ps.setString(1, l.getProductName());
			ps.setString(2, l.getPrice());
			//ps.setString(3, l.getColor());
			ps.setString(4, l.getPictureLink());
			ps.setString(5, l.getLink());
			ps.setString(6, l.getNumberOfBids());
			
			flag =ps.executeUpdate();
			return flag;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return 0;
		}finally{
			
				try {
					if(ps!=null)
					ps.close();
					if(con!=null)
						con.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			
		}
	
		}
		return flag;
	}
}
