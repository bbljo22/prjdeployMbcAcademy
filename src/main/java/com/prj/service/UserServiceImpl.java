package com.prj.service;

import java.util.List; 

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.prj.mapper.UserMapper;
import com.prj.vo.UserVO;

import lombok.AllArgsConstructor;



@Service
@AllArgsConstructor
public class UserServiceImpl implements UserService {

	@Autowired
	private UserMapper mapper;
	
	@Override
	public List<UserVO> getList(UserVO vo) {
		System.out.println("전체조회");
		return mapper.getList(vo);
	}

	@Override
	public UserVO getUserById(String id) {
		System.out.println("아이디 조회");
		return mapper.getUserById(id);
	}

	@Override
	public int insert(UserVO vo) {
		System.out.println("추가");
		return mapper.insert(vo);
	}

	@Override
	public void modifyInfo(UserVO vo) {
		System.out.println("수정하기");
		mapper.update(vo);
	}

	@Override
	public void wihtdrow(String id) {
		System.out.println("삭제하기");
		mapper.delete(id);
	}

	@Override
	public UserVO successLogin(UserVO vo) {
		UserVO loginvo = mapper.successLogin(vo);
		System.out.println("로그인성공"+loginvo);
		return loginvo;
	}

	@Override
	public boolean selectId(String id) {
	    System.out.println("Service :: selectId...............");
	    return mapper.selectId(id);
	}



	public String login(String id, String password) {
		UserVO userVO = mapper.getUserByEmail(id);
		if(userVO.getPassword().equals(password))
			return userVO.getId();
		return null;
	}

	@Override
	public UserVO getId(String id) {
		System.out.println(mapper.getUserById(id));
		return null;
	}



}
