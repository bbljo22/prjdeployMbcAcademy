package com.prj.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@ToString

public class BoardVO {
	
	private long bno;
	private String title;
	private String content;
	private String writer;
	private Date regDate;
	private int views;

}
