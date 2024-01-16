package com.application.mbms.myPage.service;

import java.util.List;
import java.util.Map;

import com.application.mbms.member.dto.MemberDTO;
import com.application.mbms.movie.dto.MovieDTO;
import com.application.mbms.myPage.dto.WishListDTO;
import com.application.mbms.order.dto.TicketDTO;

public interface MyPageService {
	
	public MemberDTO getMemberDetail(String memberId) 				 throws Exception;
	public List<Map<String,Object>> getMyTicketList(String memberId) throws Exception;
	public TicketDTO getMyTicketDetail(String memberId) 			 throws Exception;
	public List<MovieDTO> getMovieList(MovieDTO movieDTO) 			 throws Exception;
	public List<MovieDTO> getRelatedMovieList(TicketDTO ticketDTO)   throws Exception;
	public void cancelTicket(long ticketCd) 						 throws Exception;
	public void addWishList(WishListDTO wishListDTO) 				 throws Exception;
	public void deleteHeart(WishListDTO wishListDTO) 				 throws Exception;
	public void deleteWish(long movieCd) 							 throws Exception;
	public List<Map<String,Object>> getWishList(String memberId)	 throws Exception;

}
