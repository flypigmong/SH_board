package com.sh.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sh.mapper.BoardMapper;
import com.sh.model.BoardVO;

@Service
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	private BoardMapper mapper;

	@Override
	public void enroll(BoardVO board) {
		
		 mapper.enroll(board);
		 
	}

	@Override
	public List<BoardVO> getList() {
		
		return mapper.getList();
	}
}
