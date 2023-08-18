package com.sh.mapper;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.sh.model.BoardVO;
import com.sh.model.Criteria;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class BoardMapperTests {
	
    private static final Logger log = LoggerFactory.getLogger(BoardMapperTests.class);
    
    @Autowired
    private BoardMapper mapper;
    
    
    /*
    @Test
    public void testEnroll() {
        
        BoardVO vo = new BoardVO();
        
        vo.setTitle("mapper test1");
        vo.setContent("mapper test1");
        vo.setWriter("mapper test1");
        
        mapper.enroll(vo);
        
    }
    */
    
    /*
    // 게시판 목록 테스트 
    @Test
    public void testGetList() {
        
        List list = mapper.getList();
       // 일반적 for문 
        for(int i = 0; i < list.size();i++) {
            log.info("" + list.get(i));
        }
        
    }

	*/
    
    /*
    //게시판 조회
    @Test
    public void testGetPage() {
    	
    	// 실제 존재하는 페이지 
    	int bno = 7;
    	
    	log.info("" + mapper.getPage(bno));
    	
    }
	*/
    
    /*
    //게시판 수정
    @Test
    public void testModify() {
    	
    	BoardVO board = new BoardVO();
    	board.setBno(7);
    	board.setTitle("수우정 제목");
    	board.setContent("수우정 내용");
    	
    	int result = mapper.modify(board);
    	log.info("result : " + result);
    			
    }
    */
    
    /*
    // 게시판 삭제
    @Test
    public void testDelete() {
    	
    	int result = mapper.delete(23);  //delete 메소드의 반환값은 삭제된 게시글의 개수를 의미
    	log.info("result : " + result);  // 성공적으로 삭제하면 1, 실패하면 0 반환
    	
    }
    */
    
    
    /*
    // 게시판 목록(페이징 적용) 테스트 
    @Test
    public void testGetListPaging() {
    	
    	Criteria cri = new Criteria();        //Criteria(int pageNum, int amount)
    	
    	//cri.setPageNum(1); //20~11    limit(0,10)
    	cri.setPageNum(2); //10~1 		limit(1,10)
    	cri.setAmount(10);
    	
    	List list  = mapper.getListPaging(cri);
    	list.forEach(board -> log.info("" + board));
    }
    */
    
    
    //게시물 총 갯수
	 @Test
	 public void testGetTotal() {
	
		 Criteria cri = new Criteria();
		 /*
		 cri.setKeyword("service");
		 cri.setType("T");
		 */
		 System.out.println("------------------------------------" + cri);
		 int result = mapper.getTotal();
		 
		 log.info("" + result);
	 }
	 
}
