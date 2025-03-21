package com.web.cookie.a01_song.a01_controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;

import com.web.cookie.a01_song.a02_service.Prodt_sal_chartService;
import com.web.cookie.a01_song.a04_vo.Prodt_sal_chart;

@Controller
public class Prodt_sal_chartController {
	@Autowired(required = false)
	private Prodt_sal_chartService service;
	
	// http://localhost:5050/prodt_sal_chart
	@GetMapping("prodt_sal_chart")
	public String prodt_sal_chart() {
		return "WEB-INF\\a01_song\\Product\\lineChart.jsp";
	}
	// http://localhost:5050/prodt_sal_chartList
	@GetMapping("prodt_sal_chartList")
	public ResponseEntity<?> prodt_sal_chartList(Prodt_sal_chart sch,Model d){
		return ResponseEntity.ok(service.getProdt_sal_chartList(sch));
	}
	// http://localhost:5050/ckNum
	@GetMapping("ckNum")
	public ResponseEntity<?> ckNum(@RequestParam("num") int num){
		return ResponseEntity.ok(service.ckNum(num));
	}
	// http://localhost:5050/chartByNum
	@GetMapping("chartByNum")
	public ResponseEntity<?> chartByNum(@RequestParam("num") int num){
		return ResponseEntity.ok(service.getChart(num));
	}
	// http://localhost:5050/insertChart
	@PostMapping("insertChart")
	public ResponseEntity<?> insertChart(@RequestBody Prodt_sal_chart ins){
		return ResponseEntity.ok(service.insertChart(ins));
	}
	// http://localhost:5050/updateChart
	@PutMapping("updateChart")
	public ResponseEntity<?> updateChart(@RequestBody Prodt_sal_chart upt){
		return ResponseEntity.ok(service.updateChart(upt));
	}
	// http://localhost:5050/deleteChart
	@DeleteMapping("deleteChart")
	public ResponseEntity<?> deleteChart(@RequestParam("num") int num){
		return ResponseEntity.ok(service.deleteChart(num));
	}
}
