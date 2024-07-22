package com.yhs.portfolio.smboard.service;

import com.yhs.portfolio.smboard.dao.CommentDAO;
import com.yhs.portfolio.smboard.dto.CommentDTO;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class CommentService {

    private final CommentDAO commentDAO;

    public void save(CommentDTO commentDTO) {
        commentDAO.save(commentDTO);
    }

    public List<CommentDTO> findAll(Long boardId) {
        return commentDAO.findAll(boardId);
    }
}
