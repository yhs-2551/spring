package com.yhs.member.spring.mybatis.service;

import com.yhs.member.spring.mybatis.dao.MemberDAO;
import com.yhs.member.spring.mybatis.dto.MemberDTO;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class MemberService {
    private final MemberDAO memberDAO;

    public int save(MemberDTO memberDTO) {
        return memberDAO.save(memberDTO);
    }

    public boolean login(MemberDTO memberDTO) {
        MemberDTO loginMember = memberDAO.login(memberDTO);

        if(loginMember != null) {
            return true;
        } else {
            return false;
        }
    }

    public List<MemberDTO> findAll() {
        return memberDAO.findAll();
    }

    public MemberDTO findById(Long id) {
        return memberDAO.findById(id);
    }

    public void delete(Long id) {
        memberDAO.delete(id);
    }

    public MemberDTO findByMemberEmail(String loginEmail) {
        return memberDAO.findByMemberEmail(loginEmail);
    }

    public boolean update(MemberDTO memberDTO) {
        int result = memberDAO.update(memberDTO);
        return result > 0;
    }

    public String emailCheck(String memberEmail) {
        MemberDTO memberDTO = memberDAO.findByMemberEmail(memberEmail);
        if (memberDTO == null) {
            return "ok";
        } else {
            return "no";
        }
    }
}
