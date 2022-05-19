package com.yurim.www.repository;

import com.yurim.www.vo.RequestCommentForDetail;
import lombok.RequiredArgsConstructor;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@RequiredArgsConstructor
public class AppraisalDAOImpl implements AppraisalDAO {

	private final SqlSessionTemplate sqlSessionTemplate;

//	// 평가 작성
//	@Override
//	public void writeComment(AppraisalVO appraisal) {
//		sqlSessionTemplate.insert("writeComment", appraisal);
//	}
//
//	// 독서 상태 삽입 및 해당 독서 상태 바로 호출
//	@Override
//	public BookShelfVO insertBookShelf(BookShelfVO bookShelf) {
//		sqlSessionTemplate.insert("insertBookShelf", bookShelf);
//		return selectBookShelf(bookShelf);
//	}
//
//	// 독서 상태 호출
//	@Override
//	public BookShelfVO selectBookShelf(BookShelfVO bookShelf) {
//		return sqlSessionTemplate.selectOne("selectBookShelf", bookShelf);
//	}

	// 해당 도서의 대한 모든 평가 호출
	@Override
	public List<RequestCommentForDetail> findAllComment(String isbn) {
		return sqlSessionTemplate.selectList("findAllComment", isbn);
	}

	// 해당 도서의 대한 평가 개수 호출
	@Override
	public int commentCount(String isbn) {
		return sqlSessionTemplate.selectOne("commentCount", isbn);
	}

//	// 평가 삭제
//	@Override
//	public void deleteComment(DeleteCmd deleteCmd) {
//		sqlSessionTemplate.delete("deleteComment", deleteCmd);
//	}
//
//	// 평가 수정
//	@Override
//	public void updateComment(UpdateCmd updateAppraisal) {
//		sqlSessionTemplate.update("updateComment", updateAppraisal);
//	}
//
//	@Override
//	public CommentCmd getComment(Long appraisal_num) {
//		return sqlSessionTemplate.selectOne("getComment", appraisal_num);
//	}
//
//	@Override
//	public String getMemPass(Long appraisal_num) {
//		return sqlSessionTemplate.selectOne("getMemPass", appraisal_num);
//	}
//
}
