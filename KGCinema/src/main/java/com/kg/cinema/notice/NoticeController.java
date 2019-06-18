package com.kg.cinema.notice;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.kg.cinema.join.JoinDAO;
import com.kg.cinema.join.Joinbean;

@Controller
public class NoticeController {
	
	private static final Logger logger = LoggerFactory.getLogger(NoticeController.class);
	
	@Inject
	@Autowired
	NoticeDAO ndao;
	
	@Inject
	@Autowired
	JoinDAO jdao;
	
	@RequestMapping(value = "/noticelist.do", method = RequestMethod.GET)
	public ModelAndView noticeList(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView( );
		if(request.getSession().getAttribute("temp") != null) {
			Joinbean bean = jdao.myInfo((String)request.getSession().getAttribute("temp"));
			mav.addObject("bean", bean);
		}
		int startpage=1, endpage=10;
		String pnum="";
		int pageNUM=1, start=1,end=10;
		int pagecount=1,temp=0;
		String AA = "";
		String BB = "";
		// 검색
		
		String skey="", sval="", returnpage="";  
		skey=request.getParameter("keyfield");
		sval=request.getParameter("keyword"); 
		if(skey == "" || skey == null || sval == "" || sval ==null ) {
			skey="n_title"; sval="";
		}
		  
		//if(skey.equals("n_name")) {AA = skey;}
		  
		if(skey.equals("n_title") && sval!="") {
			BB = skey; 
		}
		  
		returnpage = "&keyfield=" + skey + "&keyword=" + sval;
		  
		int SearchTotal = ndao.NoticeCountSearch(skey, sval); //조회갯수
		    
		pnum=request.getParameter("pageNum");
		if(pnum=="" || pnum==null) {pnum="1";}
		else {pageNUM=Integer.parseInt(pnum);}
		  
		//[7클릭] 숫자7을 pageNUM변수가 기억
		start=(pageNUM-1)*10+1;
		end=(pageNUM)*10;
		  
		int Gtotal=ndao.NoticeCount(); //레코드전체갯수
		  
		if(SearchTotal%10==0){ pagecount=SearchTotal/10; } 
		else {pagecount=(SearchTotal/10)+1;}

		temp=(pageNUM-1)%10;
		startpage=pageNUM-temp;
		endpage=startpage+9; //[31]~~~[40]
		if(endpage > pagecount) {endpage = pagecount;}
		
		List<Noticebean> LG=ndao.NoticeSelect(start,end,skey,sval);
		
		mav.addObject("naver", LG);
		mav.addObject("Gtotal", Gtotal);
		mav.addObject("SearchTotal", SearchTotal);
		mav.addObject("startpage", startpage);
		mav.addObject("endpage", endpage);
		mav.addObject("pagecount", pagecount);
		mav.addObject("pageNUM", pageNUM);
		mav.addObject("returnpage", returnpage);
		mav.addObject("skey", skey);
		mav.addObject("sval", sval);
		mav.addObject("AA", AA);
		mav.addObject("BB", BB);
		mav.setViewName("notice/noticeList");
		return mav;
	}
	
	@RequestMapping(value = "/noticedetail.do", method = RequestMethod.GET)
	public ModelAndView noticeDetail(HttpServletRequest request) {
	  ModelAndView mav = new ModelAndView( );
	  int data=Integer.parseInt(request.getParameter("idx")); 
	  Noticebean ndto=ndao.NoticeDetail(data);
	  mav.addObject("notice", ndto);
	  mav.setViewName("notice/noticeDetail");
	  return mav;
	}//end
	
}
