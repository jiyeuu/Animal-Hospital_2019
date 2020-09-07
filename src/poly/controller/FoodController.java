package poly.controller;

import org.apache.log4j.Logger;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import poly.service.IFoodService;

@Controller
public class FoodController {
	private Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name = "FoodService")
	private IFoodService foodService;
	
	@RequestMapping(value = "food/getFoodInfoFromWEB")
	public String getMovieInfoFromWEB(HttpServletRequest request, HttpServletResponse response, ModelMap model)
			throws Exception{
		
		log.info(this.getClass().getName() + ".getFoodInfoFromWEB start!");
		
		int res = foodService.getFoodInfoFromWEB();
		
		model.addAttribute("res", String.valueOf(res));
		
		log.info(this.getClass().getName() + ".getFoodInfoFromWEB end!");
		
		return "/food/RankForWEB";
	}

}
