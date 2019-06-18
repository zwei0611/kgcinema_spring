package com.kg.cinema.movie;

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
import com.kg.cinema.reply.ReplyDAO;
import com.kg.cinema.reply.Replybean;

@Controller
public class MovieController {
	
	private static final Logger logger = LoggerFactory.getLogger(MovieController.class);
	
	@Inject
	@Autowired
	MovieDAO mdao;
	
	@Inject
	@Autowired
	JoinDAO jdao;
	
	@Inject
	@Autowired
	ReplyDAO rdao;
	
	@RequestMapping(value = "/movielist.do", method = RequestMethod.GET)
	public ModelAndView main(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		if(request.getSession().getAttribute("temp") != null) {
			Joinbean bean = jdao.myInfo((String)request.getSession().getAttribute("temp"));
			mav.addObject("bean", bean);
		}	
		List<Moviebean> movieList = mdao.movieSelect();
		List<Moviebean> next = mdao.movieSelectNext();
		List<Moviebean> mvs = mdao.MovieSlideSelect();
		
		
		mav.addObject("movie", movieList);
		mav.addObject("next", next);
		mav.addObject("mvs", mvs);
		mav.setViewName("movie/movieList");
		return mav;
	}
	
	@RequestMapping(value = "/moviedetail.do", method = RequestMethod.GET)
		public ModelAndView MovieDetail(HttpServletRequest request) {
		  ModelAndView mav = new ModelAndView( );
		  if(request.getSession().getAttribute("temp") != null) {
			Joinbean bean = jdao.myInfo((String)request.getSession().getAttribute("temp"));
			mav.addObject("bean", bean);
		  }	
		  int data=Integer.parseInt(request.getParameter("idx")); 
		  System.out.println(data);
		  System.out.println((String)request.getSession().getAttribute("temp"));
		  Moviebean mdto=mdao.movieDetail(data);
		  int inwon = rdao.Count(data);
		  int replycount = rdao.ReplyCountSu(data); 
		  if((String)request.getSession().getAttribute("temp") != null) {			  
			  Replybean rdto = rdao.ReplySelect(data,(String)request.getSession().getAttribute("temp"));
			  mav.addObject("myreply", rdto);
		  }
		  mav.addObject("movie", mdto);
		  mav.addObject("inwon", inwon);
		  mav.addObject("replycnt", replycount);
		  
		  mav.setViewName("movie/movieDetail");
		  return mav;
	}//end
	
	@RequestMapping(value = "/videopopup.do", method = RequestMethod.GET)
	public void eventDetail(HttpServletRequest request, HttpServletResponse response) throws IOException{
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
		PrintWriter out = response.getWriter();
		String mvs_no = request.getParameter("mvs_no");
		System.out.println("mvs_no= " + mvs_no);
		Moviebean mvsdto = mdao.VideoPopUp(mvs_no);
		StringBuilder sb = new StringBuilder();
		System.out.println("mvs_video= " + mvsdto.getMvs_video());
		sb.append("{");
		sb.append("\"mvs_video\": \"" + mvsdto.getMvs_video() + "\" " );
		sb.append("}");
		out.print(sb.toString());
	}//end	
}
