package com.kg.cinema.movie;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.kg.cinema.Mainbean;
import com.kg.cinema.event.Eventbean;
import com.kg.cinema.notice.Noticebean;
import com.kg.cinema.reply.Replybean;

@Repository
@Component
public class MovieDAO {
	
	//org.mybatis.spring.SqlSessionTemplate
	@Autowired
	SqlSessionTemplate temp;
	
	public List<Moviebean> movieSelect() {
		List<Moviebean> list = temp.selectList("movie.selectAllDynamic");
		return list;
	}
	public List<Moviebean> movieSelectNext() {
		List<Moviebean> list = temp.selectList("movie.selectAllNext");
		return list;
	}
	
	public Moviebean movieDetail(int data) {
		Moviebean mdto=temp.selectOne("movie.detail",data);
		return mdto;
	}//end
	
	public Moviebean movieDetail(String title) {
		Moviebean mdto=temp.selectOne("movie.detailTitle",title);
		return mdto;
	}//end
	
	public List<Moviebean> movieSelectName() {
		List<Moviebean> list = temp.selectList("movie.movieSelectName");
		return list;
	}
	public List<Moviebean> MovieMgSelect(int start, int end, String skey, String sval){
		Moviebean dto = new Moviebean();
		dto.setStart(start);
		dto.setEnd(end);
		dto.setSkey(skey);
		dto.setSval(sval);
		System.out.println(start);
		System.out.println(end);
		System.out.println(skey);
		System.out.println(sval);
		List<Moviebean> list=temp.selectList("movie.movieMgSelectAll", dto);
	return list;
	}//end
		
	public int MovieMgCount() {
		int cnt=(Integer)temp.selectOne("movie.movieMgcountAll");
		return cnt;
	}//end
		 
	public int MovieMgCountSearch(String skey, String sval) {
		Moviebean dto = new Moviebean();
		dto.setSkey(skey);
		dto.setSval(sval);
		System.out.println(skey);
		System.out.println(sval);
		int cnt=(Integer)temp.selectOne("movie.movieMgcountAllSearch" , dto);
		return cnt;
	}//end	
	
	public Moviebean movieSlideDetail(int data) {
		Moviebean mvsdto=temp.selectOne("movie.movieSlideDetail",data);
		return mvsdto;
	}//end	
	
	public List<Moviebean> MovieSlideSelect() {
		List<Moviebean> list = temp.selectList("movie.movieSlideSelectAll");
		return list;
	}
	
	public Moviebean VideoPopUp(String mvs_no) {
		Moviebean mvsdto = new Moviebean();
		mvsdto.setMvs_no(Integer.parseInt(mvs_no));
		mvsdto=temp.selectOne("movie.movieSlideDetail",mvsdto);
		return mvsdto;
	}//end	
	
	public Moviebean MoviePointEdit(int mno, double starscore, int cnt) {
		Moviebean mdto = new Moviebean();
		mdto.setM_point(starscore);
		mdto.setM_no(mno);
		mdto.setM_inwon(cnt);
		System.out.println("PointEditDao_no: " + mno);
		System.out.println("PointEditDao_score: " + starscore);
		temp.update("movie.moviePointEdit", mdto);
		return mdto;
	}//end		
}
