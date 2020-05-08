package com.ar.project.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.multipart.MultipartFile;

import com.ar.project.entity.BoardDto;
import com.ar.project.entity.FileDto;
import com.ar.project.entity.FileVO;
import com.ar.project.repository.BoardDao;
//1. 세로모드
//2. 줄이동, 줄복사
//3. 1줄지우기
//4. 정규식
//([a-zA-Z0-9]+)
//+ 1글자이상 매칭
//* 0글자도가능
//{0,} = *
//{1}
//{1,3}
public class BoardServiceImpl implements BoardService{

	@Autowired
	private BoardDao boardDao;
	
	@Override
	public void readCount(int board_no) {
		boardDao.readCount(board_no);
	}
	
	@Override
	public Map<String, Object> getBoardList(PageMaker pageMaker) {
		Map<String, Object> resMap = new HashMap<>();
		List<BoardDto> boardList = boardDao.boardList(pageMaker);
		int listCount = boardDao.listCount(pageMaker);
		pageMaker.setTotalCount(listCount);
		resMap.put("boardList", boardList);
		resMap.put("pageMaker", pageMaker);
		resMap.put("listCount", listCount);

		return resMap;
	}
	
	
	@Override
	public void registBoard(BoardDto boardDto) {
		int board_no = boardDao.getBoardSequence();
		boardDto.setBoard_no(board_no);
		boardDao.regist(boardDto);
	}

	@Override
	public void fileUpload(FileVO fileVo) {
		
		List<FileDto> fileList = new  ArrayList<>();
		for(MultipartFile mf : fileVo.getFile()) {
			int file_no = boardDao.getFileSequence();
			fileList.add(FileDto.builder().build())
		}
		
		
	}
	
	
}
