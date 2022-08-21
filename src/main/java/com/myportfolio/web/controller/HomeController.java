package com.myportfolio.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

//홈화면
@Controller
public class HomeController {

	@RequestMapping(value="/", method= RequestMethod.GET)
	public String main(){

		return "index";
	}


}
