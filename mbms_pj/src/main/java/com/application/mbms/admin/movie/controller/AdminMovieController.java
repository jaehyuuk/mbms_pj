package com.application.mbms.admin.movie.controller;

import java.io.File;
import java.io.IOException;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.HSSFColor.HSSFColorPredefined;
import org.apache.poi.ss.usermodel.BorderStyle;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.FillPatternType;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.application.mbms.admin.movie.service.AdminMovieService;
import com.application.mbms.movie.dto.MovieDTO;
import com.application.mbms.movie.service.MovieService;

import net.coobird.thumbnailator.Thumbnails;

@Controller
@RequestMapping("/admin/movie")
public class AdminMovieController {
	
	@Autowired
	private AdminMovieService adminMovieService;
	
	@Autowired
	private MovieService movieService;
	
	private final String MOVIE_IMAGE_REPO_PATH = "C:\\file_repo\\";					// window
	//private final String MOVIE_IMAGE_REPO_PATH = "/var/lib/tomcat9/file_repo/";	// linux
	
	@GetMapping("/adminMovieList")
	public ModelAndView adminMovieList() throws Exception{
		
		ModelAndView mv =  new ModelAndView("/admin/movie/adminMovieList");
		mv.addObject("movieList" , adminMovieService.getMovieList());
 		
		return mv;
	}
	
	
	@GetMapping("/thumbnails")
	public void thumbnails(@RequestParam("imgNm") String imgNm , HttpServletResponse response) throws IOException {
		
		OutputStream out = response.getOutputStream();
		String filePath = MOVIE_IMAGE_REPO_PATH + imgNm;
		
		File image = new File(filePath);
		if (image.exists()) { 
			Thumbnails.of(image).size(800,800).outputFormat("jpg").toOutputStream(out);
		}
		byte[] buffer = new byte[1024 * 8];
		out.write(buffer);
		out.close();
		
	}
	
	
	@GetMapping("/adminAddMovie")
	public ModelAndView addMovie() throws Exception {
		
		return new ModelAndView("/admin/movie/adminAddMovie");
	}
	
	
	@PostMapping("/adminAddMovie")
	public ResponseEntity<Object> adminAddMovie(MultipartHttpServletRequest multipartRequest, HttpServletRequest request) throws Exception {
		
		multipartRequest.setCharacterEncoding("utf-8");

		SimpleDateFormat fm = new SimpleDateFormat("yyyy-MM-dd");

		MovieDTO movieDTO = new MovieDTO();
		movieDTO.setMovieNm(multipartRequest.getParameter("movieNm"));
		movieDTO.setDirector(multipartRequest.getParameter("director"));
		movieDTO.setRunningTime(multipartRequest.getParameter("runningTime"));
		movieDTO.setGenre(multipartRequest.getParameter("genre"));
		movieDTO.setReleaseDt(fm.parse(multipartRequest.getParameter("releaseDt")));
		movieDTO.setPlot(multipartRequest.getParameter("plot"));
		movieDTO.setRatings(Double.parseDouble(multipartRequest.getParameter("ratings")));
		movieDTO.setOriginalPrice(Integer.parseInt(multipartRequest.getParameter("originalPrice")));
		
		Iterator<String> file = multipartRequest.getFileNames();
		if (file.hasNext()) {
			
			MultipartFile uploadFile = multipartRequest.getFile(file.next()); 	
			
			if(!uploadFile.getOriginalFilename().isEmpty()) {
				String uploadFileName = UUID.randomUUID() + "_" + uploadFile.getOriginalFilename();
				File f = new File(MOVIE_IMAGE_REPO_PATH + uploadFileName);	
				uploadFile.transferTo(f); 
				movieDTO.setImgNm(uploadFileName);
			}
		
		}
		
		adminMovieService.addMovie(movieDTO);
		
		String jsScript = "<script>";
		   	   jsScript += "alert('등록되었습니다.');";
		       jsScript += "location.href='" + request.getContextPath() + "/admin/movie/adminMovieList'";
		       jsScript += "</script>";
		
		HttpHeaders responseHeaders = new HttpHeaders();
	    responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		
		return new ResponseEntity<Object>(jsScript, responseHeaders, HttpStatus.OK);
		
	}
	
	
	@GetMapping("/adminMovieModify")
	public ModelAndView modifyMovie(@RequestParam("movieCd") int movieCd) throws Exception {
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/admin/movie/adminMovieModify");
		mv.addObject("movieDTO" , movieService.getMovieDetail(movieCd));
		
		return mv;
		
	}
	
