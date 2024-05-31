package com.prj.service;

import java.util.List;

import com.prj.vo.ReplyVO;

public interface ReplyService {

	public int replyInsert(ReplyVO vo);
	public List<ReplyVO> replyList();
	public ReplyVO replyRead(Long rno);
	public int replyDelete(Long rno);
	public int replyUpdate(ReplyVO vo);
	public List<ReplyVO> replyListByBno(Long bno);
}
