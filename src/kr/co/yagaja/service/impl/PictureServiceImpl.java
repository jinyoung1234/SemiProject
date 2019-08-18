package kr.co.yagaja.service.impl;

import java.io.IOException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import kr.co.yagaja.dao.HouseDao;
import kr.co.yagaja.dao.PictureDao;
import kr.co.yagaja.dao.impl.HouseDaoImpl;
import kr.co.yagaja.dao.impl.PictureDaoImpl;
import kr.co.yagaja.service.HouseService;
import kr.co.yagaja.service.PictureService;
import kr.co.yagaja.util.SqlSessionFactoryManager;
import kr.co.yagaja.vo.House;
import kr.co.yagaja.vo.Picture;

public class PictureServiceImpl implements PictureService{
	private SqlSessionFactory factory;
	private PictureDao pictureDao;
	private static PictureService instance;
	
	public PictureServiceImpl() throws IOException
	{
		SqlSessionFactoryManager manager = SqlSessionFactoryManager.getInstance();
		factory = manager.getSqlSessionFactory();
		pictureDao = PictureDaoImpl.getInstance();
	}
	
	public static PictureService getInstance() throws IOException {
		if (instance == null) {
			instance = new PictureServiceImpl();
		}
		return instance;
	}
	
	@Override
	public List<Picture> selectPictureList(SqlSession session,String id) {
		List<Picture> list = null;	
		try{
			session =  SqlSessionFactoryManager.getInstance().getSqlSessionFactory().openSession();
			list = pictureDao.selectPictureList(session,id);
			session.commit();
			return list;
		} catch (IOException e) {
			e.printStackTrace();
		}finally{
			session.close();
		}
		return list;
	}

	

}
