package com.kh.finalProject.manager.model.vo;

public class MPagination {
	
	public static MPageInfo getPageInfo(int currentPage, int listCount) {
		
		MPageInfo mpi = null;
		
		int pageLimit = 10; 
		int maxPage;
		int startPage;
		int endPage;
		
		int limit = 20;
		
		maxPage = (int)((double)listCount / limit + 0.95);
		
		startPage = ((int)((double)currentPage / pageLimit + 0.95) - 1) * limit + 1;
		
		endPage = startPage + pageLimit - 1;
		
		if(maxPage < endPage) {
			endPage = maxPage;
		}
		
		mpi = new MPageInfo(currentPage, listCount, pageLimit, maxPage, startPage, endPage, limit);
		
		return mpi;
		
	}

}
