package com.application.mbms.member.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.application.mbms.member.dto.MemberDTO;

@Repository
public class MemberDAOImpl implements MemberDAO {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public void insertMember(MemberDTO memberDTO) throws Exception{
		sqlSession.insert("member.insertMember" , memberDTO);
	}
	
	@Override
	public String selectDuplicatedId(String memberId) throws Exception{
		return sqlSession.selectOne("member.selectDuplicatedId" , memberId);
	}

	@Override
	public MemberDTO selectOneLogin(MemberDTO memberDTO) throws Exception {
		return sqlSession.selectOne("member.selectOneLogin", memberDTO);
	}
	
	@Override
	public MemberDTO selectOneDetail(String memberId) throws Exception {
		return sqlSession.selectOne("member.selectOneDetail", memberId);
	}
	
	@Override
	public void updateMember(MemberDTO memberDTO) throws Exception {
		sqlSession.update("member.updateMember", memberDTO);
		
	}
	
	@Override
	public void deleteMember(String memberId) throws Exception {
		sqlSession.delete("member.deleteMember", memberId);
	}
	
	@Override
	public void deleteTicket(String memberId) throws Exception {
		sqlSession.delete("member.deleteTicket", memberId);
	}
	
	@Override
	public void deleteWishList(String memberId) throws Exception {
		sqlSession.delete("member.deleteWishList", memberId);
	}

	@Override
	public void deleteBoard(String memberId) throws Exception {
		sqlSession.delete("member.deleteBoard", memberId);		
	}
	
}
