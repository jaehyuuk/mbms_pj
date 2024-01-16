package com.application.mbms.member.service;

import com.application.mbms.member.dto.MemberDTO;

public interface MemberService {
	
	public void addMember(MemberDTO memberDTO) 		  throws Exception;
	public String checkDuplicatedId(String memberId)  throws Exception;
	public MemberDTO login(MemberDTO memberDTO) 	  throws Exception;
	public MemberDTO getMemberDetail(String memberId) throws Exception;
	public void modifyMember(MemberDTO memberDTO) 	  throws Exception;
	public void deleteMember(String memberId) 		  throws Exception;
	public void deleteTicket(String memberId) 		  throws Exception;
	public void deleteWishList(String memberId) 	  throws Exception;
	public void deleteBoard(String memberId) 	 	  throws Exception;
	
}
