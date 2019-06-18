package com.kg.cinema.reserve;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.joda.time.Interval;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.datetime.joda.JodaDateTimeFormatAnnotationFormatterFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kg.cinema.join.JoinDAO;
import com.kg.cinema.join.Joinbean;
import com.kg.cinema.login.EgovHttpSessionBindingListener;
import com.kg.cinema.movie.MovieDAO;
import com.kg.cinema.movie.Moviebean;
import com.kg.cinema.schedule.ScheduleDAO;
import com.kg.cinema.schedule.Schedulebean;
import com.kg.cinema.screen.ScreenDAO;
import com.kg.cinema.screen.Screenbean;
import com.kg.cinema.seat.SeatDAO;
import com.kg.cinema.seat.Seatbean;
import com.kg.cinema.theater.TheaterDAO;
import com.kg.cinema.theater.Theaterbean;

@Controller
public class ReserveController {
	
	private static final Logger logger = LoggerFactory.getLogger(ReserveController.class);
	
	@Inject
	@Autowired
	MovieDAO mdao;
	
	@Inject
	@Autowired
	JoinDAO jdao;
	
	@Inject
	@Autowired
	TheaterDAO tdao;
	
	@Inject
	@Autowired
	ScheduleDAO sdao;
	
	@Inject
	@Autowired
	ScreenDAO scrdao;
	
	@Inject
	@Autowired
	SeatDAO seatdao;
	
	@Inject
	@Autowired
	ReserveDAO rdao;
	
	@RequestMapping(value = "/reserveMain.do", method = RequestMethod.GET)
	public ModelAndView reserve_main(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		if(request.getSession().getAttribute("temp") != null) {
			Joinbean bean = jdao.myInfo((String)request.getSession().getAttribute("temp"));
			mav.addObject("bean", bean);
		}
		
		List<Moviebean> movieList = mdao.movieSelect();
		List<Theaterbean> theaterList = tdao.theaterSelect();
		
		Calendar cal = Calendar.getInstance();
		String year = String.valueOf(cal.get(Calendar.YEAR));
		String month = String.valueOf(cal.get(Calendar.MONTH)+1);
		String day = String.valueOf(cal.get(Calendar.DAY_OF_MONTH));
		
		if(Integer.parseInt(month) < 10) {
			month = "0" + month;
		}
		if(Integer.parseInt(day) < 10) {
			day = "0" + day;
		}
		
		String today = year + "-" + month + "-" + day;
		
		mav.addObject("date", today);
		mav.addObject("movie", movieList);
		mav.addObject("theater", theaterList);
		mav.setViewName("reserve/movieReserve");
		return mav;
	}
	
	@RequestMapping(value = "/reserveMovie.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView reserve_movie(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		
		if(request.getSession().getAttribute("temp") != null) {
			Joinbean bean = jdao.myInfo((String)request.getSession().getAttribute("temp"));
			mav.addObject("bean", bean);
		}
		
		Calendar cal = Calendar.getInstance();
		String year = String.valueOf(cal.get(Calendar.YEAR));
		String month = String.valueOf(cal.get(Calendar.MONTH)+1);
		String day = String.valueOf(cal.get(Calendar.DAY_OF_MONTH));
		
		if(Integer.parseInt(month) < 10) {
			month = "0" + month;
		}
		if(Integer.parseInt(day) < 10) {
			day = "0" + day;
		}
		String date = year + "-" + month + "-" + day;
		
		if(request.getParameter("date") != null) {
			date = request.getParameter("date");
		}
		
		String theater = request.getParameter("theater");
		if(theater == null) {
			theater = "";
		}
		String movieNo = request.getParameter("no");
		
		Moviebean mbean = new Moviebean();
		if(!movieNo.equals("")) {
			int no = Integer.parseInt(movieNo);
			mbean = mdao.movieDetail(no);
			mav.addObject("mbean", mbean);
		}
		
		if(mbean.getM_title() == null) {
			mbean.setM_title("");
		}

		List<Schedulebean> scheduleList = sdao.scheduleSelect(date, theater, mbean.getM_title());
		List<Moviebean> movieList = mdao.movieSelect();
		List<Theaterbean> theaterList = tdao.theaterSelect();
		List<Screenbean> screenCount = scrdao.screenCount();
		
		
		mav.addObject("date", date);
		mav.addObject("tbean", theater);
		mav.addObject("theater", theaterList);
		mav.addObject("movie", movieList);
		mav.addObject("schedule", scheduleList);
		mav.addObject("screenCount", screenCount);
		mav.setViewName("reserve/movieReserve");
		return mav;
	}
	
