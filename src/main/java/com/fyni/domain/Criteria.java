package com.fyni.domain;

public class Criteria {
	private int page;
	private int pagepernum;
	
	public Criteria() {
		this.page = 1;
		this.pagepernum = 10;
	}
	
	public void setPage(int page) {
		if(page <= 0) {
			this.page = 1;
			return;
		}
		this.page = page;
	}
	
	public void setPagePerNum(int pagepernum) {
		if(pagepernum <= 0 || pagepernum > 100) {
			this.pagepernum = 10;
			return;
		}
		this.pagepernum = pagepernum;
	}

	public int getPage() {
		return page;
	}

	public int getPagepernum() {
		return pagepernum;
	}
	
	public int getPageStart() {
		return (this.page - 1) * pagepernum;
	}

	@Override
	public String toString() {
		return "Criteria [page=" + page + ", pagepernum=" + pagepernum + "]";
	}
}
