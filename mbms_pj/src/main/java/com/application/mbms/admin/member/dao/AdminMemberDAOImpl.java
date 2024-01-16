package com.application.mbms.admin.member.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.application.mbms.admin.member.dto.AdminDTO;
import com.application.mbms.member.dto.MemberDTO;

@Repository
public class AdminMemberDAOImpl implements AdminMemberDAO {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public AdminDTO selectAdminLogin(AdminDTO adminDTO) throws Exception{
	   return sqlSession.selectOne("admin.member.selectAdminLogin" , adminDTO);
	}

	@Override
	public List<MemberDTO> selectListMember() throws Exception {
		return sqlSession.selectList("admin.member.selectListMember");
	}

	@Override
	public void deleteMember(String memberId) throws Exception {
		sqlSession.delete("admin.member.deleteMember", memberId);
	}

	@Override
	public int selectMemberCnt() throws Exception {
		return sqlSession.selectOne("admin.member.selectMemberCnt");
	}

	@Override
	public List<AdminDTO> selectAdminMember() throws Exception {
		return sqlSession.selectList("admin.member.selectAdminMember");
	}

	@Override
	public void updateManager(Map<String, Object> map) throws Exception {
		sqlSession.update("admin.member.updateManager", map);
	}

	@Override
	public AdminDTO selectAdminDetail(AdminDTO adminDTO) throws Exception {
		return sqlSession.selectOne("admin.member.selectAdminDetail" , adminDTO);
	}

}
