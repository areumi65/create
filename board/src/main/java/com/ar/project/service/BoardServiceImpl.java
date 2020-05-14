package com.ar.project.service;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

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
		int listCount = boardDao.listCount(pageMaker);
		pageMaker.setTotalCount(listCount);
		List<BoardDto> boardList = boardDao.boardList(pageMaker);
		
		resMap.put("boardList", boardList);
		resMap.put("pageMaker", pageMaker);
		resMap.put("listCount", listCount);

		return resMap;
	}
	
	
	@Override
	public void registBoard(BoardDto boardDto, FileVO fileVo) throws IllegalStateException, IOException {
		try {
			int board_no = boardDao.getBoardSequence();
			boardDto.setBoard_no(board_no);
			boardDao.regist(boardDto);
			
			List<FileDto> fileList = new  ArrayList<>();
			for(MultipartFile mf : fileVo.getFile()) {
				fileList.add(FileDto.builder()
												.file_uploadname(mf.getOriginalFilename())
												.file_savename(UUID.randomUUID().toString())
												.file_size(mf.getSize())
												.board_no(board_no)
												.build());
			}
			
			File dir = new File("D:/upload");
			dir.mkdirs();
			
			for(int i=0; i < fileList.size(); i++) {
				MultipartFile mf = fileVo.getFile().get(i);
				FileDto fileDto = fileList.get(i);
				File target = new File(dir,fileDto.getFile_savename());
				mf.transferTo(target);
				int file_no = boardDao.getFileSequence();
				fileDto.setFile_no(file_no);
				boardDao.fileUpload(fileDto);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public List<FileDto> getFileList(int board_no) {
		List<FileDto> fileList = boardDao.getFileList(board_no);
		return fileList;
	}

	
	
	
	
	
	}

