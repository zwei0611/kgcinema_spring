package com.kg.cinema.movie;
import org.springframework.web.multipart.MultipartFile;
public class Moviebean {
   //무비
   private int m_no;
   private String m_title;
   private String m_subtitle;
   private int m_grade;

   private String m_type;
   private java.util.Date m_premiere;
   private String m_director;
   private String m_actor;
   private String m_genre;
   private String m_story;
   private String m_poster;
   private String m_steal1;
   private String m_steal2;
   private String m_steal3;
   private String m_steal4;
   private String m_steal5;
   private String upload_premiere;
   private int m_inwon;
   
   
   private MultipartFile upload_poster;
   private MultipartFile upload_steal1;
   private MultipartFile upload_steal2;
   private MultipartFile upload_steal3;
   private MultipartFile upload_steal4;
   private MultipartFile upload_steal5;
   
   
   private double m_point;
   private String m_audience;
   private int m_rn;
   
   private int start, end;
   private String skey,sval;
   
   //무비슬라이드
   private int mvs_rn;
   private int mvs_no;
   private java.util.Date mvs_date;
   private String mvs_file;
   private String mvs_video;
   
   private MultipartFile upload_file;
   private MultipartFile upload_video;
   
   
    public int getM_inwon() {
	   return m_inwon;
    }
	public void setM_inwon(int m_inwon) {
		this.m_inwon = m_inwon;
	}
	public String getUpload_premiere() {
	   return upload_premiere;
    }
    public void setUpload_premiere(String upload_premiere) {
	   this.upload_premiere = upload_premiere;
    }
	public int getM_rn() {
		return m_rn;
	}
	public void setM_rn(int m_rn) {
		this.m_rn = m_rn;
	}
	public int getStart() {
		return start;
	}
	public void setStart(int start) {
		this.start = start;
	}
	public int getEnd() {
		return end;
	}
	public void setEnd(int end) {
		this.end = end;
	}
	public String getSkey() {
		return skey;
	}
	public void setSkey(String skey) {
		this.skey = skey;
	}
	public String getSval() {
		return sval;
	}
	public void setSval(String sval) {
		this.sval = sval;
	}
	public int getM_no() {
		return m_no;
	}
	public void setM_no(int m_no) {
		this.m_no = m_no;
	}
	public String getM_title() {
		return m_title;
	}
	public void setM_title(String m_title) {
		this.m_title = m_title;
	}
	public String getM_subtitle() {
		return m_subtitle;
	}
	public void setM_subtitle(String m_subtitle) {
		this.m_subtitle = m_subtitle;
	}
	public int getM_grade() {
		return m_grade;
	}
	public void setM_grade(int m_grade) {
		this.m_grade = m_grade;
	}
	public String getM_type() {
		return m_type;
	}
	public void setM_type(String m_type) {
		this.m_type = m_type;
	}
	public java.util.Date getM_premiere() {
		return m_premiere;
	}
	public void setM_premiere(java.util.Date m_premiere) {
		this.m_premiere = m_premiere;
	}
	public String getM_director() {
		return m_director;
	}
	public void setM_director(String m_director) {
		this.m_director = m_director;
	}
	public String getM_actor() {
		return m_actor;
	}
	public void setM_actor(String m_actor) {
		this.m_actor = m_actor;
	}
	public String getM_genre() {
		return m_genre;
	}
	public void setM_genre(String m_genre) {
		this.m_genre = m_genre;
	}
	public String getM_story() {
		return m_story;
	}
	public void setM_story(String m_story) {
		this.m_story = m_story;
	}
	public String getM_poster() {
		return m_poster;
	}
	public void setM_poster(String m_poster) {
		this.m_poster = m_poster;
	}
	public String getM_steal1() {
		return m_steal1;
	}
	public void setM_steal1(String m_steal1) {
		this.m_steal1 = m_steal1;
	}
	public String getM_steal2() {
		return m_steal2;
	}
	public void setM_steal2(String m_steal2) {
		this.m_steal2 = m_steal2;
	}
	public String getM_steal3() {
		return m_steal3;
	}
	public void setM_steal3(String m_steal3) {
		this.m_steal3 = m_steal3;
	}
	public String getM_steal4() {
		return m_steal4;
	}
	public void setM_steal4(String m_steal4) {
		this.m_steal4 = m_steal4;
	}
	public String getM_steal5() {
		return m_steal5;
	}
	public void setM_steal5(String m_steal5) {
		this.m_steal5 = m_steal5;
	}
	public MultipartFile getUpload_poster() {
		return upload_poster;
	}
	public void setUpload_poster(MultipartFile upload_poster) {
		this.upload_poster = upload_poster;
	}
	public MultipartFile getUpload_steal1() {
		return upload_steal1;
	}
	public void setUpload_steal1(MultipartFile upload_steal1) {
		this.upload_steal1 = upload_steal1;
	}
	public MultipartFile getUpload_steal2() {
		return upload_steal2;
	}
	public void setUpload_steal2(MultipartFile upload_steal2) {
		this.upload_steal2 = upload_steal2;
	}
	public MultipartFile getUpload_steal3() {
		return upload_steal3;
	}
	public void setUpload_steal3(MultipartFile upload_steal3) {
		this.upload_steal3 = upload_steal3;
	}
	public MultipartFile getUpload_steal4() {
		return upload_steal4;
	}
	public void setUpload_steal4(MultipartFile upload_steal4) {
		this.upload_steal4 = upload_steal4;
	}
	public MultipartFile getUpload_steal5() {
		return upload_steal5;
	}
	public void setUpload_steal5(MultipartFile upload_steal5) {
		this.upload_steal5 = upload_steal5;
	}
	public double getM_point() {
		return m_point;
	}
	public void setM_point(double m_point) {
		this.m_point = m_point;
	}
	public String getM_audience() {
		return m_audience;
	}
	public void setM_audience(String m_audience) {
		this.m_audience = m_audience;
	}
	public int getMvs_no() {
		return mvs_no;
	}
	public void setMvs_no(int mvs_no) {
		this.mvs_no = mvs_no;
	}
	public java.util.Date getMvs_date() {
		return mvs_date;
	}
	public void setMvs_date(java.util.Date mvs_date) {
		this.mvs_date = mvs_date;
	}
	public String getMvs_file() {
		return mvs_file;
	}
	public void setMvs_file(String mvs_file) {
		this.mvs_file = mvs_file;
	}
	public String getMvs_video() {
		return mvs_video;
	}
	public void setMvs_video(String mvs_video) {
		this.mvs_video = mvs_video;
	}
	public MultipartFile getUpload_file() {
		return upload_file;
	}
	public void setUpload_file(MultipartFile upload_file) {
		this.upload_file = upload_file;
	}
	public MultipartFile getUpload_video() {
		return upload_video;
	}
	public void setUpload_video(MultipartFile upload_video) {
		this.upload_video = upload_video;
	}
	public int getMvs_rn() {
		return mvs_rn;
	}
	public void setMvs_rn(int mvs_rn) {
		this.mvs_rn = mvs_rn;
	}
	
	
   
   
   
   
}