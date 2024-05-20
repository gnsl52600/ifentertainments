package kr.or.ddit.vo.common;

import java.util.Date;
import java.util.List;

import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotBlank;
import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class UserVO{

	// USER 테이블
	private int userNo;
	@NotBlank
	private String userName;
	@NotBlank
	@Size(max=15)
	private String userId;
	@NotBlank
	private String userPw;
	private String userPw1;
	private String userType; //(2)
	private String userProfile;
	private String enabled;
	private String maPlace;
	private MultipartFile imgFile;

	// MEMBER 테이블
	@NotBlank
	private String memberTelno;
	@NotBlank
//	@Email
	private String memberEmail;
	@NotBlank
	private String memberBirth;
	private String memberGender;
	@NotBlank
	private String memberPostcode;
	@NotBlank
	private String memberAddress1;
	@NotBlank
	private String memberAddress2;
//	private LocalDate memberRegdate;
	private Date memberRegdate;
	
	private String memberNotification;

	private String[] notiType;
	private String[] notiSetting;
	
	// 알림 정보
	private String nsGoods;
	private String nsArtist;
	private String nsCompany;
	
	private String memberStopyn;
	private String memberDelyn;
	private String memberLgnpath;
	
	// ARTIST 테이블
	private Date artistBirth;
	private String artistIntro;
	private String artistFakename;
	private String artistDelyn;
	private String agId;
	
	List<UserAuthVO> authList;
	
	
	
    }
