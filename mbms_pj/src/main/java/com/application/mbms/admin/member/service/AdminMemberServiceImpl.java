package com.application.mbms.admin.member.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.application.mbms.admin.member.dao.AdminMemberDAO;
import com.application.mbms.admin.member.dto.AdminDTO;
import com.application.mbms.member.dto.MemberDTO;

@Service
public class AdminMemberServiceImpl implements AdminMemberService {
	
	@Autowired
	private AdminMemberDAO adminMemberDAO;

	@Override
	public boolean adminLogin(AdminDTO adminDTO) throws Exception {
		if (adminMemberDAO.selectAdminLogin(adminDTO) != null) {
			return true;
		}
		return false;
	}

	@Override
	public List<MemberDTO> getMemberList() throws Exception {
		return adminMemberDAO.selectListMember();
	}

	@Override
	public void removeMember(String memberId) throws Exception {
		adminMemberDAO.deleteMember(memberId);
	}

	@Override
	public int getMemberCnt() throws Exception {
		return adminMemberDAO.selectMemberCnt();
	}

	@Override
	public List<AdminDTO> getAdminMember() throws Exception {
		return adminMemberDAO.selectAdminMember();
	}

	@Override
	public void updateManager(Map<String, Object> map) throws Exception {
		adminMemberDAO.updateManager(map);
	}

	@Override
	public AdminDTO getAdminDetail(AdminDTO adminDTO) throws Exception {
		return adminMemberDAO.selectAdminDetail(adminDTO);
	}

}
