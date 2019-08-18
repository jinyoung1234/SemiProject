package kr.co.yagaja.service;

import java.io.IOException;
import java.util.ArrayList;

import kr.co.yagaja.exception.IdCheckSuccessException;
import kr.co.yagaja.exception.IdDuplicationException;
import kr.co.yagaja.exception.IdNullException;
import kr.co.yagaja.exception.LoginFailException;
import kr.co.yagaja.vo.Member;
import kr.co.yagaja.vo.Reservation;

public interface MemberService{
    
	public int joinMemberById(Member member) throws IOException, IdDuplicationException, IdNullException; 	
	
	Member loginProcess(String id, String password) throws LoginFailException, IOException ;		
		
	public String idDuplicationCheck(String id) throws IdDuplicationException, IdCheckSuccessException, IdNullException, IOException;

	public int modifyMember(Member member) throws IOException;
	
	void testMember() throws IOException;

	
	public Member selectMemberById(String memberId) throws IOException;

}