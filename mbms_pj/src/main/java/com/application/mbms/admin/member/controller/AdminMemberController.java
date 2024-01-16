package com.application.mbms.admin.member.controller;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.application.mbms.admin.member.dto.AdminDTO;
import com.application.mbms.admin.member.service.AdminMemberService;
import com.application.mbms.member.dto.MemberDTO;
import com.application.mbms.member.service.MemberService;

@Controller
@RequestMapping("/admin/member")
public class AdminMemberController {
	
	@Autowired
	private AdminMemberService adminMemberService; 
	
	@Autowired
	private MemberService memberService;
	
	
	@GetMapping("/adminLogin")
	public ModelAndView adminLogin() throws Exception {
		return new ModelAndView("/admin/member/adminLogin");
	}
	
	
	@PostMapping("/adminLogin")
	public ResponseEntity<Object> adminLogin(@ModelAttribute AdminDTO adminDTO, HttpServletRequest request) throws Exception {
		
		String jsScript = "";
		
		if (adminMemberService.adminLogin(adminDTO)) { 	
			
			AdminDTO able = adminMemberService.getAdminDetail(adminDTO);
			
			HttpSession session = request.getSession();		
			session.setAttribute("adminId" 			 , adminDTO.getAdminId());
			session.setAttribute("selectMovie" 		 , able.getSelectMovie());
			session.setAttribute("managementMovie" 	 , able.getManagementMovie());
			session.setAttribute("selectMember" 	 , able.getSelectMember());
			session.setAttribute("managementMember"  , able.getManagementMember());
			session.setAttribute("selectComment" 	 , able.getSelectComment());
			session.setAttribute("managementComment" , able.getManagementComment());
			session.setAttribute("selectOrder" 		 , able.getSelectOrder());
			session.setAttribute("role" 			 , "admin");
			session.setMaxInactiveInterval(60 * 30);
			
			jsScript  = "<script>";
			jsScript += " location.href='" + request.getContextPath() + "/admin/main';";
			jsScript += " </script>";
			
		}
		else { 
			
			jsScript  = "<script>";
			jsScript += " location.href='" + request.getContextPath() + "/admin/member/adminLogin?err=true';";
			jsScript += " </script>";
			
		}
		
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		
		return new ResponseEntity<Object>(jsScript, responseHeaders, HttpStatus.OK);
	}
	
	
	@GetMapping("/adminLogout")
	public ResponseEntity<Object> adminLogout(HttpServletRequest request) throws Exception {
		
		HttpSession session = request.getSession();
		session.invalidate(); 
		
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		
		String jsScript = "<script>";
			   jsScript += "location.href='" + request.getContextPath() + "/admin/member/adminLogin';";
			   jsScript += " </script>";
		
		return new ResponseEntity<Object>(jsScript, responseHeaders, HttpStatus.OK);
	
	}
	
	
	@GetMapping("/adminMemberList")
	public ModelAndView adminMemberList() throws Exception{

		ModelAndView mv = new ModelAndView("/admin/member/adminMemberList");
		mv.addObject("memberList" , adminMemberService.getMemberList());
		return mv;
	}
	
	
	@GetMapping("/adminMemberModify")
	public ModelAndView modifyMember(HttpServletRequest request, @RequestParam String memberId) throws Exception {
		
		ModelAndView mv = new ModelAndView("/admin/member/adminMemberModify");
		mv.addObject("memberDTO" , memberService.getMemberDetail(memberId));
		
		return mv;
	}
	
	
	@PostMapping("/adminMemberModify")
	public ResponseEntity<Object> adminMemberModify(HttpServletRequest request, MemberDTO memberDTO) throws Exception {
		
		memberService.modifyMember(memberDTO);
		String jsScript = "";
		
		jsScript  = "<script>";
		jsScript += " alert('수정 되었습니다.');";
		jsScript += " location.href='" + request.getContextPath() + "/admin/member/adminMemberList';";
		jsScript += " </script>";
		
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		
		return new ResponseEntity<Object>(jsScript, responseHeaders, HttpStatus.OK);
		
	}
	
	
	@GetMapping("/removeMember")
	public ResponseEntity<Object> removeMember(HttpServletRequest request) throws Exception {
		
		String memberIdList = request.getParameter("memberIdList");
		String[] memberId = memberIdList.split(",");
		
		for (int i = 0; i < memberId.length; i++) {
			adminMemberService.removeMember(memberId[i]);
			memberService.deleteTicket(memberId[i]);
			memberService.deleteWishList(memberId[i]);
			memberService.deleteBoard(memberId[i]);
		}
		
		String jsScript = "";
		
		jsScript  = "<script>";
		jsScript += " alert('삭제되었습니다.');";
		jsScript += " location.href='" + request.getContextPath() + "/admin/member/adminMemberList';";
		jsScript += " </script>";
		
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		
		return new ResponseEntity<Object>(jsScript, responseHeaders, HttpStatus.OK);
	}
	
	
	@GetMapping("/memberExcelExport")
	public void memberExcelExport(HttpServletResponse response) throws Exception {
		  
		SimpleDateFormat joinSdf = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat fileSdf = new SimpleDateFormat("yyyy_MM_dd_hh_mm");
		String fileTime = fileSdf.format(new Date());
		String fileName = fileTime + "_memberList.xls";
		
	    Workbook wb = new HSSFWorkbook();
	    Sheet sheet = wb.createSheet("회원리스트");
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
	    cell.setCellValue("회원아이디");
	    cell = row.createCell(1);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("회원이름");
	    cell = row.createCell(2);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("성별");
	    cell = row.createCell(3);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("생일");
	    cell = row.createCell(4);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("휴대폰번호");
	    cell = row.createCell(5);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("문자수신여부");
	    cell = row.createCell(6);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("이메일");
	    cell = row.createCell(7);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("이메일수신여부");
	    cell = row.createCell(8);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("주소");
	    cell = row.createCell(9);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("가입일자");
	    
		for (MemberDTO memberDTO :  adminMemberService.getMemberList()) {
			row = sheet.createRow(rowNo++);
	        cell = row.createCell(0);
	        cell.setCellStyle(bodyStyle);
	        cell.setCellValue(memberDTO.getMemberId());
	        cell = row.createCell(1);
	        cell.setCellStyle(bodyStyle);
	        cell.setCellValue(memberDTO.getMemberNm());
	        cell = row.createCell(2);
	        cell.setCellStyle(bodyStyle);
	        cell.setCellValue(memberDTO.getSex());
	        cell = row.createCell(3);
	        cell.setCellStyle(bodyStyle);
	        cell.setCellValue(memberDTO.getBirthDt());
	        cell = row.createCell(4);
	        cell.setCellStyle(bodyStyle);
	        cell.setCellValue(memberDTO.getHp());
	        cell = row.createCell(5);
	        cell.setCellStyle(bodyStyle);
	        cell.setCellValue(memberDTO.getSmsstsYn());
	        cell = row.createCell(6);
	        cell.setCellStyle(bodyStyle);
	        cell.setCellValue(memberDTO.getEmail());
	        cell = row.createCell(7);
	        cell.setCellStyle(bodyStyle);
	        cell.setCellValue(memberDTO.getEmailstsYn());
	        cell = row.createCell(8);
	        cell.setCellStyle(bodyStyle);
	        cell.setCellValue(memberDTO.getRoadAddress() + " " + memberDTO.getJibunAddress() + " " + memberDTO.getNamujiAddress());
	        cell = row.createCell(9);
	        cell.setCellStyle(bodyStyle);
	        cell.setCellValue(joinSdf.format(memberDTO.getJoinDt()));

		} 

	    response.setContentType("ms-vnd/excel");
	    response.setHeader("Content-Disposition", "attachment;filename="+fileName);

	    wb.write(response.getOutputStream());
	    wb.close();

	}
}
