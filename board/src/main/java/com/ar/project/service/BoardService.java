package com.ar.project.service;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import com.ar.project.entity.BoardDto;
import com.ar.project.entity.FileDto;
import com.ar.project.entity.FileVO;

public interface BoardService {

	void readCount(int board_no);
	Map<String, Object> getBoardList(PageMaker pageMaker);
	void registBoard(BoardDto boardDto, FileVO fileVo) throws IllegalStateException, IOException;
//	void fileUpload(FileVO fileVo) throws IllegalStateException, IOException;
	List<FileDto> getFileList(int board_no);
	
}
