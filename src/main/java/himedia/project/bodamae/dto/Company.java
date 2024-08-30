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
	private int cmp_code;								// 업체 코드
	private int cmp_img_no;							// 업체 이미지 번호
	private String cmp_name;						// 업체 이름
	private String cmp_address;					// 업체 주소
	private String cmp_address_gu;			// 업체 주소_구
	private String cmp_tel_no;					// 업체 전화번호
	private String cmp_holidays;				// 업체 휴무일
	private String operation_hours;			// 운영시간
	private String pet_restriction;			// 반려동물 제한사항
	private String cmp_img_url;					// 업체 이미지 URL
	private Date cmp_date;							// 업체 등록 날짜
	
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
