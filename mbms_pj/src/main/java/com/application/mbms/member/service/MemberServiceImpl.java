package com.application.mbms.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.application.mbms.member.dao.MemberDAO;
import com.application.mbms.member.dto.MemberDTO;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDAO memberDAO;

	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	
	@Override
	public void addMember(MemberDTO memberDTO) throws Exception {
		memberDTO.setPasswd(bCryptPasswordEncoder.encode(memberDTO.getPasswd()));
		memberDAO.insertMember(memberDTO);
	}
	
	@Override
	public String checkDuplicatedId(String memberId) throws Exception{
		if (memberDAO.selectDuplicatedId(memberId) == null)	return "notDuplicate";
		else												return "duplicate";
	}
	
	@Override
	public MemberDTO login(MemberDTO memberDTO) throws Exception {
		MemberDTO dbMemberDTO = memberDAO.selectOneLogin(memberDTO);
		if (dbMemberDTO != null) {
			if (bCryptPasswordEncoder.matches(memberDTO.getPasswd() , dbMemberDTO.getPasswd())) {
				return memberDTO;
			}
		}
		return null;
	}
	
	@Override
	public MemberDTO getMemberDetail(String memberId) throws Exception {
		return memberDAO.selectOneDetail(memberId);
	}
	
	@Override
	public void modifyMember(MemberDTO memberDTO) throws Exception {
		memberDAO.updateMember(memberDTO);
	}
	
	@Override
	public void deleteMember(String memberId) throws Exception {
		memberDAO.deleteMember(memberId);
	}
	
	@Override
	public void deleteTicket(String memberId) throws Exception {
		memberDAO.deleteTicket(memberId);
	}
	
	@Override
	public void deleteWishList(String memberId) throws Exception {
		memberDAO.deleteWishList(memberId);
	}

	@Override
	public void deleteBoard(String memberId) throws Exception {
		memberDAO.deleteBoard(memberId);		
	}
	
}
