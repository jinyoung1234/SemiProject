package kr.co.yagaja.service.impl;

import java.io.IOException;
import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import kr.co.yagaja.dao.HouseDao;
import kr.co.yagaja.dao.MemberDao;
import kr.co.yagaja.dao.impl.HouseDaoImpl;
import kr.co.yagaja.dao.impl.MemberDaoImpl;
import kr.co.yagaja.exception.IdCheckSuccessException;
import kr.co.yagaja.exception.IdDuplicationException;
import kr.co.yagaja.exception.IdNullException;
import kr.co.yagaja.exception.LoginFailException;
import kr.co.yagaja.service.MemberService;
import kr.co.yagaja.util.SqlSessionFactoryManager;
import kr.co.yagaja.vo.House;
import kr.co.yagaja.vo.Member;
import kr.co.yagaja.vo.Reservation;

public class MemberServiceImpl implements MemberService {
	private SqlSessionFactory factory;
	private MemberDao MemberDao;
	private HouseDao HouseDao; //추가 - 예약내역에서 숙소 정보 받아오려고

	private ArrayList<Member> memberList;
	private ArrayList<String> checkList;
	
	private static MemberService instance;
	private MemberServiceImpl() throws IOException {
		factory = SqlSessionFactoryManager.getInstance().getSqlSessionFactory();
		MemberDao = MemberDaoImpl.getInstance();
		HouseDao = HouseDaoImpl.getInstance(); //추가 - 예약내역에서 숙소 정보 받아오려고
		memberList = new ArrayList<Member>();
		checkList = new ArrayList<String>();
	}
	public static MemberService getInstance() throws IOException {
		if (instance == null) {
			instance = new MemberServiceImpl();
		}
		return instance;
	}

	
	public void testMember() throws IOException{
		SqlSession session = null;
		try{
			session =  factory.openSession();
			
			////////////////////////////테스트 로직은 여기 안에다 해주세요///////////////////////
			
			
			
			
			//회원 전체 정보(예약내역포함) 조회
			String memberId = "juhyun";
			Member selectMember = MemberDao.selectMemberById(session, memberId);
			System.out.println("<회원 아이디로 조회>");
			System.out.printf("회원이름 : %s,  회원아이디 : %s%n", selectMember.getMemberName(), selectMember.getMemberId());
			System.out.println("------예약 내역 조회-----");
			for(Reservation reservation : selectMember.getReservationList()){
				//System.out.println(reservation);  reservation = 한개의 예약정보			
				
				House reservedHouse =  HouseDao.selectHouseById(session, reservation.getHouseId());
				// System.out.println(reservedHouse); // reservedHouse = 해당예약정보의 예약된 숙소
				
				System.out.printf("예약번호 : %d, 숙소명 : %s 숙소위치: %s 숙소가격 : %d %n", reservation.getRentNo(), reservedHouse.getHouseName(), reservedHouse.getLocation(), reservedHouse.getPrice());				
			}
			
			
			
			
			////////////////////////////테스트 로직은 여기 안에다 해주세요///////////////////////
			session.commit();
		}finally{
			session.close();
		}
		   
	}


	
	@Override
	public Member loginProcess(String id, String password) throws LoginFailException, IOException {
		SqlSession sqlsession = factory.openSession(true);
		Member member = MemberDao.selectMemberById(sqlsession, id);
		try {
			if (member != null) {
				if (password.equals(member.getPassword())) {

					return member;
				} else {
					throw new LoginFailException("패스워드를 확인하세요");
				}
			} else {

				throw new LoginFailException("ID를 확인하세요");
			}
		} finally {
			sqlsession.close();
		}
	}

	/*	
	
	@Override
	public int joinMemberById(Member member) throws IdDuplicationException, IdNullException {
		SqlSession sqlsession = factory.openSession(true);
		try {
			if (member.getMemberId() == null) {
				throw new IdNullException("Id를 입력하세요(join)");
			} else if (memberList.size() == 0) {
				memberList.add(member);
				return new MemberDaoImpl().insertMember(sqlsession, member);

			} else {
				for (int i = 0; i < memberList.size(); i++) {
					if (memberList.get(i).getMemberId().equals(member.getMemberId())) {
						throw new IdDuplicationException("ID가 중복되었습니다.");
					}
				}
				memberList.add(member);
				return new MemberDaoImpl().insertMember(sqlsession, member);
			}
		} finally {
			sqlsession.close();
		}
	}
	

	public String idDuplicationCheck(String id)
			throws IdDuplicationException, IdCheckSuccessException, IdNullException, IOException {
		SqlSession sqlsession = factory.openSession(true);
		String s = "Id사용 가능합니다.";
		try {
			if (id == null) {
				throw new IdNullException("Id를 입력하세요(id)");
			} else if (checkList.size() == 0) {
				checkList.add(id);
				return s;

			} else {
				for (int i = 0; i < checkList.size(); i++) {
					if (checkList.get(i).equals(id)) {

						throw new IdDuplicationException("ID가 중복되었습니다.");
					}
				}
				checkList.add(id);
				return s;
			}

		} finally {
			sqlsession.close();
		}	
	}

	*/
	
	@Override
	public int joinMemberById(Member member) throws IOException{
		int cnt;
		SqlSession session = SqlSessionFactoryManager.getInstance().getSqlSessionFactory().openSession();
		try {
			cnt = MemberDao.insertMember(session, member);
			session.commit();
		} finally {
			session.close();
		}
		return cnt;
	}
	
	//회원 정보 수정 - 작성자 : 김장규
	@Override
	public int modifyMember(Member member) throws IOException
	{	
		SqlSession session = factory.openSession(true);
		try{				
			
			return MemberDao.updateMember(session, member);
		}
		finally{
			session.close();
		}
	}
	

	
	@Override
	public Member selectMemberById(String memberId) throws IOException   {
		SqlSession session = factory.openSession();
		try{
			return MemberDao.selectMemberById(session, memberId);
		}finally{
			session.close();
		}
	}
	
	
	public static void main(String[] args) throws IOException {
		MemberService exam = new MemberServiceImpl().getInstance();
		exam.testMember();
		//exam.selectReservationMemberById("jang");
	}
	@Override
	public String idDuplicationCheck(String id)
			throws IdDuplicationException, IdCheckSuccessException, IdNullException, IOException {
		// TODO Auto-generated method stub
		return null;
	}
	

}
