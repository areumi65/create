package com.ar.project.controller;


import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ar.common.util.StringUtil;
import com.ar.project.entity.BoardDto;
import com.ar.project.entity.FileDto;
import com.ar.project.entity.FileVO;
import com.ar.project.repository.BoardDao;
import com.ar.project.service.BoardService;
import com.ar.project.service.FileService;
import com.ar.project.service.PageMaker;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class BoardController {

	@Autowired
	private BoardDao boardDao;
	
	@Autowired
	private BoardService boardService;
	
	@Autowired
	FileService fileService;
	
	
//	@GetMapping("/")
//	public String main() {
//		return "board/list";
//	}
//	
	@GetMapping("/")
	public String main(Model model, @ModelAttribute("pageMaker") PageMaker pageMaker) {
		Map<String, Object> resMap = boardService.getBoardList(pageMaker);
		model.addAllAttributes(resMap);
//		log.info("listCount={}", listCount);
//		log.info("boardList ={}", boardList);
		return "board/list";
	}
	
	@GetMapping("/board/regist")
	public String regist() {
		return "board/regist";
	}
	
	@PostMapping("/board/regist")
	public String regist(@ModelAttribute BoardDto boardDto, 
										@ModelAttribute FileVO fileVo, 
										Model model) throws IllegalStateException, IOException {
		boardService.registBoard(boardDto, fileVo);
		return "redirect: ../";
	}
	
	
	@GetMapping("/board/view")
	public String view(Model model, @RequestParam int board_no) {
		List<FileDto> fileList = boardService.getFileList(board_no);
		model.addAttribute("fileList",fileList);
		int readCount = 0;
		boardService.readCount(board_no);
		model.addAttribute("board_readcount", readCount);
		model.addAttribute("boardDto", boardDao.view(board_no));
		model.addAttribute("board_no",board_no);
		return "board/view";
	}
	
	
	@GetMapping("/board/edit")
	public String edit(Model model, @RequestParam int board_no) {
		List<FileDto> fileList = boardService.getFileList(board_no);
		model.addAttribute("fileList",fileList);
		model.addAttribute("boardDto", boardDao.view(board_no));
		model.addAttribute("board_no",board_no);
		return "board/edit";
	}
	
	@PostMapping("/board/edit")
	public String edit(Model model,@ModelAttribute FileVO fileVo, @ModelAttribute BoardDto boardDto, @RequestParam int board_no) {
		model.addAttribute("board_no",board_no);
		boardDao.edit(boardDto, fileVo);
		String deleteFileNo = boardDto.getDeleteFileNo();
		if(StringUtil.isNotEmpty(deleteFileNo)) {
			String[] fileArr = deleteFileNo.split(",");//
			for(String fileNo : fileArr) {
				boardDao.deleteFileNo(Integer.parseInt(fileNo));
			}
		}
		
		return "redirect:../board/view";
	}
	
	@GetMapping("/board/delete")
	public String delete(@RequestParam int board_no) throws IOException {
		
		List<FileDto> fileList = boardDao.getFileList(board_no);
//		log.info("fileList ={}"+fileList);
		for(int i=0; i < fileList.size(); i++) {
				FileDto fileDto = fileList.get(i);
				File target = new File("D:/upload"+fileDto.getFile_savename());
				target.delete();
		}
		boardDao.filedelete(board_no);
		boardDao.delete(board_no);
		
		return "redirect: ../";
		
	}
	
	@GetMapping("/board/deletefile")
	public String delete(@RequestParam int file_no, @RequestParam(defaultValue="") int board_no, Model model) throws IOException {
		boardDao.deleteFileNo(file_no);
		model.addAttribute("board_no", board_no);
		return "redirect:../board/edit";
	}
	
//	@PostMapping("/board/fileUploadExample")
//	public String fileUploadExample(HttpServletRequest request) {
//		fileService.fileUpload(request);
//		return "redirect: ../board/list";
//	}

	
	@GetMapping("/board/download")
	@ResponseBody
	public ResponseEntity<ByteArrayResource> download(@RequestParam int file_no) throws IOException{
		
		FileDto fileDto = boardDao.getFileNum(file_no);
		byte[] data = boardDao.getFileName(fileDto.getFile_savename());
		ByteArrayResource resource = new ByteArrayResource(data);
		
		return ResponseEntity.ok()
											.contentType(MediaType.APPLICATION_OCTET_STREAM)
											.contentLength(fileDto.getFile_size())
											.header(HttpHeaders.CONTENT_ENCODING, "UTF-8")
											.header(HttpHeaders.CONTENT_DISPOSITION, 
													makeDispositionString(fileDto.getFile_uploadname()))
											.body(resource);
		
	}

	private String makeDispositionString(String file_uploadname) throws UnsupportedEncodingException {
		
		StringBuffer buffer= new StringBuffer();
		buffer.append("attachment;");
		buffer.append("filename=");
		buffer.append("\"");
		buffer.append(URLEncoder.encode(file_uploadname,"UTF-8"));
		buffer.append("\"");
		
		return buffer.toString();
	}
	
	
}
