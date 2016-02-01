package com.tony.struts2.app;

import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.RequestAware;

public class Employee implements RequestAware {

	private Map<String, Object> requestMap = null;
	
	private Dao dao = new Dao();
	
	private String name;
	private String password;
	private String gender;
	private String dept;
	
	private List<String> roles;
	private String desc;
	
	public String input(){
		
		requestMap.put("depts", dao.getDepartments());
		requestMap.put("roles", dao.getRoles());
		
		return "input";
	}

	public Map<String, Object> getRequestMap() {
		return requestMap;
	}

	public void setRequestMap(Map<String, Object> requestMap) {
		this.requestMap = requestMap;
	}

	public Dao getDao() {
		return dao;
	}

	public void setDao(Dao dao) {
		this.dao = dao;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getDept() {
		return dept;
	}

	public void setDept(String dept) {
		this.dept = dept;
	}

	public List<String> getRoles() {
		return roles;
	}

	public void setRoles(List<String> roles) {
		this.roles = roles;
	}

	public String getDesc() {
		return desc;
	}

	public void setDesc(String desc) {
		this.desc = desc;
	}

	@Override
	public void setRequest(Map<String, Object> arg0) {
			this.requestMap = arg0;
	
	}
	
	
	
	

	public Employee(String name, String password, String gender, String dept, List<String> roles, String desc) {
		super();
		this.name = name;
		this.password = password;
		this.gender = gender;
		this.dept = dept;
		this.roles = roles;
		this.desc = desc;
	}

	public String save(){
		System.out.println("save: " + this);
		
		
		return "save";
	}
	
}
