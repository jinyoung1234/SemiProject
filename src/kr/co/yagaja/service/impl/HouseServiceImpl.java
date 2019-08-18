package kr.co.yagaja.service.impl;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import kr.co.yagaja.dao.HouseDao;
import kr.co.yagaja.dao.impl.HouseDaoImpl;
import kr.co.yagaja.service.HouseService;
import kr.co.yagaja.util.PagingBean;
import kr.co.yagaja.util.SqlSessionFactoryManager;
import kr.co.yagaja.vo.House;

public class HouseServiceImpl implements HouseService{
	
	private SqlSessionFactory factory;
	private HouseDao houseDao;
	private static HouseService instance;
	
	public HouseServiceImpl() throws IOException
	{
		SqlSessionFactoryManager manager = SqlSessionFactoryManager.getInstance();
		factory = manager.getSqlSessionFactory();
		 houseDao = HouseDaoImpl.getInstance();
	}
	
	public static HouseService getInstance() throws IOException {
		if (instance == null) {
			instance = new HouseServiceImpl();
		}
		return instance;
	}
	
	public Map<String, Object> getHouseList(int page,String type,String location){
		HashMap<String,Object> map=new HashMap<>();// 결과값을 담을 Map
		SqlSession session=factory.openSession();
		try{
			 
			  int totalCount=houseDao.selectHouseCount(session);
			  PagingBean pageBean=new PagingBean(totalCount,page);
			  map.put("pageBean", pageBean);
			 // List<House> list=houseDao.selectHouseByKeyword(session,type , location);
			  //위에 꺼 찍으면 원하는 분류는 나오는데 매개변수를 beginitem과 enditem을 안넘겨서 그런지 안됨.
			 // System.out.println("selectHouseByKeyword에서의" +list);
			  List<House>list=houseDao.selectHouseList(session,pageBean.getBeginItemInPage(), pageBean.getEndItemInPage(),type,location);
			  //이게 원래 내가 하려던것 근데 찍으면 전부 다 나온다.
			  map.put("list", list);
			  System.out.println(list);
			  return map;
		}finally{
			session.close();
		}
		 //정상적으로 끝나면 return 하고  sessin종료
	}
	
	

	
	
	public List selectHouseByKeyword(SqlSession session, String type, String location) {

		List<House> list = null;	
		try{
			session =  SqlSessionFactoryManager.getInstance().getSqlSessionFactory().openSession();
			list = houseDao.selectHouseByKeyword(session, type, location);
			session.commit();
			return list;
		} catch (IOException e) {
			e.printStackTrace();
		}finally{
			session.close();
		}
		return list;
	}
	
	
	@Override
	public House selectHouseById(String houseId) {
		SqlSession session = factory.openSession(true);
		try {			
			return houseDao.selectHouseById(session, houseId);
		} finally {
			session.close();
		}
	}
	   @Override
	   public Map<String, Object> selectHouseByPriceLowList(int page, String type, String location) {
	      HashMap<String, Object> map = new HashMap<>();// 결과값을 담을 Map
	   
	      HouseDao dao = HouseDaoImpl.getInstance();
	      SqlSession session = factory.openSession();
	      try {
	         
	         int totalCount = houseDao.selectHouseCount(session);
	         PagingBean pageBean = new PagingBean(totalCount, page);
	         map.put("pageBean", pageBean);
	         
	         List<House> list = dao.selectHouseByPriceLow(session, pageBean.getBeginItemInPage(),
	               pageBean.getEndItemInPage(), type, location);
	         map.put("list", list);
	         System.out.println("(Service)lowList"+list);
	         return map;

	      } finally {
	         session.close();
	      }

	   }

	   public Map<String,Object> selectHouseByPriceHighList(int page, String type, String location) {
	      HouseDao dao = HouseDaoImpl.getInstance();
	      SqlSession session = factory.openSession();
	      HashMap<String, Object> map = new HashMap<>();// 결과값을 담을 Map
	      try {
	         int totalCount = houseDao.selectHouseCount(session);
	         PagingBean pageBean = new PagingBean(totalCount, page);
	         map.put("pageBean", pageBean);
	         List<House> list = dao.selectHouseByPriceHigh(session, pageBean.getBeginItemInPage(),
	               pageBean.getEndItemInPage(), type, location);
	         map.put("list", list);
	         System.out.println("(Service)HighList"+list);
	         return map;

	      } finally {
	         session.close();
	      
	   }
	   }
	

	/*@Override
	public List<House> selectHouseByPriceLow(SqlSession session,String type, String location)  {
		HouseDao dao = HouseDaoImpl.getInstance();
		List<House> list = null;	
		try{
			session =  SqlSessionFactoryManager.getInstance().getSqlSessionFactory().openSession();
			list = dao.selectHouseByPriceLow(session,type, location);
			session.commit();
			
			return list;
		} catch (IOException e) {
			e.printStackTrace();
		}finally{
			session.close();
		}
		return list;
	}

	public List<House> selectHouseByPriceHigh(SqlSession session,String type, String location)  {
		HouseDao dao = HouseDaoImpl.getInstance();
		List<House> list = null;	
		try{
			session =  SqlSessionFactoryManager.getInstance().getSqlSessionFactory().openSession();
			list = dao.selectHouseByPriceHigh(session,type, location);
			session.commit();
			return list;
		} catch (IOException e) {
			e.printStackTrace();
		}finally{
			session.close();
		}
		return list;
	}
	*/
	
	
	public void testHouse() throws IOException{
		SqlSession session = null;
		try{
			session = SqlSessionFactoryManager.getInstance().getSqlSessionFactory().openSession();
			
			////////////////////////////테스트 로직은 여기 안에다 해주세요///////////////////////
			///////////////////////////테스트 로직은 여기 안에다 해주세요///////////////////////
			session.commit();
		}finally{
			session.close();
		}
	}	
	
	@Override
	public List<House> selectHouseBymemberId(String memberId) {
		SqlSession session = factory.openSession();
		List<House> list = null;
		try
		{
			list = houseDao.selectHouseByMemberId(session,memberId);
			System.out.println(list);
			return list;
		}
		finally
		{
			session.close();
		}
	}
	
	
	public static void main(String[] args) throws IOException {
		HouseService exam = new HouseServiceImpl().getInstance();
		exam.testHouse();
	}



	





}
