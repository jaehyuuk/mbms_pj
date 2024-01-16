package com.application.mbms.movie.dao;

import java.util.List;
import java.util.Map;

import com.application.mbms.movie.dto.BoardDTO;
import com.application.mbms.movie.dto.MovieDTO;
import com.application.mbms.myPage.dto.WishListDTO;

public interface MovieDAO {

	public List<MovieDTO> selectMovieList(MovieDTO movieDTO) 				throws Exception;
	public MovieDTO selectOneMovie(long movieCd) 							throws Exception;
	public List<MovieDTO> selectGenreList(String genre) 					throws Exception;
	public List<WishListDTO> selectWishList(long movieCd) 					throws Exception;
	public int selectAllMovieCnt() 											throws Exception;
	public List<MovieDTO> selectCategoryList(Map<String, Object> searchMap) throws Exception;
	public List<MovieDTO> selectRelatedMovieList(String genre) 				throws Exception;
	public List<BoardDTO> selectBoardList(long movieCd) 					throws Exception;
	public void insertBoard(BoardDTO boardDTO) 								throws Exception;
	public void updateRatings(long movieCd) 								throws Exception;
	public void deleteBoard(long boardCd) 									throws Exception;
	public List<MovieDTO> selectSearchMovieList(String search) 				throws Exception;
	
}
