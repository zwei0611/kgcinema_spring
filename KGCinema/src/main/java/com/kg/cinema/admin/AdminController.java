package com.kg.cinema.admin;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.inject.Inject;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kg.cinema.MainDAO;
import com.kg.cinema.Mainbean;
import com.kg.cinema.event.EventDAO;
import com.kg.cinema.event.Eventbean;
import com.kg.cinema.movie.MovieDAO;
import com.kg.cinema.movie.Moviebean;
import com.kg.cinema.notice.NoticeDAO;
import com.kg.cinema.notice.Noticebean;
import com.kg.cinema.schedule.ScheduleDAO;
import com.kg.cinema.schedule.Schedulebean;
import com.kg.cinema.screen.ScreenDAO;
import com.kg.cinema.screen.Screenbean;
import com.kg.cinema.seat.SeatDAO;
import com.kg.cinema.seat.Seatbean;
import com.kg.cinema.theater.TheaterDAO;
import com.kg.cinema.theater.Theaterbean;

@Controller
public class AdminController {
	
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
	
	@Inject
	@Autowired
	MovieDAO mdao;
	@Autowired
	NoticeDAO ndao;
	@Autowired
	EventDAO edao;
	@Autowired
	AdminDAO adao;
	@Autowired
	MainDAO maindao;	
	@Autowired
	ScheduleDAO sdao;
	@Autowired
	TheaterDAO tdao;	
	@Autowired
	ScreenDAO srdao;
	@Autowired
	SeatDAO stdao;
	
	@Autowired
	private ServletContext  application;
	
	//notice 	
	@RequestMapping(value = "/noticemglist.do", method = RequestMethod.GET)
	public ModelAndView noticeMgList(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView( );
		
		 HttpSession session = request.getSession();
		 
		 if(!session.getAttribute("temp").equals("admin")) {
			mav.setViewName("redirect:/main.do");
			return mav;
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
		mav.setViewName("admin/noticeManagement");
		return mav;
	}
	
	@RequestMapping(value = "/noticewrite.do", method = RequestMethod.GET)
	public String noticeWrite(Locale locale, Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		 
		 if(!session.getAttribute("temp").equals("admin")) {
			return "redirect:/main.do";
		 }
		 
		return "admin/noticeInsert";
	}//end
	
	@RequestMapping(value = "/noticeinsert.do", method = RequestMethod.GET)
	public String noticeInsert(Noticebean ndto, HttpServletRequest request) {  
		HttpSession session = request.getSession();
		 
		 if(!session.getAttribute("temp").equals("admin")) {
			return "redirect:/main.do";
		 }
		 
		adao.NoticeInsert(ndto);
		return "redirect:/noticemglist.do" ;
	}//end
	
	@RequestMapping(value = "/noticedelete.do", method = RequestMethod.GET)
	public ModelAndView noticeDelete(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView( );
		HttpSession session = request.getSession();
		 
		 if(!session.getAttribute("temp").equals("admin")) {
			mav.setViewName("redirect:/main.do");
			return mav;
		 }
		 
		int data=Integer.parseInt(request.getParameter("idx"));
		adao.NoticeDelete(data);
		mav.setViewName("redirect:/noticemglist.do");
		return mav;
	}//end
	
	@RequestMapping(value = "/noticeedit.do", method = RequestMethod.GET)
	public ModelAndView noticeEdit(HttpServletRequest request) {
	  ModelAndView mav = new ModelAndView( );
	  HttpSession session = request.getSession();
		 
		 if(!session.getAttribute("temp").equals("admin")) {
			mav.setViewName("redirect:/main.do");
			return mav;
		 }
		 
	  int data=Integer.parseInt(request.getParameter("idx"));
	  Noticebean ndto=ndao.NoticeDetail(data);
	  mav.addObject("notice", ndto);
	  mav.setViewName("admin/noticeEdit");
	  return mav;
	}//end
	
	@RequestMapping("/noticeeditsave.do")
	public String noticeEditSave(Noticebean ndto, HttpServletRequest request) {   		
		HttpSession session = request.getSession();
		 
		 if(!session.getAttribute("temp").equals("admin")) {
			return "redirect:/main.do";
		 }
		 
	  adao.NoticeEdit(ndto); 
	  return "redirect:/noticemglist.do";
	}//end
	
	//movie
	@RequestMapping(value = "/moviemglist.do", method = RequestMethod.GET)
	public ModelAndView movieMgList(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView( );
		HttpSession session = request.getSession();
		 
		 if(!session.getAttribute("temp").equals("admin")) {
			mav.setViewName("redirect:/main.do");
			return mav;
		 }
		 
		String page = request.getParameter("page");

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
			skey="m_title"; sval="";
		}
		  
		//if(skey.equals("m_name")) {AA = skey;}
		  
		if(skey.equals("m_title") && sval!="") {
			BB = skey; 
		}
		  
		returnpage = "&keyfield=" + skey + "&keyword=" + sval;
		  
		int SearchTotal = mdao.MovieMgCountSearch(skey, sval); //조회갯수
		    
		pnum=request.getParameter("pageNum");
		if(pnum=="" || pnum==null) {pnum="1";}
		else {pageNUM=Integer.parseInt(pnum);}
		  
		//[7클릭] 숫자7을 pageNUM변수가 기억
		start=(pageNUM-1)*10+1;
		end=(pageNUM)*10;
		  
		int Gtotal=mdao.MovieMgCount(); //레코드전체갯수
		  
		if(SearchTotal%10==0){ pagecount=SearchTotal/10; } 
		else {pagecount=(SearchTotal/10)+1;}

		temp=(pageNUM-1)%10;
		startpage=pageNUM-temp;
		endpage=startpage+9; //[31]~~~[40]
		if(endpage > pagecount) {endpage = pagecount;}
		
		List<Moviebean> LG=mdao.MovieMgSelect(start,end,skey,sval);
		List<Moviebean> mvs=mdao.MovieSlideSelect();
		
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
		mav.addObject("mvs", mvs);
		mav.addObject("page",page);
		mav.setViewName("admin/movieManagement");
		return mav;
	}
	//////////////
	@RequestMapping(value = "/moviewrite.do", method = RequestMethod.GET)
	public String movieWrite(Locale locale, Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		 
		 if(!session.getAttribute("temp").equals("admin")) {
			return "redirect:/main.do";
		 }
		 
		return "admin/movieInsert";
	}//end
	
