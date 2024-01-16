package com.application.mbms.movie.service;

import java.util.List;
import java.util.Map;

import com.application.mbms.movie.dto.BoardDTO;
import com.application.mbms.movie.dto.MovieDTO;
import com.application.mbms.myPage.dto.WishListDTO;

public interface MovieService {

	public List<MovieDTO> getMovieList(MovieDTO movieDTO) 				 throws Exception;
	public MovieDTO getMovieDetail(long movieCd) 						 throws Exception;
	public List<MovieDTO> getGenreList(String genre) 					 throws Exception;
	public List<WishListDTO> getWishList(long movieCd) 					 throws Exception;
	public int getAllMovieCnt() 										 throws Exception;
	public List<MovieDTO> getCategoryList(Map<String, Object> searchMap) throws Exception;
	public List<MovieDTO> getRelatedMovieList(String genre) 			 throws Exception;
	public List<BoardDTO> getBoardList(long movieCd) 					 throws Exception;
	public void addBoard(BoardDTO boardDTO) 							 throws Exception;
	public void updateRatings(long movieCd) 							 throws Exception;
	public void deleteBoard(long boardCd) 								 throws Exception;
	public List<MovieDTO> getSearchMovie(String search) 				 throws Exception;
	
}
