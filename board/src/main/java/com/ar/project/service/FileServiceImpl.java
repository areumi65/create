package com.ar.project.service;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.apache.tika.Tika;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.multipart.MultipartFile;

import com.ar.project.entity.BoardDto;
import com.ar.project.entity.FileDto;
import com.ar.project.repository.BoardDao;

public class FileServiceImpl implements FileService{

	@Autowired
	private BoardDao boardDao;
	
	@Override
	public void upload(FileDto fileDto) throws IllegalStateException, IOException {
			
		List<FileDto> list = new ArrayList<>();
		for(MultipartFile mf : fileDto.getFile())	{
			
			int file_no = boardDao.getFileSequence();
			list.add(fileDto.builder()
									.file_no(file_no)
									.file_uploadname(mf.getOriginalFilename())
									.file_savename(UUID.randomUUID().toString())
									.file_size(mf.getSize())
									.file_type(fileDto.getFile_type())
									.board_no(fileDto.getBoard_no())
									.build());
		}
			File dir = new File("D:/upload");
			dir.mkdir();		
			
			for(int i = 0; i <list.size(); i++) {
				MultipartFile mf = fileDto.getFile().get(i);
				FileDto dto = list.get(i);
				File target = new File(dir, String.valueOf(list.get(i).getFile_no()));
				mf.transferTo(target);
				String  mimeType = new Tika().detect(target);
				fileDto.setFile_type(mimeType);
				boardDao.upload(dto);
			}
	}
	
}
