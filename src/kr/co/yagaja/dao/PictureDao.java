package kr.co.yagaja.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.co.yagaja.vo.House;
import kr.co.yagaja.vo.Picture;

public interface PictureDao {
	public List<Picture> selectPictureList(SqlSession session, String id);

}
