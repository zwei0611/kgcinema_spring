package com.kg.cinema.schedule;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import com.kg.cinema.movie.Moviebean;

@Repository
@Component
public class ScheduleDAO {
	
	//org.mybatis.spring.SqlSessionTemplate
	@Autowired
	SqlSessionTemplate temp;
	
	public List<Schedulebean> scheduleSelect(String date, String theater, String movie) {
		ScheduleSelectbean bean = new ScheduleSelectbean();
		bean.setDate(date);
		bean.setTheater(theater);
		bean.setMovie(movie);
		List<Schedulebean> list = temp.selectList("schedule.select", bean);
		return list;
	}
	
	public List<Schedulebean> ScheduleMgSelect(int start, int end, String skey, String sval){
		Schedulebean sdto = new Schedulebean();
		sdto.setStart(start);
		sdto.setEnd(end);
		sdto.setSkey(skey);
		sdto.setSval(sval);
		System.out.println(start);
		System.out.println(end);
		System.out.println(skey);
		System.out.println(sval);
		List<Schedulebean> list=temp.selectList("schedule.scheduleMgSelectAll", sdto);
		return list;
	}//end	
	
	public int ScheduleMgCount() {
		int cnt=(Integer)temp.selectOne("schedule.scheduleMgcountAll");
		return cnt;
	}//end
		 
	public int ScheduleMgCountSearch(String skey, String sval) {
		Schedulebean sdto = new Schedulebean();
		sdto.setSkey(skey);
		sdto.setSval(sval);
		System.out.println(skey);
		System.out.println(sval);
		int cnt=(Integer)temp.selectOne("schedule.scheduleMgcountAllSearch" , sdto);
		return cnt;
	}//end		
	
	public Schedulebean scheduleDetail(int idx) {
		return temp.selectOne("schedule.detail", idx);
	}

}
