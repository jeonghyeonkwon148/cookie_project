package com.web.cookie.a05_yoon.a02_CRUD;

import org.springframework.core.io.Resource;
import org.springframework.core.io.UrlResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.beans.factory.annotation.Value;

import java.net.MalformedURLException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.nio.file.Path;
import java.nio.file.Paths;


@RestController
public class A04_FileDownloadController {
	@Value("${user.download}")
	private String path;
	// http://192.168.0.39:5050/yoon_download?filename=web.zip
	// http://localhost:5050/yoon_download?filename=web.zip
	@GetMapping("yoon_download")
	public ResponseEntity<Resource> downloadFile(@RequestParam("filename") String filename){
		try {
			Path filePath = Paths.get(path).resolve(filename).normalize();	
			Resource resource = new UrlResource( filePath.toUri() );
			if(!resource.exists()) {
				return ResponseEntity.notFound().build();
			}
			String encodedFileName = URLEncoder.encode(resource.getFilename(), 
					StandardCharsets.UTF_8).replaceAll("\\+", "%20"); 
			HttpHeaders headers = new HttpHeaders();
			headers.add(HttpHeaders.CONTENT_DISPOSITION, 
					"attachment; filename=\""+encodedFileName+"\"; filename*=UTF-8''"+encodedFileName );
			return ResponseEntity.ok().headers(headers).body(resource); 
		} catch (Exception e) {
			System.out.println("파일 서버에서 클라이언트로 전송시 에러:"+e.getMessage());
		}
		return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build(); 
	}
 
}