package com.ar.project.entity;


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
	private String file_uploadname, file_savename;
	private long file_size;
	
}
