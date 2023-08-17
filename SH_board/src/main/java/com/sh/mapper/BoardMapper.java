package com.sh.mapper;

import java.util.List;

import com.sh.model.BoardVO;

public interface BoardMapper {
	
    /* 작가 등록 */
    public void enroll(BoardVO board);
    
    /* 게시판 목록 */
    public List<BoardVO> getList();
    
    /* 게시판 조회 */
    public BoardVO getPage(int bno);
    
}
