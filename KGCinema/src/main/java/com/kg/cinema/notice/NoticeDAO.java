package com.kg.cinema.notice;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import com.kg.cinema.movie.Moviebean;

@Repository
@Component
public class NoticeDAO {
	
	//org.mybatis.spring.SqlSessionTemplate
	@Autowired
	SqlSessionTemplate temp;
	
	public List<Noticebean> NoticeSelect(int start, int end, String skey, String sval){
		Noticebean dto = new Noticebean();
		dto.setStart(start);
		dto.setEnd(end);
		dto.setSkey(skey);
		dto.setSval(sval);
		System.out.println(start);
		System.out.println(end);
		System.out.println(skey);
		System.out.println(sval);
		List<Noticebean> list=temp.selectList("notice.selectAll", dto);
		return list;
	}//end
	
	public int NoticeCount() {
	   int cnt=(Integer)temp.selectOne("notice.countAll");
	   return cnt;
	}//end
	 
	public int NoticeCountSearch(String skey, String sval) {
		Noticebean dto = new Noticebean();
		dto.setSkey(skey);
		dto.setSval(sval);
		System.out.println(skey);
		System.out.println(sval);
		int cnt=(Integer)temp.selectOne("notice.countAllSearch" , dto);
		return cnt;
	}//end
	
	public Noticebean NoticeDetail(int data) {
		Noticebean ndto=temp.selectOne("notice.detail",data);
		return ndto;
	}//end

}