	@PostMapping("/adminMovieModify")
	public ResponseEntity<Object> adminMovieModify(MultipartHttpServletRequest multipartRequest, HttpServletRequest request) throws Exception {
		
		multipartRequest.setCharacterEncoding("utf-8");
		String uploadFileName ="";
		MovieDTO movieDTO = new MovieDTO();

		SimpleDateFormat fm = new SimpleDateFormat("yyyy-MM-dd");

		movieDTO.setMovieCd(Long.parseLong(multipartRequest.getParameter("movieCd")));
		movieDTO.setMovieNm(multipartRequest.getParameter("movieNm"));
		movieDTO.setDirector(multipartRequest.getParameter("director"));
		movieDTO.setRunningTime(multipartRequest.getParameter("runningTime"));
		movieDTO.setGenre(multipartRequest.getParameter("genre"));
		movieDTO.setReleaseDt(fm.parse(multipartRequest.getParameter("releaseDt")));
		movieDTO.setPlot(multipartRequest.getParameter("plot"));
		movieDTO.setRatings(Double.parseDouble(multipartRequest.getParameter("ratings")));
		movieDTO.setOriginalPrice(Integer.parseInt(multipartRequest.getParameter("originalPrice")));
		
		Iterator<String> file = multipartRequest.getFileNames();
		if (file.hasNext()) {
			
			MultipartFile uploadFile = multipartRequest.getFile(file.next()); 	
			
			if (!uploadFile.getOriginalFilename().isEmpty()) {
				uploadFileName = UUID.randomUUID() + "_" + uploadFile.getOriginalFilename();
				File f = new File(MOVIE_IMAGE_REPO_PATH + uploadFileName);	
				uploadFile.transferTo(f); 
				movieDTO.setImgNm(uploadFileName);
				
				new File(MOVIE_IMAGE_REPO_PATH + movieService.getMovieDetail(Integer.parseInt(multipartRequest.getParameter("movieCd"))).getImgNm()).delete();
				
			}
			
		}
		
		adminMovieService.modifyMovie(movieDTO);
		
		String jsScript= "<script>";
			   jsScript += " alert('수정하였습니다.');";
			   jsScript += "location.href='" + request.getContextPath() + "/admin/movie/adminMovieList'";
			   jsScript +="</script>";

		HttpHeaders responseHeaders = new HttpHeaders();
	    responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		
		return new ResponseEntity<Object>(jsScript, responseHeaders, HttpStatus.OK);

	}
	
	
	@GetMapping("/removeMovie")
	public ResponseEntity<Object> adminRemoveMovie(HttpServletRequest request) throws Exception {
		
		String movieCdList = request.getParameter("movieCdList");
		String[] movieCd = movieCdList.split(",");
		
		for (int i = 0; i < movieCd.length; i++) {
			adminMovieService.adminRemoveMovie(movieCd[i]);
			adminMovieService.adminRemoveBoard(movieCd[i]);
			adminMovieService.adminRemoveTicket(movieCd[i]);
			adminMovieService.adminRemoveWishList(movieCd[i]);
		}
		
		String jsScript = "";
		
		jsScript  = "<script>";
		jsScript += " alert('삭제되었습니다.');";
		jsScript += " location.href='" + request.getContextPath() + "/admin/movie/adminMovieList';";
		jsScript += " </script>";
		
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		
		return new ResponseEntity<Object>(jsScript, responseHeaders, HttpStatus.OK);
	}
	
	
	@GetMapping("/movieExcelExport")
	public void goodsExcelExport(HttpServletResponse response) throws Exception {
		  
		SimpleDateFormat fileSdf = new SimpleDateFormat("yyyy_MM_dd_hh_mm");
		SimpleDateFormat dateSdf = new SimpleDateFormat("yyyy-MM-dd");
		String makeFileTime = fileSdf.format(new Date());
		String makeFileName = makeFileTime + "_movieList.xls";
		
	    Workbook wb = new HSSFWorkbook();
	    Sheet sheet = wb.createSheet("상품리스트");
	    Row row = null;
	    Cell cell = null;

	    int rowNo = 0;

	    CellStyle headStyle = wb.createCellStyle();
	    headStyle.setBorderTop(BorderStyle.THIN);
	    headStyle.setBorderBottom(BorderStyle.THIN);
	    headStyle.setBorderLeft(BorderStyle.THIN);
	    headStyle.setBorderRight(BorderStyle.THIN);

	    headStyle.setFillForegroundColor(HSSFColorPredefined.YELLOW.getIndex());
	    headStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);
	    
	    headStyle.setAlignment(HorizontalAlignment.CENTER);

	    CellStyle bodyStyle = wb.createCellStyle();
	    bodyStyle.setBorderTop(BorderStyle.THIN);
	    bodyStyle.setBorderBottom(BorderStyle.THIN);
	    bodyStyle.setBorderLeft(BorderStyle.THIN);
	    bodyStyle.setBorderRight(BorderStyle.THIN);

	    row = sheet.createRow(rowNo++);
	    cell = row.createCell(0);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("영화코드");
	    cell = row.createCell(1);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("영화제목");
	    cell = row.createCell(2);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("감독");
	    cell = row.createCell(3);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("런닝타임");
	    cell = row.createCell(4);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("장르");
	    cell = row.createCell(5);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("개봉일");
	    cell = row.createCell(6);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("평점");

		for (MovieDTO movieDTO :  adminMovieService.getMovieList()) {
			row = sheet.createRow(rowNo++);
	        cell = row.createCell(0);
	        cell.setCellStyle(bodyStyle);
	        cell.setCellValue(movieDTO.getMovieCd());
	        cell = row.createCell(1);
	        cell.setCellStyle(bodyStyle);
	        cell.setCellValue(movieDTO.getMovieNm());
	        cell = row.createCell(2);
	        cell.setCellStyle(bodyStyle);
	        cell.setCellValue(movieDTO.getDirector());
	        cell = row.createCell(3);
	        cell.setCellStyle(bodyStyle);
	        cell.setCellValue(movieDTO.getRunningTime());
	        cell = row.createCell(4);
	        cell.setCellStyle(bodyStyle);
	        cell.setCellValue(movieDTO.getGenre());
	        cell = row.createCell(5);
	        cell.setCellStyle(bodyStyle);
	        cell.setCellValue(dateSdf.format(movieDTO.getEnrollDt()));
	        cell = row.createCell(6);
	        cell.setCellStyle(bodyStyle);
	        cell.setCellValue(movieDTO.getRatings());
		} 

	    response.setContentType("ms-vnd/excel");
	    response.setHeader("Content-Disposition", "attachment;filename=" + makeFileName);

	    wb.write(response.getOutputStream());
	    wb.close();
		
	}
	
}
