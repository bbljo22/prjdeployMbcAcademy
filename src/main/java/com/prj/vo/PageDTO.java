package com.prj.vo;

import com.prj.vo.Criteria;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class PageDTO {
	private int startPage;
	private int endPage;
	private boolean next; // 이전페이지
	private boolean prev; // 다음페이지
	private int total; // 총 데이터의 갯수
	private Criteria cri;
	
	public PageDTO (Criteria cri ,int total) {
		this.cri=cri;
		this.total=total;
		
		this.endPage=(int)(Math.ceil(cri.getPageNum()/10.0))*10;//마지막 페이지 번호
		//페이지 번호를 5라고 가정하면 10으로 나누면 0.5가 되고   ceil을 하면 1.0이되고,  정수형 형변환하면 1이되고  
		//10을 곱하면  10이됨 
		this.startPage= this.endPage-9;// 첫번째 페이지 번호
		int realEnd=(int)(Math.ceil((total * 1.0) / cri.getAmount()));//실제 마지막 페이지는 
		//만약 56개의 데이터가 있으면 6페이지이고 마지막 페이지에는 6개가 있음 
		
		if (realEnd < this.endPage) this.endPage=realEnd;
		this.prev=this.startPage>1;//1보다 크면 이전페이지가 있음
		this.next =this.endPage<realEnd;//마지막페이지에는 next 가 없음 
	}
}
