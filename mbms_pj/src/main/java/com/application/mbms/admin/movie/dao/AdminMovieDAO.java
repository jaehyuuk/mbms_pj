package com.application.mbms.admin.movie.dao;

import java.util.List;

import com.application.mbms.movie.dto.MovieDTO;

public interface AdminMovieDAO {

	public List<MovieDTO> selectListMovie() 	   throws Exception;
	public MovieDTO selectOneMovie(String movieCd) throws Exception;
	public void insertMovie(MovieDTO movieDTO) 	   throws Exception;
	public void updateMovie(MovieDTO movieDTO) 	   throws Exception;
	public void deleteMovie(String movieCd) 	   throws Exception;
	public void deleteBoard(String movieCd) 	   throws Exception;
	public void deleteTicket(String movieCd) 	   throws Exception;
	public void deleteWishList(String movieCd) 	   throws Exception;
	public int selectMovieCnt() 				   throws Exception;

}
