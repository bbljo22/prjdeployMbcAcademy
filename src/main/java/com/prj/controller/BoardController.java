package com.prj.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.prj.vo.BoardVO;
import com.prj.vo.Criteria;
import com.prj.vo.PageDTO;
import com.prj.service.BoardService;

@Controller
@RequestMapping("/board/*")
public class BoardController {

	@Autowired
	private BoardService service;

	@GetMapping("/list")
	public String list(Model model, Criteria cri) {
		model.addAttribute("board", service.getBoardList(cri));
		model.addAttribute("pageMaker", new PageDTO(cri, service.getTotal(cri)));
		return "/board/list";
	}

	@GetMapping("/register")
	public String register() {
		return "/board/register";
	}

	@PostMapping("/register")
	public String registerPost(BoardVO vo) {
		System.out.println("컨트롤러에서 등록");
		vo.setViews(0);
		service.register(vo);
		return "redirect:/board/list";
	}

	@PostMapping("/updateReadcnt")
	@ResponseBody
	public String updateReadcnt(@RequestParam("bno") Long bno, Model model) { // 조회수-> ajax로
		System.out.println("컨트롤러 디버깅 bno: " + bno);
		service.updateReadcnt(bno);
		return "200";
	}

	@GetMapping({ "/detail", "/modify" })
	public void get(Long bno, Model model) {
		System.out.println("게시물 번호 : " + bno);
		model.addAttribute("board", service.get(bno));
	}

	@PostMapping("/modify")
	public String modify(BoardVO vo, RedirectAttributes rttr) {
		System.out.println("컨트롤러에서 수정:" + vo);
	    if (service.modify(vo)) {
	        rttr.addFlashAttribute("message", "게시글이 수정되었습니다.");
	    }
		return "redirect:/board/detail?bno=" + vo.getBno();
	}

	@PostMapping("/remove")
	public String remove(Long bno, RedirectAttributes rttr) {
		System.out.println("컨트롤러 삭제:" + bno);
	    if (service.remove(bno)) {
	        rttr.addFlashAttribute("message", "게시글이 삭제되었습니다.");
	    }
		return "redirect:/board/list";
	}

}
