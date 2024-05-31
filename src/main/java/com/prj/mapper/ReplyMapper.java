package com.prj.mapper;

import java.util.List;

//import com.izen.vo.Criteria;
import com.prj.vo.ReplyVO;

public interface ReplyMapper {
	
	public int replyInsert(ReplyVO vo);
	public List<ReplyVO> replyList();
	public ReplyVO replyRead(Long rno);
	public int replyDelete(Long rno);
	public int replyUpdate(ReplyVO vo);
	public List<ReplyVO> replyListByBno(Long bno);
	
}
