package com.ar.project.repository;

import java.io.File;
import java.util.List;

import javax.annotation.PostConstruct;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

import com.ar.project.entity.BoardDto;
import com.ar.project.entity.FileDto;
import com.ar.project.entity.PagingVO;
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
	public void upload(FileDto fileDto) {
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
	public void edit(BoardDto boardDto) {
		sqlSession.update("board.edit",boardDto);
	}


	@Override
	public void delete(int board_no) {
		sqlSession.delete("board.delete",board_no);
	}




	
	
}
