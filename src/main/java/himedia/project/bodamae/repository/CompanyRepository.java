package himedia.project.bodamae.repository;

import java.util.List;
import java.util.Optional;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import himedia.project.bodamae.dto.Company;

public interface CompanyRepository {
	
	// 신규 업체 등록(이미지는 따로 불러와서 진행)
	@Insert("insert into company(cmp_img_no,cmp_name,cmp_address,cmp_address_gu,cmp_tel_no,cmp_holidays,operating_hours,pet_restriction)\r\n"
			+ "values(#{cmp_img_no},#{newCompany.cmp_name},#{newCompany.cmp_address},#{newCompany.cmp_address_gu},#{newCompany.cmp_tel_no},#{newCompany.cmp_holidays},#{newCompany.operating_hours},#{newCompany.pet_restriction})")
	@Options(useGeneratedKeys = true, keyProperty = "cmp_img_no")
	void saveCompany(int cmp_img_no, @Param("company") Company newCompany);
	
	// 업체정보 전체 조회
	@Select("select * from company order by cmp_code desc")
	List<Company> companyList();
	
	// 인덱스 장소 4개 조회
	@Select("select * from company limit 4")
	List<Company> companyIndexList();
	
	// 업체정보 검색(카테고리 선택이 "선택"으로 됐을 경우)
  @Select("select * from company where cmp_code like concat('%',#{search},'%')\r\n"
  		+ "						or cmp_name like concat('%',#{search},'%')\r\n"
  		+ "						or cmp_address_gu like concat('%',#{search},'%')\r\n"
  		+ "           or cmp_tel_no like concat('%',#{search},'%');") 
  List<Company> findByChoose(String search);
	 
  // 업체정보 검색 모든 컬럼으로 검색
  @Select("select * from company where ${column} like concat('%', #{other}, '%')")
  List<Company> findByColumn(@Param("column") String column, @Param("other") String other);
	
  // 상세 페이지 진입 시 cmp_code에 해당하는 업체 조회
  @Select("select * from company where cmp_code = ${cmp_code}")
  Optional<Company> findByCode(int cmp_code);
  
  // 업체정보 수정
  @Update("update company set cmp_name = #{ updateCompany.cmp_name }, cmp_address = #{ updateCompany.cmp_address }, cmp_address_gu = #{ updateCompany.cmp_address_gu }, cmp_tel_no = #{ updateCompany.cmp_tel_no }, cmp_holidays = #{ updateCompany.cmp_holidays }, operation_hours = #{ updateCompany.operation_hours }, pet_restriction = #{ updateCompany.pet_restriction } where cmp_code = #{ cmp_code }")
  int update(@Param("cmp_code") int cmp_code, @Param("updateCompany") Company updateCompany);
  
}
