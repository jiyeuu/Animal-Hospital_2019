package poly.controller;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MapController {
	
	private Logger log = Logger.getLogger(this.getClass());
	
	@RequestMapping(value="map/MapForm")
	public String MapForm() {
		log.info(this.getClass());
		
		return "/map/MapForm";
	}
	
	@RequestMapping(value="map/MapForm1")
	public String MapForm1() {
		log.info(this.getClass());
		
		return "/map/MapForm1";
	}
	
	@RequestMapping(value="map/MapForm2")
	public String MapForm2() {
		log.info(this.getClass());
		
		return "/map/MapForm2";
	}
	
	@RequestMapping(value="map/MapForm3")
	public String MapForm3() {
		log.info(this.getClass());
		
		return "/map/MapForm3";
	}

}
