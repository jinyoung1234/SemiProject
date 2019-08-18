package kr.co.yagaja.dao.impl;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.co.yagaja.dao.HouseDao;
import kr.co.yagaja.vo.House;

public class HouseDaoImpl implements HouseDao{
	
	private HouseDaoImpl(){}
	
	private static HouseDaoImpl instance = new HouseDaoImpl();
	public static HouseDaoImpl getInstance(){
		return instance;
	}
	
	private String makeSqlId(String id){
		return "kr.co.yagaja.config.mapper.houseMapper."+id;
	}
	
	//하나의 house 정보를 insert하는 dao 메소드
	@Override
	public int insertHouse(SqlSession session, House house) {
		return session.insert(makeSqlId("insertHouse"), house);
	}
	
	@Override
	public int updateHouse(SqlSession session, House house) {
		return session.update(makeSqlId("updateHouse"),house);	
	}
	
	//매개변수로 house의 id를 받아서 update 하는 dao 메소드
	//매개변수로 아이디를 넣으므로 메소드 명에 ById 추가.
	@Override
	public int deleteHouseById(SqlSession session, String houseId) {
		return session.delete(makeSqlId("deleteHouseById"), houseId);
	}
	
	//하우스 전체를 select 하는 메소드
	//리턴 할 수 있도록 list 추가
	@Override
	public List<House> selectHouseList(SqlSession session) {
		return session.selectList(makeSqlId("selectHouseByList"));
		 
	}
	
	//매개변수로 houseId를 받아서 하우스를 select 하는 메소드
	@Override
	public House selectHouseById(SqlSession session, String houseId) {
		return session.selectOne(makeSqlId("selectHouseById"), houseId);
	}	
	
	//매개변수로 location을 받아서 하우스를 select 하는 메소드
	//리턴 할 수 있도록 list 추가
	@Override
	public List<House> selectHouseByLocation(SqlSession session, String location) {
		return  session.selectList(makeSqlId("selectHouseBylocation"),location);
	}
	
	
	//매개변수로 house 객체를 받아서 하우스를 select 하는 메소드
	//selectOne 메소드의 파라미터 제한 때문에 int patter, String location을 House house로 변경함. ==>> HashMap 으로 사용해서 수정해야함
	@Override
	public List<House> selectHouseByKeyword(SqlSession session, String type, String location) {
		HashMap param = new HashMap();
		param.put("type", type);
		param.put("location", location);
		return session.selectList(makeSqlId("selectHouseByKeyword"),param);
	}

	/*@Override
	public List<House> selectHouseByPriceLow(SqlSession session, String type, String location) {
		HashMap<String,String> param = new HashMap();
		param.put("type", type);
		param.put("location", location);
		return  session.selectList(makeSqlId("selectHouseByPriceLow"),param);
	}

	@Override
	public List<House> selectHouseByPriceHigh(SqlSession session, String type, String location) {
		HashMap<String,String> param = new HashMap();
		param.put("type", type);
		param.put("location", location);
		return  session.selectList(makeSqlId("selectHouseByPriceHigh"),param);
	}*/
	@Override
	   public List<House> selectHouseByPriceLow(SqlSession session,int beginItemNo, int endItemNo, String type, String location) {
	      HashMap<String,Object> param = new HashMap();
	      param.put("beginItemNum", beginItemNo);
	      param.put("endItemNum", endItemNo);
	      param.put("type", type);
	      param.put("location", location);
	      return  session.selectList(makeSqlId("selectHouseByPriceLowList"),param);
	   }

	   @Override
	   public List<House> selectHouseByPriceHigh(SqlSession session,int beginItemNo, int endItemNo, String type, String location) {
	      HashMap<String,Object> param = new HashMap();
	      param.put("beginItemNum", beginItemNo);
	      param.put("endItemNum", endItemNo);
	      param.put("type", type);
	      param.put("location", location);

	      return  session.selectList(makeSqlId("selectHouseByPriceHighList"),param);
	   }

	public List<House> selectHouseList(SqlSession session, int beginItemNo, int endItemNo,String type,String location) {
		HashMap<String,Object>  param = new HashMap<>();
		param.put("beginItemNum", beginItemNo);
		param.put("endItemNum", endItemNo);
		param.put("type",type);
		param.put("location", location);
		System.out.println("selectHouseList 에서의 param"+param); //여기값 찍으면 잘됨.
		return session.selectList(makeSqlId("selectHouseList"), param); //그러면 여기로 가서 mapper문제인가?? 그러나 mapper를 sql찍어보면 잘되는데 이해가 안감.
	}

	@Override
	public int selectHouseCount(SqlSession session) {
		return session.selectOne(makeSqlId("selectHouseCount"));
	}

	public List<House> selectHouseByMemberId(SqlSession session, String memberId) {
		return  session.selectList(makeSqlId("selectHouseByMemberId"),memberId);
	}


	
}
