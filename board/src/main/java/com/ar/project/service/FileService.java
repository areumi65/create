package com.ar.project.service;

import java.io.IOException;

import com.ar.project.entity.FileDto;

public interface FileService {

		void upload(FileDto fileDto) throws IllegalStateException, IOException;
	
}
