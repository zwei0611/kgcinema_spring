package com.kg.cinema.event;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
public class EventController {
	
	private static final Logger logger = LoggerFactory.getLogger(EventController.class);
	
	@Inject
	@Autowired
	EventDAO edao;
	
	@Inject
	@Autowired
	JoinDAO jdao;
	
	@RequestMapping(value = "/eventlist.do", method = RequestMethod.GET)
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
			skey="e_title"; sval="";
		}
		  
		//if(skey.equals("n_name")) {AA = skey;}
		  
		if(skey.equals("e_title") && sval!="") {
			BB = skey; 
		}
		  
		returnpage = "&keyfield=" + skey + "&keyword=" + sval;
		  
		int SearchTotal = edao.EventCountSearch(skey, sval); //조회갯수
		    
		pnum=request.getParameter("pageNum");
		if(pnum=="" || pnum==null) {pnum="1";}
		else {pageNUM=Integer.parseInt(pnum);}
		  
		//[7클릭] 숫자7을 pageNUM변수가 기억
		start=(pageNUM-1)*8+1;
		end=(pageNUM)*8;
		  
		int Gtotal=edao.EventCount(); //레코드전체갯수
		  
		if(SearchTotal%8==0){ pagecount=SearchTotal/8; } 
		else {pagecount=(SearchTotal/8)+1;}

		temp=(pageNUM-1)%10;
		startpage=pageNUM-temp;
		endpage=startpage+9; //[31]~~~[40]
		if(endpage > pagecount) {endpage = pagecount;}
		
		List<Eventbean> LG=edao.EventSelect(start,end,skey,sval);
		
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
		mav.setViewName("event/eventList");
		return mav;
	}
	
	@RequestMapping(value = "/eventdetail.do", method = RequestMethod.GET)
	public void eventDetail(HttpServletRequest request, HttpServletResponse response) throws IOException{
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
		PrintWriter out = response.getWriter();
		String e_no = request.getParameter("e_no");
		System.out.println("e_no= " + e_no);
		Eventbean edto = edao.EventDetail2(e_no);
		StringBuilder sb = new StringBuilder();
		System.out.println("gettitle=" + edto.getE_title());
		sb.append("{");
		sb.append("\"e_title\": \"" + edto.getE_title() + "\", " );
		sb.append("\"e_content\": \""+ edto.getE_content() + "\" ");
		sb.append("}");
		out.print(sb.toString());
	}//end
	
}
