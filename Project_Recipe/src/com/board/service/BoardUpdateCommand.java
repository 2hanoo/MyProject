package com.board.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.board.dao.BoardMapper;
import com.board.entity.BoardDTO;

public class BoardUpdateCommand implements BoardCommand{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {

		BoardDTO dto = new BoardDTO();
//		dto.setPage(request.getParameter("page"));
//		dto.setPageSize(request.getParameter("pageSize"));
		dto.setNum(Integer.parseInt(request.getParameter("num")));
		dto.setB_title(request.getParameter("b_title"));
		dto.setB_content(request.getParameter("b_content"));
		dto.setB_pwd(request.getParameter("b_pwd"));
		dto.setContent(request.getParameter("content"));
		dto.setImage(request.getParameter("image"));
		BoardMapper mapper = new BoardMapper();
		mapper.recipeUpdate(dto);
		mapper.close();
		
//		request.setAttribute("url", "detail.do?num="+dto.getNum()+"&page="+dto.getPage()+"&pageSize="+dto.getPageSize());
		request.setAttribute("url", "detail.do?num="+dto.getNum());
	}

}
