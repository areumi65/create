package com.ar.project.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public interface FileService {

	List<Map<String, Object>> fileUpload(HttpServletRequest request);

	
}
