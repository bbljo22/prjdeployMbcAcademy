package com.prj.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.prj.vo.BoardVO;
import com.prj.vo.Criteria;

public interface BoardMapper {
	public List<BoardVO> getList(); // 전체 조회
	public BoardVO read(Long bno); // 지정 조회
	public int insert(BoardVO vo); // 추가
	public int delete (Long bno); // 삭제
	public int update(BoardVO vo); // 수정
	public int updateViewcnt(Long bno); // 조회수 누적
	public List<BoardVO> getListWithPaging(Criteria cri); //페이지 단위로 데이터 조회
	public int getTotalCount(Criteria cri); //전체 데이터의 갯수 처리 
	
}
