package com.yhs.portfolio.smboard.controller;

import com.yhs.portfolio.smboard.dto.CommentDTO;
import com.yhs.portfolio.smboard.service.CommentService;
import lombok.RequiredArgsConstructor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RequiredArgsConstructor
@RequestMapping("/comment")
@Controller
public class CommentController {


    private final CommentService commentService;
    private static final Logger logger = LoggerFactory.getLogger(CommentController.class);

    @PostMapping("/save")
    public @ResponseBody  List<CommentDTO> save(@ModelAttribute CommentDTO commentDTO) {
        logger.info("commentDTO 값 {}", commentDTO);
        commentService.save(commentDTO);
        return commentService.findAll(commentDTO.getBoardId());
    }
}
