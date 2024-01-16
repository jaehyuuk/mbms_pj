package com.application.mbms.admin.member.dao;

import java.util.List;
import java.util.Map;

import com.application.mbms.admin.member.dto.AdminDTO;
import com.application.mbms.member.dto.MemberDTO;

public interface AdminMemberDAO {

	public AdminDTO selectAdminLogin(AdminDTO adminDTO)  throws Exception;
	public List<MemberDTO> selectListMember() 			 throws Exception;
	public void deleteMember(String memberId) 			 throws Exception;
	public int selectMemberCnt() 						 throws Exception;
	public List<AdminDTO> selectAdminMember() 			 throws Exception;
	public void updateManager(Map<String, Object> map)   throws Exception;
	public AdminDTO selectAdminDetail(AdminDTO adminDTO) throws Exception;
	
}
