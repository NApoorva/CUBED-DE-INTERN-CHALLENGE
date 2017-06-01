package com.service;

import java.util.List;

import com.bean.Bean;
import com.bean.ListBean;
import com.dao.GetDetails;
import com.dao.InsertData;


public class Service {

public int insert(ListBean l){
		
		InsertData id =new InsertData();
		int flag=id.insert(l);
		if(flag==1)
		return 1;
		else 
			return 0;
	}

	
	public List<Bean> getDetails(){
		
		GetDetails gd=new GetDetails();
		
		List<Bean> list=gd.display();
		return list;
	}
}
