package com.kg.cinema.screen;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

@Repository
@Component
public class ScreenDAO {
	
	//org.mybatis.spring.SqlSessionTemplate
	@Autowired
	SqlSessionTemplate temp;
	
	public Screenbean screenSelect(String theater, String scrno) {
		Screenbean bean = new Screenbean();
		bean.setS_theater(theater);
		bean.setS_scrno(scrno);
		Screenbean sbean = temp.selectOne("screen.select", bean);
		return sbean;
	}
	
	public List<Screenbean> screenCount() {
		List<Screenbean> list = temp.selectList("screen.count");
		return list;
	}
	
	public List<Screenbean> ScreenMgSelect(){
		List<Screenbean> list=temp.selectList("screen.screenMgSelectAll");
		return list;
	}//end	
	
	public Screenbean ScreenDetail(int data) {
		Screenbean tdto=temp.selectOne("screen.screenDetail",data);
		return tdto;
	}//end
	
	public List<Screenbean> ScrNo(String s_theater) {
		System.out.println("s_theaterDAO: " + s_theater);
		List<Screenbean> list =temp.selectList("screen.scrNo", s_theater);
		return list;
	}//end	
	
}
