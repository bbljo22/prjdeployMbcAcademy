package com.prj.mapper;

import java.util.List; 

import com.prj.vo.UserVO;

public interface UserMapper {
	public List<UserVO> getList(UserVO vo);//전체조회
	public UserVO getUserById(String id);//가입된 아이디 찾기
	public int insert(UserVO vo); //추가
	public void update(UserVO vo); //수정
	void delete(String id); //삭제
	public UserVO successLogin(UserVO vo);//로그인 성공 여부 확인
	public boolean selectId(String id); //중복 Id 검색
	UserVO getUserByEmail(String email);
}
