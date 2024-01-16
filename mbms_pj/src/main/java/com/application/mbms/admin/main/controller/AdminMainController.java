package com.application.mbms.admin.main.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.application.mbms.admin.board.service.AdminBoardService;
import com.application.mbms.admin.member.service.AdminMemberService;
import com.application.mbms.admin.movie.service.AdminMovieService;
import com.application.mbms.admin.order.service.AdminOrderService;

@Controller
public class AdminMainController {
	
	@Autowired
	private AdminMovieService adminMovieService;
	
	@Autowired
	private AdminMemberService adminMemberService;
	
	@Autowired
	private AdminBoardService adminBoardService;
	
	@Autowired
	private AdminOrderService adminOrderService;

	
	@GetMapping("/accessControll/accessLogin")
	public ModelAndView accessLogin() throws Exception {
		return new ModelAndView("/accessControll/accessLogin");
	}
	
	
	@GetMapping("/admin/main")
	public ModelAndView admin() throws Exception {
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/admin/main");
		
		mv.addObject("movieCnt", adminMovieService.getMovieCnt());
		mv.addObject("memberCnt", adminMemberService.getMemberCnt());
		mv.addObject("boardCnt", adminBoardService.getBoardCnt());
		mv.addObject("orderCnt", adminOrderService.getOrderCnt());
		
		mv.addObject("movieList" , adminMovieService.getMovieList());
		mv.addObject("memberList" , adminMemberService.getMemberList());
		mv.addObject("boardList" , adminBoardService.getBoardList());
		mv.addObject("orderList" , adminOrderService.getOrderList());
		
		return mv;
	}
	
	@GetMapping("/admin/manager")
	public ModelAndView adminManager() throws Exception {
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/admin/manager");		
		
		mv.addObject("adminList", adminMemberService.getAdminMember());
		
		return mv;
	}
	

	@PostMapping("/admin/manager")
	public ResponseEntity<Object> adminManager(@RequestParam Map<String, Object> map) throws Exception {
		
		adminMemberService.updateManager(map);
		
		return new ResponseEntity<Object>(HttpStatus.OK);
		
	}
	
	
	@GetMapping("/openChrome")
	public ModelAndView openChrome() throws Exception{
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/admin/movie/movieRanking");
		
		String chromeDriver = "webdriver.chrome.driver";
		String chromePath = "C:\\chromedriver_win32\\chromedriver.exe";
		//String chromePath = "/home/ubuntu/chromedriver";
		
		System.setProperty(chromeDriver, chromePath);
		
        ChromeOptions options = new ChromeOptions();
        options.setCapability("ignoreProtectedModeSettings", true);
        options.addArguments("--headless");
        options.addArguments("--no-sandbox");
        
		WebDriver driver = new ChromeDriver(options);
		WebDriverWait wait = new WebDriverWait(driver, 30);
		
		driver.get("http://www.cgv.co.kr/movies/?lt=1&ft=0");
		
		wait.until(ExpectedConditions.visibilityOfElementLocated(By.className("title")));
		List<WebElement> title = driver.findElements(By.className("title")); 	

		wait.until(ExpectedConditions.visibilityOfElementLocated(By.className("score")));
		List<WebElement> score = driver.findElements(By.className("score")); 	
		
		wait.until(ExpectedConditions.visibilityOfElementLocated(By.className("txt-info")));
		List<WebElement> info = driver.findElements(By.className("txt-info")); 	

		List<Map<String, Object>> cgvRanking = new ArrayList<Map<String,Object>>();
		for (int i = 0; i < 10; i++) {
		
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("title", title.get(i).getText());
			map.put("score", score.get(i).getText().split(" ")[0].substring(3));
			map.put("info", info.get(i).getText().split(" ")[0]);
		
			cgvRanking.add(map);	
		
		}
		
		mv.addObject("cgvRankingList" ,cgvRanking);
		
        driver.close();
		
		return mv;
		
	}

	
}
