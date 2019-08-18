package kr.co.yagaja.service.impl;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import kr.co.yagaja.dao.HouseDao;
import kr.co.yagaja.dao.ReservationDao;
import kr.co.yagaja.dao.impl.HouseDaoImpl;
import kr.co.yagaja.dao.impl.ReservationDaoImpl;
import kr.co.yagaja.service.ReservationService;
import kr.co.yagaja.util.SqlSessionFactoryManager;
import kr.co.yagaja.vo.House;
import kr.co.yagaja.vo.Reservation;

public class ReservationServiceImpl implements ReservationService {
	private SqlSessionFactory factory;
	private ReservationDao reservationDao;
	private HouseDao houseDao;
	
	private static ReservationService instance;	
	private ReservationServiceImpl() throws IOException{
		factory = SqlSessionFactoryManager.getInstance().getSqlSessionFactory();
		reservationDao = ReservationDaoImpl.getInstance();
		houseDao = HouseDaoImpl.getInstance();
	}
	public static ReservationService getInstance() throws IOException {
		if(instance == null){
			instance = new ReservationServiceImpl();
		}
		return instance;
	}
	
	
	public void testReservation() throws IOException {
		SqlSession session = null;
		try{
			session = SqlSessionFactoryManager.getInstance().getSqlSessionFactory().openSession();
			
			////////////////////////////테스트 로직은 여기 안에다 해주세요///////////////////////

			//중복확인 테스트 - 완료 
			House house = houseDao.selectHouseById(session, "003");
			ArrayList reservationList = (ArrayList) house.getReservationList();
			if(dateDuplicationCheck("20160725", "20160803",  reservationList)){
				System.out.println("예약가능");
			}else{
				System.out.println("예약불가");
			}
			//
			
			int cnt = reservationDao.deleteReservationByRentNo(session, 1);
			System.out.println(cnt+"행이 삭제됨");
			
			////////////////////////////테스트 로직은 여기 안에다 해주세요///////////////////////
			session.commit();
		}finally{
			session.close();
		}
	}
	

	

	
	
	//현재시간 저장하는 method
	public Date currentTime() {
		Date currentTime = new Date(); // java.util
		return currentTime;
	}
	
	//매개변수로 받은 reservationList(해당숙소의 예약리스트)에서, 입력받은 예약일(startDate, endDate)과 중복되는지 비교 
	public boolean dateDuplicationCheck(String startDate, String endDate, ArrayList reservationList){
		//한 숙소에 담긴 예약리스트→예약객체→시간으로 중복검사 
			//예약된 시간 int로
			for(int i=0; i<reservationList.size(); i++){
				//예약된 시간 int로
				Reservation reservation = (Reservation) reservationList.get(i);      //하나의 예약정보
				Date reservedStartDate = reservation.getStartRentDate(); //해당 예약정보의 예약 시작일
				Date reservedEndDate = reservation.getStartRentDate();   //해당 예약정보의 예약 종료일
				
				int reservedStartDateInt = Integer.parseInt(new SimpleDateFormat("yyyyMMdd").format(reservedStartDate)); //Date->String->int로 형변환
				int reservedEndDateInt = Integer.parseInt(new SimpleDateFormat("yyyyMMdd").format(reservedStartDate));
				
				//입력받은 시간 int로 
				int startDateInt = Integer.parseInt(startDate); //startDate : 20160801 => int타입의 startDateInt
				int endDateInt = Integer.parseInt(endDate);
				         
				if( (startDateInt>=reservedStartDateInt && startDateInt<reservedEndDateInt) 
				  ||(  endDateInt>reservedStartDateInt  && endDateInt<=reservedEndDateInt) ){
					return false; //예약 불가 - 중복 
				}
				if((startDateInt<=reservedStartDateInt) && (endDateInt>=reservedEndDateInt)){
					return false;
				}
		}	
		return true;//예약 가능		
	}
	
	
	//새로운 예약정보 추가 
	public void insertReservation(SqlSession session, Reservation reservation) throws IOException{
		try{
			session = SqlSessionFactoryManager.getInstance().getSqlSessionFactory().openSession();
			reservationDao.insertReservation(session, reservation);			
			session.commit();
		}finally{
			session.close();
		}
		
	}
	public void deleteReservation(SqlSession session, int rentNo) throws IOException{
		try{
			session = SqlSessionFactoryManager.getInstance().getSqlSessionFactory().openSession();
			reservationDao.deleteReservationByRentNo(session, rentNo);			
			session.commit();
		}finally{
			session.close();
		}
	}
	
	public static void main(String[] args) throws IOException {
		ReservationService exam = new ReservationServiceImpl().getInstance();
		//exam.testReservation();		
	}
}
