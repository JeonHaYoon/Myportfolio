//package jeon.project;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.PostMapping;
//
//import java.lang.reflect.Member;
//
//
//@Controller
//public class MemberController {
//
//    private MemberService memberService;
//
//    @Autowired
//    public MemberController(MemberService memberService){
//        this.memberService=memberService;
//    }
//
//    @GetMapping("/sign/add")
//    public String createForm(){
//        return "signup";
//
//    }
//
//    @PostMapping("sign/add")
//    public String create(MemberForm form){
//        Member member= new Member();
//        member.setName(form.getName());
//
//        memberService.join(member);
//
//        return "redirect:/";
//    }
//}
