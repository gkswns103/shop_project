package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import vo.InterestVO;

public class InterestDAO {
    SqlSession sqlSession; // MyBatis SqlSession 객체

    // SqlSession 객체 주입을 위한 setter
    public void setSqlSession(SqlSession sqlSession) {
        this.sqlSession = sqlSession;
    }

    // 사용자 인덱스에 해당하는 관심 목록 조회
    public List<InterestVO> select_list(int user_idx) {
        List<InterestVO> list = sqlSession.selectList("i.select_list", user_idx); // user_idx를 기반으로 관심 목록 조회
        return list;
    }

    // 관심 목록에 항목 추가
    public int insert_interest(InterestVO vo) {
        int res = sqlSession.insert("i.insert_interest", vo); // 관심 목록에 항목 추가
        System.out.println(res);
        return res;
    }

    // 관심 항목의 인덱스 조회
    public int select_idx(InterestVO vo) {
        int res = sqlSession.selectOne("i.select_idx", vo); // 관심 항목의 인덱스 조회
        return res;
    }

    // 관심 목록에 중복된 항목이 있는지 확인
    public boolean check_duplicate(InterestVO vo) {
        int count = sqlSession.selectOne("i.check_duplicate", vo); // 중복 확인 쿼리 실행
        return count > 0; // count가 1 이상이면 중복으로 판단
    }

    // 사용자의 관심 목록 개수 조회
    public int interest_count(int user_idx) {
        int count = sqlSession.selectOne("i.interest_count", user_idx); // 사용자별 관심 목록 개수 조회
        return count ;
    }

    // 관심 목록 항목 삭제
    public int delete(int interest_idx) {
        int res = sqlSession.delete("i.interest_delete", interest_idx); // 관심 항목 삭제
        return res;
    }

    // 관심 목록 항목을 장바구니로 이동
    public int interest_cart(InterestVO vo) {
        int res = sqlSession.insert("i.interest_cart", vo); // 관심 항목을 장바구니로 이동
        return res;
    }

    // 관심 항목의 상세 정보 조회
    public InterestVO select_detail(int interest_idx) {
        InterestVO vo = sqlSession.selectOne("i.select_detail", interest_idx); // 관심 항목의 상세 정보 조회
        return vo;
    }
    
    //
    public int select_interest_idx(InterestVO vo) {
        return sqlSession.selectOne("i.select_interest_idx", vo); // 관심 상품의 인덱스를 가져오는 쿼리 실행
    }
}
