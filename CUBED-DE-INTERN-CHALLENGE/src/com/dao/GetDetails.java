package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.bean.Bean;



public class GetDetails {

	Connection con=null;
	PreparedStatement ps=null;
	ResultSet rs=null;
	List<Bean> list=new ArrayList<Bean>();
	
	public List<Bean> display(){
	
		con=MyConnection.getConnection();
		try {
			ps=con.prepareStatement("select * from library");
			rs =ps.executeQuery();
			while(rs.next()){
				Bean l=new Bean();
				l.setProductName(rs.getString(1));
				l.setPrice(rs.getString(2));
				//l.setColor(rs.getString(3));
				l.setPictureLink(rs.getString(4));
				l.setLink(rs.getString(5));
				l.setNumberOfBids(rs.getString(6));
				
				list.add(l);
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			
		}finally{
			try {
				if(rs!=null)
					rs.close();
				if(ps!=null)
					ps.close();
					if(con!=null)
						con.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
		}
		return list;
	}
}
