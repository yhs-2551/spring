package com.yhs.portfolio.smboard.service;

import com.yhs.portfolio.smboard.dao.BoardDAO;
import com.yhs.portfolio.smboard.dto.BoardDTO;
import com.yhs.portfolio.smboard.dto.PageDTO;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
@RequiredArgsConstructor
public class BoardService {

    private final BoardDAO boardDAO;

    public int save(BoardDTO boardDTO) {
        return boardDAO.save(boardDTO);
    }

    public List<BoardDTO> findAll() {
        return boardDAO.findAll();
    }

    public BoardDTO findById(Long id) {
        return boardDAO.findById(id);
    }

    public void updateHits(Long id) {
        boardDAO.updateHits(id);

    }

    public void delete(Long id) {
        boardDAO.delete(id);
    }

    public void update(BoardDTO boardDTO) {
        boardDAO.update(boardDTO);
    }

    int pageLimit = 3; // 페이지당 보여줄 글 개수
    int blockLimit = 3; // 하단에 표시될 페이징 개수

    public List<BoardDTO> pagingList(int page) {
        int pageLimit = 3;
        int pagingStart = (page - 1) * pageLimit;
        Map<String, Integer> pagingParams = new HashMap<>();
        pagingParams.put("start", pagingStart);
        pagingParams.put("limit", pageLimit);
        return boardDAO.pagingList(pagingParams);
    }

    public PageDTO pagingParam(int page) {
        // 전체 글 갯수 조회
        int boardCount = boardDAO.boardCount();
        // 전체 페이지 갯수 계산
        int maxPage = (int) (Math.ceil((double) boardCount / pageLimit));
        // 시작 페이지 값 계산
        int startPage = (((int)(Math.ceil((double) page / blockLimit))) - 1) * blockLimit + 1;
        // 끝 페이지 값 계산
        int endPage = startPage + blockLimit - 1;
        if (endPage > maxPage) {
            endPage = maxPage;
        }
        PageDTO pageDTO = new PageDTO();
        pageDTO.setPage(page);
        pageDTO.setMaxPage(maxPage);
        pageDTO.setStartPage(startPage);
        pageDTO.setEndPage(endPage);
        return pageDTO;
    }
}
