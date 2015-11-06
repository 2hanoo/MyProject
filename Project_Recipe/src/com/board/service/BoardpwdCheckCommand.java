package com.board.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.board.dao.BoardMapper;
import com.board.entity.BoardDTO;

public class BoardpwdCheckCommand implements BoardCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String num = request.getParameter("num");
		String b_pwd = request.getParameter("b_pwd");
		
		BoardDTO dto = new BoardDTO();
		dto.setNum(Integer.parseInt(num));
		dto.setB_pwd(b_pwd);
		
		BoardMapper mapper = new BoardMapper();
		int result = mapper.pwdCheck(dto);
		
		request.setAttribute("result", result);
	}
}
