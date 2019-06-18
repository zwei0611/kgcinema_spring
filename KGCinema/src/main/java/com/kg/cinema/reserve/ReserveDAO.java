package com.kg.cinema.reserve;

import java.text.SimpleDateFormat;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

@Repository
@Component
public class ReserveDAO {
	
	//org.mybatis.spring.SqlSessionTemplate
	@Autowired
	SqlSessionTemplate temp;
	
	public List<Reservebean> reserveSelect(String r_theater, String r_scrno, String r_start) {
		//SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		Reservebean bean = new Reservebean();
		bean.setR_theater(r_theater);
		bean.setR_scrno(r_scrno);
		bean.setDate(r_start);
		List<Reservebean> list = temp.selectList("reserve.select", bean);
		return list;
	}
	
	public void reserveInsert(Reservebean bean) {

		temp.insert("reserve.insert", bean);
	}
	
	public List<Reservebean> reserveDetail(String id) {
		List<Reservebean> list = temp.selectList("reserve.detail", id);
		return list;
	}
	
	public List<Reservebean> oldReserveDetail(String id) {
		List<Reservebean> list = temp.selectList("reserve.oldDetail", id);
		return list;
	}
	
	public Reservebean reserveDetailOne(int no) {
		Reservebean bean = temp.selectOne("reserve.detailOne", no);
		return bean;
	}
	
	public void reserveCancelInsert(Reservebean bean) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		bean.setDate(sdf.format(bean.getR_start()));
		temp.insert("reserve_cancel.insert", bean);
	}
	
	public List<Reservebean> reserveCancelDetail(String id) {
		List<Reservebean> list = temp.selectList("reserve_cancel.detail", id);
		return list;
	}
	
	public void reserveDelete(int no) {
		temp.delete("reserve.delete",no);
	}
	

}
