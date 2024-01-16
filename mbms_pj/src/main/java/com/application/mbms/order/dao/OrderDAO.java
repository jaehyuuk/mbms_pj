package com.application.mbms.order.dao;

import java.util.List;

import com.application.mbms.movie.dto.MovieDTO;
import com.application.mbms.order.dto.TicketDTO;

public interface OrderDAO {
	
	public MovieDTO selectOneMovie(String movieCd) 						  throws Exception;
	public void insertTicket(TicketDTO ticketDTO) 						  throws Exception;
	public List<TicketDTO> selectTicketList(TicketDTO ticketDTO) 		  throws Exception;
	public List<TicketDTO> selectHasTicketMemberList(TicketDTO ticketDTO) throws Exception;

}
