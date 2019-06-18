package com.kg.cinema.theater;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import com.kg.cinema.movie.Moviebean;
import com.kg.cinema.schedule.Schedulebean;

@Repository
@Component
public class TheaterDAO {
	
	//org.mybatis.spring.SqlSessionTemplate
	@Autowired
	SqlSessionTemplate temp;
	
	public List<Theaterbean> theaterSelect() {
		List<Theaterbean> list = temp.selectList("theater.select");
		return list;
	}
	
	public List<Theaterbean> TheaterMgSelect(int start, int end, String skey, String sval){
		Theaterbean tdto = new Theaterbean();
		tdto.setStart(start);
		tdto.setEnd(end);
		tdto.setSkey(skey);
		tdto.setSval(sval);
		System.out.println(start);
		System.out.println(end);
		System.out.println(skey);
		System.out.println(sval);
		List<Theaterbean> list=temp.selectList("theater.theaterMgSelectAll", tdto);
		return list;
	}//end	
	
	public int TheaterMgCount() {
		int cnt=(Integer)temp.selectOne("theater.theaterMgcountAll");
		return cnt;
	}//end
		 
	public int TheaterMgCountSearch(String skey, String sval) {
		Theaterbean tdto = new Theaterbean();
		tdto.setSkey(skey);
		tdto.setSval(sval);
		System.out.println(skey);
		System.out.println(sval);
		int cnt=(Integer)temp.selectOne("theater.theaterMgcountAllSearch" , tdto);
		return cnt;
	}//end			
	
	public Theaterbean TheaterDetail(int data) {
		Theaterbean tdto=temp.selectOne("theater.theaterDetail",data);
		return tdto;
	}//end	
	
	public List<Theaterbean> findTheater(String name) {
		List<Theaterbean> list = temp.selectList("theater.findTheater", name);
		return list;
	}

}
