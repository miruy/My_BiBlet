package com.yurim.www.repository;

import com.yurim.www.dto.AppraisalDTO;

import java.util.List;

public interface MypageDAO {
    List<AppraisalDTO> myCommentForMypage(Long userNo);
    List<AppraisalDTO> myEvaluateList(Long userNo);
    List<String> mypage_1(Long userNo);
    List<String> mypage_2(Long userNo);
}