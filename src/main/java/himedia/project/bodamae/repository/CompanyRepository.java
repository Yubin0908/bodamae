package himedia.project.bodamae.repository;

import java.util.List;
import java.util.Optional;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import himedia.project.bodamae.dto.Company;

public interface CompanyRepository {
	
	// 이미지 저장
	@Insert("insert into company_image(cmp_img_url) values(#{cmp_img_url})")
	void saveImg(@Param("cmp_img_url") String cmp_img_url);
	
	// 신규 업체 등록(이미지는 따로 불러와서 진행)
	@Insert("insert into company(cmp_img_no,cmp_name,cmp_address,cmp_address_gu,cmp_tel_no,cmp_holidays,operating_hours,pet_restriction)\r\n"
			+ "values(#{cmp_img_no},#{cmp_name},#{cmp_address},#{cmp_address_gu},#{cmp_tel_no},#{cmp_holidays},#{operating_hours},#{pet_restriction})")
	void saveCompany(String cmp_img_no, 
							      @Param("cmp_name") String cmp_name, 
							      @Param("cmp_address") String cmp_address, 
							      @Param("cmp_address_gu") String cmp_address_gu, 
							      @Param("cmp_tel_no") String cmp_tel_no, 
							      @Param("cmp_holidays") String cmp_holidays, 
							      @Param("operating_hours") String operating_hours, 
							      @Param("pet_restriction") String pet_restriction);
	
	// 업체정보 전체 조회
	@Select("select * from company")
	List<Company> companyList();
	
	// 인덱스 장소 4개 조회
	@Select("select * from company limit 4")
	List<Company> companyIndexList();
	
	// 업체정보 검색(카테고리 선택이 "선택"으로 됐을 경우)
  @Select("select * from company where cmp_code like concat('%',#{search},'%')\r\n"
  		+ "						or cmp_name like concat('%',#{search},'%')\r\n"
  		+ "						or cmp_address_gu like concat('%',#{search},'%')\r\n"
  		+ "           or theme_no like concat('%',#{search},'%')\r\n"
  		+ "           or cmp_tel_no like concat('%',#{search},'%');") 
  List<Company> findByChoose(String search);
	 
  // 업체정보 검색 모든 컬럼으로 검색
  @Select("select * from company where ${column} like concat('%', #{other}, '%')")
  List<Company> findByColumn(@Param("column") String column, @Param("other") String other);
	
  // 상세 페이지 진입 시 cmp_code에 해당하는 업체 조회
  @Select("select *from Company where cmp_code = #{cmp_code}")
  Optional<Company> findByCode(int cmp_code);
  
  
	/*
	 * @Select("select * from company where cmp_Address_gu like '#{cmp_Address_gu}'"
	 * ) List<Company> findByAddress(String cmp_Address_gu);
	 * 
	 * @Select("select * from company where cmp_tel_no like '#{cmp_tel_no}'")
	 * List<Company> findByTelNo(String cmp_tel_no);
	 * 
	 * @Select("select * from company where theme_name like '#{theme_name}'")
	 * List<Company> findByTheme(String theme_name);
	 */
}
