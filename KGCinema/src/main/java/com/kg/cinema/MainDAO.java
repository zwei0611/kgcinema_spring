package com.kg.cinema;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import com.kg.cinema.event.Eventbean;
import com.kg.cinema.movie.Moviebean;

@Repository
@Component
public class MainDAO {
	
	//org.mybatis.spring.SqlSessionTemplate
	@Autowired
	SqlSessionTemplate temp;
	
	public List<Mainbean> MainSlideSelect() {
		List<Mainbean> list = temp.selectList("main.mainSlideSelectAll");
		return list;
	}	
	
	public int MainSlideCount() {
		   int cnt=(Integer)temp.selectOne("main.mainSlideCountAll");
		   return cnt;
	}//end
	
	public Mainbean MainSlideDetail(int data) {
		Mainbean msdto=temp.selectOne("main.mainSlideDetail",data);
		return msdto;
	}//end	

	public List<Mainbean> MainEventSelect() {
		List<Mainbean> list = temp.selectList("main.mainEventSelectAll");
		return list;
	}	
	public Mainbean MainEventDetail(int data) {
		Mainbean medto=temp.selectOne("main.mainEventDetail",data);
		return medto;
	}//end		
	public Mainbean MainEventDetail2(String me_no){
		Mainbean medto = new Mainbean();
		medto.setMe_no(Integer.parseInt(me_no));
		medto = temp.selectOne("main.mainEventDetail",medto);
		return medto;
	}		
}
