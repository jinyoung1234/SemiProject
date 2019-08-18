package kr.co.yagaja.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;


import kr.co.yagaja.dao.PictureDao;
import kr.co.yagaja.vo.House;
import kr.co.yagaja.vo.Picture;

public class PictureDaoImpl implements PictureDao{

	private PictureDaoImpl(){}
	
	private static PictureDaoImpl instance = new PictureDaoImpl();
	public static PictureDaoImpl getInstance(){
		return instance;
	}
	
	private String makeSqlId(String id){
		return "kr.co.yagaja.config.mapper.pictureMapper."+id;
	}
	public List<Picture> selectPictureList(SqlSession session,String id){
		return session.selectList(("kr.co.yagaja.config.mapper.pictureMapper.selectPictureList"),id);
	}

	
}