	@RequestMapping(value = "/movieinsert.do", method = RequestMethod.POST)
	public String movieInsert(Moviebean mdto, HttpServletRequest request) throws ParseException {  
		HttpSession session = request.getSession();
		 
		 if(!session.getAttribute("temp").equals("admin")) {
			return "redirect:/main.do";
		 }
		 
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date ee = null;
	    try {
	    	ee = sdf.parse(mdto.getUpload_premiere());
	    } catch (ParseException e1) {
	    	e1.printStackTrace();
	    }
		  String path=application.getRealPath("/resources/storage");
		  System.out.println(path);
		  String poster=mdto.getUpload_poster().getOriginalFilename();
		  String steal1=mdto.getUpload_steal1().getOriginalFilename();
		  String steal2=mdto.getUpload_steal2().getOriginalFilename();
		  String steal3=mdto.getUpload_steal3().getOriginalFilename();
		  String steal4=mdto.getUpload_steal4().getOriginalFilename();
		  String steal5=mdto.getUpload_steal5().getOriginalFilename();
		  File file1 = new File( path, poster);
		  File file2 = new File( path, steal1);
		  File file3 = new File( path, steal2);
		  File file4 = new File( path, steal3);
		  File file5 = new File( path, steal4);
		  File file6 = new File( path, steal5);
		    
		try{ 
			mdto.getUpload_poster().transferTo(file1);
			mdto.getUpload_steal1().transferTo(file2);
			mdto.getUpload_steal2().transferTo(file3);
			mdto.getUpload_steal3().transferTo(file4);
			mdto.getUpload_steal4().transferTo(file5);
			mdto.getUpload_steal5().transferTo(file6);
		}catch(Exception ex){ }
			mdto.setM_poster(poster);
			mdto.setM_steal1(steal1);
			mdto.setM_steal2(steal2);
			mdto.setM_steal3(steal3);
			mdto.setM_steal4(steal4);
			mdto.setM_steal5(steal5);
			mdto.setM_premiere(ee);
			
			System.out.println("no : " + mdto.getM_no());
			System.out.println("actor : " + mdto.getM_actor());
			System.out.println("director : " + mdto.getM_director());
			System.out.println("genre : " + mdto.getM_genre());
			System.out.println("grade : " + mdto.getM_grade());
			System.out.println("poster : " + mdto.getM_poster());
			System.out.println("steal1 : " + mdto.getM_steal1());
			System.out.println("steal2 : " + mdto.getM_steal2());
			System.out.println("steal3 : " + mdto.getM_steal3());
			System.out.println("steal4 : " +mdto.getM_steal4());
			System.out.println("steal5 : " + mdto.getM_steal5());
			System.out.println("story : " + mdto.getM_story());
			System.out.println("subtitle : " + mdto.getM_subtitle());
			System.out.println("title : " + mdto.getM_title());
			System.out.println("premiere : " + mdto.getM_premiere());
			System.out.println("type : " + mdto.getM_type());
			adao.MovieInsert(mdto);
			return "redirect:/moviemglist.do" ;
	}//end
	
	@RequestMapping(value = "/moviedelete.do", method = RequestMethod.GET)
	public ModelAndView movieDelete(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView( );
		HttpSession session = request.getSession();
		 
		 if(!session.getAttribute("temp").equals("admin")) {
			mav.setViewName("redirect:/main.do");
			return mav;
		 }
		 
		int data=Integer.parseInt(request.getParameter("idx"));
		adao.MovieDelete(data);
		mav.setViewName("redirect:/moviemglist.do");
		return mav;
	}//end
	
	@RequestMapping(value = "/movieedit.do", method = RequestMethod.GET)
	public ModelAndView movieEdit(HttpServletRequest request) {
	  ModelAndView mav = new ModelAndView( );
	  HttpSession session = request.getSession();
		 
		 if(!session.getAttribute("temp").equals("admin")) {
			mav.setViewName("redirect:/main.do");
			return mav;
		 }
		 
	  int data=Integer.parseInt(request.getParameter("idx"));
	  Moviebean mdto=mdao.movieDetail(data);
	  mav.addObject("movie", mdto);
	  mav.setViewName("admin/movieEdit");
	  return mav;
	}//end
	
