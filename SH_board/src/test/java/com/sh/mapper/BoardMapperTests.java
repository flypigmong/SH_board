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
    
    /* 게시판 목록 테스트 */
    @Test
    public void testGetList() {
        
        List list = mapper.getList();
       /* 일반적 for문 */
        for(int i = 0; i < list.size();i++) {
            log.info("" + list.get(i));
        }
        
    }


    
}
