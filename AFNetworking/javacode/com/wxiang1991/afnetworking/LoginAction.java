package com.wxiang1991.afnetworking;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

public class LoginAction extends ActionSupport {
	private String username;
	private String password;

	private String foo;
	private String baz[];

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getFoo() {
		return foo;
	}

	public void setFoo(String foo) {
		this.foo = foo;
	}

	public String[] getBaz() {
		return baz;
	}

	public void setBaz(String[] baz) {
		this.baz = baz;
	}

	public String execute() throws Exception {
		return SUCCESS;
	}

	public String register() throws Exception {
		System.out.println("username=" + getUsername() + "password=" + getPassword());
		return SUCCESS;
	}

	public String paramWithArray() throws Exception {
		HttpServletRequest request = ServletActionContext.getRequest();
		System.out.println(request.getQueryString());
		System.out.println("foo=" + getFoo());
		for (String n : getBaz()) {
			System.out.println("*** " + n);
		}
		return SUCCESS;
	}
}
