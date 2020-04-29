package com.ar.project.entity;


import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class FileDto {
	
	private int file_no, board_no;
	private String file_uploadname, file_savename,file_type;
	private long file_size;
	private List<MultipartFile> file;
	
}
