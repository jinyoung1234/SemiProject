package kr.co.yagaja.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import kr.co.yagaja.service.HouseService;
import kr.co.yagaja.service.ReservationService;
import kr.co.yagaja.service.impl.HouseServiceImpl;
import kr.co.yagaja.service.impl.ReservationServiceImpl;
import kr.co.yagaja.vo.House;
import kr.co.yagaja.vo.Member;
import kr.co.yagaja.vo.Reservation;

public class ReserveHouseController extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String startDate = req.getParameter("startDate");
		String endDate = req.getParameter("endDate");
		String houseId = req.getParameter("houseId");
		String memberId = req.getParameter("memberId");
		
		SqlSession session = null;
		
		ReservationService reservationService = ReservationServiceImpl.getInstance();
		HouseService houseService = HouseServiceImpl.getInstance();
		
		//중복확인 후 예약	
		
		//1. 해당 House의 reservationList 내 Date정보들 list에 담기
		ArrayList reservationList = (ArrayList) houseService.selectHouseById(houseId).getReservationList();
		
		//예약 시간
		Date currentTime = ((ReservationServiceImpl) reservationService).currentTime(); 
		//String값으로온 입실,퇴실일을 reservation객체에 담기위해 Date타입으로 형변환
		DateFormat dateFormat = new SimpleDateFormat("yyyyMMdd");
		Date startDate_Date = null, endDate_Date = null;
		try {
			startDate_Date = dateFormat.parse(startDate);
			endDate_Date = dateFormat.parse(endDate);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		
		//Ajax 응답
		resp.setContentType("text/html;charset=UTF-8");
		resp.setHeader("cache-control", "no-store");
		PrintWriter out = resp.getWriter();
		//out.print("예약성공");
		//out.print(currentTimeStr); 
		//Reservation newReservation = new Reservation(0, startDate_Date, endDate_Date, currentTime, houseId, null, "juhyun", null);

		
		//2. 예약리스트, 새로운 예약일 => ReservationService의 중복확인 메소드호출
		if(((Reservation) reservationList.get(0)).getStartRentDate()==null){ //아예 예약된 리스트가 없을때 - 예약 가능, 예약정보 추가
			Reservation newReservation = new Reservation(0, startDate_Date, endDate_Date, currentTime, houseId, null, memberId, null);
			reservationService.insertReservation(session, newReservation);
			out.print("중복안됨");
		}else{
			if (reservationService.dateDuplicationCheck(startDate, endDate, reservationList)){
				//예약 가능 - 예약정보 추가
				Reservation newReservation = new Reservation(0, startDate_Date, endDate_Date, currentTime, houseId, null, memberId, null);
				//System.out.println(newReservation);
				reservationService.insertReservation(session, newReservation);
				out.print("중복안됨");
			}else{
				//예약 불가능 - 날짜 중복 
				out.print("중복");			
			}
		}


	}
}
