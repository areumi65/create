package com.ar.project.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class BoardDto {

	private int board_no, board_readcount;
	private String board_head,
								board_title,
								board_write_date, 
								board_writer, 
								board_content,
								deleteFileNo;
							
	private int reply_no, reply_pw;
	private String reply_writer, reply_wtite_date, reply_content;
	
	
	
}
