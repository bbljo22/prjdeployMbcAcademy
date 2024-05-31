package com.prj.service;

import java.util.List;



import com.prj.vo.UserVO;

public interface UserService {
	
	
	public List<UserVO> getList(UserVO vo);//전체조회
	public UserVO getId(String id);//가입된 아이디 찾기
	public int insert(UserVO vo); //추가
	public void modifyInfo(UserVO vo); //수정
	void wihtdrow(String id); //삭제
	public UserVO successLogin(UserVO vo);//로그인 성공
	public boolean selectId(String id);//중복 아이디 확인
	public String login(String id, String password);
	UserVO getUserById(String id);
	
	
}
