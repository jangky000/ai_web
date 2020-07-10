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
	 * JSON ����¡ ���
	 * http://localhost:9090/test/add_view/add_view.do?replyPage=1
	 * @param replyPage ������ ��ȣ
	 * @return
	 */
	@ResponseBody
  @RequestMapping(value = "/add_view/add_view.do", 
                            method = RequestMethod.GET,
                            produces="text/plain;charset=UTF-8")
  public String add_view(int replyPage) {
    System.out.println("add_view ȣ���: " + replyPage);
    JSONObject obj = new JSONObject();
    obj.put("replyPage", replyPage);
    obj.put("name","JTBC");
    obj.put("title","�������");
    obj.put("content","5�Ⱓ ���� 11%��..��衤ź�����ᡤ���ڰ� ���� �ö�");
 
    return obj.toString();
  }
	
	/**
	 * JSON ����¡ ���, ���� ���ڵ� ���
	 * http://localhost:9090/test/add_view/add_view_pg.do?replyPage=1
	 * @param replyPage
	 * @return
	 */
	@ResponseBody
  @RequestMapping(value = "/add_view/add_view_pg.do", 
                            method = RequestMethod.GET,
                            produces="text/plain;charset=UTF-8")
  public String add_view_pg(int replyPage) {
    System.out.println("addView ȣ���: " + replyPage);
    
    JSONObject main_obj = new JSONObject();
    main_obj.put("replyPage", replyPage+1);
    
    JSONArray list = new JSONArray();
    
    JSONObject obj = new JSONObject();
    obj.put("replyPage", replyPage);
    obj.put("name","JTBC");
    obj.put("title","�������");
    obj.put("content","5�Ⱓ ���� 11%��..��衤ź�����ᡤ���ڰ� ���� �ö�");
    list.put(obj);
    
    obj = new JSONObject();
    obj.put("replyPage", replyPage);
    obj.put("name","JTBC");
    obj.put("title","������/��ȣ��");
    obj.put("content","'�Ӵ���� ���� ������ �޵��' �Ѹ�Ҹ�");
    list.put(obj);
    
    main_obj.put("list", list); 
    
    return main_obj.toString();
  }
}
