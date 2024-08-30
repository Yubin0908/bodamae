package himedia.project.bodamae.dto;

import org.apache.ibatis.annotations.Mapper;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter @Getter
@Mapper
@NoArgsConstructor
@ToString
public class CompanyImage {
	
	private int cmp_img_no;				// 업체 이미지 번호
	private String cmp_img_url;		// 업체 이미지 URL
	
	public CompanyImage(String cmp_img_url) {
		this.cmp_img_url = cmp_img_url;
	}
}
