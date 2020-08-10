package com.kh.finalProject.manager.model.vo;

public class RPagination {
	
	public static RPageInfo getPageInfo(int currentPage, int listCount, String id, int rprNo) {
		
		RPageInfo rpi = null;
		
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
		
		rpi = new RPageInfo(currentPage, listCount, pageLimit, maxPage, startPage, endPage, limit, id, rprNo);
		
		return rpi;
		
	}

}
