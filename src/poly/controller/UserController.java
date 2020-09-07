//package poly.controller;
//
//import javax.annotation.Resource;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpSession;
//
//import org.apache.log4j.Logger;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.RequestMapping;
//
//import poly.dto.UserDTO;
//import poly.service.IUserService;
//
//@Controller
//public class UserController {
//
//	private Logger log = Logger.getLogger(this.getClass());
//	
//	@Resource(name="UserService")
//	private IUserService userservice;
//	

//	
//	/*@RequestMapping("/loginBody")
//	public String userBody() throws Exception{
//		
//		return "/loginBody";
//	}*/
//	
//	@RequestMapping("/userRegProc")
//	public String userRegProc(HttpServletRequest request, Model model) throws Exception{
//		
//		String userId = request.getParameter("userId");
//		String userName = request.getParameter("userName");
//		String userPassword = request.getParameter("userPassword");
//		
//		log.info("userId 확인:" + userId);
//		log.info("userName 확인:" + userName);
//		log.info("userPassword 확인:" + userPassword);
//		
//		UserDTO uDTO = new UserDTO();
//		uDTO.setUserId(userId);
//		uDTO.setUserPassword(userPassword);
//		uDTO.setUserName(userName);
//		
//		int result = 0;
//		
//		result = userservice.userRegProc(uDTO);
//		log.info("결과값:"+ result);
//		String msg, url;
//		if(result == 1) {
//			msg = "회원가입성공";
//			url = "/index.do";
//			model.addAttribute("msg", msg);
//			model.addAttribute("url", url);
//		}else {
//			msg = "회원가입실패";
//			url = "/index.do";
//			model.addAttribute("msg", msg);
//			model.addAttribute("url", url);
//		}
//		return "/redirect";
//	}
//	
//	@RequestMapping(value="/userLogin")
//	public String login(HttpServletRequest request,Model model, HttpSession session) throws Exception{
//		
//		//1.jsp에서 가져온 값을 String 변수에 담음
//		String userId = request.getParameter("userId");
//		String userPassword = request.getParameter("userPassword");
//		
//		log.info("userId 확인:" + userId);
//		log.info("userPassword 확인:" + userPassword);
//		
//		//2.String변수의 값을 DTO에 세팅
//		UserDTO uDTO = new UserDTO();
//		uDTO.setUserId(userId);
//		uDTO.setUserPassword(userPassword);
//		
//		//3. DTO를 변수로  service, mapper, sml에 보내고 메소드를 실행 시킴
//		//그리고  결과값을 userDTO 형태로 받아오면됨
//		//그 이유는 일치하는 사람의 정보만 받아올 것이기 때문
//		uDTO = userservice.getLogin(uDTO);
//		
//		if(uDTO == null) {//실패
//			model.addAttribute("msg", "로그인에 실패하셨습니다");
//			model.addAttribute("url", "/index.do");
//			log.info("실패");
//			
//		}else {//성공
//			model.addAttribute("msg", "로그인에 성공하셨습니다");
//			model.addAttribute("url", "/index.do");
//			session.setAttribute("userId", uDTO.getUserId());
//			session.setAttribute("userName", uDTO.getUserName());
//			session.setAttribute("userSeq", uDTO.getUserSeq());
//			log.info("성공");
//		}
//		return "/redirect";
//	}
//	
//	@RequestMapping(value="/logout")
//	public String logout(HttpSession session, Model model) throws Exception{
//		//세션을 초기화 시킴
//		session.invalidate();
//		model.addAttribute("msg", "로그아웃하셨습니다");
//		model.addAttribute("url", "/index.do");
//		
//		return "/redirect";
//	}
//}
