package kr.co.yagaja.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;

import kr.co.yagaja.exception.IdDuplicationException;
import kr.co.yagaja.exception.IdNullException;
import kr.co.yagaja.service.HouseService;
import kr.co.yagaja.service.MemberService;
import kr.co.yagaja.service.impl.HouseServiceImpl;
import kr.co.yagaja.service.impl.MemberServiceImpl;
import kr.co.yagaja.vo.Member;

public class IdDuplicationCheckContoller extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
		
		String inputId = req.getParameter("id");
		
		SqlSession session = null;
		MemberService memberService = MemberServiceImpl.getInstance();
		//Ajax 응답
		resp.setContentType("text/html;charset=UTF-8");
		resp.setHeader("cache-control", "no-store");
		PrintWriter out = resp.getWriter();
				
		Member joinedMember = memberService.selectMemberById(inputId);
		if(joinedMember == null){
			out.print("중복안됨"); //가입가능
		}else{
			out.print("중복");	
		}		

	}
	
}