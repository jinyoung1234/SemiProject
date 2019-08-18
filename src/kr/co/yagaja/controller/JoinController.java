package kr.co.yagaja.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.yagaja.exception.IdDuplicationException;
import kr.co.yagaja.exception.IdNullException;
import kr.co.yagaja.service.MemberService;
import kr.co.yagaja.service.impl.MemberServiceImpl;
import kr.co.yagaja.vo.Member;

public class JoinController extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
		
		String id = req.getParameter("id");
		String pw = req.getParameter("pw");
		String name = req.getParameter("name");
		String phoneNumber = req.getParameter("phoneNumber");
		String email = req.getParameter("email");
		int point = 2000;
	
		MemberService service = MemberServiceImpl.getInstance();
		HttpSession session = req.getSession();
		
		//Ajax 응답을 위한 코드
		resp.setContentType("text/html;charset=UTF-8");
		resp.setHeader("cache-control", "no-store");
		PrintWriter out = resp.getWriter();

		
		//회원가입 - 멤버 추가 
		Member member = new Member(id, pw, name, phoneNumber, email, point, null); //새로 들어온 Member값 
		try {
			service.joinMemberById(member);
		} catch (IdDuplicationException | IdNullException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		session.setAttribute("joinInfoMemberId", member.getMemberId());
		session.setAttribute("loginInfo", null);

		out.print("가입완료");

	}
}