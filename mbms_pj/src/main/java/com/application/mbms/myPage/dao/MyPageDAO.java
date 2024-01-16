package com.application.mbms.myPage.dao;

import java.util.List;
import java.util.Map;

import com.application.mbms.member.dto.MemberDTO;
import com.application.mbms.movie.dto.MovieDTO;
import com.application.mbms.myPage.dto.WishListDTO;
import com.application.mbms.order.dto.TicketDTO;

public interface MyPageDAO {
	
	public MemberDTO selectOneDetail(String memberId) 					throws Exception;
	public List<Map<String,Object>> selectMyTicketList(String memberId) throws Exception;
	public TicketDTO selectTicketDetail(String memberId) 				throws Exception;
	public List<MovieDTO> selectMovieList(MovieDTO movieDTO) 			throws Exception;
	public List<MovieDTO> selectRelatedMovieList(TicketDTO ticketDTO) 	throws Exception;
	public void deleteTicket(long ticketCd)								throws Exception;
	public void insertWishList(WishListDTO wishListDTO) 				throws Exception;
	public void deleteHeart(WishListDTO wishListDTO)					throws Exception;
	public void deleteWish(long movieCd)								throws Exception;
	public List<Map<String,Object>> selectWishList(String memberId)		throws Exception;

}
