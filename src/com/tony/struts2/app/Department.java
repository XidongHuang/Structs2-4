package com.tony.struts2.app;

public class Department {
	public Department() {
		super();
	}

	public Department(Integer departmentId, String deptName) {
		super();
		this.departmentId = departmentId;
		this.deptName = deptName;
	}

	public Integer getDepartmentId() {
		return departmentId;
	}

	public void setDepartmentId(Integer departmentId) {
		this.departmentId = departmentId;
	}

	public String getDeptName() {
		return deptName;
	}

	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}

	private Integer departmentId;
	private String deptName;
}
