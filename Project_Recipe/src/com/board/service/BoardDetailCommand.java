package com.board.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import com.board.dao.BoardMapper;
import com.board.entity.BoardDTO;

public class BoardDetailCommand implements BoardCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		Logger logger = Logger.getLogger(BoardDetailCommand.class);
		
		String num = request.getParameter("num");

		BoardMapper mapper = new BoardMapper();
		mapper.readcntUpdate(Integer.parseInt(num));
		BoardDTO data = mapper.recipeDetail(Integer.parseInt(num));
		List<BoardDTO> recipeContent = mapper.recipeContent(Integer.parseInt(num));

		if (data.getContent() != null && (!data.getContent().equals(""))) {
			data.setContent(data.getContent().toString().replaceAll("\n", "<br>"));
		}
		request.setAttribute("recipeDetail", data);
		request.setAttribute("recipeContent", recipeContent);
		
		logger.info("Detail 호출 : "+request +","+data);
	}

}
