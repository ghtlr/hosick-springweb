package com.hosick.letter;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;







public class LetterController {
	
	@Autowired
	LetterDao letterDao;
	
	//@GetMapping("\")
	public void sendList(
			@RequestParam(value = "page", defaultValue = "1") int page,
			Model model) {

		// 페이지당 행의 수와 페이지의 시작점
		final int COUNT = 100;
		int offset = (page - 1) * COUNT;
		
		List<Letter> sendList = letterDao.sendlist(offset, COUNT);
		
		model.addAttribute("sendList", sendList);
		
	}
	//@GetMapping("\")
	public void receiveList(
			@RequestParam(value = "page", defaultValue = "1") int page,
			Model model) {

		// 페이지당 행의 수와 페이지의 시작점
		final int COUNT = 100;
		int offset = (page - 1) * COUNT;
				
		List<Letter> receiveList = letterDao.receivelist(offset, COUNT);
				
		model.addAttribute("receiveList", receiveList);
				
	}
	//조회
	//@GetMapping("//")
	public void getLetter(@RequestParam("letterId") String letterId,
			Model model) {
		Letter letter = letterDao.getLetter(letterId);
		model.addAttribute("letter", letter);
	}
	//쓰기
	
	
	

}
