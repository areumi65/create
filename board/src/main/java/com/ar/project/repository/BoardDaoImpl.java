package com.ar.project.repository;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.annotation.PostConstruct;

import org.apache.commons.io.FileUtils;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

import com.ar.project.entity.BoardDto;
import com.ar.project.entity.FileDto;
import com.ar.project.entity.FileVO;
import com.ar.project.service.PageMaker;

@Repository
public class BoardDaoImpl implements BoardDao{

	private File dir = new File("D:/upload");
	
	@PostConstruct
	public void init() {
		dir.mkdirs();
	}
	
	@Autowired
	private SqlSession sqlSession;
	
	
	@Override
	public List<BoardDto> boardList(PageMaker pageMaker) {
		return sqlSession.selectList("board.boardList",pageMaker);
	}


	@Override
	public int getBoardSequence() {
		return sqlSession.selectOne("board.getBoardSequence");
	}


	@Override
	public int getFileSequence() {
		return sqlSession.selectOne("board.getFileSequence");
	}

	
	@Override
	public void regist(BoardDto boardDto) {
		sqlSession.insert("board.regist",boardDto);
		
	}


	@Override
	public void fileUpload(FileDto fileDto) {
		sqlSession.insert("board.upload",fileDto);
	}


	@Override
	public int listCount(PageMaker pageMaker) {
		return sqlSession.selectOne("board.listCount", pageMaker);
	}


	@Override
	public BoardDto view(int board_no) {
		return sqlSession.selectOne("board.view",board_no);
	}


	@Override
	public void readCount(int board_no) {
		sqlSession.update("board.readCount", board_no);
	}



	@Override
	public void edit(BoardDto boardDto,FileVO fileVo) {
		try {
			List<FileDto> fileList = new  ArrayList<>();
			for(MultipartFile mf : fileVo.getFile()) {
				if(mf.getOriginalFilename().length() !=0) {
					fileList.add(FileDto.builder()
							.file_uploadname(mf.getOriginalFilename())
							.file_savename(UUID.randomUUID().toString())
							.file_size(mf.getSize())
							.board_no(boardDto.getBoard_no())
							.build());
				}
			}
			
			File dir = new File("D:/upload");
			dir.mkdirs();
			
			for(int i=0; i < fileList.size(); i++) {
				MultipartFile mf = fileVo.getFile().get(i);
				FileDto fileDto = fileList.get(i);
				File target = new File(dir,fileDto.getFile_savename());
				mf.transferTo(target);
				int file_no = getFileSequence();
				fileDto.setFile_no(file_no);
				fileUpload(fileDto);
			}
			
			sqlSession.update("board.edit",boardDto);
			
		} catch (Exception e) {
		}
	}


	@Override
	public void delete(int board_no) {
		sqlSession.delete("board.delete",board_no);
	}


	@Override
	public List<FileDto> getFileList(int board_no) {
		return sqlSession.selectList("board.fileList", board_no);
	}


	@Override
	public FileDto getFileNum(int file_no) {
		return sqlSession.selectOne("board.getFileNum",file_no);
	}


	@Override
	public byte[] getFileName(String file_savename) throws IOException {
		File file = new File(dir, file_savename);
		byte[] data = FileUtils.readFileToByteArray(file);
		return data;
	}


	@Override
	public void filedelete(int board_no) {
		sqlSession.delete("board.fileDelete", board_no);
	}


	@Override
	public void deleteFileNo(int file_no) {
		sqlSession.delete("board.deleteFileNo",file_no);
	}






	
	
}
