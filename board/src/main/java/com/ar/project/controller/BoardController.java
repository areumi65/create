package com.ar.project.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.ar.project.entity.BoardDto;
import com.ar.project.repository.BoardDao;

@Controller
public class BoardController {

	@Autowired
	private BoardDao boardDao;
	
	@GetMapping("/")
	public String main(Model model) {
		List<BoardDto> boardList = boardDao.boardList();
		model.addAttribute("boardList", boardList);
		return "index";
	}
	
	@GetMapping("/board/regist")
	public String regist() {
		return "board/regist";
	}
	
	@PostMapping("/board/regist")
	public String regist(@ModelAttribute BoardDto boardDto, @RequestParam MultipartFile file) {
		boardDao.regist(boardDto, file);
		return "redirect:/";
	}
	
	@GetMapping("/board/view")
	public String view() {
		return "board/view";
	}
	
	
	
	
}
