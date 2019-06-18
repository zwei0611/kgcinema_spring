package com.kg.cinema.seat;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.kg.cinema.event.Eventbean;
import com.kg.cinema.movie.MovieDAO;
import com.kg.cinema.movie.Moviebean;

@Controller
public class SeatController {
	
	private static final Logger logger = LoggerFactory.getLogger(SeatController.class);
	
	@Inject
	@Autowired
	SeatDAO sdao;
	
	@RequestMapping(value = "/seatCount.do", method = RequestMethod.GET)
	public void seatCount(HttpServletRequest request, HttpServletResponse response) throws IOException{
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
		PrintWriter out = response.getWriter();
		String seatstyle = request.getParameter("style");
		System.out.println("seatstyle: " + seatstyle);
		int count = sdao.SeatCount(seatstyle);
		System.out.println(count);
		StringBuilder sb = new StringBuilder();
		sb.append("{");
		sb.append("\"count\": \"" + count + "\" " );
		sb.append("}");
		out.print(sb.toString());
	}//end	
}
