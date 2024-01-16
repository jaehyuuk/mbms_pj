package com.application.mbms.admin.order.dao;

import java.util.List;

import com.application.mbms.order.dto.TicketDTO;

public interface AdminOrderDAO {
	
	public List<TicketDTO> selectListOrder() throws Exception;
	public int selectOrderCnt() 			 throws Exception;

}
