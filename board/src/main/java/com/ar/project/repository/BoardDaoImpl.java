package com.ar.project.repository;

import java.io.File;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

import com.ar.project.entity.BoardDto;

@Repository
public class BoardDaoImpl implements BoardDao{

	@Autowired
	private SqlSession sqlSession;
	
	
	@Override
	public List<BoardDto> boardList() {
		return sqlSession.selectList("board.boardList");
	}


	@Override
	public int getBoardSequence() {
		return sqlSession.selectOne("board.getSequence");
	}


	@Override
	public int fileGetSequence() {
		return sqlSession.selectOne("board.fileGetSequence");
	}

	
	@Override
	public void regist(BoardDto boardDto, MultipartFile multipartFile) {
		
		int board_no = getBoardSequence();
		int file_no = fileGetSequence();
		
		boardDto.setBoard_no(board_no);
//		boardDto.setBoard_pw(board_pw);
		
		File dir = new File("D:/upload");
		dir.mkdir();
		
		File target = new File(dir, String.valueOf(file_no));
		boardDto.setBoard_no(board_no);
		boardDto.setFile_no(file_no);
		sqlSession.insert("board.regist",boardDto);
		
	}
	
	
}
