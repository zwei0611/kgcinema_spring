package com.kg.cinema.admin;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import com.kg.cinema.Mainbean;
import com.kg.cinema.event.Eventbean;
import com.kg.cinema.movie.Moviebean;
import com.kg.cinema.notice.Noticebean;
import com.kg.cinema.schedule.Schedulebean;
import com.kg.cinema.screen.Screenbean;
import com.kg.cinema.theater.Theaterbean;
@Repository
@Component
public class AdminDAO {
	
	//org.mybatis.spring.SqlSessionTemplate
		@Autowired
		SqlSessionTemplate temp;
	
	//notice
	public void NoticeInsert(Noticebean ndto) {
		temp.insert("admin.noticeInsert", ndto);
	}//end
	public void NoticeDelete(int data) {
		 temp.delete("admin.noticeDelete", data);
	}//end
	public void NoticeEdit(Noticebean ndto) {
		temp.update("admin.noticeEdit",ndto);
	}//end
	
	//movie
	public void MovieInsert(Moviebean mdto) {
		temp.insert("admin.movieInsert", mdto);
	}//end
	public void MovieDelete(int data) {
		 temp.delete("admin.movieDelete", data);
	}//end
	public void MovieEdit(Moviebean mdto) {
		temp.update("admin.movieEdit",mdto);
	}//end
	
	//event
	public void EventInsert(Eventbean edto) {
		temp.insert("admin.eventInsert", edto);
	}//end
	public void EventDelete(int data) {
		 temp.delete("admin.eventDelete", data);
	}//end
	public void EventEdit(Eventbean edto) {
		temp.update("admin.eventEdit",edto);
	}//end
	
	//mainslide
	public void MainSlideInsert(Mainbean msdto) {
		temp.insert("admin.mainSlideInsert", msdto);
	}//end
	public void MainSlideDelete(int data) {
		 temp.delete("admin.mainSlideDelete", data);
	}//end
	public void MainSlideEdit(Mainbean msdto) {
		temp.update("admin.mainSlideEdit", msdto);
	}//end
	
	//mainevent
	public void MainEventInsert(Mainbean medto) {
		System.out.println("no : " + medto.getMe_no());
		System.out.println("date : " + medto.getMe_date());
		System.out.println("add : " + medto.getMe_add());
		System.out.println("file1 : " + medto.getMe_file1());
		System.out.println("file2 : " + medto.getMe_file2());
		System.out.println("file3 : " + medto.getMe_file3());
		System.out.println("file4 : " + medto.getMe_file4());
		System.out.println("file5 : " + medto.getMe_file5());
		System.out.println("file6 : " + medto.getMe_file6());
		System.out.println("file7 : " + medto.getMe_file7());
		System.out.println("file8 : " + medto.getMe_file8());
		System.out.println("file9 : " + medto.getMe_file9());		
		temp.insert("admin.mainEventInsert", medto);
	}//end
	public void MainEventEdit(Mainbean medto) {
		System.out.println("no : " + medto.getMe_no());
		System.out.println("date : " + medto.getMe_date());
		System.out.println("add : " + medto.getMe_add());
		System.out.println("file1 : " + medto.getMe_file1());
		System.out.println("file2 : " + medto.getMe_file2());
		System.out.println("file3 : " + medto.getMe_file3());
		System.out.println("file4 : " + medto.getMe_file4());
		System.out.println("file5 : " + medto.getMe_file5());
		System.out.println("file6 : " + medto.getMe_file6());
		System.out.println("file7 : " + medto.getMe_file7());
		System.out.println("file8 : " + medto.getMe_file8());
		System.out.println("file9 : " + medto.getMe_file9());
		temp.update("admin.mainEventEdit", medto);
	}//end	
	
	//movieslide
	public void MovieSlideInsert(Moviebean mvsdto) {
		temp.insert("admin.movieSlideInsert", mvsdto);
	}//end
	public void MovieSlideDelete(int data) {
		 temp.delete("admin.movieSlideDelete", data);
	}//end
	public void MovieSlideEdit(Moviebean mvsdto) {
		temp.update("admin.movieSlideEdit", mvsdto);
	}//end	
	
	//scheduleslide
	public void ScheduleInsert(Schedulebean sdto) {
		temp.insert("admin.scheduleInsert", sdto);
	}//end
	public void ScheduleDelete(int data) {
		 temp.delete("admin.scheduleDelete", data);
	}//end
	
	//theater
	public void TheaterInsert(Theaterbean tdto) {
		temp.insert("admin.theaterInsert", tdto);
	}//end
	public void TheaterDelete(int data) {
		 temp.delete("admin.theaterDelete", data);
	}//end
	public void TheaterEdit(Theaterbean tdto) {
		temp.update("admin.theaterEdit",tdto);
	}//end	
	
	//screen
	public void ScreenInsert(Screenbean srdto) {
		temp.insert("admin.screenInsert", srdto);
	}//end
	public void ScreenDelete(int data) {
		 temp.delete("admin.screenDelete", data);
	}//end
	public void ScreenEdit(Screenbean srdto) {
		temp.update("admin.screenEdit",srdto);
	}//end		
	
}
