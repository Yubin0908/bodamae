package himedia.project.bodamae.repository;

import java.util.List;
import java.util.Optional;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import himedia.project.bodamae.dto.Company;

public interface CompanyRepository {

	/** 관리자 뷰 > 업체 company **/
	// 신규 업체 등록(이미지는 따로 불러와서 진행)
	@Insert("insert into company(cmp_img_no,cmp_name,cmp_address,cmp_address_gu,cmp_tel_no,cmp_holidays,operation_hours,pet_restriction)"
			+ "values(#{cmp_img_no},#{cmp_name},#{cmp_address},#{cmp_address_gu},#{cmp_tel_no},#{cmp_holidays},#{operation_hours},#{pet_restriction})")
	@Options(useGeneratedKeys = true, keyProperty = "cmp_img_no")
	void saveCompany(Company newCompany);

	// 업체정보 전체 조회
	@Select("select * from company cmp join company_image cmp_img on cmp.cmp_img_no = cmp_img.cmp_img_no order by cmp_code desc")
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
	@Select("select * from company cmp join company_image cmp_img on cmp.cmp_img_no = cmp_img.cmp_img_no  where cmp_code = ${cmp_code}")
	Optional<Company> findByCode(int cmp_code);

	// 업체정보 수정
	@Update("update company set cmp_name = #{ updateCompany.cmp_name }, cmp_address = #{ updateCompany.cmp_address }, "
			+ "cmp_address_gu = #{ updateCompany.cmp_address_gu }, cmp_tel_no = #{ updateCompany.cmp_tel_no }, cmp_holidays = #{ updateCompany.cmp_holidays }, "
			+ "operation_hours = #{ updateCompany.operation_hours }, pet_restriction = #{ updateCompany.pet_restriction } where cmp_code = #{ cmp_code }")
	int update(@Param("cmp_code") int cmp_code, @Param("updateCompany") Company updateCompany);

	// 업체정보 삭제
	@Delete("delete company_image, company from company join company_image on company.cmp_img_no = company_image.cmp_img_no where company.cmp_code = #{ cmp_code }")
	boolean deleteCompany(@Param("cmp_code") int cmp_code);

	/** 사용자 뷰 > 장소 place **/
	// 장소정보 전체 조회
	@Select("select * from company cmp join company_image cmp_img on cmp.cmp_img_no = cmp_img.cmp_img_no order by cmp_code desc")
	List<Company> placeList();

	// 장소리스트 검색(컬럼 선택이 "선택"으로 됐을 경우)
	@Select("select * from company cmp join company_image cmp_img on cmp.cmp_img_no = cmp_img.cmp_img_no where cmp_name like concat('%',#{search},'%') or cmp_address_gu like concat('%',#{search},'%')")
	List<Company> findByChoosePlace(String search);

	// 업체정보 검색 모든 컬럼으로 검색
	@Select("select * from company cmp join company_image cmp_img on cmp.cmp_img_no = cmp_img.cmp_img_no where ${column} like concat('%', #{other}, '%')")
	List<Company> findByColumnPlace(@Param("column") String column, @Param("other") String other);
	
	// 카드 형식의 업체 정보에서 장소 이름으로 상세보기 이동
	@Select("select * from company cmp join company_image cmp_img on cmp.cmp_img_no = cmp_img.cmp_img_no where cmp_name like '${cmp_name}'")
	Optional<Company> findByName(@Param("cmp_name") String cmp_name);
	
	// index 검색 기능 : 업체명으로 검색
	@Select("select * from company cmp join company_image cmp_img on cmp.cmp_img_no = cmp_img.cmp_img_no where cmp_name like #{place}")
	List<Company> findByPlace(@Param("place") String place);
}
