package com.kg.cinema.schedule;

public class Schedulebean {
	
	private int schedule_id;
	private String theater;
	private String scrno;
	private String title;
	private java.util.Date starthour;
	private java.util.Date endhour;

	private String upload_starthour;
	private String upload_endhour;
	
	private int rn;
	private int start, end;
	private String skey,sval;
	
	
	public int getRn() {
		return rn;
	}
	public void setRn(int rn) {
		this.rn = rn;
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
	public int getSchedule_id() {
		return schedule_id;
	}
	public void setSchedule_id(int schedule_id) {
		this.schedule_id = schedule_id;
	}
	public String getTheater() {
		return theater;
	}
	public void setTheater(String theater) {
		this.theater = theater;
	}
	public String getScrno() {
		return scrno;
	}
	public void setScrno(String scrno) {
		this.scrno = scrno;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public java.util.Date getStarthour() {
		return starthour;
	}
	public void setStarthour(java.util.Date starthour) {
		this.starthour = starthour;
	}
	public java.util.Date getEndhour() {
		return endhour;
	}
	public void setEndhour(java.util.Date endhour) {
		this.endhour = endhour;
	}
	public String getUpload_starthour() {
		return upload_starthour;
	}
	public void setUpload_starthour(String upload_starthour) {
		this.upload_starthour = upload_starthour;
	}
	public String getUpload_endhour() {
		return upload_endhour;
	}
	public void setUpload_endhour(String upload_endhour) {
		this.upload_endhour = upload_endhour;
	}
	

}
