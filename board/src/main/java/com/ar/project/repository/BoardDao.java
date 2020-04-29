package com.ar.project.repository;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.ar.project.entity.BoardDto;
import com.ar.project.entity.FileDto;
import com.ar.project.entity.PagingVO;

public interface BoardDao {

		int getBoardSequence();
		void regist(BoardDto boardDto);
		int getFileSequence();
		void upload(FileDto fileDto);
		List<BoardDto> boardList(PagingVO pagingVo);
		int listCount();
		BoardDto view(int board_no);
}
