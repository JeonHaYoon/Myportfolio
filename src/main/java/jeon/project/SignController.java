package jeon.project;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SignController {

    @RequestMapping(value="/sign/add")
    public String signup(){
            return "signup";
    }
}
