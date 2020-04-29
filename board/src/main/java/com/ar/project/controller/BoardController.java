package com.ar.project.controller;


import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.ar.project.entity.BoardDto;
import com.ar.project.entity.FileDto;
import com.ar.project.entity.PagingVO;
import com.ar.project.repository.BoardDao;
import com.ar.project.service.FileService;
import com.ar.project.service.Pagination;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class BoardController {

	@Autowired
	private BoardDao boardDao;
	
	
	@GetMapping("/")
	public String main() {
		
		
		return "index";
	}
	
	@GetMapping("/board/list")
	public String main(Model model, @ModelAttribute PagingVO pagingVo, @RequestParam(defaultValue="1") int curPage) {
		
		int listCount = boardDao.listCount();
		Pagination pagination = new Pagination(listCount,curPage);
		pagingVo.setStartIndex(pagination.getStartIndex()+1);
		pagingVo.setCountPerPage(pagination.getPageSize()+pagination.getStartIndex());
		List<BoardDto> boardList = boardDao.boardList(pagingVo);
		
		model.addAttribute("boardList", boardList);
		model.addAttribute("listCount",listCount);
		model.addAttribute("pagination",pagination);
		
//		log.info("listCount={}", listCount);
//		log.info("boarList ={}", boardList);
		
		return "board/list";
	}
	
	@GetMapping("/board/regist")
	public String regist() {
		return "board/regist";
	}
	
	@Autowired
	private FileService fileService;
	
	@PostMapping("/board/regist")
	public String regist(@ModelAttribute BoardDto boardDto, Model model) throws IllegalStateException, IOException {
		
		int board_no = boardDao.getBoardSequence();
		boardDto.setBoard_no(board_no);
//		fileDto.setBoard_no(board_no);
		boardDao.regist(boardDto);
		
//		int file_no = boardDao.getFileSequence();
//		model.addAttribute("board_no", boardDto.getBoard_no());
//		fileDto.setFile_no(file_no);
//		fileService.upload(fileDto);
		
		return "redirect:/";
	}
	
	
	@GetMapping("/board/view")
	public String view(Model model, @RequestParam int board_no) {
		
		model.addAttribute("boardDto", boardDao.view(board_no));
		
		return "board/view";
	}
	
	
	
	
}
