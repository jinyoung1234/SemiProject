package kr.co.yagaja.service;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import kr.co.yagaja.vo.House;

public interface HouseService {

	public List selectHouseByKeyword(SqlSession session, String type, String location);

	public void testHouse() throws IOException;

	public House selectHouseById(String houseId);

	/*public List<House> selectHouseByPriceHigh(SqlSession session, String type, String location);

	public List<House> selectHouseByPriceLow(SqlSession session, String type, String location);*/

	public Map<String, Object> getHouseList(int page, String type, String location);

	public List<House> selectHouseBymemberId(String houseId);

	public Map<String, Object> selectHouseByPriceLowList(int page, String type, String location);

	public Map<String, Object> selectHouseByPriceHighList(int page, String type, String location);

}
