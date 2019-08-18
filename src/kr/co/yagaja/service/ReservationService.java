package kr.co.yagaja.service;

import java.io.IOException;
import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;

import kr.co.yagaja.vo.Reservation;

public interface ReservationService {
	//public String RentTime();	
	
	
	//public ArrayList<String> reservationList(String id);
	
	
	//public void insertRentDate(Date startRentDate,Date endRentDate,String id);

	public void testReservation() throws IOException;

	public boolean dateDuplicationCheck(String startDate, String endDate, ArrayList dateList);
	
	public void insertReservation(SqlSession session, Reservation reservation) throws IOException;
	public void deleteReservation(SqlSession session, int rentNo) throws IOException;

}
