package himedia.project.bodamae.repository;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import himedia.project.bodamae.dto.Company;

public interface CompanyRepository {
	@Select("select cmp_code, cmp_name, cmp_address_gu, cmp_tel_no from company")
	List<Company> companyList();
}
