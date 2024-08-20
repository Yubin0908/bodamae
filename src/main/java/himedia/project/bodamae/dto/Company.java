package himedia.project.bodamae.dto;

import org.apache.ibatis.annotations.Mapper;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;


@Setter @Getter
@Mapper
@NoArgsConstructor
@AllArgsConstructor
public class Company {
	private int cmp_code;
	private String cmp_name;
	private String cmp_address;
	private String cmp_address_gu;
	private String cmp_tel_no;
	private String cmp_holidays;
	private String operating_hours;
	private String pet_restriction;
}
