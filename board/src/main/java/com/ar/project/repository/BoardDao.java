package com.ar.project.repository;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.ar.project.entity.BoardDto;
import com.ar.project.entity.FileDto;
import com.ar.project.entity.PagingVO;
import com.ar.project.service.PageMaker;

public interface BoardDao {

		int getBoardSequence();
		void regist(BoardDto boardDto);
		int getFileSequence();
		void upload(FileDto fileDto);
		List<BoardDto> boardList(PageMaker pageMaker);
		int listCount(PageMaker pageMaker);
		BoardDto view(int board_no);
		void readCount(int board_no);
		void edit(BoardDto boardDto);
		void delete(int board_no);
}
