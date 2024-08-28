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
	
	private int cmp_img_no;
	private String cmp_img_url;
	
	public CompanyImage(String cmp_img_url) {
		this.cmp_img_url = cmp_img_url;
	}
}
