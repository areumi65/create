package com.ar.project.service;

import org.springframework.beans.factory.annotation.Autowired;

import com.ar.project.repository.BoardDao;

public class BoardServiceImpl implements BoardService{

	@Autowired
	private BoardDao boardDao;
	
	@Override
	public void readCount(int board_no) {
		boardDao.readCount(board_no);
	}
	
}
