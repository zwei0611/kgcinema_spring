package com.kg.cinema.reply;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Locale;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.kg.cinema.movie.MovieDAO;
import com.kg.cinema.movie.Moviebean;

@Controller
public class ReplyController {
	
	private static final Logger logger = LoggerFactory.getLogger(ReplyController.class);
	
	@Inject
	@Autowired
	ReplyDAO rdao;
	
	@Inject
	@Autowired
	MovieDAO mdao;	
	
	@RequestMapping(value = "/replywrite.do", method = RequestMethod.GET)
	public String replyWrite(Locale locale, Model model, HttpServletRequest request) {
		return "reply/reply";
	}//end
	
	//notice 	
	@RequestMapping(value = "/replylist.do", method = RequestMethod.GET)
	public ModelAndView replyList(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView( );
		
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
			skey="dr_content"; sval="";
		}
		  
		//if(skey.equals("dr_id")) {AA = skey;}
		  
		if(skey.equals("dr_mno") && sval!="") {
			BB = skey; 
		}
		  
		returnpage = "&keyfield=" + skey + "&keyword=" + sval;
		  
		int SearchTotal = rdao.ReplyCountSearch(skey, sval); //조회갯수
		    
		pnum=request.getParameter("pageNum");
		if(pnum=="" || pnum==null) {pnum="1";}
		else {pageNUM=Integer.parseInt(pnum);}
		  
		//[7클릭] 숫자7을 pageNUM변수가 기억
		start=(pageNUM-1)*10+1;
		end=(pageNUM)*10;
		String data = request.getParameter("idx");  
		int Gtotal=rdao.ReplyCountSu(Integer.parseInt(data)); //레코드전체갯수
		  
		if(SearchTotal%10==0){ pagecount=SearchTotal/10; } 
		else {pagecount=(SearchTotal/10)+1;}

		temp=(pageNUM-1)%10;
		startpage=pageNUM-temp;
		endpage=startpage+9; //[31]~~~[40]
		if(endpage > pagecount) {endpage = pagecount;}
		
		
		List<Replybean> LG=rdao.ReplySelect(start,end,skey,sval,data);
		