	@RequestMapping(value = "/movieeditsave.do", method = RequestMethod.POST)
	public String movieEditSave(Moviebean mdto, HttpServletRequest request) throws ParseException, IOException {   
		HttpSession session = request.getSession();
		 
		 if(!session.getAttribute("temp").equals("admin")) {
			return "redirect:/main.do";
		 }
		 
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date ee = null;
		
	    try {
	    	ee = sdf.parse(mdto.getUpload_premiere());
	    } catch (ParseException e1) {
	    	e1.printStackTrace();
	    }
		  String path=application.getRealPath("/resources/storage");
		  
		  if(!mdto.getUpload_poster().getOriginalFilename().equals("")) {
			  MultipartFile mf1=mdto.getUpload_poster();
			  String poster=mf1.getOriginalFilename();
			  File file1=new File(path, poster);
			  FileCopyUtils.copy(mdto.getUpload_poster().getBytes(), file1);
			  mdto.setM_poster(poster);
		  }else {
			  mdto.setM_poster(mdto.getM_poster());
		  }
		  if(!mdto.getUpload_steal1().getOriginalFilename().equals("")) {
			  MultipartFile mf2=mdto.getUpload_steal1();
			  String steal1=mf2.getOriginalFilename();
			  File file2=new File(path, steal1);
			  FileCopyUtils.copy(mdto.getUpload_steal1().getBytes(), file2);
			  mdto.setM_steal1(steal1);
		  }else {
			  mdto.setM_steal1(mdto.getM_steal1());
		  }
		  if(!mdto.getUpload_steal2().getOriginalFilename().equals("")) {
			  MultipartFile mf3=mdto.getUpload_steal2();
			  String steal2=mf3.getOriginalFilename();
			  File file3=new File(path, steal2);
			  FileCopyUtils.copy(mdto.getUpload_steal2().getBytes(), file3);
			  mdto.setM_steal2(steal2);
		  }else {
			  mdto.setM_steal2(mdto.getM_steal2());
		  }
		  if(!mdto.getUpload_steal3().getOriginalFilename().equals("")) {
			  MultipartFile mf4=mdto.getUpload_steal3();
			  String steal3=mf4.getOriginalFilename();
			  File file4=new File(path, steal3);
			  FileCopyUtils.copy(mdto.getUpload_steal3().getBytes(), file4);
			  mdto.setM_steal3(steal3);
		  }else {
			  mdto.setM_steal3(mdto.getM_steal3());
		  }
		  if(!mdto.getUpload_steal4().getOriginalFilename().equals("")) {
			  MultipartFile mf5=mdto.getUpload_steal4();
			  String steal4=mf5.getOriginalFilename();
			  File file5=new File(path, steal4);
			  FileCopyUtils.copy(mdto.getUpload_steal4().getBytes(), file5);
			  mdto.setM_steal4(steal4);
		  }else {
			  mdto.setM_steal4(mdto.getM_steal4());
		  }
		  if(!mdto.getUpload_steal5().getOriginalFilename().equals("")) {
			  MultipartFile mf6=mdto.getUpload_steal5();
			  String steal5=mf6.getOriginalFilename();
			  File file6=new File(path, steal5);
			  FileCopyUtils.copy(mdto.getUpload_steal5().getBytes(), file6);
			  mdto.setM_steal5(steal5);
		  }else {
			  mdto.setM_steal5(mdto.getM_steal5());   
		  }

		   mdto.setM_premiere(ee);
		   
		  
		   
			System.out.println("no : " + mdto.getM_no());
			System.out.println("actor : " + mdto.getM_actor());
			System.out.println("director : " + mdto.getM_director());
			System.out.println("genre : " + mdto.getM_genre());
			System.out.println("grade : " + mdto.getM_grade());
			System.out.println("poster : " + mdto.getM_poster());
			System.out.println("steal1 : " + mdto.getM_steal1());
			System.out.println("steal2 : " + mdto.getM_steal2());
			System.out.println("steal3 : " + mdto.getM_steal3());
			System.out.println("steal4 : " +mdto.getM_steal4());
			System.out.println("steal5 : " + mdto.getM_steal5());
			System.out.println("story : " + mdto.getM_story());
			System.out.println("subtitle : " + mdto.getM_subtitle());
			System.out.println("title : " + mdto.getM_title());
			System.out.println("premiere : " + mdto.getM_premiere());
			System.out.println("type : " + mdto.getM_type());
		   adao.MovieEdit(mdto); 
		   return "redirect:/moviemglist.do";
	}//end
	
