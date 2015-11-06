package com.board.common;

import com.board.entity.BoardDTO;

public class Paging {
	/**
	 * 페이징을 위한 설정 작업
	 * @param bvo
	 */
	public static void set(BoardDTO dto){
		int page = Util.nvl(dto.getPage(),1);
		int pageSize = Util.nvl(dto.getPageSize(),3);
		
		if(dto.getPage()==null) dto.setPage(page+"");
		if(dto.getPageSize()==null) dto.setPageSize(pageSize+"");
		
		int start_row = (page-1)*pageSize +1;
		int end_row = (page-1)*pageSize+pageSize;
		
		dto.setStart_row(start_row+"");
		dto.setEnd_row(end_row+"");
		
		System.out.println("start_row : "+dto.getStart_row());//test확인용
		System.out.println("end_row : "+dto.getEnd_row());
	}
}
