package com.hosick.letter;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import com.hosick.article.Article;


public class LetterDao {
	//보낸목록
	static final String SENDLIST = "select letterId, title, receiverId, receiverName, cdate from where senderId=?";
	//받은 목록
	static final String  RECEIVELIST = "select letterId, title, senderId, senderName, cdate from letter where receiverId=1379";
	//편지조회
	static final String GET_LETTER = "select letterId, title, senderId, senderName, receiverId, receiverName, cdate from letter where letterId=? and (senderId=? or receiverId=?)";
	//편지쓰기
	static final String INSERT = "insert letter(title,content,senderId,senderName,receiverId,receiverName) values(?,?,?,?,?,?)";
	//편지 삭제
	static final String DELETE = "delete from letter where letterId=9 and (senderId=? or receiverId=?)";
	
	@Autowired
	JdbcTemplate jdbcTemplate;
	
	RowMapper<Letter> letterRowMapper = new BeanPropertyRowMapper<>(
			Letter.class);
	
	//보낸 목록
	public List<Letter> sendlist(int offset, int count) {
		return jdbcTemplate.query(SENDLIST, letterRowMapper, offset,
				count);
	}
	//받은 목록
	public List<Letter> receivelist(int offset, int count) {
		return jdbcTemplate.query(RECEIVELIST, letterRowMapper, offset,
				count);
	}
	
	//편지조회
	public Letter getLetter(String letterId) {
		return jdbcTemplate.queryForObject(GET_LETTER, letterRowMapper,
				letterId);
	}
	//편지 쓰기
	public int addLetter(Letter letter) {
		return jdbcTemplate.update(GET_LETTER, letter.getTitle(),
				letter.getContent(), letter.getSenderId(), letter.getSenderName());
	}
	//편지 삭제
	public int deleteLetter(String letterId, String senderId) {
		return jdbcTemplate.update(DELETE, letterId, senderId);
	}
	

	
}
