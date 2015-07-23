package com.wxiang1991.afnetworking;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import com.opensymphony.xwork2.ActionSupport;

public class UploadAction extends ActionSupport{
	private List<File> upload = new ArrayList<File>();
	private List<String> uploadFileName = new ArrayList<String>();
	private List<String> uploadContentType = new ArrayList<String>();
	public List<File> getUpload() {
		return upload;
	}
	public void setUpload(List<File> upload) {
		this.upload = upload;
	}
	public List<String> getUploadFileName() {
		return uploadFileName;
	}
	public void setUploadFileName(List<String> uploadFileName) {
		this.uploadFileName = uploadFileName;
	}
	public List<String> getUploadContentType() {
		return uploadContentType;
	}
	public void setUploadContentType(List<String> uploadContentType) {
		this.uploadContentType = uploadContentType;
	}
	
	public String upload() throws Exception {
		System.out.println("\n\n upload1");
		System.out.println("files:");
		for (File u : upload) {
			System.out.println("*** " + u + "\t" + u.length());
		}
		System.out.println("filenames:");
		for (String n : uploadFileName) {
			System.out.println("*** " + n);
		}
		System.out.println("content types:");
		for (String c : uploadContentType) {
			System.out.println("*** " + c);
		}
		System.out.println("\n\n");
		return SUCCESS;
	}
	
}
