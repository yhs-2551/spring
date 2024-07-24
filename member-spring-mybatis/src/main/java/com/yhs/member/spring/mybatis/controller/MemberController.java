package com.yhs.member.spring.mybatis.controller;

import com.yhs.member.spring.mybatis.dto.MemberDTO;
import com.yhs.member.spring.mybatis.service.MemberService;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.lang.reflect.Member;
import java.util.List;

@Controller
@RequestMapping("/member")
@RequiredArgsConstructor
public class MemberController {

    private final MemberService memberService;

    @GetMapping("/save")
    public String saveForm() {
        return "save";
    }

    @PostMapping("/save")
    public String save(MemberDTO memberDTO) {
        int saveResult = memberService.save(memberDTO);
        if(saveResult > 0) {
            return "login";
        } else {
            return "save";
        }
    }

    @GetMapping("/login")
    public String loginForm() {
        return "login";
    }

    @PostMapping("/login")
    public String login(MemberDTO memberDTO, HttpSession httpSession) {
        boolean loginResult = memberService.login(memberDTO);

        if (loginResult) {
            httpSession.setAttribute("loginEmail", memberDTO.getMemberEmail());
            return "main";
        } else {
            return "login";
        }
    }

    @GetMapping("/view")
    public String findAll(Model model) {
        List<MemberDTO> memberDTOList = memberService.findAll();
        model.addAttribute("memberList", memberDTOList);
        return "list";
    }

    @GetMapping("/{id}")
    public String findById(@PathVariable("id") Long id, Model model) {
        MemberDTO memberDTO = memberService.findById(id);
        model.addAttribute("member", memberDTO);
        return "detail";
    }

    @GetMapping("/delete/{id}")
    public String delete(@PathVariable("id") Long id) {
        memberService.delete(id);
        return "redirect:/member/view";
    }

    @GetMapping("/update")
    public String updateForm(HttpSession httpSession, Model model) {
        String loginEmail = (String) httpSession.getAttribute("loginEmail");
        MemberDTO memberDTO = memberService.findByMemberEmail(loginEmail);
        model.addAttribute("member", memberDTO);
        return "update";
    }

    @PostMapping("/update")
    public String update(MemberDTO memberDTO) {
        boolean result = memberService.update(memberDTO);
        if (result) {
            return "redirect:/member/" + memberDTO.getId();
        } else {
            return "index";
        }
    }

    @PostMapping("/email-check")
    @ResponseBody
    public String emailCheck(@RequestParam("memberEmail")String memberEmail) {
        return memberService.emailCheck(memberEmail);

    }
}
