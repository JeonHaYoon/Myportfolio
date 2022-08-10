package com.myportfolio.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@Controller
public class HomeController {

	@RequestMapping(value="/", method= RequestMethod.GET)
	public String main(){
		return "index";
	}


}
