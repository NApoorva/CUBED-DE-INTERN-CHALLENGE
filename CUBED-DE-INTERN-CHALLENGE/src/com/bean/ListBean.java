package com.bean;

import java.util.ArrayList;
import java.util.List;

public class ListBean {

	private List<Bean> list=new ArrayList<>();

	public List<Bean> getList() {
		return list;
	}

	public void setChild(Bean object) {
        list.add(object);
    }
	
	
}
