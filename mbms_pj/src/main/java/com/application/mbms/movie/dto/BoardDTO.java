package com.application.mbms.movie.dto;

import java.util.Date;

import org.springframework.stereotype.Component;

@Component
public class BoardDTO {

	private long   boardCd;
	private long   movieCd;
	private String memberId;
	private String comment;
	private int    ratings;
	private Date   enrollDt;
	
	public long getBoardCd() {
		return boardCd;
	}
	public void setBoardCd(long boardCd) {
		this.boardCd = boardCd;
	}
	public long getMovieCd() {
		return movieCd;
	}
	public void setMovieCd(long movieCd) {
		this.movieCd = movieCd;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public int getRatings() {
		return ratings;
	}
	public void setRatings(int ratings) {
		this.ratings = ratings;
	}
	public Date getEnrollDt() {
		return enrollDt;
	}
	public void setEnrollDt(Date enrollDt) {
		this.enrollDt = enrollDt;
	}
	
}
