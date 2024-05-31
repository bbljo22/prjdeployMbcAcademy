package com.prj.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.prj.mapper.ReplyMapper;
import com.prj.mapper.UserMapper;
import com.prj.vo.ReplyVO;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class ReplyServiceImpl implements ReplyService{
	
	@Autowired
	ReplyMapper mapper;
	
	@Override
	public int replyInsert(ReplyVO vo) {
		System.out.println("댓글 추가");
		return mapper.replyInsert(vo);
	}

	@Override
	public List<ReplyVO> replyList() {
		System.out.println("댓글 조회");
		return mapper.replyList();
	}

	@Override
	public ReplyVO replyRead(Long rno) {
		System.out.println("댓글 rno 조회");
		return mapper.replyRead(rno);
	}

	@Override
	public int replyDelete(Long rno) {
		System.out.println("댓글 삭제");
		return mapper.replyDelete(rno);
	}

	@Override
	public int replyUpdate(ReplyVO vo) {
		System.out.println("댓글 수정");
		return mapper.replyUpdate(vo);
	}

	@Override
	public List<ReplyVO> replyListByBno(Long bno) {
		System.out.println("댓글	bno 조회");
		return mapper.replyListByBno(bno);
	}

}
