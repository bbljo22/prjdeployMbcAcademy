package com.prj.controller;

import java.util.List;

import org.apache.catalina.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.prj.vo.ReplyVO;
import com.prj.vo.UserVO;
import com.prj.service.ReplyService;
import com.prj.service.UserService;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/board")
@Slf4j
public class Replycontroller {
	
	@Autowired
	private ReplyService service;
	
	@Autowired
	private UserService userService;
	
	@PostMapping(value="/replyadd", consumes = "application/json",
			produces = {
					MediaType.APPLICATION_JSON_UTF8_VALUE})
	//@ResponseBody
	public ResponseEntity<List<ReplyVO>> create(@RequestBody ReplyVO vo, UserVO uu){
		if(uu.getId() == null) {
			// 로그인되지 않은 사용자는 댓글을 작성할 수 없음
			return new ResponseEntity<>(HttpStatus.UNAUTHORIZED);
		}
		
		String username = uu.getId();
        UserVO user = userService.getId(username);
        if (user == null) {
            // 사용자 정보를 찾을 수 없음
            return new ResponseEntity<>(HttpStatus.UNAUTHORIZED);
        }
		
		log.info("replyVO"+vo);
		service.replyInsert(vo);
		List<ReplyVO> list = service.replyList();
		//댓글이 추가되면 FRONTEND에 success를 전송함
		return new ResponseEntity<>(list, HttpStatus.OK);
				
	}
	
	
	//p395
	@GetMapping(value="/a",produces = {
			MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<List<ReplyVO>> getList(Long bno){
		log.info("페이지 컨트롤러 bno : "+bno);
		List<ReplyVO> list = service.replyListByBno(bno);
		return new ResponseEntity<>(service.replyList(), HttpStatus.OK);
	}
	
	
	
	
	//p397
	@GetMapping(value="/{rno}",
			produces = {MediaType.APPLICATION_XML_VALUE,
					MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<ReplyVO> get(@PathVariable("rno") Long rno){
		log.info("댓글 조회 : rno "+ rno);
		return new ResponseEntity<>(service.replyRead(rno), HttpStatus.OK);
	}
}
