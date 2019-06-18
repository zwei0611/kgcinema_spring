package com.kg.cinema.join;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

@Repository
@Component
public class JoinDAO {
	
	//org.mybatis.spring.SqlSessionTemplate
	@Autowired
	SqlSessionTemplate temp;
	
	public void insertSave(Joinbean bean) {
		temp.insert("join.insert", bean);
	}
	
	public int idCheck(String id) {
		int check = temp.selectOne("join.idCheck", id);
		return check;
	}
	
	public Joinbean myInfo(String id) {
		return temp.selectOne("join.myInfo", id);
	}
	
	public void edit(Joinbean bean) {
		temp.update("join.edit", bean);
	}
	
	public void chagePass(Joinbean bean) {
		temp.update("join.chagePass", bean);
	}
	
	public void memberDel(String id) {
		temp.delete("join.delete", id);
	}

}
