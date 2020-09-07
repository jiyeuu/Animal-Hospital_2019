package poly.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import poly.service.IMyRedisService;

@controller
public class MyRedisController {

	private Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "MyRedisService")
	private IMyRedisService myRedisService;

	@RequestMapping(value = "myRedis/test")
	@ResponseBody
	public String myRedis(HttpServletRequest request, HttpServletResponse response) throws Exception {

		log.info(this.getClass().getName() + ".myRedis start!");

		myRedisService.doSaveData();

		log.info(this.getClass().getName() + ".myRedis end!");

		return "success";
	}

}
