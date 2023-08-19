package com.sh.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sh.model.BoardVO;
import com.sh.model.Criteria;
import com.sh.model.PageMakerDTO;
import com.sh.service.BoardService;

@Controller
@RequestMapping("/board/*")
public class BoardController {

	private static final Logger log = LoggerFactory.getLogger(BoardController.class);
   
	@Autowired
    private BoardService service;
	
    
    /* 게시판 목록 페이지 접속 --> 페이징 적용 추가*/
	
	/*
    @GetMapping("/list")
    public void boardListGET(Model model) {
    	
    	log.info("게시판 목록 페이지 진입");
    	
    	model.addAttribute("list", service.getList());
    	
    }
    */
	
    @GetMapping("/list")
    public void boardListGET(Model model, Criteria cri) {
        
        log.info("게시판 목록 진입(페이징)");
        
        model.addAttribute("list", service.getListPaging(cri));
        
        int total = service.getTotal(cri);
        
        PageMakerDTO pageMake = new PageMakerDTO(cri, total);
        
        model.addAttribute("pageMaker", pageMake);
    }
	
    /* 게시판 등록 페이지 접속 */
    @GetMapping("/enroll")
    public void boardEnrollGET() {
        
        log.info("게시판 등록 페이지 진입");
        
    }	

    /* 게시판 등록 */
    @PostMapping("/enroll")
    public String boardEnrollPOST(BoardVO board, RedirectAttributes rttr) { 
        
        log.info("BoardVO : " + board);
        
        service.enroll(board);
        
        rttr.addFlashAttribute("result", "enroll success"); //일회성 전달하기 위한 addFlashAttribute()
        
		return "redirect:/board/list";
        
    }


    /* 게시판 조회 */
    @GetMapping("/get")
    public void boardGetPageGET(int bno, Model model, Criteria cri) {
    	
    	model.addAttribute("pageInfo", service.getPage(bno));
    	model.addAttribute("cri", cri);    // 조회(get.jsp)>다시 목록으로 돌아갈 때 원래 페이지로 돌아가기 위해 가져올 pageNum,amount데이터가 있는 Criteria 인스턴스 저장
    	
    }


    /* 수정 페이지 이동 */
    @GetMapping("/modify")
    public void boardModifyGET(int bno, Model model, Criteria cri) {
    	
    	model.addAttribute("pageInfo", service.getPage(bno));
    	model.addAttribute("cri", cri);    // 수정->목록 돌아갈때 원래페이지 돌아가기위한 Criteria 인스턴스 저장  
    	
    }

    /* 페이지 수정 */
    @PostMapping("/modify")
    public String boardModifyPOST(BoardVO board, RedirectAttributes rttr, Model model,Criteria cri) {
    		
    		service.modify(board);
    		
    		rttr.addFlashAttribute("result", "modify success");
    		
            // 페이지 번호와 페이지 크기를 RedirectAttributes에 추가
            rttr.addAttribute("pageNum", cri.getPageNum());
            rttr.addAttribute("amount", cri.getAmount());
    		
    		
    		//model.addAttribute("cri", cri);
    		

    		log.info("" + cri);
    		
    		return "redirect:/board/list";
    		
    }

    
    /* 페이지 삭제 */
    @PostMapping("/delete")
    public String boardDeletePost(int bno, RedirectAttributes rttr) {
		
    		service.delete(bno);
    		
    		rttr.addFlashAttribute("result", "delete success");
    	
    		return "redirect:/board/list";
    }
}
