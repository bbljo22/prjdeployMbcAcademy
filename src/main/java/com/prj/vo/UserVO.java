package com.prj.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class UserVO {
	
	private Long uno;
	private String id;
	private String password;
	private String name;
	private String email;
	private String birth;
	private String address;
	private String gender;
	private String phone;
}
