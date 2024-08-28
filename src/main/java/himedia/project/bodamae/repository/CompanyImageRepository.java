package himedia.project.bodamae.repository;

import java.util.List;
import java.util.Optional;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.transaction.annotation.Transactional;

import himedia.project.bodamae.dto.CompanyImage;

public interface CompanyImageRepository {
	
	// 이미지 저장
	@Insert("insert into company_image(cmp_img_url) values(#{cmp_img_url})")
  @Options(keyProperty = "cmp_img_no", useGeneratedKeys = true)
  int saveImg(CompanyImage companyImage);
	
	@Select("select cmp_img_no from company_image where cmp_img_url like concat(https,${cmp_img_url})")
	Optional<CompanyImage> findImgNo(String cmp_img_url);
	
	// cmp_code를 통해 cmp_img_url 조회
	@Select("select cmp_img_url from company_image where cmp_img_no = ${cmp_img_no} ")
	Optional<String> findImgUrl(int cmp_img_no);
	
	// 인덱스 장소 이미지 4개 조회
	@Select("select * from company_image limit 4")
	List<CompanyImage> companyIndexUrlList();
	
}
