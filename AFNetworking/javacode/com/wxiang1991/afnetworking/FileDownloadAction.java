package com.wxiang1991.afnetworking;

import java.io.InputStream;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

public class FileDownloadAction extends ActionSupport {
	private String inputPath;

	public String execute() throws Exception {
		return SUCCESS;
	}

	public void setInputPath(String value) {
		inputPath = sanitizeInputPath(value);
	}

	String sanitizeInputPath(String value) {
		if (value != null && value.toUpperCase().contains("WEB-INF")) {
			return null;
		}
		return value;
	}

	public InputStream getInputStream() throws Exception {
		return ServletActionContext.getServletContext().getResourceAsStream(inputPath);
	}
}
