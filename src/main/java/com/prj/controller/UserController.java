package com.prj.controller;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.prj.service.UserService;
import com.prj.vo.UserVO;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/cafe")
@RequiredArgsConstructor //MemberService에 대한 멤버를 사용 가능
public class UserController {
	
	@Autowired
	UserService service;
	
	// 로그인 페이지
    @GetMapping("/login")
    public String login(HttpSession session) {
        return "/cafe/login";
    }
    
    // 메인 페이지
    @GetMapping("/main")
    public String main() {
        return "/cafe/main";
    }

    // 회원가입 페이지
    @GetMapping("/loginregister")
    public String join() {
        return "/cafe/loginregister";
    }

    // 회원가입 처리
    @PostMapping("/loginregister")
    public String registerPost(UserVO vo) {
        service.insert(vo);
        return "/cafe/login";
    }

    // 로그인 요청 처리
    @PostMapping(value = "/login", consumes = "application/json", produces = { MediaType.TEXT_PLAIN_VALUE })
    public ResponseEntity<String> create(@RequestBody UserVO vo, Model model, HttpSession session) {
        String result = "";
        if (service.successLogin(vo) != null) {
            result = vo.getId();
            model.addAttribute("login", result);
            session.setAttribute("id", vo);
        } else {
            result = "fail";
        }
        return new ResponseEntity<>(result, HttpStatus.OK);
    }

    // 아이디 중복 확인
    @PostMapping("/ConfirmId")
    @ResponseBody
    public ResponseEntity<Boolean> confirmId(String id) {
        boolean result = true;
        if (id.trim().isEmpty()) {
            result = false;
        } else {
            if (service.selectId(id)) {
                result = false;
            } else {
                result = true;
            }
        }
        return new ResponseEntity<>(result, HttpStatus.OK);
    }

    // 마이페이지
    @GetMapping("/mypage")
    public String home(HttpSession session, Model model) {
        UserVO vo = (UserVO) session.getAttribute("id");
        if (vo.getId() != null) {
            UserVO userVO = service.getUserById(vo.getId());
            model.addAttribute("user", userVO);
            return "/cafe/mypage";
        }
        return "redirect:/cafe/login";
    }

    // 회원 정보 수정 페이지
//    @GetMapping("/update")
//    public String toUpdatePage(HttpSession session, Model model) {
//        UserVO vo = (UserVO) session.getAttribute("id");
//        UserVO voData = service.getUserById(vo.getId());
//        if(userVO != null ) {
//        	System.out.println("계정 조회: " + userVO.toString());
//        }else {
//        	System.out.println("계정이 없다: "+ id);
//        }
//        model.addAttribute("user", voData);
//        return "/cafe/update";
//    }

    // 회원 정보 수정 처리
//    @PostMapping("/update")
//    public String modifyInfo(UserVO userVO, Model model) {
//    	System.out.println("수정할 정보: "+ userVO);
//    	boolean vv = service.modifyInfo(userVO);
//    	
//        return "redirect:/cafe/mypage";
//    }

    // 회원 탈퇴 처리
    @PostMapping("/delete")
    public String withdraw(HttpSession session) {
        String id = (String) session.getAttribute("id");
        if (id != null) {
            service.wihtdrow(id);
        }
        session.invalidate();
        return "redirect:/main";
    }

    // 로그아웃
    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/cafe/main";
    }
	

}
