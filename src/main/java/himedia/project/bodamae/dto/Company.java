package himedia.project.bodamae.dto;

import java.sql.Date;

import org.apache.ibatis.annotations.Mapper;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter @Getter
@Mapper
@NoArgsConstructor
public class Company {
	private int cmp_code;
	private int cmp_img_no;
	private String cmp_name;
	private String cmp_address;
	private String cmp_address_gu;
	private String cmp_tel_no;
	private String cmp_holidays;
	private String operation_hours;
	private String pet_restriction;
	private String cmp_img_url;
	private Date cmp_date;
	
	public Company(String cmp_name, String cmp_address, String cmp_address_gu, String cmp_tel_no,
			String cmp_holidays, String operation_hours, String pet_restriction) {
		this.cmp_name = cmp_name;
		this.cmp_address = cmp_address;
		this.cmp_address_gu = cmp_address_gu;
		this.cmp_tel_no = cmp_tel_no;
		this.cmp_holidays = cmp_holidays;
		this.operation_hours = operation_hours;
		this.pet_restriction = pet_restriction;
	}
	
	
	
}
