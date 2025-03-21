package com.web.cookie.a05_Jo.File;

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


// restcontroller : 주로 바로 ajax형식으로 결과를 처리할 때, 사용된다..
@RestController
public class A06_FileDownloadController {
	// 다운로드 대상 경로 위치지정..
	@Value("${user.upload}")
	private String path;
	// http://192.168.0.39:5050/download?filename=web.zip
	// http://localhost:5050/download?filename=web.zip
	@GetMapping("download")
	public ResponseEntity<Resource> downloadFile(@RequestParam("filename") String filename){
		

		try {
			// 1. 다운로드할 파일 설정..
			Path filePath = Paths.get(path).resolve(filename).normalize();	
			//    물리적파일 network통해서 전달할 때, 사용되는 객체..
			Resource resource = new UrlResource( filePath.toUri() );
			//    파일이 없을 때, 예외 처리
			if(!resource.exists()) {
				return ResponseEntity.notFound().build();
			}
			// 2. 파일이름이 한글인 경우에 UTF-8인코딩 전달 처리 부분..
			String encodedFileName = URLEncoder.encode(resource.getFilename(), 
					StandardCharsets.UTF_8).replaceAll("\\+", "%20"); // 공백 처리
			
			// 3. 파일 전달할 내용 선언 ResponseEntity 형식으로 전달 방식..
			//    Request(요청처리),  Response(반응처리)		
			//    Content-Disposition 헤드 설정(http프로토콜로 파일을 전송할 때, 사용되는 형식지정)
			HttpHeaders headers = new HttpHeaders();
			headers.add(HttpHeaders.CONTENT_DISPOSITION, 
					"attachment; filename=\""+encodedFileName+"\"; filename*=UTF-8''"+encodedFileName );
			return ResponseEntity.ok().headers(headers).body(resource); //정상
		} catch (Exception e) {
			System.out.println("파일 서버에서 클라이언트로 전송시 에러:"+e.getMessage());
		}
		return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build(); //에러발생
	}
 
}