	@RequestMapping(value = "/reserveSeat.do", method = RequestMethod.GET)
	public ModelAndView reserve_seat(HttpServletRequest request, @RequestParam("idx") String idx) {
		ModelAndView mav = new ModelAndView();
		if(request.getSession().getAttribute("temp") != null) {
			Joinbean bean = jdao.myInfo((String)request.getSession().getAttribute("temp"));
			mav.addObject("bean", bean);
		}
		Schedulebean sbean = new Schedulebean();
		sbean = sdao.scheduleDetail(Integer.parseInt(idx));
		
		Moviebean mbean = new Moviebean();
		mbean = mdao.movieDetail(sbean.getTitle());

		
		Screenbean scrbean = scrdao.screenSelect(sbean.getTheater(), sbean.getScrno());
		List<Seatbean> seatList = seatdao.seatSelect(scrbean.getS_seatstyle());
		int price = scrbean.getS_price();
		
		mav.addObject("seatbean", seatList);
		mav.addObject("sbean", sbean);
		mav.addObject("scrno", idx);
		mav.addObject("mbean", mbean);
		mav.addObject("price", price);
		mav.setViewName("reserve/movieSeat");
		return mav;
	}
	
	@RequestMapping(value = "/seatReserveCheck.do", method = RequestMethod.GET)
	public void reserve_check(HttpServletRequest request, HttpServletResponse response) throws IOException {
		PrintWriter out = response.getWriter();
		String theater = request.getParameter("theater");
		String scrno = request.getParameter("scrno");
		String start = request.getParameter("start");
		
		List<Reservebean> reserveList = rdao.reserveSelect(theater, scrno, start);
		
		StringBuilder sb = new StringBuilder();
		for(Reservebean bean : reserveList) {
			String[] book = bean.getR_seat().split(",");
			for(int i = 0; i < book.length; i++) {
				sb.append(book[i]+",");
			}
		}
		String json = "{\"reserveSeat\":\""+sb.toString()+"\"}";
		out.print(json);
	}
	
	
	@RequestMapping(value = "/reserve.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView reserve_save(Reservebean bean, HttpServletResponse response, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		rdao.reserveInsert(bean);
		request.getSession().setAttribute("alram", "o");
		String alram = (String) request.getSession().getAttribute("alram");
		
		mav.addObject("test",alram);
		mav.setViewName("redirect:/reservdetails.do");
		return mav;
		
	}
	
	@RequestMapping(value = "/reservdetails.do", method = RequestMethod.GET)
	public ModelAndView reservDetails(Locale locale, Model model,HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		if(request.getSession().getAttribute("temp") != null) {
			Joinbean bean = jdao.myInfo((String)request.getSession().getAttribute("temp"));
			
			mav.addObject("bean", bean);
		} else {
			mav.setViewName("redirect:/main.do");
			return mav;
		}

		String id = (String) request.getSession().getAttribute("temp");
		List<Reservebean> myReserveList = rdao.reserveDetail(id);
		List<Reservebean> myOldReserveList = rdao.oldReserveDetail(id);
		List<Moviebean> movieList = mdao.movieSelect();
		List<Reservebean> myCancelList = rdao.reserveCancelDetail(id);
		
		String test = request.getParameter("test");
		
		if(test != null) {
			String str = (String)request.getSession().getAttribute("alram");
			str += "k";
			request.getSession().setAttribute("alram", str);
			
		} else {
			request.getSession().setAttribute("alram", "no");
		}
		String alram = (String) request.getSession().getAttribute("alram");
		
		mav.addObject("test1",alram);
		mav.addObject("movie",movieList);
		mav.addObject("reserve",myReserveList);
		mav.addObject("oldReserve",myOldReserveList);
		mav.addObject("cancel",myCancelList);
		mav.setViewName("reserve/reservDetails");
		return mav;
		
	}//end
	
	@RequestMapping(value = "/cancel.do", method = RequestMethod.GET)
	public void reserve_cancel(HttpServletRequest request, HttpServletResponse response) throws ParseException, IOException {
		PrintWriter out = response.getWriter();
		String rstart = request.getParameter("rstart");
		Date now = new Date();
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		
		Date d1 = sdf.parse(rstart);
		Date d2 = sdf.parse(sdf.format(now));
		long diff = d1.getTime() - d2.getTime();
		long diffMinites = diff / 1000 / 60;
		
		String rno = request.getParameter("rno");
		if(diffMinites >= 20) {
			System.out.println("취소가능시간");
			Reservebean bean = rdao.reserveDetailOne(Integer.parseInt(rno));
			rdao.reserveCancelInsert(bean);
			rdao.reserveDelete(Integer.parseInt(rno));
			out.print("{\"check\":\"1\"}");
		} else {
			System.out.println("취소불가");
			out.print("{\"check\":\"0\"}");
		}
	}
	
	@RequestMapping(value = "/findCinema.do", method = {RequestMethod.GET, RequestMethod.POST}, produces="application/json; charset=utf8")
	public @ResponseBody void reserve_findCinema(HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		
		String location = request.getParameter("name");
		List<Theaterbean> locTheater = tdao.findTheater(location);
		
		StringBuilder sb = new StringBuilder();
		sb.append("{\"theater\":\"");
		for(Theaterbean tbean : locTheater) {
			sb.append(tbean.getT_theater()+",");
		}
		sb.append("\"}");
		out.print(sb.toString());
	}
	
}
