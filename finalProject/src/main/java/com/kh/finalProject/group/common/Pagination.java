package com.kh.finalProject.group.common;

public class Pagination {

	public static PageInfo getPageInfo(int currentPage, int listCount) {
		PageInfo pi = null;
		
		// 한번에 뿌려줄 page 수
		int pageLimit = 10;
		int maxPage;
		int startPage;
		int endPage;
		
		// 뿌려줄 게시글 수
		int boardLimit = 5;
		
		maxPage = (int)((double)listCount/boardLimit+0.9);
		
		startPage = ((int)((double)currentPage/pageLimit + 0.9)-1)*pageLimit + 1;
		
		endPage = startPage + pageLimit - 1;
		
		if(maxPage < endPage) {
			endPage = maxPage;
		}
		
		pi = new PageInfo(currentPage, listCount, pageLimit, maxPage, startPage, endPage, boardLimit);
		
		return pi;
		
	}
}
