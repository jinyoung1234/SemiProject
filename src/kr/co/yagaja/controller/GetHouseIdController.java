package kr.co.yagaja.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;

import kr.co.yagaja.service.HouseService;
import kr.co.yagaja.service.PictureService;
import kr.co.yagaja.service.impl.HouseServiceImpl;
import kr.co.yagaja.service.impl.PictureServiceImpl;

public class GetHouseIdController extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}
	private SqlSession session2;
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String id = req.getParameter("houseId");
		HouseService house = HouseServiceImpl.getInstance();
		PictureService picture = PictureServiceImpl.getInstance();
		HttpSession session = req.getSession();
	    int count=1;
		
		session.setAttribute("selectPicture", picture.selectPictureList(session2, id));
		session.setAttribute("selectHouse", house.selectHouseById(id));
		session.setAttribute("count",count);
		req.getRequestDispatcher("/detailed/detailed.jsp").forward(req, resp);



	}
}
