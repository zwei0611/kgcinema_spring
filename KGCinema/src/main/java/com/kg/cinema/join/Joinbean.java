package com.kg.cinema.join;

import org.springframework.web.multipart.MultipartFile;

public class Joinbean {
	private String j_id;
	private String j_name;
	private String j_pwd;
	private String j_juso1;
	private String j_juso2;
	private String j_birth; // to_date('2018-09-01','yyyy-mm-dd')
	private String j_phone; // 010-7766-7936
	private String j_email;
	private String j_file1;
	
	private MultipartFile upload_f;
	
	private String num1, num2, num3;
	private String year, month, day;
	
	
	public MultipartFile getUpload_f() {
		return upload_f;
	}
	public void setUpload_f(MultipartFile upload_f) {
		this.upload_f = upload_f;
	}
	

	public String getNum1() {
		return num1;
	}
	public void setNum1(String num1) {
		this.num1 = num1;
	}
	public String getNum2() {
		return num2;
	}
	public void setNum2(String num2) {
		this.num2 = num2;
	}
	public String getNum3() {
		return num3;
	}
	public void setNum3(String num3) {
		this.num3 = num3;
	}
	public String getYear() {
		return year;
	}
	public void setYear(String year) {
		this.year = year;
	}
	public String getMonth() {
		return month;
	}
	public void setMonth(String month) {
		this.month = month;
	}
	public String getDay() {
		return day;
	}
	public void setDay(String day) {
		this.day = day;
	}
	public String getJ_id() {
		return j_id;
	}
	public void setJ_id(String j_id) {
		this.j_id = j_id;
	}
	public String getJ_name() {
		return j_name;
	}
	public void setJ_name(String j_name) {
		this.j_name = j_name;
	}
	public String getJ_pwd() {
		return j_pwd;
	}
	public void setJ_pwd(String j_pwd) {
		this.j_pwd = j_pwd;
	}
	public String getJ_juso1() {
		return j_juso1;
	}
	public void setJ_juso1(String j_juso1) {
		this.j_juso1 = j_juso1;
	}
	public String getJ_juso2() {
		return j_juso2;
	}
	public void setJ_juso2(String j_juso2) {
		this.j_juso2 = j_juso2;
	}
	public String getJ_birth() {
		return j_birth;
	}
	public void setJ_birth(String j_birth) {
		this.j_birth = j_birth;
	}
	public String getJ_phone() {
		return j_phone;
	}
	public void setJ_phone(String j_phone) {
		this.j_phone = j_phone;
	}
	public String getJ_email() {
		return j_email;
	}
	public void setJ_email(String j_email) {
		this.j_email = j_email;
	}
	public String getJ_file1() {
		return j_file1;
	}
	public void setJ_file1(String j_file1) {
		this.j_file1 = j_file1;
	}
	
	
	
	
}
