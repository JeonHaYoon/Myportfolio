package com.myportfolio.web;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.Locale;

@Controller
public class HomeController {

	@RequestMapping(value="/", method= RequestMethod.GET)
	public String main(){
		return "main";
	}


}
