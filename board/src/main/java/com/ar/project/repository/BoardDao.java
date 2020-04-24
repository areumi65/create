package com.ar.project.repository;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.ar.project.entity.BoardDto;

public interface BoardDao {

		List<BoardDto> boardList();
		int getBoardSequence();
		void regist(BoardDto boardDto, MultipartFile multipartFile);
		int fileGetSequence();
		
		
}
