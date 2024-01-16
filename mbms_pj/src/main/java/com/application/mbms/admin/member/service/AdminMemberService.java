package com.application.mbms.admin.member.service;

import java.util.List;
import java.util.Map;

import com.application.mbms.admin.member.dto.AdminDTO;
import com.application.mbms.member.dto.MemberDTO;

public interface AdminMemberService {

	public boolean adminLogin(AdminDTO adminDTO) 		throws Exception;
	public List<MemberDTO> getMemberList() 		 		throws Exception;
	public void removeMember(String memberId)    		throws Exception;
	public int getMemberCnt() 					 		throws Exception;
	public List<AdminDTO> getAdminMember() 		 		throws Exception;
	public void updateManager(Map<String, Object> map)	throws Exception;
	public AdminDTO getAdminDetail(AdminDTO adminDTO)   throws Exception;
	
}
