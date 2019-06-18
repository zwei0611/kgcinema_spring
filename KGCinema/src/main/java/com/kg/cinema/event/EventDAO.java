package com.kg.cinema.event;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import com.kg.cinema.movie.Moviebean;

@Repository
@Component
public class EventDAO {
	
	//org.mybatis.spring.SqlSessionTemplate
	@Autowired
	SqlSessionTemplate temp;
	
	public List<Eventbean> EventSelect(int start, int end, String skey, String sval){
		Eventbean dto = new Eventbean();
		dto.setStart(start);
		dto.setEnd(end);
		dto.setSkey(skey);
		dto.setSval(sval);
		System.out.println(start);
		System.out.println(end);
		System.out.println(skey);
		System.out.println(sval);
		List<Eventbean> list=temp.selectList("event.selectAll", dto);
		return list;
	}//end
	
	public int EventCount() {
	   int cnt=(Integer)temp.selectOne("event.countAll");
	   return cnt;
	}//end
	 
	public int EventCountSearch(String skey, String sval) {
		Eventbean dto = new Eventbean();
		dto.setSkey(skey);
		dto.setSval(sval);
		System.out.println(skey);
		System.out.println(sval);
		int cnt=(Integer)temp.selectOne("event.countAllSearch" , dto);
		return cnt;
	}//end
	
	public Eventbean EventDetail(int data) {
		Eventbean edto=temp.selectOne("event.detail",data);
		return edto;
	}//end
	
	public Eventbean EventDetail2(String e_no) {
		Eventbean edto = new Eventbean();
		edto.setE_no(Integer.parseInt(e_no));
		edto=temp.selectOne("event.detail",edto);
		return edto;
	}//end


}
