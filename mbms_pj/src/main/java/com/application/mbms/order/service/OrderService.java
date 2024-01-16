package com.application.mbms.order.service;

import java.util.List;

import com.application.mbms.movie.dto.MovieDTO;
import com.application.mbms.order.dto.TicketDTO;

public interface OrderService {
	
	public MovieDTO getMovieDetail(String movieCd) 					throws Exception;
	public void addTicket(TicketDTO ticketDTO) 						throws Exception;
	public List<TicketDTO> getTicketList(TicketDTO ticketDTO) 		throws Exception;
	public List<TicketDTO> getHasTicketMember(TicketDTO ticketDTO)  throws Exception;
	
}
