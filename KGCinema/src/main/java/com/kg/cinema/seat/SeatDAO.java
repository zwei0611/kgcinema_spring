package com.kg.cinema.seat;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import com.kg.cinema.event.Eventbean;
import com.kg.cinema.theater.Theaterbean;

@Repository
@Component
public class SeatDAO {
	
	//org.mybatis.spring.SqlSessionTemplate
	@Autowired
	SqlSessionTemplate temp;
	
	public List<Seatbean> seatSelect(int seatstyle) {
		List<Seatbean> list = temp.selectList("seat.select", seatstyle);
		return list;
	}
	
	public List<Seatbean> seatStyle() {
		List<Seatbean> list = temp.selectList("seat.seatStyleAll");
		return list;
	}	
	
	public int SeatCount(String seatstyle) {
		System.out.println("seatstyleDAO: " + seatstyle);
		int count =temp.selectOne("seat.seatCount", seatstyle);
		return count;
	}//end


}
