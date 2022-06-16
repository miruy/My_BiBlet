package com.yurim.www.service;

import com.yurim.www.dto.AppraisalDTO;
import com.yurim.www.dto.UserDTO;

import java.util.List;

public interface MainService {
    List<String> popularList();
    List<String> recommendList();
    List<AppraisalDTO> latestComments();
    List<Integer> latestStar(Long userNo, String isbn);
    Long totalCommentCount();
}
