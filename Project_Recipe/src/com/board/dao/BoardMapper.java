package com.board.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.board.entity.BoardDTO;
import com.mybatis.SqlMapConfig;
import com.sun.istack.internal.logging.Logger;

public class BoardMapper {
	Logger logger = Logger.getLogger(BoardMapper.class);
	
	private SqlSessionFactory factory = SqlMapConfig.getSqlSession();
	private SqlSession sqlSession;

	public BoardMapper() {
		sqlSession = factory.openSession(true);
	}
	//게시판 목록 조회
	public List<BoardDTO> recipeList(){
		logger.info("BoardList 호출");
		return sqlSession.selectList("recipeList");
	}
	//상세 게시판 조회
	public BoardDTO recipeDetail(int b_num) {
		return (BoardDTO)sqlSession.selectOne("recipeDetail",b_num);
	}
	//컨텐츠 부분 조회
	public List<BoardDTO> recipeContent(int num) {
		return sqlSession.selectList("recipeContent", num);
	}
	//조회수 증가
	public void readcntUpdate(int num) {
		sqlSession.update("readcntUpdate",num);
	}
//	//추천수 증가
//	public void b_likeUpdate(int num) {
//		sqlSession.update("b_likeUpdate",num);
//	}
	//게시글 작성
	public void recipeInsert(BoardDTO dto) {
		sqlSession.insert("recipeInsert",dto);
	}
//	//회원가입
//	public void joinInsert(BoardDTO dto) {
//		sqlSession.insert("joinInsert",dto);
//	}
//	//암호 체크
//	public int pwdCheck(BoardDTO dto){
//		return (int)sqlSession.selectOne("pwdCheck",dto);
//	}
//	//게시글 수정
//	public void recipeUpdate(BoardDTO dto) {
//		sqlSession.update("recipeUpdate",dto);
//	}
//	//게시글 삭제
//	public void delete(int num) {
//		sqlSession.delete("delete",num);
//	}
	public void close(){
		sqlSession.close();
	}
}
