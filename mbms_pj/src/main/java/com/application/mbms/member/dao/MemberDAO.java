package com.application.mbms.member.dao;

import com.application.mbms.member.dto.MemberDTO;

public interface MemberDAO {
	public void insertMember(MemberDTO memberDTO) 		 throws Exception;
	public String selectDuplicatedId(String memberId) 	 throws Exception;
	public MemberDTO selectOneLogin(MemberDTO memberDTO) throws Exception;
	public MemberDTO selectOneDetail(String memberId) 	 throws Exception;
	public void updateMember(MemberDTO memberDTO) 		 throws Exception;
	public void deleteMember(String memberId) 			 throws Exception;
	public void deleteTicket(String memberId) 			 throws Exception;
	public void deleteWishList(String memberId) 		 throws Exception;
	public void deleteBoard(String memberId) 		 	 throws Exception;
	
}
