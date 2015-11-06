package com.board.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.board.dao.BoardMapper;
import com.board.entity.BoardDTO;

public class JoinInsertCommand implements BoardCommand{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		BoardDTO dto = new BoardDTO();
		dto.setId(request.getParameter("id"));
		dto.setPasswd(request.getParameter("passwd"));
		dto.setName(request.getParameter("name"));
		dto.setNickname(request.getParameter("nickname"));
		dto.setEmail(request.getParameter("email"));
		dto.setPhone(request.getParameter("phone"));
		
		BoardMapper mapper = new BoardMapper();
		mapper.joinInsert(dto);
		
		request.setAttribute("url", "MainDisplay.do");
	}
}
