package com.application.mbms.myPage.dto;

import org.springframework.stereotype.Component;

@Component
public class WishListDTO {

	private long wishListCd;
	private long movieCd;
	private String memberId;
	
	public long getWishListCd() {
		return wishListCd;
	}
	public void setWishListCd(long wishListCd) {
		this.wishListCd = wishListCd;
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
	
}
