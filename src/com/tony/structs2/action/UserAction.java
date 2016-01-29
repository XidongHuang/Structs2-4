package com.tony.structs2.action;

import com.opensymphony.xwork2.ActionContext;

public class UserAction {

	private String userId;
	private String userName;
	private String desc;
	private String password;
	private boolean married = true;
	
	
	public boolean isMarried() {
		return married;
	}

	public void setMarried(boolean married) {
		this.married = married;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getDesc() {
		return desc;
	}

	public void setDesc(String desc) {
		this.desc = desc;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String save() {
		System.out.println(this);

		UserAction ua = new UserAction();
		ua.setDesc("Oracle!");
		ua.setPassword("112233");
		ua.setUserId("1001");
		ua.setUserName("tony");
		
		
		ActionContext.getContext().getValueStack().push(ua);
		
		return "input";
	}



	@Override
	public String toString() {
		return "UserAction [userId=" + userId + ", userName=" + userName + ", desc=" + desc + ", password=" + password
				+ ", married=" + married + "]";
	}

	public String update() {

		System.out.println("update");

		return "update-success";
	}

	public String delete() {

		System.out.println("delete");

		return "delete-success";
	}

	public String query() {

		System.out.println("query");

		return "query-success";
	}

	public String test() {

		System.out.println("test");

		return "query-success";
	}

}
