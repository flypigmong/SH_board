package com.sh.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sh.model.BoardVO;
import com.sh.service.BoardService;

@Controller
@RequestMapping("/board/*")
public class BoardController {

	private static final Logger log = LoggerFactory.getLogger(BoardController.class);
   
	@Autowired
    private BoardService service;
	
    @GetMapping("/list")
    public void boardListGET() {
        
        log.info("게시판 목록 페이지 진입");
        
    }
    
    @GetMapping("/enroll")
    public void boardEnrollGET() {
        
        log.info("게시판 등록 페이지 진입");
        
    }	

    /* 게시판 등록 */
    @PostMapping("/enroll")
    public String boardEnrollPOST(BoardVO board, RedirectAttributes rttr) {
        
        log.info("BoardVO : " + board);
        
        service.enroll(board);
        
        rttr.addFlashAttribute("result", "enroll success");
        
		return "redirect:/board/list";
        
    }









}
