package com.board.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.board.dao.BoardMapper;
import com.board.entity.BoardDTO;

public class BoardWriteCommand implements BoardCommand{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		BoardDTO dto = new BoardDTO();
		dto.setB_title(request.getParameter("b_title"));
		dto.setNum(Integer.parseInt(request.getParameter("num")));
		dto.setB_pwd(request.getParameter("b_pwd"));
//		dto.setCg_num(Integer.parseInt(request.getParameter("cg_num")));
		dto.setB_content(request.getParameter("b_content"));
//		dto.setThumbnail(request.getParameter("thumbnail"));
//		dto.setContent(request.getParameter("content"));
//		dto.setImage(request.getParameter("image"));
		
		BoardMapper mapper = new BoardMapper();
		mapper.recipeInsert(dto);
		
		request.setAttribute("url", "recipeList.do");
	}
}
