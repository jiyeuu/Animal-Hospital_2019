package poly.controller;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainFormController {
	
	private Logger log = Logger.getLogger(this.getClass());
	
	@RequestMapping(value="MainForm")
	public String MainForm() {
		log.info(this.getClass());
		
		return "/MainForm";
	}

}
