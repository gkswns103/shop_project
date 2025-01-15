package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.web.multipart.MultipartFile;

import vo.BannerVO;

public class BannerDAO {
SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession=sqlSession;
	}
	
	public List<BannerVO> select_banner(){
		List<BannerVO> list = sqlSession.selectList("b.list");
		
		return list;
	}
	
	public int banner_off(int banner_idx) {
		int res = sqlSession.update("b.off",banner_idx);
		return res;
	}
	
	public int banner_on(int banner_idx) {
		int res = sqlSession.update("b.on",banner_idx);
		return res;
	}
	
	public List<BannerVO> select_active_banners() {
        return sqlSession.selectList("b.select_active");
    }
	
	public int update_banner(BannerVO vo) {
	    return sqlSession.update("b.update", vo);
	}

	public int banner_insert(BannerVO vo) {
		int res = sqlSession.insert("b.insert", vo);
		return res;
	}
	
	public int banner_delete(int banner_idx) {
		int res = sqlSession.delete("b.delete",banner_idx);
		return res;
	}
}
