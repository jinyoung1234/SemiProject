package kr.co.yagaja.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import kr.co.yagaja.service.HouseService;
import kr.co.yagaja.service.impl.HouseServiceImpl;
import kr.co.yagaja.vo.House;

public class PriceController extends HttpServlet{
	private List<House> house;
	private House viewlist;
	private SqlSession session;
	
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(req,resp);
	}
	
	
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		HouseService service = HouseServiceImpl.getInstance();
		
		//1.요청 파라미터 조회
		String location = req.getParameter("location");
		String type = req.getParameter("type");
		String order = req.getParameter("order");
		
		
		//2.비지니스 로직 처리 - location,type 일치하는 House 호출
		int page = 1;// 기본페이지가 1
	      try {
	         page = Integer.parseInt(req.getParameter("page"));// 보려는 페이지 번호
	         
	      } catch (NumberFormatException e) {
	      }
	       Map<String,Object>map=null;
	     try {
	      
	         if(order.equals("lowprice"))
	         {
	          map =service.selectHouseByPriceLowList(page, type, location);
	            req.setAttribute("result", map.get("list"));
	            req.setAttribute("pageBean", map.get("pageBean"));
	            req.setAttribute("type", type);
	            req.setAttribute("location", location);
	            req.setAttribute("order", order);
	                     
	         }else 
	         {
	         map=service.selectHouseByPriceHighList(page, type, location);
	         req.setAttribute("result", map.get("list"));
	         req.setAttribute("pageBean", map.get("pageBean"));
	         req.setAttribute("type", type);
	         req.setAttribute("location", location);
	         req.setAttribute("order", order);
	         
	         
	     
	         }
	      } catch(Exception e) {
	         e.printStackTrace();
	      } 
	      
	       req.setAttribute("order", order);
	       
	      req.getRequestDispatcher("/house/price_list.jsp").forward(req, resp);
	   }
		/*int page=1;
		try {
			
			
			
			if(order.equals("lowprice"))
			{
				house = service.selectHouseByPriceLow(session, type, location);
			}else 
			{
				house = service.selectHouseByPriceHigh(session, type, location);
			}
		} catch(Exception e) {
			e.printStackTrace();
		} 
		
		
		//3.응답-View 호출(JSP)
		req.setAttribute("list", house);
		req.getRequestDispatcher("/house/search_list.jsp").forward(req, resp);
	}*/
}
