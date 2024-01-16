package com.application.mbms.admin.order.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import com.application.mbms.admin.order.dao.AdminOrderDAO;
import com.application.mbms.order.dto.TicketDTO;

@Service
public class AdminOrderServiceImpl implements AdminOrderService {
	
	private static final Logger logger = LoggerFactory.getLogger(AdminOrderServiceImpl.class);
	
	@Autowired
	private AdminOrderDAO adminOrderDAO;
	
	@Override
	public List<TicketDTO> getOrderList() throws Exception {
		return adminOrderDAO.selectListOrder();
	}

	@Override
	public int getOrderCnt() throws Exception {
		return adminOrderDAO.selectOrderCnt();
	}
	
   @Override
   @Scheduled(cron = "* * 0 * * *")
   public void dailyGetOrderList() throws Exception {
      List<TicketDTO> dailyOrderList = adminOrderDAO.selectListOrder();
      for (TicketDTO ticketDTO : dailyOrderList) {
    	  
    	  String ticketInfo = "TicketDTO [ticketCd=" + ticketDTO.getTicketCd() + ", memberId=" + ticketDTO.getMemberId() + ", movieCd=" + ticketDTO.getMovieCd() 
    	  						+ ", movieNm=" + ticketDTO.getMovieNm() + ", genre=" + ticketDTO.getGenre() + ", originalPrice=" + ticketDTO.getOriginalPrice() 
    	  						+ ", seat=" + ticketDTO.getSeat() + ", paymentAmt=" + ticketDTO.getPaymentAmt() + ", price=" + ticketDTO.getPrice() 
    	  						+ ", payOrderTime=" + ticketDTO.getPayOrderTime() + "]";
    	  
         logger.info(ticketInfo);
         
      }
   }
   
}
