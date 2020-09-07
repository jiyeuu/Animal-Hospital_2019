package poly.controller;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import poly.dto.AccStatDTO;
import poly.service.IGetAccStatService;
import poly.util.CmmUtil;

@Controller
public class GetAccStatController {

	private Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="GetAccStatService")
	private IGetAccStatService getAccStatService;
	
	@RequestMapping(value = "AccStat/getAccStatForJSON")
	public String getAccStatForJSON(HttpServletRequest request, HttpServletResponse response,
			Model model) throws Exception{
		
		log.info(this.getClass().getName() + ".getAccStatForJSON start");
		
		String url = "http://localhost:9010/accStat/getAccStatInfo.do?1=1";
		
		String yyyymm = CmmUtil.nvl(request.getParameter("yyyymm"));
		String a_code = CmmUtil.nvl(request.getParameter("a_code"));
		
		if(yyyymm.length() > 0) {
			url += "&yyyymm=" + yyyymm;
		}
		
		if(a_code.length() > 0) {
			url += "&a_code=" + a_code;
		}
		
		log.info("url : " + url);
		
		AccStatDTO pDTO = new AccStatDTO();
		pDTO.setUrl(url);
		
		Map<String, Object> rMap = getAccStatService.getAccStatForJSON(pDTO);
		
		
		
		model.addAttribute("rMap", rMap);
		
		log.info(this.getClass().getName() + ".getAccStatForJSON end");
		
		return "/AccStat/getAccStatForJSON";
		
	}
	
	@RequestMapping(value = "AccStat/getAccStatNightForJSON")
	@ResponseBody
	public Map<String, Object> getAccStatNightForJSON(HttpServletRequest request, HttpServletResponse response,
			Model model) throws Exception {
		
		log.info(this.getClass().getName() + ".getAccStatNightForJSON start");
		
		String url = "http://localhost:9010/accStat/getAccStatInfo.do?1=1";
		
		String yyyymm = CmmUtil.nvl(request.getParameter("yyyymm"));
		String a_code = CmmUtil.nvl(request.getParameter("a_code"));
		
		if(yyyymm.length() > 0) {
			url += "&yyyymm=" + yyyymm;
		}
		
		if(a_code.length() > 0) {
			url += "&a_code=" + a_code;
		}
		
		log.info("url : " + url);
		
		AccStatDTO pDTO = new AccStatDTO();
		pDTO.setUrl(url);
		
		Map<String, Object> rMap = getAccStatService.getAccStatNightForJSON(pDTO);
		
		if(rMap == null) {
			rMap = new HashMap<String, Object>();
		}
		
		log.info(this.getClass().getName() + ".getAccStatNightForJSON end");
		
		return rMap;
	}
	
	@RequestMapping(value = "AccStat/accStatForAjax")
	public String accStatForAjax(HttpServletRequest request, HttpServletResponse response,
			Model model) throws Exception {
		
		log.info(this.getClass().getName() + ".accStatForAjax start");
		
		log.info(this.getClass().getName() + ".accStatForAjax end");
		
		return "/AccStat/accStatForAjax";
	}
	
}
