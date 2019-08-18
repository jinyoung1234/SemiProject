package kr.co.yagaja.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;

import kr.co.yagaja.service.ReservationService;
import kr.co.yagaja.service.impl.ReservationServiceImpl;
import kr.co.yagaja.vo.Member;

public class DeleteReservationController extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	
	
	{		
		ReservationService reservationService = ReservationServiceImpl.getInstance();
		HttpSession session = req.getSession();
		SqlSession sqlSession = null;
	
		//요청파라미터
		String rentNoStr = req.getParameter("rentNo");
		int rentNo = Integer.parseInt(rentNoStr);
		reservationService.deleteReservation(sqlSession, rentNo);
		session.setAttribute("rentNo", rentNo);
		resp.sendRedirect("/yagaja_project_back2/mypage/reservation_delete.jsp");
	}
	
}
