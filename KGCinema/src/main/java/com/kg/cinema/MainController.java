package com.kg.cinema;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.kg.cinema.join.JoinDAO;
import com.kg.cinema.join.Joinbean;
import com.kg.cinema.login.EgovHttpSessionBindingListener;
import com.kg.cinema.movie.MovieDAO;
import com.kg.cinema.movie.Moviebean;

@Controller
public class MainController {
	
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	
	@Inject
	@Autowired
	MovieDAO mdao;
	
	@Inject
	@Autowired
	JoinDAO jdao;
	
	@Inject
	@Autowired
	MainDAO maindao;
	
	@RequestMapping(value = "/main.do", method = RequestMethod.GET)
	public ModelAndView main(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		
		if(request.getSession().getAttribute("temp") != null) {
			Joinbean bean = jdao.myInfo((String)request.getSession().getAttribute("temp"));
			mav.addObject("bean", bean);
		}
		
		List<Moviebean> movieList = mdao.movieSelect();
		List<Mainbean> msList = maindao.MainSlideSelect();
		List<Mainbean> meList = maindao.MainEventSelect();
		int count = maindao.MainSlideCount();
		
		mav.addObject("movie", movieList);
		mav.addObject("ms", msList);
		mav.addObject("me", meList);
		mav.addObject("count", count);
		mav.setViewName("main/main");
		return mav;
	}
	

	
	
}
