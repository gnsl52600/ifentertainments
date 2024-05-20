package kr.or.ddit.controller.community;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.commons.lang3.StringUtils;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.service.community.IFeedService;
import kr.or.ddit.vo.common.PaginationInfoVO;
import kr.or.ddit.vo.community.MainArtistVO;
import kr.or.ddit.vo.goods.GoodsVO;
import kr.or.ddit.vo.community.FeedCommentVO;
import kr.or.ddit.vo.community.FeedVO;
import lombok.extern.slf4j.Slf4j;

/**
 * 피드 조회 컨트롤러
 * @author 임민혁
 */
@Controller
@Slf4j
@RequestMapping("/community/feed")
public class FeedRetrieveController {
	
	/* 
	 *	모든 사용자가 볼 수 있는 피드와 멤버십 전용 피드가 전부 조회가능하되 
	 *	멤버십에 가입되지 않은 유저는 멤버십 전용 피드는 블러처리가 된다
	 *	(스프링 시큐리티 권한 사용)  
	 *
	 *	조회하는 되어야하는 내용
	 *	1. 게시물
	 * 	2. 해당 게시물 번호에 해당하는 댓글
	 *  3. 해당 게시물 번호에 해당하는 좋아요
	 *  4. 상품 리스트 10번째 추천 상품 굿즈출력
	 *  등등
	 */
	
	
	@Inject
	private IFeedService feedService;

	@PreAuthorize("hasAnyRole('ROLE_ADMIN','ROLE_MEMBER', 'ROLE_ARTIST')")
	@GetMapping("/getProdList.do")
	@ResponseBody
	public List<GoodsVO> getArtistGoodsList(GoodsVO goodsVO,Model model) {
		List<GoodsVO> goodsList = feedService.getGoodsList(goodsVO);
	    return goodsList;
	}
	
	
	@PreAuthorize("hasAnyRole('ROLE_ADMIN','ROLE_MEMBER', 'ROLE_ARTIST')")
	@GetMapping("/artistFeedComment.do")
    @ResponseBody
    public Map<String, Object> getArtistFeed(@RequestParam("feedNo") int feedNo ,Model model) {
		Map<String, Object> responseData = new HashMap<>();

//		List<FeedVO> feedVOList=feedService.getArtistFeed(feedNo);
//		log.info("FEEDVOVOVOVOVO: {}", feedVOList);
		
		// 내가 클릭한 Feed의 데이터를 가져온다.
		FeedVO feedVO = feedService.selectFeed(feedNo);
		// 내가 클릭한 Feed의 댓글들을 가져온다.
		List<FeedVO> feedCommentList=feedService.getArtistFeedComment(feedNo);
		List<FeedVO> memberShipYn = feedService.memberShipYn();
//		responseData.put("feedVOList", feedVOList);
		responseData.put("feedVO", feedVO);
	    responseData.put("feedCommentList", feedCommentList);
	    responseData.put("memberShipYn", memberShipYn);
        return responseData;
    }
	
	
	
	
	@RequestMapping(value = "admin/list.do")
	public String feedList(
			@RequestParam(name ="page", required = false, defaultValue = "1") int currentPage,
			@RequestParam(required = false, defaultValue = "title") String searchType,
			@RequestParam(required = false) String searchWord,
			Model model) {
		PaginationInfoVO<FeedVO> pagingVO = new PaginationInfoVO<FeedVO>();
		
		if (StringUtils.isNotBlank(searchWord)) {
			pagingVO.setSearchType(searchType);
			pagingVO.setSearchWord(searchWord);
			
			model.addAttribute("searchType", searchType);
			model.addAttribute("searchWord", searchWord);
		}
		
		pagingVO.setCurrentPage(currentPage);
		int totalRecord = feedService.selectFeedListCount(pagingVO);
		pagingVO.setTotalRecord(totalRecord);
		
		List<FeedVO> feedList = feedService.selectFeedList(pagingVO);
		pagingVO.setDataList(feedList);
		
		model.addAttribute("pagingVO", pagingVO);
		
		return "admin/community/feedList";
	}
	
	
	@RequestMapping(value="admin/comList.do")
	public String feedComment(
			@RequestParam(name="page",required = false, defaultValue = "1")int currentPage,
			@RequestParam(required = false, defaultValue = "title") String searchType,
			@RequestParam(required = false) String searchWord,
			Model model) {
		
		PaginationInfoVO<FeedCommentVO> pagingVO = new PaginationInfoVO<FeedCommentVO>();
		if (StringUtils.isNotBlank(searchWord)) {
			pagingVO.setSearchType(searchType);
			pagingVO.setSearchWord(searchWord);
			
			model.addAttribute("searchType", searchType);
			model.addAttribute("searchWord", searchWord);
		}
		
		pagingVO.setCurrentPage(currentPage);
		int totalRecord = feedService.selectCommentListCount(pagingVO);
		pagingVO.setTotalRecord(totalRecord);
		
		List<FeedCommentVO> commentList=feedService.selectCommentList(pagingVO);
		pagingVO.setDataList(commentList);
		log.info("commentListcommentList"+commentList);
		model.addAttribute("pagingVO", pagingVO);
		
		return "admin/community/feedCommentList";
		
		
	}
	
	
}
