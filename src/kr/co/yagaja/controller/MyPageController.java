package kr.co.yagaja.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.yagaja.service.HouseService;
import kr.co.yagaja.service.impl.HouseServiceImpl;
import kr.co.yagaja.vo.House;
import kr.co.yagaja.vo.Member;

public class MyPageController extends HttpServlet
{
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException 
	{
		doPost(request, response);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		HttpSession session = req.getSession();
		HouseService service = HouseServiceImpl.getInstance();
		req.setCharacterEncoding("utf-8");

		//요청파라미터
		String memberId = req.getParameter("memberId");
		//Member member = (Member)session.getAttribute("loginInfo");
		

		List<House> house = service.selectHouseBymemberId(memberId);

		session.setAttribute("house", house);
		//session.setAttribute("loginInfo", member);
		req.getRequestDispatcher("/mypage/mypage.jsp").forward(req, resp);	
	}
}
