package com.kg.cinema.screen;

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

@Controller
public class ScreenController {
	
	private static final Logger logger = LoggerFactory.getLogger(ScreenController.class);
	
	@Inject
	@Autowired
	ScreenDAO srdao;
	
	@RequestMapping(value = "/scrNo.do", method = RequestMethod.GET)
	public void seatCount(HttpServletRequest request, HttpServletResponse response) throws IOException{
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
		PrintWriter out = response.getWriter();
		String s_theater = request.getParameter("s_theater");
		System.out.println("s_theater: " + s_theater);
		List<Screenbean> list = srdao.ScrNo(s_theater);
		StringBuilder sb = new StringBuilder();
		//{"scrno":"1관,2관,"}
		sb.append("{");
		sb.append("\"scrno\": \"");
		for(Screenbean bean:list) {
			sb.append(bean.getS_scrno()+",");
		}
		sb.append("\" }");
		out.print(sb.toString());
	}//end	
}
