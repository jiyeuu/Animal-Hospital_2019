package poly.controller;
  
import java.io.File;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import poly.dto.OcrDTO;
import poly.service.IOcrService;
import poly.util.CmmUtil;
import poly.util.DateUtil;
import poly.util.FileUtil;
  
  
  @Controller public class OcrController {
  
	  private Logger log = Logger.getLogger(this.getClass());
	  
	  @Resource(name = "OcrService") 
	  private IOcrService ocrService;
	  
	  final private String FILE_UPLOAD_SAVE_PATH = "c:/upload";
	  
	  @RequestMapping(value="ocr/imageFileUpload") public String Index() {
	  log.info(this.getClass().getName() + ".imageFileUpload");
	  
	  return "/ocr/ImageFileUplaod"; 
	 }
	  
	  @RequestMapping(value = "ocr/getReadforImageText") public String
	  getReadforImageText(HttpServletRequest request, HttpServletResponse
	  repResponse, Model model, @RequestParam(value = "fileUpload") MultipartFile mf) throws Exception{
	  
	  log.info(this.getClass().getName() + ".getReadforImageText start");
	  
	  //OCR 실행결과
	  String res = "";
	  
	  	String originalFileName = mf.getOriginalFilename();
	  
	  	String ext = originalFileName.substring(originalFileName.lastIndexOf(".") +
	  			1, originalFileName.length()).toLowerCase();
	  
	  	if(ext.equals("jpeg") || ext.equals("jpg") || ext.equals("gif") || ext.equals("png")) {
	  
		String savefileName = DateUtil.getDateTime("24hhmmss") + "." + ext;
	  
	  	String savefilePath = FileUtil.mkdirForDate(FILE_UPLOAD_SAVE_PATH);
	  
	  	String fullFileInfo = savefilePath + "/" + savefileName;
	  	
	  	String reg_id = request.getParameter("reg_id");
	  
	  	log.info("ext : " + ext); 
	  	log.info("savefileName : " + savefileName);
	  	log.info("savefilePath : " + savefilePath); 
	  	log.info("fullFileInfo : " + fullFileInfo);
	  	log.info("originalFileName : " + originalFileName);
	  	log.info("reg_id : " + reg_id);
	  	
	  	mf.transferTo(new File(fullFileInfo));
	  
	  	OcrDTO pDTO = new OcrDTO();
	  
	  	pDTO.setFileName(savefileName); 
	  	pDTO.setFilePath(savefilePath);
	  	
	  	
	  	OcrDTO rDTO = ocrService.getReadforImageText(pDTO);
	  
	  	if(rDTO == null) {
	  		rDTO = new OcrDTO();
	  	}
	  
	  	res = CmmUtil.nvl(rDTO.getTextFromImage());
	  	pDTO.setOcr_text(res);
	  	pDTO.setOrg_file_name(originalFileName);
	  	pDTO.setReg_id(reg_id);
	  	pDTO.setSave_file_name(savefileName);
	  	pDTO.setSave_file_path(savefilePath);
	  	pDTO.setExt(ext);
  	
	  	int result = 0;
	  	 
	  	result = ocrService.InsertOcrInfo(pDTO);
	  	
	  	if(result > 0) {
	  		log.info("DB에 들어감");
	  	}else {
	  		log.info("DB에 안들어감");
		}
	  	
	  	rDTO = null;
	  	pDTO = null; 
	  
	  	}else {
	  		res = "이미지 파일이 아니라서 인식이 불가능합니다"; 
	  		}
	  
	  	model.addAttribute("res", res);
	  	log.info(this.getClass().getName() + ".getReadforImageText end");
	  
	  	return "/ocr/TextFromImage"; 
	  } 
 }
 