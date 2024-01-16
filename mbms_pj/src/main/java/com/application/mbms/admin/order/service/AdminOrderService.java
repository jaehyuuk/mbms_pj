package com.application.mbms.admin.order.service;

import java.util.List;

import com.application.mbms.order.dto.TicketDTO;

public interface AdminOrderService {
	
	public List<TicketDTO> getOrderList() throws Exception;
	public int getOrderCnt() 			  throws Exception;
	public void dailyGetOrderList() 	  throws Exception;

}
