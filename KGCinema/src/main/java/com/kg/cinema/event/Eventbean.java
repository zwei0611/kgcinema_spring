package com.kg.cinema.event;

import org.springframework.web.multipart.MultipartFile;

public class Eventbean { 
  //eventList 
  private int e_no;
  private String e_title;
  private String e_content;
  private java.util.Date e_date;
  private String e_file;
  private int e_rn;
  private String e_period;
  
  private MultipartFile upload_file;
  private MultipartFile upload_content;
  
  
  private int start, end;
  private String skey,sval;
  
  
  
	public MultipartFile getUpload_file() {
	return upload_file;
	}
	public void setUpload_file(MultipartFile upload_file) {
		this.upload_file = upload_file;
	}
	public MultipartFile getUpload_content() {
		return upload_content;
	}
	public void setUpload_content(MultipartFile upload_content) {
		this.upload_content = upload_content;
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
	public int getE_no() {
		return e_no;
	}
	public void setE_no(int e_no) {
		this.e_no = e_no;
	}
	public String getE_title() {
		return e_title;
	}
	public void setE_title(String e_title) {
		this.e_title = e_title;
	}
	public String getE_content() {
		return e_content;
	}
	public void setE_content(String e_content) {
		this.e_content = e_content;
	}
	public java.util.Date getE_date() {
		return e_date;
	}
	public void setE_date(java.util.Date e_date) {
		this.e_date = e_date;
	}
	public String getE_file() {
		return e_file;
	}
	public void setE_file(String e_file) {
		this.e_file = e_file;
	}
	public int getE_rn() {
		return e_rn;
	}
	public void setE_rn(int e_rn) {
		this.e_rn = e_rn;
	}
	public String getE_period() {
		return e_period;
	}
	public void setE_period(String e_period) {
		this.e_period = e_period;
	}
  
	
}
