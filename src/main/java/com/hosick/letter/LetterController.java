package com.hosick.letter;

import java.util.List;

import com.hosick.chap11.Member;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;








public class LetterController {
	
	@Autowired
	LetterDao letterDao;
	
	Logger logger = LogManager.getLogger();
	
	//보낸 메일 목록
	@GetMapping("/letter/sendlist")
	public void sendList(
			@RequestParam(value = "page", defaultValue = "1") int page,
			Model model) {

		// 페이지당 행의 수와 페이지의 시작점
		final int COUNT = 100;
		int offset = (page - 1) * COUNT;
		
		List<Letter> sendList = letterDao.sendList(offset, COUNT);
		
		model.addAttribute("sendList", sendList);
		
	}
	
	//받은 메일 목록
	@GetMapping("/letter/receivelist")
	public void receiveList(
			@RequestParam(value = "page", defaultValue = "1") int page,
			Model model) {

		// 페이지당 행의 수와 페이지의 시작점
		final int COUNT = 100;
		int offset = (page - 1) * COUNT;
				
		List<Letter> receiveList = letterDao.receiveList(offset, COUNT);
				
		model.addAttribute("receiveList", receiveList);
				
	}
	//상세 조회
	@GetMapping("/letter/view")
	public void getLetter(@RequestParam("letterId") String letterId,
			Model model) {
		Letter letter = letterDao.getLetter(letterId);
		model.addAttribute("letter", letter);
	}
	
	
	// 메일 보내기 화면
	
	@GetMapping("/letter/sendForm")
	public String letterSendForm(@SessionAttribute("MEMBER")Member member) {
		
		return "letter/sendForm";
	}
	//메일 쓰기
	@PostMapping("/letter/send")
	public String letterSend(Letter letter, 
		@SessionAttribute("MEMBER")Member member) {
		
		letter.setSenderId(member.getMemberId());
		letter.setSenderName(member.getName());
		letterDao.sendLetter(letter);
		return "redirect:/app/letter/sendlist";
	}
	//메일 삭제
	@GetMapping("/letter/delete")
	public String delete(@RequestParam("senderId") String letterId,
			@SessionAttribute("MEMBER") Member member) {
		int updatedRows = letterDao.deleteLetter(letterId,
				member.getMemberId());

		// 권한 체크 : 글이 삭제되었는지 확인
		if (updatedRows == 0)
			// 글이 삭제되지 않음. 자신이 쓴 글이 아님
			throw new RuntimeException("No Authority!");

		logger.debug("글을 삭제했습니다. letterId={}", letterId);
		return "redirect:/app/letter/sendlist";
	}
	

}
