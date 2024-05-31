package com.prj.service;

import java.util.List;

import com.prj.vo.Criteria;
import com.prj.vo.BoardVO;

public interface BoardService {
	
	public List<BoardVO> getBoardList(Criteria cri); // 전체조회 / 페이지 단위로 전체조회
	public BoardVO get(Long bno); // 지정조회
	public int register (BoardVO vo); // 추가
	public boolean modify(BoardVO vo); // 수정
	public boolean remove(Long bno); // 삭제
	public int updateReadcnt(Long bno); // 조회수
	
	public int getTotal(Criteria cri);
	
	

}
