package com.prj.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.prj.mapper.BoardMapper;
import com.prj.vo.BoardVO;
import com.prj.vo.Criteria;

@Service
public class BoardServiceImpl implements BoardService{

	@Autowired
	private BoardMapper mapper;
	
	/*
	 * @Override public List<BoardVO> getBoardList() { System.out.println("전체 조회");
	 * return mapper.getList(); }
	 */
	
	@Override
	public List<BoardVO> getBoardList(Criteria cri) {
		System.out.println("페이지 단위로 전체조회");
		return mapper.getListWithPaging(cri);
	}

	@Override
	public BoardVO get(Long bno) {
		System.out.println(bno+"번 게시물을 검색했습니다");
		return mapper.read(bno);
	}

	@Override
	public int register(BoardVO vo) {
		System.out.println("서비스에 등록 되었습니다"+vo);
		return mapper.insert(vo);
	}

	@Override
	public boolean modify(BoardVO vo) {
		System.out.println(vo+"수정되었습니다");
		return mapper.update(vo)==1;
	}

	@Override
	public boolean remove(Long bno) {
		System.out.println(bno+"번 게시물이 삭제되었습니다");
		return mapper.delete(bno)==1;
	}

	@Override
	public int updateReadcnt(Long bno) {
		System.out.println("조회수 추가 되었습니다");
		return mapper.updateViewcnt(bno);
	}

	@Override
	public int getTotal(Criteria cri) {
		return mapper.getTotalCount(cri);
	}


	
	

}
