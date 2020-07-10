package sts.basic.test;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.json.JSONArray;
import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/hello.do", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		// http:localhost:9090/test/hello.do
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "home"; // WEB-INF/views/home.jsp
		// return "spring"; // WEB-INF/views/spring.jsp
	}
	
	/**
	 * JSON 페이징 출력
	 * http://localhost:9090/test/add_view/add_view.do?replyPage=1
	 * @param replyPage 페이지 번호
	 * @return
	 */
	@ResponseBody
  @RequestMapping(value = "/add_view/add_view.do", 
                            method = RequestMethod.GET,
                            produces="text/plain;charset=UTF-8")
  public String add_view(int replyPage) {
    System.out.println("add_view 호출됨: " + replyPage);
    JSONObject obj = new JSONObject();
    obj.put("replyPage", replyPage);
    obj.put("name","JTBC");
    obj.put("title","물가상승");
    obj.put("content","5년간 물가 11%↑..담배·탄산음료·과자값 많이 올라");
 
    return obj.toString();
  }
	
	/**
	 * JSON 페이징 출력, 여러 레코드 출력
	 * http://localhost:9090/test/add_view/add_view_pg.do?replyPage=1
	 * @param replyPage
	 * @return
	 */
	@ResponseBody
  @RequestMapping(value = "/add_view/add_view_pg.do", 
                            method = RequestMethod.GET,
                            produces="text/plain;charset=UTF-8")
  public String add_view_pg(int replyPage) {
    System.out.println("addView 호출됨: " + replyPage);
    
    JSONObject main_obj = new JSONObject();
    main_obj.put("replyPage", replyPage+1);
    
    JSONArray list = new JSONArray();
    
    JSONObject obj = new JSONObject();
    obj.put("replyPage", replyPage);
    obj.put("name","JTBC");
    obj.put("title","물가상승");
    obj.put("content","5년간 물가 11%↑..담배·탄산음료·과자값 많이 올라");
    list.put(obj);
    
    obj = new JSONObject();
    obj.put("replyPage", replyPage);
    obj.put("name","JTBC");
    obj.put("title","안종범/정호성");
    obj.put("content","'朴대통령 지시 따르고 받들어' 한목소리");
    list.put(obj);
    
    main_obj.put("list", list); 
    
    return main_obj.toString();
  }
}
