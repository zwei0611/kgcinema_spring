package com.kg.cinema.join;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.inject.Inject;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.net.SecureNio2Channel.ApplicationBufferHandler;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kg.cinema.movie.MovieDAO;
import com.kg.cinema.movie.Moviebean;

@Controller
public class JoinController {
	
	private static final Logger logger = LoggerFactory.getLogger(JoinController.class);
	
	@Inject
	@Autowired
	JoinDAO dao;
	
	@Autowired
	private ServletContext application;
	
	@RequestMapping(value = "/write.do", method = RequestMethod.GET)
	public ModelAndView join_insert() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("join/Input");
		return mav;
	}
	
	@RequestMapping("/join.do")
	public String join_insertSave(Joinbean bean) {
		bean.setJ_birth(bean.getYear()+"-"+bean.getMonth()+"-"+bean.getDay());
		bean.setJ_phone(bean.getNum1()+"-"+bean.getNum2()+"-"+bean.getNum3());
		dao.insertSave(bean);
		return "redirect:/main.do";
	}
	
	@RequestMapping("/check.do")
	public void check(HttpServletResponse response, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		PrintWriter out;
		try {
			out = response.getWriter();
			String id = request.getParameter("id");
			int count = dao.idCheck(id);
			if(count == 1) {
				out.print(count);
			} else {
				mav.addObject("check", count);
				out.print(count);
			}
		} catch(IOException e) {
			e.printStackTrace();
		}
		return ;
	}
	
	@RequestMapping("/mypage.do")
	public ModelAndView join_mypage(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		if(session.getAttribute("temp") == null) {
			mav.setViewName("redirect:/main.do");
			return mav;
		} else {
			Joinbean bean = dao.myInfo((String)session.getAttribute("temp"));
			
			mav.addObject("bean", bean);
			mav.setViewName("join/myInfo");
		}
		return mav;
	}
	
	@RequestMapping("/edit.do")
	public String join_edit(Joinbean bean) {
		bean.setJ_birth(bean.getYear()+"-"+bean.getMonth()+"-"+bean.getDay());
		bean.setJ_phone(bean.getNum1()+"-"+bean.getNum2()+"-"+bean.getNum3());
		
		if(bean.getUpload_f().getOriginalFilename().equals("")) {
			
		} else {
			String path = application.getRealPath("/resources/storage/");
			bean.setJ_file1(bean.getUpload_f().getOriginalFilename());
			try {
				bean.getUpload_f().transferTo(new File(path + bean.getJ_file1()));
			} catch(Exception e) { }
			
		}
		
		dao.edit(bean);
		return "redirect:/mypage.do";
	}
	
	@RequestMapping("/changePw.do")
	public ModelAndView join_changePw(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		if(session.getAttribute("temp") == null) {
			mav.setViewName("redirect:/main.do");
			return mav;
		} else {
			Joinbean bean = dao.myInfo((String)session.getAttribute("temp"));
			
			mav.addObject("bean", bean);
			mav.setViewName("join/changePw");
		}
		return mav;
	}
	
	@RequestMapping("/changePwSave.do")
	public ModelAndView join_changePwSave(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		if(session.getAttribute("temp") == null) {
			mav.setViewName("redirect:/main.do");
			return mav;
		} else {
			Joinbean bean = dao.myInfo((String)session.getAttribute("temp"));
			
			String newPass = request.getParameter("newPassword");
			bean.setJ_pwd(newPass);
			dao.chagePass(bean);
			mav.setViewName("redirect:/logout.do");
		}
		return mav;
	}
	
	@RequestMapping("/memberDel.do")
	public void join_memberDel(HttpServletRequest request, HttpServletResponse response) throws IOException {
		PrintWriter out = response.getWriter();
		String userId = request.getParameter("userid");
		dao.memberDel(userId);
		out.print("1");
	}
	
	
}
