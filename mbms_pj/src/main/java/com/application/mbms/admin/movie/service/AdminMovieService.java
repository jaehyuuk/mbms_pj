package com.application.mbms.admin.movie.service;

import java.util.List;

import com.application.mbms.movie.dto.MovieDTO;

public interface AdminMovieService {

	public List<MovieDTO> getMovieList() 			throws Exception;
	public void addMovie(MovieDTO movieDTO) 		throws Exception;
	public void modifyMovie(MovieDTO movieDTO) 		throws Exception;
	public void adminRemoveMovie(String movieCd) 	throws Exception;
	public void adminRemoveBoard(String movieCd) 	throws Exception;
	public void adminRemoveTicket(String movieCd) 	throws Exception;
	public void adminRemoveWishList(String movieCd) throws Exception;
	public int getMovieCnt() 						throws Exception;
	
}