	//event
	@RequestMapping(value = "/eventmglist.do", method = RequestMethod.GET)
	public ModelAndView eventMgList(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView( );
		HttpSession session = request.getSession();
		 
		 if(!session.getAttribute("temp").equals("admin")) {
			mav.setViewName("redirect:/main.do");
			return mav;
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
		  
		//if(skey.equals("e_name")) {AA = skey;}
		  
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
		mav.setViewName("admin/eventManagement");
		return mav;
	}
	
	@RequestMapping(value = "/eventwrite.do", method = RequestMethod.GET)
	public String eventWrite(Locale locale, Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		 
		 if(!session.getAttribute("temp").equals("admin")) {
			return "redirect:/main.do";
		 }
		 
		return "admin/eventInsert";
	}//end
	
	@RequestMapping(value = "/eventinsert.do", method = RequestMethod.POST)
	public String eventInsert(Eventbean edto, HttpServletRequest request) {  
		
		HttpSession session = request.getSession();
		 
		 if(!session.getAttribute("temp").equals("admin")) {
			return "redirect:/main.do";
		 }
		 
		 
		  String path=application.getRealPath("/resources/storage");
		  String img=edto.getUpload_file().getOriginalFilename();
		  String content=edto.getUpload_content().getOriginalFilename();
		  
		  File file1 = new File( path, img);
		  File file2 = new File( path, content);
		    
		try{ 
			edto.getUpload_file().transferTo(file1); 
			edto.getUpload_content().transferTo(file2);
			
		}catch(Exception ex){ }
		
		edto.setE_file(img);
		edto.setE_content(content);
		adao.EventInsert(edto);
		return "redirect:/eventmglist.do" ;
	}//end
	
	@RequestMapping(value = "/eventdelete.do", method = RequestMethod.GET)
	public ModelAndView eventDelete(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView( );
		HttpSession session = request.getSession();
		 
		 if(!session.getAttribute("temp").equals("admin")) {
			mav.setViewName("redirect:/main.do");
			return mav;
		 }

		int data=Integer.parseInt(request.getParameter("idx"));
		adao.EventDelete(data);
		mav.setViewName("redirect:/eventmglist.do");
		return mav;
	}//end
	
	@RequestMapping(value = "/eventedit.do", method = RequestMethod.GET)
	public ModelAndView eventEdit(HttpServletRequest request) {
	  ModelAndView mav = new ModelAndView( );
	  HttpSession session = request.getSession();
		 
		 if(!session.getAttribute("temp").equals("admin")) {
			mav.setViewName("redirect:/main.do");
			return mav;
		 }

	  int data=Integer.parseInt(request.getParameter("idx"));
	  Eventbean edto=edao.EventDetail(data);
	  mav.addObject("event", edto);
	  mav.setViewName("admin/eventEdit");
	  return mav;
	}//end
	
	@RequestMapping(value = "/eventeditsave.do", method = RequestMethod.POST)
	public String eventEditSave(Eventbean edto, HttpServletRequest request) throws IOException {   
		HttpSession session = request.getSession();
		 
		 if(!session.getAttribute("temp").equals("admin")) {
			return "redirect:/main.do";
		 }
		 
	 String path=application.getRealPath("/resources/storage");
	 
	 if(!edto.getUpload_file().getOriginalFilename().equals("")) {
		 MultipartFile mf1=edto.getUpload_file();
		 String img=mf1.getOriginalFilename();
		 File file1=new File(path, img);
		 FileCopyUtils.copy(edto.getUpload_file().getBytes(), file1);
		 edto.setE_file(img);
	 }else {
		 edto.setE_file(edto.getE_file());
	 }
		  
	 if(!edto.getUpload_file().getOriginalFilename().equals("")) {
		 MultipartFile mf2=edto.getUpload_content();
		 String content=mf2.getOriginalFilename();	  
		 File file2=new File(path, content);	  
		 FileCopyUtils.copy(edto.getUpload_content().getBytes(), file2);	  
		 edto.setE_content(content);
	 }else {
		 edto.setE_content(edto.getE_content());
	 }	  
	 adao.EventEdit(edto); 
	 return "redirect:/eventmglist.do";
	}//end
	
	//mainslide	
	@RequestMapping(value = "/msmglist.do", method = RequestMethod.GET)
	public ModelAndView msMgList(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView( );

		HttpSession session = request.getSession();
		 
		 if(!session.getAttribute("temp").equals("admin")) {
			mav.setViewName("redirect:/main.do");
			return mav;
		 }

		 
		List<Mainbean> msMgList = maindao.MainSlideSelect();
		List<Mainbean> meMgList = maindao.MainEventSelect();
		
		mav.addObject("ms", msMgList);
		mav.addObject("me", meMgList);
		
        
		mav.setViewName("admin/mainManagement");
		return mav;		
	}	
	
	@RequestMapping(value = "/mswrite.do", method = RequestMethod.GET)
	public String msMgWrite(Locale locale, Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		 
		 if(!session.getAttribute("temp").equals("admin")) {
			return "redirect:/main.do";
		 }
		 
		return "admin/mainSlideInsert";
	}//end
	
	@RequestMapping(value = "/msinsert.do", method = RequestMethod.POST)
	public String mainSlideInsert(Mainbean msdto, HttpServletRequest request) {  
		HttpSession session = request.getSession();
		 
		 if(!session.getAttribute("temp").equals("admin")) {
			return "redirect:/main.do";
		 }
		 

		  String path=application.getRealPath("/resources/storage");
		  String img=msdto.getUpload_file().getOriginalFilename();
		  
		  File file = new File( path, img);
		    
		try{ 
			msdto.getUpload_file().transferTo(file); 
		}catch(Exception ex){ }
		
		msdto.setMs_file(img);
		
		System.out.println("no : " + msdto.getMs_no());
		System.out.println("title : " + msdto.getMs_title());
		System.out.println("subtitle : " + msdto.getMs_subtitle());
		System.out.println("content : " + msdto.getMs_content());
		System.out.println("date : " + msdto.getMs_date());
		System.out.println("file : " + msdto.getMs_file());
		adao.MainSlideInsert(msdto);
		return "redirect:/msmglist.do" ;
	}//end
	
	@RequestMapping(value = "/msdelete.do", method = RequestMethod.GET)
	public ModelAndView mainSlideDelete(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView( );
		HttpSession session = request.getSession();
		 
		 if(!session.getAttribute("temp").equals("admin")) {
			mav.setViewName("redirect:/main.do");
			return mav;
		 }

		int data=Integer.parseInt(request.getParameter("idx"));
		adao.MainSlideDelete(data);
		mav.setViewName("redirect:/msmglist.do");
		return mav;
	}//end
	
	@RequestMapping(value = "/msedit.do", method = RequestMethod.GET)
	public ModelAndView mainSlideEdit(HttpServletRequest request) {
	  ModelAndView mav = new ModelAndView( );
	  HttpSession session = request.getSession();
		 
		 if(!session.getAttribute("temp").equals("admin")) {
			mav.setViewName("redirect:/main.do");
			return mav;
		 }

	  int data=Integer.parseInt(request.getParameter("idx"));
	  Mainbean msdto=maindao.MainSlideDetail(data);
	  mav.addObject("ms", msdto);
	  mav.setViewName("admin/mainSlideEdit");
	  return mav;
	}//end
	
	@RequestMapping(value = "/mseditsave.do", method = RequestMethod.POST)
	public String mainSlideEditSave(Mainbean msdto, HttpServletRequest request) throws IOException {   
		HttpSession session = request.getSession();
		 
		 if(!session.getAttribute("temp").equals("admin")) {
			return "redirect:/main.do";
		 }
		 
	 String path=application.getRealPath("/resources/storage");
	 
	 if(!msdto.getUpload_file().getOriginalFilename().equals("")) {
		 MultipartFile mf=msdto.getUpload_file();
		 String img=mf.getOriginalFilename();
		 File file=new File(path, img);
		 FileCopyUtils.copy(msdto.getUpload_file().getBytes(), file);
		 msdto.setMs_file(img);
	 }else {
		 msdto.setMs_file(msdto.getMs_file());
	 }

	 adao.MainSlideEdit(msdto); 
	 return "redirect:/msmglist.do";
	}//end	
	
	@RequestMapping(value="/maineventwrite.do", method=RequestMethod.GET)
	public void eventDetail(HttpServletRequest request, HttpServletResponse response) throws IOException{
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
		PrintWriter out = response.getWriter();
		String me_no = request.getParameter("me_no");
		Mainbean medto = maindao.MainEventDetail2(me_no);
		StringBuilder sb = new StringBuilder();
		System.out.println("me_no = " + me_no);
		System.out.println("getMe_file1=" + medto.getMe_file1());
		sb.append("{");
		sb.append("\"me_no\": \"" + medto.getMe_no() + "\", " );
		sb.append("\"me_file1\": \"" + medto.getMe_file1() + "\" ");
		sb.append("\"me_file2\": \"" + medto.getMe_file2() + "\" ");
		sb.append("\"me_file3\": \"" + medto.getMe_file3() + "\" ");
		sb.append("\"me_file4\": \"" + medto.getMe_file4() + "\" ");
		sb.append("\"me_file5\": \"" + medto.getMe_file5() + "\" ");
		sb.append("\"me_file6\": \"" + medto.getMe_file6() + "\" ");
		sb.append("\"me_file7\": \"" + medto.getMe_file7() + "\" ");
		sb.append("\"me_file8\": \"" + medto.getMe_file8() + "\" ");
		sb.append("\"me_file9\": \"" + medto.getMe_file9() + "\" ");
		sb.append("}");
		out.print(sb.toString());
	}	
	
	@RequestMapping(value = "/maineventinsert.do", method = RequestMethod.POST)
	public String mainEventInsert(Mainbean medto, HttpServletRequest request) { 
		HttpSession session = request.getSession();
		 
		 if(!session.getAttribute("temp").equals("admin")) {
			return "redirect:/main.do";
		 }
		 

		String path=application.getRealPath("/resources/storage");
		System.out.println(path);
		
		System.out.println("no : " + medto.getMe_no());
		System.out.println("date : " + medto.getMe_date());
		System.out.println("add : " + medto.getMe_add());
		System.out.println("uploadfile1 : " + medto.getUpload_file1());
		System.out.println("file1 : " + medto.getMe_file1());
		System.out.println("uploadfile2 : " + medto.getUpload_file2());
		System.out.println("file2 : " + medto.getMe_file2());
		System.out.println("uploadfile3 : " + medto.getUpload_file3());
		System.out.println("file3 : " + medto.getMe_file3());
		System.out.println("uploadfile4 : " + medto.getUpload_file4());
		System.out.println("file4 : " + medto.getMe_file4());
		System.out.println("uploadfile5 : " + medto.getUpload_file5());
		System.out.println("file5 : " + medto.getMe_file5());
		System.out.println("uploadfile6 : " + medto.getUpload_file6());
		System.out.println("file6 : " + medto.getMe_file6());
		System.out.println("uploadfile7 : " + medto.getUpload_file7());
		System.out.println("file7 : " + medto.getMe_file7());
		System.out.println("uploadfile8 : " + medto.getUpload_file8());
		System.out.println("file8 : " + medto.getMe_file8());
		System.out.println("uploadfile9 : " + medto.getUpload_file9());
		System.out.println("file9 : " + medto.getMe_file9());
		
		String img1=medto.getUpload_file1().getOriginalFilename();
		String img2=medto.getUpload_file2().getOriginalFilename();
		String img3=medto.getUpload_file3().getOriginalFilename();
		String img4=medto.getUpload_file4().getOriginalFilename();
		String img5=medto.getUpload_file5().getOriginalFilename();
		String img6=medto.getUpload_file6().getOriginalFilename();
		String img7=medto.getUpload_file7().getOriginalFilename();
		String img8=medto.getUpload_file8().getOriginalFilename();
		String img9=medto.getUpload_file9().getOriginalFilename();
		
		File file1 = new File( path, img1);
		File file2 = new File( path, img2);
		File file3 = new File( path, img3);
		File file4 = new File( path, img4);
		File file5 = new File( path, img5);
		File file6 = new File( path, img6);
		File file7 = new File( path, img7);
		File file8 = new File( path, img8);
		File file9 = new File( path, img9);
		  
		try{ 
			medto.getUpload_file1().transferTo(file1); 
			medto.getUpload_file2().transferTo(file2); 
			medto.getUpload_file3().transferTo(file3); 
			medto.getUpload_file4().transferTo(file4); 
			medto.getUpload_file5().transferTo(file5); 
			medto.getUpload_file6().transferTo(file6); 
			medto.getUpload_file7().transferTo(file7); 
			medto.getUpload_file8().transferTo(file8); 
			medto.getUpload_file9().transferTo(file9); 
		}catch(Exception ex){ }
		
		medto.setMe_file1(img1);  
		medto.setMe_file2(img2); 
		medto.setMe_file3(img3); 
		medto.setMe_file4(img4); 
		medto.setMe_file5(img5); 
		medto.setMe_file6(img6); 
		medto.setMe_file7(img7); 
		medto.setMe_file8(img8); 
		medto.setMe_file9(img9); 
				

		adao.MainEventInsert(medto);
		return "redirect:/msmglist.do" ;
	}//end	
	
	@RequestMapping(value = "/maineventeditsave.do", method = RequestMethod.POST)
	public String mainEventEditSave(Mainbean medto, HttpServletRequest request) throws ParseException, IOException {   
		HttpSession session = request.getSession();
		 
		 if(!session.getAttribute("temp").equals("admin")) {
			return "redirect:/main.do";
		 }
		 
		  
			if(medto.getUpload_file1().getOriginalFilename().equals("")) {
				
			} else {
				String path = application.getRealPath("/resources/storage/");
				medto.setMe_file1(medto.getUpload_file1().getOriginalFilename());
				try {
					medto.getUpload_file1().transferTo(new File(path + medto.getMe_file1()));
				} catch(Exception e) { }	
			}
			
			if(medto.getUpload_file2().getOriginalFilename().equals("")) {
				
			} else {
				String path = application.getRealPath("/resources/storage/");
				medto.setMe_file2(medto.getUpload_file2().getOriginalFilename());
				try {
					medto.getUpload_file2().transferTo(new File(path + medto.getMe_file2()));
				} catch(Exception e) { }	
			}
			
			if(medto.getUpload_file3().getOriginalFilename().equals("")) {
				
			} else {
				String path = application.getRealPath("/resources/storage/");
				medto.setMe_file3(medto.getUpload_file3().getOriginalFilename());
				try {
					medto.getUpload_file3().transferTo(new File(path + medto.getMe_file3()));
				} catch(Exception e) { }	
			}
			
			if(medto.getUpload_file4().getOriginalFilename().equals("")) {
				
			} else {
				String path = application.getRealPath("/resources/storage/");
				medto.setMe_file4(medto.getUpload_file4().getOriginalFilename());
				try {
					medto.getUpload_file4().transferTo(new File(path + medto.getMe_file4()));
				} catch(Exception e) { }	
			}
			if(medto.getUpload_file5().getOriginalFilename().equals("")) {
				
			} else {
				String path = application.getRealPath("/resources/storage/");
				medto.setMe_file5(medto.getUpload_file5().getOriginalFilename());
				try {
					medto.getUpload_file5().transferTo(new File(path + medto.getMe_file5()));
				} catch(Exception e) { }	
			}
			
			if(medto.getUpload_file6().getOriginalFilename().equals("")) {
				
			} else {
				String path = application.getRealPath("/resources/storage/");
				medto.setMe_file6(medto.getUpload_file6().getOriginalFilename());
				try {
					medto.getUpload_file6().transferTo(new File(path + medto.getMe_file6()));
				} catch(Exception e) { }	
			}
			
			if(medto.getUpload_file7().getOriginalFilename().equals("")) {
				
			} else {
				String path = application.getRealPath("/resources/storage/");
				medto.setMe_file7(medto.getUpload_file7().getOriginalFilename());
				try {
					medto.getUpload_file7().transferTo(new File(path + medto.getMe_file7()));
				} catch(Exception e) { }	
			}
			
			if(medto.getUpload_file8().getOriginalFilename().equals("")) {
				
			} else {
				String path = application.getRealPath("/resources/storage/");
				medto.setMe_file8(medto.getUpload_file8().getOriginalFilename());
				try {
					medto.getUpload_file8().transferTo(new File(path + medto.getMe_file8()));
				} catch(Exception e) { }	
			}
			
			if(medto.getUpload_file9().getOriginalFilename().equals("")) {
				
			} else {
				String path = application.getRealPath("/resources/storage/");
				medto.setMe_file9(medto.getUpload_file9().getOriginalFilename());
				try {
					medto.getUpload_file9().transferTo(new File(path + medto.getMe_file9()));
				} catch(Exception e) { }	
			}
		   adao.MainEventEdit(medto); 
		   return "redirect:/msmglist.do";
	}//end	
	
	//movieslide
	@RequestMapping(value = "/mvswrite.do", method = RequestMethod.GET)
	public String mvsMgWrite(Locale locale, Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		 
		 if(!session.getAttribute("temp").equals("admin")) {
			return "redirect:/main.do";
		 }
		 
		return "admin/movieSlideInsert";
	}//end
	
	@RequestMapping(value = "/mvsinsert.do", method = RequestMethod.POST)
	public String movieSlideInsert(Moviebean mvsdto, HttpServletRequest request) {  
		HttpSession session = request.getSession();
		 
		 if(!session.getAttribute("temp").equals("admin")) {
			return "redirect:/main.do";
		 }

		  String path=application.getRealPath("/resources/storage");
		  String img=mvsdto.getUpload_file().getOriginalFilename();
		  String video=mvsdto.getUpload_video().getOriginalFilename();
		  
		  File file1 = new File( path, img);
		  File file2 = new File( path, video);
		    
		try{ 
			mvsdto.getUpload_file().transferTo(file1);
			mvsdto.getUpload_video().transferTo(file2);
		}catch(Exception ex){ }
		
		mvsdto.setMvs_file(img);
		mvsdto.setMvs_video(video);
		
		System.out.println("no : " + mvsdto.getMvs_no());
		System.out.println("img : " + mvsdto.getMvs_file());
		System.out.println("video : " + mvsdto.getMvs_video());

		adao.MovieSlideInsert(mvsdto);
		return "redirect:/moviemglist.do?page=mvs" ;
	}//end
	
	@RequestMapping(value = "/mvsdelete.do", method = RequestMethod.GET)
	public ModelAndView movieSlideDelete(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView( );
		HttpSession session = request.getSession();
		 
		 if(!session.getAttribute("temp").equals("admin")) {
			mav.setViewName("redirect:/main.do");
			return mav;
		 }

		int data=Integer.parseInt(request.getParameter("idx"));
		adao.MovieSlideDelete(data);
		mav.setViewName("redirect:/moviemglist.do?page=mvs");
		return mav;
	}//end
	
	@RequestMapping(value = "/mvsedit.do", method = RequestMethod.GET)
	public ModelAndView movieSlideEdit(HttpServletRequest request) {
	  ModelAndView mav = new ModelAndView( );
	  HttpSession session = request.getSession();
		 
		 if(!session.getAttribute("temp").equals("admin")) {
			mav.setViewName("redirect:/main.do");
			return mav;
		 }

	  int data=Integer.parseInt(request.getParameter("idx"));
	  Moviebean mvsdto=mdao.movieSlideDetail(data);
	  mav.addObject("mvs", mvsdto);
	  mav.setViewName("admin/movieSlideEdit");
	  return mav;
	}//end
	
	@RequestMapping(value = "/mvseditsave.do", method = RequestMethod.POST)
	public String movieSlideEditSave(Moviebean mvsdto, HttpServletRequest request) throws IOException {   
		HttpSession session = request.getSession();
		 
		 if(!session.getAttribute("temp").equals("admin")) {
			return "redirect:/main.do";
		 }

	 
		if(mvsdto.getUpload_file().getOriginalFilename().equals("")) {
			
		} else {
			String path = application.getRealPath("/resources/storage/");
			mvsdto.setMvs_file(mvsdto.getUpload_file().getOriginalFilename());
			try {
				mvsdto.getUpload_file().transferTo(new File(path + mvsdto.getMvs_file()));
			} catch(Exception e) { }	
		}
		
		if(mvsdto.getUpload_video().getOriginalFilename().equals("")) {
			
		} else {
			String path = application.getRealPath("/resources/storage/");
			mvsdto.setMvs_video(mvsdto.getUpload_video().getOriginalFilename());
			try {
				mvsdto.getUpload_video().transferTo(new File(path + mvsdto.getMvs_video()));
			} catch(Exception e) { }	
		}

	 adao.MovieSlideEdit(mvsdto); 
	 return "redirect:/moviemglist.do?page=mvs";
	}//end	
	
	//schedule
	@RequestMapping(value = "/schedulemglist.do", method = RequestMethod.GET)
	public ModelAndView scheduleMgList(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView( );
		HttpSession session = request.getSession();
		 
		 if(!session.getAttribute("temp").equals("admin")) {
			mav.setViewName("redirect:/main.do");
			return mav;
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
			skey="title"; sval="";
		}
		  
		//if(skey.equals("name")) {AA = skey;}
		  
		if(skey.equals("title") && sval!="") {
			BB = skey; 
		}
		  
		returnpage = "&keyfield=" + skey + "&keyword=" + sval;
		  
		int SearchTotal = sdao.ScheduleMgCountSearch(skey, sval); //조회갯수
		    
		pnum=request.getParameter("pageNum");
		if(pnum=="" || pnum==null) {pnum="1";}
		else {pageNUM=Integer.parseInt(pnum);}
		  
		//[7클릭] 숫자7을 pageNUM변수가 기억
		start=(pageNUM-1)*10+1;
		end=(pageNUM)*10;
		  
		int Gtotal=sdao.ScheduleMgCount(); //레코드전체갯수
		  
		if(SearchTotal%10==0){ pagecount=SearchTotal/10; } 
		else {pagecount=(SearchTotal/10)+1;}

		temp=(pageNUM-1)%10;
		startpage=pageNUM-temp;
		endpage=startpage+9; //[31]~~~[40]
		if(endpage > pagecount) {endpage = pagecount;}
		
		List<Schedulebean> LG=sdao.ScheduleMgSelect(start,end,skey,sval);
		
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
		mav.setViewName("admin/scheduleManagement");
		return mav;
	}		
	
	@RequestMapping(value = "/schedulewrite.do", method = RequestMethod.GET)
	public ModelAndView scheduleWrite(HttpServletRequest request) {	
		ModelAndView mav = new ModelAndView( );
		HttpSession session = request.getSession();
		 
		 if(!session.getAttribute("temp").equals("admin")) {
			mav.setViewName("redirect:/main.do");
			return mav;
		 }

		List<Theaterbean> tselect=tdao.theaterSelect();
		List<Screenbean> srselect=srdao.ScreenMgSelect();
		List<Moviebean> mselect=mdao.movieSelectName();
		mav.addObject("tselect", tselect);
		mav.addObject("srselect",srselect);
		mav.addObject("mselect", mselect);
		mav.setViewName("admin/scheduleInsert");
		return mav;
	}//end
	
	@RequestMapping(value = "/scheduleinsert.do", method = RequestMethod.GET)
	public String scheduleInsert(Schedulebean sdto, HttpServletRequest request) {  
		HttpSession session = request.getSession();
		 
		 if(!session.getAttribute("temp").equals("admin")) {
			return "redirect:/main.do";
		 }

		adao.ScheduleInsert(sdto);
		return "redirect:/schedulemglist.do" ;
	}//end
	
	@RequestMapping(value = "/scheduledelete.do", method = RequestMethod.GET)
	public ModelAndView scheduleDelete(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView( );
		HttpSession session = request.getSession();
		 
		 if(!session.getAttribute("temp").equals("admin")) {
			mav.setViewName("redirect:/main.do");
			return mav;
		 }

		int data=Integer.parseInt(request.getParameter("idx"));
		adao.ScheduleDelete(data);
		mav.setViewName("redirect:/schedulemglist.do");
		return mav;
	}//end	
	
	//schedule
	@RequestMapping(value = "/theatermglist.do", method = RequestMethod.GET)
	public ModelAndView theaterMgList(HttpServletRequest request) {
		String page = request.getParameter("page");
		ModelAndView mav = new ModelAndView( );
		HttpSession session = request.getSession();
		 
		 if(!session.getAttribute("temp").equals("admin")) {
			mav.setViewName("redirect:/main.do");
			return mav;
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
			skey="t_theater"; sval="";
		}
		  
		//if(skey.equals("t_theater")) {AA = skey;}
		  
		if(skey.equals("t_theater") && sval!="") {
			BB = skey; 
		}
		  
		returnpage = "&keyfield=" + skey + "&keyword=" + sval;
		  
		int SearchTotal = tdao.TheaterMgCountSearch(skey, sval); //조회갯수
		    
		pnum=request.getParameter("pageNum");
		if(pnum=="" || pnum==null) {pnum="1";}
		else {pageNUM=Integer.parseInt(pnum);}
		  
		//[7클릭] 숫자7을 pageNUM변수가 기억
		start=(pageNUM-1)*10+1;
		end=(pageNUM)*10;
		  
		int Gtotal=tdao.TheaterMgCount(); //레코드전체갯수
		  
		if(SearchTotal%10==0){ pagecount=SearchTotal/10; } 
		else {pagecount=(SearchTotal/10)+1;}

		temp=(pageNUM-1)%10;
		startpage=pageNUM-temp;
		endpage=startpage+9; //[31]~~~[40]
		if(endpage > pagecount) {endpage = pagecount;}
		
		List<Theaterbean> LG=tdao.TheaterMgSelect(start,end,skey,sval);
		List<Screenbean> sr=srdao.ScreenMgSelect();
		
		mav.addObject("theater", LG);
		mav.addObject("screen", sr);
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
		mav.addObject("page",page);
		mav.setViewName("admin/theaterManagement");
		return mav;
	}		
	
	@RequestMapping(value = "/theaterewrite.do", method = RequestMethod.GET)
	public String theaterWrite(Locale locale, Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		 
		 if(!session.getAttribute("temp").equals("admin")) {
			return "redirect:/main.do";
		 }

		return "admin/theaterInsert";
	}//end
	
	@RequestMapping(value = "/theaterinsert.do", method = RequestMethod.GET)
	public String theaterInsert(Theaterbean tdto, HttpServletRequest request) {  
		HttpSession session = request.getSession();
		 
		 if(!session.getAttribute("temp").equals("admin")) {
			return "redirect:/main.do";
		 }

		adao.TheaterInsert(tdto);
		return "redirect:/theatermglist.do" ;
	}//end
	
	@RequestMapping(value = "/theaterdelete.do", method = RequestMethod.GET)
	public ModelAndView theaterDelete(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView( );
		HttpSession session = request.getSession();
		 
		 if(!session.getAttribute("temp").equals("admin")) {
			mav.setViewName("redirect:/main.do");
			return mav;
		 }
		
		int data=Integer.parseInt(request.getParameter("idx"));
		adao.TheaterDelete(data);
		mav.setViewName("redirect:/theatermglist.do");
		return mav;
	}//end		
	
	@RequestMapping(value = "/theateredit.do", method = RequestMethod.GET)
	public ModelAndView theaterEdit(HttpServletRequest request) {
	  ModelAndView mav = new ModelAndView( );
	  HttpSession session = request.getSession();
		 
		 if(!session.getAttribute("temp").equals("admin")) {
			mav.setViewName("redirect:/main.do");
			return mav;
		 }
		
	  int data=Integer.parseInt(request.getParameter("idx"));
	  Theaterbean tdto=tdao.TheaterDetail(data);
	  mav.addObject("theater", tdto);
	  mav.setViewName("admin/theaterEdit");
	  return mav;
	}//end
	
	@RequestMapping("/theatereditsave.do")
	public String theaterEditSave(Theaterbean tdto, HttpServletRequest request) {   
		HttpSession session = request.getSession();
		 
		 if(!session.getAttribute("temp").equals("admin")) {
			return "redirect:/main.do";
		 }

	  adao.TheaterEdit(tdto); 
	  return "redirect:/theatermglist.do";
	}//end
	
	//screen
	@RequestMapping(value = "/screenwrite.do", method = RequestMethod.GET)
	public ModelAndView screenWrite(HttpServletRequest request) {	
		ModelAndView mav = new ModelAndView( );
		HttpSession session = request.getSession();
		 
		 if(!session.getAttribute("temp").equals("admin")) {
			mav.setViewName("redirect:/main.do");
			return mav;
		 }
		
		List<Theaterbean> tselect=tdao.theaterSelect();
        List<Seatbean> seatstyle = stdao.seatStyle();
		mav.addObject("tselect", tselect);
		mav.addObject("style", seatstyle);
		mav.setViewName("admin/screenInsert");
		return mav;
	}//end
	
	@RequestMapping(value = "/screeninsert.do", method = RequestMethod.GET)
	public String screenInsert(Screenbean srdto, HttpServletRequest request) {  
		HttpSession session = request.getSession();
		 
		 if(!session.getAttribute("temp").equals("admin")) {
			return "redirect:/main.do";
		 }

		adao.ScreenInsert(srdto);
		return "redirect:/theatermglist.do?page=screen" ;
	}//end
	
	@RequestMapping(value = "/screendelete.do", method = RequestMethod.GET)
	public ModelAndView screenDelete(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView( );
		HttpSession session = request.getSession();
		 
		 if(!session.getAttribute("temp").equals("admin")) {
			mav.setViewName("redirect:/main.do");
			return mav;
		 }
		
		int data=Integer.parseInt(request.getParameter("idx"));
		adao.ScreenDelete(data);
		mav.setViewName("redirect:/theatermglist.do?page=screen");
		return mav;
	}//end		
	
	@RequestMapping(value = "/screenedit.do", method = RequestMethod.GET)
	public ModelAndView screenEdit(HttpServletRequest request) {
	  ModelAndView mav = new ModelAndView( );
	  HttpSession session = request.getSession();
		 
		 if(!session.getAttribute("temp").equals("admin")) {
			mav.setViewName("redirect:/main.do");
			return mav;
		 }
		
	  int data=Integer.parseInt(request.getParameter("idx"));
	  String AA="",BB="";
	  Screenbean srdto=srdao.ScreenDetail(data);
	  List<Theaterbean> tselect=tdao.theaterSelect();
      List<Seatbean> seatstyle = stdao.seatStyle();
	  mav.addObject("screen", srdto);
	  mav.addObject("tselect", tselect);
	  mav.addObject("style", seatstyle);
	  mav.setViewName("admin/screenEdit");
	  return mav;
	}//end
	
	@RequestMapping("/screeneditsave.do")
	public String screenEditSave(Screenbean srdto, HttpServletRequest request) {   		  
		HttpSession session = request.getSession();
		 
		 if(!session.getAttribute("temp").equals("admin")) {
			return "redirect:/main.do";
		 }

	  adao.ScreenEdit(srdto); 
	  return "redirect:/theatermglist.do?page=screen";
	}//end		
	
}
