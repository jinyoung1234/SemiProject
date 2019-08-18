package kr.co.yagaja.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.yagaja.exception.ModifyException;
import kr.co.yagaja.service.MemberService;
import kr.co.yagaja.service.impl.MemberServiceImpl;
import kr.co.yagaja.vo.House;
import kr.co.yagaja.vo.Member;
import kr.co.yagaja.vo.Reservation;

public class ModifyController extends HttpServlet
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
		MemberService service = MemberServiceImpl.getInstance();
		req.setCharacterEncoding("utf-8"); //한글입력을 받기위한 메소드
		
		//요청파라미터
		String memberId = req.getParameter("memberId");
		String password = req.getParameter("password");	
		String password2 = req.getParameter("password2");	
		String memberName = req.getParameter("memberName");
		String phoneNumber = req.getParameter("phoneNumber");
		String email = req.getParameter("email");		
		int intPoint = Integer.parseInt(req.getParameter("point"));
		//ArrayList reservationList = (ArrayList) ((Member)session.getAttribute("loginInfo")).getReservationList();
		//Business logic처리
		try
		  {
				Member member = new Member();
				member.setMemberId(memberId);
				if(password==null || password.trim().isEmpty())
				{
					throw new ModifyException("비밀번호 입력하시오"); 
				}else if(!password.equals(password2))
				{
					throw new ModifyException("비밀번호가 일치하지 않습니다.");
				}else
				{
					member.setPassword(password);
				}
				
				member.setMemberName(memberName);
				
				if(phoneNumber==null || phoneNumber.trim().isEmpty())
				{
					throw new ModifyException("핸드폰번호를 입력하시오"); 
				}else
				{
					member.setPhoneNumber(phoneNumber);
				}
				
				if(email==null || email.trim().isEmpty())
				{
					throw new ModifyException("이메일을 입력하시오"); 
				}else
				{
					member.setEmail(email);
				}
				member.setPoint(intPoint);
				//member.setReservationList(reservationList);
				service.modifyMember(member);		
				session.setAttribute("loginInfo", member);
				//session.setAttribute("reservation",reservationList);
				resp.sendRedirect("/yagaja_project_back2/mypage/modify_success.jsp");
		  }catch(ModifyException m)
		  {
			  req.setAttribute("errorMessage", m.getMessage());
			  req.getRequestDispatcher("/mypage/modify_form.jsp").forward(req, resp);
		  }
		  
	}
}
