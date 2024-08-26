package himedia.project.bodamae.repository;

import java.util.List;
import java.util.Optional;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import himedia.project.bodamae.dto.CompanyImage;

public interface CompanyImageRepository {
	
	@Insert("")
	Optional<CompanyImage> saveCmpImg(String cmp_img_url);
	
	@Select("select cmp_img_url from company_image where cmp_img_no = ${cmp_img_no} ")
	Optional<String> findImgUrl(int cmp_img_no);
}
