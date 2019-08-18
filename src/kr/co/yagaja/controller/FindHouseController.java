/*package kr.co.yagaja.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import kr.co.yagaja.service.HouseService;
import kr.co.yagaja.service.impl.HouseServiceImpl;
import kr.co.yagaja.vo.House;

public class FindHouseController extends HttpServlet{
	private List<House> house;
	private House viewlist;
	private SqlSession session;
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		HouseService service = HouseServiceImpl.getInstance();
		
		//1.요청 파라미터 조회
		String location = req.getParameter("location");
		String type = req.getParameter("type");
		
		//2.비지니스 로직 처리 - location,type 일치하는 House 호출
		try {
			
			house = service.selectHouseByKeyword(session, type, location); //조건에 일치하는 리스트들이 담겨있음 
			
		} catch(Exception e) {
			e.printStackTrace();
		} 
		
		//3.응답-View 호출(JSP)
		req.setAttribute("result", house);
		req.getRequestDispatcher("/house/search_list.jsp").forward(req, resp);
	}
}
*/
package kr.co.yagaja.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;

import kr.co.yagaja.service.HouseService;
import kr.co.yagaja.service.impl.HouseServiceImpl;
import kr.co.yagaja.vo.House;

public class FindHouseController extends HttpServlet{
	private Map houseList;
	private House viewlist;
	private SqlSession session;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(req,resp);
	}
	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		HouseService service = HouseServiceImpl.getInstance();
		HttpSession session = req.getSession();
		
		//1.요청 파라미터 조회
				String location = req.getParameter("location");
				String type = req.getParameter("type");
				 System.out.println(location);
				 System.out.println(type);
				//조건에 일치하는 리스트들이 담겨있음 

		//2.비지니스 로직 처리 - location,type 일치하는 House 호출
			//try {
				int page = 1;// 기본페이지가 1
				try {
					page = Integer.parseInt(req.getParameter("page"));// 보려는 페이지 번호

				} catch (NumberFormatException e) {
				}
				Map<String, Object> map = service.getHouseList(page,type,location);
				
				req.setAttribute("list", map.get("list")); 
				
				req.setAttribute("pageBean", map.get("pageBean")); // 페이지 링크
			    req.setAttribute("type", type);
			    req.setAttribute("location", location);

				req.getRequestDispatcher("/house/search_list.jsp").forward(req, resp);

			/*} catch (Exception ex) {
				// 에러페이지로 이동.
				ex.printStackTrace();
			}*/
		
	}
}
