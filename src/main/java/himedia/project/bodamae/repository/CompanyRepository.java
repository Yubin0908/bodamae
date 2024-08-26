package himedia.project.bodamae.repository;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import himedia.project.bodamae.dto.Company;

public interface CompanyRepository {
	
	@Insert("insert into company_image(cmp_img_url) values(#{cmp_img_url})")
	void saveImg(@Param("cmp_img_url") String cmp_img_url);
	
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
	
	
	@Select("select * from company")
	List<Company> companyList();
	
  @Select("select * from company where cmp_code like concat('%',#{search},'%')\r\n"
  		+ "						or cmp_name like concat('%',#{search},'%')\r\n"
  		+ "						or cmp_address_gu like concat('%',#{search},'%')\r\n"
  		+ "           or theme_no like concat('%',#{search},'%')\r\n"
  		+ "           or cmp_tel_no like concat('%',#{search},'%');") 
  List<Company> findByChoose(String search);
	 

  @Select("select * from company where ${column} like concat('%', #{other}, '%')")
  List<Company> findByColumn(@Param("column") String column, @Param("other") String other);
	
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
