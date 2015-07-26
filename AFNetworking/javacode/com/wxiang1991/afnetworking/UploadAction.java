package com.wxiang1991.afnetworking;

import java.io.File;

import com.opensymphony.xwork2.ActionSupport;

public class UploadAction extends ActionSupport{
	private File upload;
	private String uploadFileName;
	private String uploadContentType;
	public File getUpload() {
		return upload;
	}
	public void setUpload(File upload) {
		this.upload = upload;
	}
	public String getUploadFileName() {
		return uploadFileName;
	}
	public void setUploadFileName(String uploadFileName) {
		this.uploadFileName = uploadFileName;
	}
	public String getUploadContentType() {
		return uploadContentType;
	}
	public void setUploadContentType(String uploadContentType) {
		this.uploadContentType = uploadContentType;
	}
	
	public String execute() throws Exception {
		return SUCCESS;
	}
	
	public String upload() throws Exception {
		System.out.println(getUploadContentType());
		System.out.println(getUploadFileName());
		return SUCCESS;
	}
	
}
