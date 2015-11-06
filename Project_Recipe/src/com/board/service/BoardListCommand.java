package com.board.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import com.board.dao.BoardMapper;
import com.board.entity.BoardDTO;

public class BoardListCommand implements BoardCommand{
	Logger logger = Logger.getLogger(BoardListCommand.class);
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		logger.info("ListCommand");
		BoardMapper mapper = new BoardMapper();
		List<BoardDTO> recipeList = mapper.recipeList();
		request.setAttribute("recipeList", recipeList);
		logger.info("ListCommand 리턴");
	}//end execute
}//end class
 