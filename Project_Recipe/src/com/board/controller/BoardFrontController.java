package com.board.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import com.board.service.BoardCommand;
import com.board.service.BoardDetailCommand;
import com.board.service.BoardListCommand;
import com.board.service.BoardUpdateCommand;
import com.board.service.BoardWriteCommand;
import com.board.service.BoardpwdCheckCommand;
import com.board.service.JoinInsertCommand;


@WebServlet(urlPatterns = { "/board/", "*.do"})
public class BoardFrontController extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
	private Logger logger = Logger.getLogger(BoardFrontController.class);
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		doPost(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		request.setCharacterEncoding("UTF-8");
		String requestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String com = requestURI.substring(contextPath.length());
		
		BoardCommand command = null;
		String nextPage = null;
		//
		if(com.equals("/board/MainDisplay.do")){
			nextPage = "MainDisplay.jsp";
		}
		//목록보기
		if(com.equals("/board/recipeList.do")){
			logger.info("recipeList 호출성공");
			command = new BoardListCommand();
			command.execute(request, response);
			logger.info("recipeList 리턴 (request) : "+request+"(response) : "+ response);
			nextPage =  "recipeList.jsp";
		}
		//글 자세히 보기
		if(com.equals("/board/recipeDetail.do")){
			logger.info("recipeDetail 호출성공");
			command = new BoardDetailCommand();
			command.execute(request, response);
			logger.info("recipeDetail 리턴 (request) : "+request+"(response) : "+ response);
			nextPage ="recipeDetail.jsp";
		}

		//글쓰기 폼
		if(com.equals("/board/recipeInsert.do")){
			nextPage = "recipeInsert.jsp";
		}
		
		//글쓰기
		if(com.equals("/board/insert.do")){
			logger.info("insert 호출성공");
			command = new BoardWriteCommand();
			command.execute(request, response);
			nextPage = "movePage.jsp";
		}
		/*
		if(com.equals("/board/joinInsert.do")){
			logger.info("joinInsert 호출성공");
			command = new JoinInsertCommand();
			command.execute(request, response);
			nextPage = "movePage.jsp";
		}
		//비밀번호 입력화면
		//비밀번호 체크
		if(com.equals("/board/pwdCheck.do")){
			logger.info("pwdCheck 호출성공");
			command = new BoardpwdCheckCommand();
			command.execute(request, response);
			nextPage = "pwdCheck.jsp";
		}
//		
		//글 수정 화면 보기
		if(com.equals("/board/recipeUpdate.do")){
			logger.info("recipeUpdate 호출성공");
			command = new BoardDetailCommand();
			command.execute(request, response);
			nextPage = "recipeUpdate.jsp";
		}
//		
		//글 수정 하기
		if(com.equals("/board/update.do")){
			logger.info("Update 호출성공");
			command = new BoardUpdateCommand();
			command.execute(request, response);
			nextPage = "movePage.jsp";
		}
//		
//		//글 삭제 하기
//		if(com.equals("/board/delete.do")){
//			logger.info("Delete 호출성공");
//			command = new BoardDeleteCommand();
//			command.execute(request, response);
//			nextPage = "movePage.jsp";
//		}
//
		//페이징 처리
		if(com.equals("/board/list.do")){
			command = new BoardPageCommand();
			command.execute(request, response);
			nextPage = "listPage.jsp";
		}
			*/	
		RequestDispatcher dis = request.getRequestDispatcher("/board/"+nextPage);
		dis.forward(request, response);
	}

}
