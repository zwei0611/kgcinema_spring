package com.kg.cinema.login;

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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.HttpServerErrorException;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.servlet.ModelAndView;

import com.kg.cinema.join.JoinDAO;
import com.kg.cinema.movie.MovieDAO;
import com.kg.cinema.movie.Moviebean;

@Controller
public class LoginController {
	
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	
	@Inject
	@Autowired
	LoginDAO dao;
	
	@RequestMapping(value = "/login.do", method = {RequestMethod.GET, RequestMethod.POST})
	public void main(Loginbean bean, HttpServletRequest request, HttpServletResponse response) throws IOException {
		ModelAndView mav = new ModelAndView();
		PrintWriter out = response.getWriter();

		int count = dao.login(bean);
		if(count > 0) {
			request.getSession().setAttribute("temp", bean.getUserid());
			
			EgovHttpSessionBindingListener listener = new EgovHttpSessionBindingListener();
			request.getSession().setAttribute(bean.getUserid(), listener);
			out.print("{\"check\": \""+ count + "\"}");
			
		} else {
			out.print("{\"check\": \""+ count + "\"}");
		}
		
	}
	
	@RequestMapping(value = "/logout.do", method = RequestMethod.GET)
	public String main(HttpServletRequest request) throws Exception {
		try {
			RequestContextHolder.getRequestAttributes().removeAttribute("temp", RequestAttributes.SCOPE_SESSION);
			
			request.getSession().invalidate();
		} catch (Exception e) {
			System.out.println("Error : " + e);
		}
		return "redirect:/main.do";
	}
	
	
}
