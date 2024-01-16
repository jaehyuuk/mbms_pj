package com.application.mbms.movie.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.application.mbms.movie.dao.MovieDAO;
import com.application.mbms.movie.dto.BoardDTO;
import com.application.mbms.movie.dto.MovieDTO;
import com.application.mbms.myPage.dto.WishListDTO;

@Service
public class MovieServiceImpl implements MovieService {

	@Autowired
	private MovieDAO movieDAO;

	@Override
	public List<MovieDTO> getMovieList(MovieDTO movieDTO) throws Exception {
		return movieDAO.selectMovieList(movieDTO);
	}

	@Override
	public MovieDTO getMovieDetail(long movieCd) throws Exception {
		return movieDAO.selectOneMovie(movieCd);
	}

	@Override
	public List<MovieDTO> getGenreList(String genre) throws Exception {
		return movieDAO.selectGenreList(genre);
	}

	@Override
	public List<WishListDTO> getWishList(long movieCd) throws Exception {
		return movieDAO.selectWishList(movieCd);
	}

	@Override
	public int getAllMovieCnt() throws Exception {
		return movieDAO.selectAllMovieCnt();
	}

	@Override
	public List<MovieDTO> getCategoryList(Map<String, Object> searchMap) throws Exception{
		return movieDAO.selectCategoryList(searchMap);
	}

	@Override
	public List<MovieDTO> getRelatedMovieList(String genre) throws Exception {
		return movieDAO.selectRelatedMovieList(genre);
	}

	@Override
	public List<BoardDTO> getBoardList(long movieCd) throws Exception {
		return movieDAO.selectBoardList(movieCd);
	}

	@Override
	public void addBoard(BoardDTO boardDTO) throws Exception {
		movieDAO.insertBoard(boardDTO);
		
	}

	@Override
	public void updateRatings(long movieCd) throws Exception {
		movieDAO.updateRatings(movieCd);
	}

	@Override
	public void deleteBoard(long boardCd) throws Exception {
		movieDAO.deleteBoard(boardCd);
	}

	@Override
	public List<MovieDTO> getSearchMovie(String search) throws Exception {
		return movieDAO.selectSearchMovieList(search);
	}

}
