package com.ar.project.service;

import java.io.File;
import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.PostConstruct;
import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;

public class FileServiceImpl implements FileService{
	Path uploadPath;
	
	@PostConstruct
	void init() {
		uploadPath = Paths.get("/upload");
	}
	
	@Override
	public List<Map<String, Object>> fileUpload(HttpServletRequest request) {
		List<Map<String, Object>> uploadedFileList = new ArrayList<>();
		
		try {
			MultipartRequest mRequest = (MultipartRequest)request;
			Iterator<String> it = mRequest.getFileNames();
			while(it.hasNext()) {
				String fileName = it.next();
				List<MultipartFile> mFileList = mRequest.getFiles(fileName);
				
				for(MultipartFile mFile : mFileList) {
					String orgFileName = mFile.getOriginalFilename();
					String saveFileName = UUID.randomUUID().toString();
					
					Path filePath = uploadPath.resolve(saveFileName);
					File file = filePath.toFile();
					mFile.transferTo(file);
					
					Map<String, Object> fileMap = new HashMap<>();
					fileMap.put("orgFileName"  , orgFileName);
					fileMap.put("saveFileName" , saveFileName);
					fileMap.put("filePath"     , filePath.toString());
					fileMap.put("fileSize"     , mFile.getSize());
					uploadedFileList.add(fileMap);
				}
			}
		} catch (IllegalStateException e) {
		} catch (IOException e) {
		}
		
		return uploadedFileList;
	}
}
