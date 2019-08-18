package kr.co.yagaja.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.co.yagaja.vo.Picture;

public interface PictureService {
	public List<Picture> selectPictureList(SqlSession session,String id);


}
