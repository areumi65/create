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

import com.ar.project.entity.BoardDto;
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
	
	@GetMapping("/")
	public String main() {
		return "index";
	}
	
	@GetMapping("/board/list")
	public String main(Model model, @ModelAttribute("pageMaker") PageMaker pageMaker) {
		
		int listCount = boardDao.listCount(pageMaker);
		List<BoardDto> boardList = boardDao.boardList(pageMaker);
		model.addAttribute("boardList", boardList);
		pageMaker.setTotalCount(listCount);
		model.addAttribute("pageMaker",pageMaker);
		
		
		log.info("listCount={}", listCount);
		log.info("boardList ={}", boardList);
		
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
		
		return "redirect: ../board/list";
	}
	
	
	@GetMapping("/board/view")
	public String view(Model model, @RequestParam int board_no) {
		
		int readCount = 0;
		boardService.readCount(board_no);
		model.addAttribute("board_readcount", readCount);
		model.addAttribute("boardDto", boardDao.view(board_no));
		model.addAttribute("board_no",board_no);
		return "board/view";
	}
	
	
	@GetMapping("/board/edit")
	public String edit(Model model, @RequestParam int board_no) {
		model.addAttribute("boardDto", boardDao.view(board_no));
		model.addAttribute("board_no",board_no);
		return "board/edit";
	}
	
	@PostMapping("/board/edit")
	public String edit(Model model, @ModelAttribute BoardDto boardDto, @RequestParam int board_no) {
		model.addAttribute("board_no",board_no);
		boardDao.edit(boardDto);
		return "redirect:../board/view";
	}
	
	@GetMapping("/board/delete")
	public String delete(@RequestParam int board_no) {
		boardDao.delete(board_no);
		return "redirect:../board/list";
		
	}
}