		mav.addObject("reply", LG);
		mav.addObject("Gtotal", Gtotal);
		mav.addObject("SearchTotal", SearchTotal);
		mav.addObject("startpage", startpage);
		mav.addObject("endpage", endpage);
		mav.addObject("pagecount", pagecount);
		mav.addObject("pageNUM", pageNUM);
		mav.addObject("returnpage", returnpage);
		mav.addObject("skey", skey);
		mav.addObject("sval", sval);
		mav.addObject("data", data);
		mav.addObject("AA", AA);
		mav.addObject("BB", BB);
		mav.setViewName("reply/reply");
		return mav;
	}
	

	@RequestMapping(value = "/replyinsert.do", method = RequestMethod.GET)
	public void replyInsert(HttpServletRequest request, HttpServletResponse response) throws IOException{
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
		String dr_no  = request.getParameter("no");
		System.out.println("dr_no : " + dr_no);
		if(dr_no.equals(null) || dr_no.equals("")) {
		Replybean rdto = new Replybean();
		Moviebean mdto = new Moviebean();
		String score  = request.getParameter("score");
		String id  = request.getParameter("id");
		String mno  = request.getParameter("mno");
		System.out.println("score= " + score);
		System.out.println("id= " + id);	
		System.out.println("mno= " + mno);
		rdao.ReplyInsert(Integer.parseInt(score),id,Integer.parseInt(mno));
		Replybean bean = rdao.ReplySelect(Integer.parseInt(mno), id);
		String sum= rdao.ScoreSum(mno);
		int cnt = rdao.Count(Integer.parseInt(mno));
		double starscore = Double.parseDouble(sum) / cnt * 2; 
		System.out.println("starscore = " + starscore);
		Moviebean mbean = mdao.MoviePointEdit(Integer.parseInt(mno), starscore, cnt);		
		PrintWriter out = response.getWriter();
		StringBuilder sb = new StringBuilder();
		sb.append("{");
		sb.append("\"score\": \"" + bean.getDr_point() + "\", " );
		sb.append("\"id\": \"" + bean.getDr_id() + "\", " );
		sb.append("\"mno\": \"" + bean.getDr_mno() + "\", " );
		sb.append("\"no\": \"" + bean.getDr_no() + "\", " );
		sb.append("\"starscore\": \"" + starscore + "\", " );
		sb.append("\"cnt\": \"" + cnt + "\" " );
		sb.append("}");
		out.print(sb.toString());
		}else {
			Replybean rdto = new Replybean();
			Moviebean mdto = new Moviebean();
			String score  = request.getParameter("score");
			String id  = request.getParameter("id");
			String mno  = request.getParameter("mno");
			String content = request.getParameter("content");
			System.out.println("dr_no = " + dr_no);
			System.out.println("score = " + score);	
			System.out.println("content = " + content);
			rdao.ReplyEdit(Integer.parseInt(score),Integer.parseInt(dr_no),content);
			Replybean bean = rdao.ReplySelect(Integer.parseInt(mno), id);
			String sum= rdao.ScoreSum(mno);
			int cnt = rdao.Count(Integer.parseInt(mno));
			int replycnt = rdao.ReplyCountSu(Integer.parseInt(mno));
			double starscore = Double.parseDouble(sum) / cnt * 2; 
			System.out.println("starscore = " + starscore);	
			Moviebean mbean = mdao.MoviePointEdit(Integer.parseInt(mno), starscore , cnt);
			PrintWriter out = response.getWriter();
			StringBuilder sb = new StringBuilder();
			sb.append("{");
			sb.append("\"dr_point\": \"" + bean.getDr_point() + "\", " );
			sb.append("\"dr_no\": \"" + bean.getDr_no() + "\", " );
			sb.append("\"dr_starscore\": \"" + starscore + "\", " );
			sb.append("\"dr_cnt\": \"" + cnt + "\", " );
			sb.append("\"dr_content\": \"" + bean.getDr_content() + "\", " );
			sb.append("\"dr_replycount\": \"" + replycnt + "\" " );
			sb.append("}");
			out.print(sb.toString());
		}
	}//end	
	
	@RequestMapping(value = "/replyedit.do", method = RequestMethod.GET)
	public void replyEdit(HttpServletRequest request, HttpServletResponse response) throws IOException{
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
		String dr_no  = request.getParameter("no");
		System.out.println("dr_no : " + dr_no);
			Replybean rdto = new Replybean();
			Moviebean mdto = new Moviebean();
			String score  = request.getParameter("score");
			String id  = request.getParameter("id");
			String mno  = request.getParameter("mno");
			String content = request.getParameter("content");
			System.out.println("dr_no = " + dr_no);
			System.out.println("score = " + score);	
			System.out.println("content = " + content);	
			rdao.ReplyEdit(Integer.parseInt(score),Integer.parseInt(dr_no),content);
			Replybean bean = rdao.ReplySelect(Integer.parseInt(mno), id);
			String sum= rdao.ScoreSum(mno);
			int cnt = rdao.Count(Integer.parseInt(mno));
			int replycnt = rdao.ReplyCountSu(Integer.parseInt(mno));			
			double starscore = Double.parseDouble(sum) / cnt * 2; 
			System.out.println("starscore = " + starscore);	
			Moviebean mbean = mdao.MoviePointEdit(Integer.parseInt(mno), starscore , cnt);
			PrintWriter out = response.getWriter();
			StringBuilder sb = new StringBuilder();
			sb.append("{");
			sb.append("\"dr_point\": \"" + bean.getDr_point() + "\", " );
			sb.append("\"dr_no\": \"" + bean.getDr_no() + "\", " );
			sb.append("\"dr_starscore\": \"" + starscore + "\", " );
			sb.append("\"dr_cnt\": \"" + cnt + "\", " );
			sb.append("\"dr_content\": \"" + bean.getDr_content() + "\", " );
			sb.append("\"dr_replycount\": \"" + replycnt + "\" " );
			sb.append("}");
			out.print(sb.toString());
	}//end		
			
	@RequestMapping(value = "/replydelete.do", method = RequestMethod.GET)
	public void replyDelete(HttpServletRequest request, HttpServletResponse response) throws IOException{
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		    String data = request.getParameter("dr_no");
		    System.out.println("dr_no : " + data);
		    rdao.ReplyDelete(Integer.parseInt(data));
			PrintWriter out = response.getWriter();
			StringBuilder sb = new StringBuilder();
			sb.append("{");
			sb.append("\"data\": \"" + data + "\" " );

			sb.append("}");
			out.print(sb.toString());
	}//end		
	
}
