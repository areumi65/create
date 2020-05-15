package com.ar.project.repository;

import java.io.IOException;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.ar.project.entity.BoardDto;
import com.ar.project.entity.FileDto;
import com.ar.project.entity.FileVO;
import com.ar.project.service.PageMaker;

public interface BoardDao {

		int getBoardSequence();
		void regist(BoardDto boardDto);
		int getFileSequence();
		void fileUpload(FileDto fileDto);
		List<BoardDto> boardList(PageMaker pageMaker);
		int listCount(PageMaker pageMaker);
		BoardDto view(int board_no);
		void readCount(int board_no);
		void edit(BoardDto boardDto,FileVO fileVo);
		void delete(int board_no);
		List<FileDto> getFileList(int board_no);
		FileDto getFileNum(int file_no);
		byte[] getFileName(String file_savename) throws IOException;
		void filedelete(int board_no);
		void deleteFileNo(int file_no);
}
