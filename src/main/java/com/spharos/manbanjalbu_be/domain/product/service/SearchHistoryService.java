package com.spharos.manbanjalbu_be.domain.product.service;

import com.spharos.manbanjalbu_be.domain.member.entity.Member;
import com.spharos.manbanjalbu_be.domain.member.repository.MemberRepository;
import com.spharos.manbanjalbu_be.domain.product.dto.request.SearchHistorySaveRequest;
import com.spharos.manbanjalbu_be.domain.product.dto.response.SearchHistoryResponse;
import com.spharos.manbanjalbu_be.domain.product.entity.SearchHistory;
import com.spharos.manbanjalbu_be.domain.product.repository.SearchHistoryRepository;
import com.spharos.manbanjalbu_be.global.exception.BusinessException;
import com.spharos.manbanjalbu_be.global.exception.ErrorCode;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class SearchHistoryService {

	private static final int MAX_HISTORY_SIZE = 10;

	private final SearchHistoryRepository searchHistoryRepository;
	private final MemberRepository memberRepository;

	public SearchHistoryService(
			SearchHistoryRepository searchHistoryRepository,
			MemberRepository memberRepository
	) {
		this.searchHistoryRepository = searchHistoryRepository;
		this.memberRepository = memberRepository;
	}

	@Transactional(readOnly = true)
	public List<SearchHistoryResponse> getSearchHistories(Long memberId) {
		return SearchHistoryResponse.fromList(
				searchHistoryRepository.findTop10ByMemberIdOrderByCreatedAtDesc(memberId)
		);
	}

	public SearchHistoryResponse saveSearchHistory(Long memberId, SearchHistorySaveRequest request) {
		Member member = getMember(memberId);
		String keyword = request.keyword().trim();

		searchHistoryRepository.deleteByMemberIdAndKeyword(memberId, keyword);
		searchHistoryRepository.save(SearchHistory.create(member, keyword));
		trimHistories(memberId);

		List<SearchHistory> histories = searchHistoryRepository.findTop10ByMemberIdOrderByCreatedAtDesc(memberId);
		return SearchHistoryResponse.from(histories.get(0));
	}

	public void deleteSearchHistory(Long memberId, Long historyId) {
		SearchHistory history = searchHistoryRepository.findByIdAndMemberId(historyId, memberId)
				.orElseThrow(() -> new BusinessException(ErrorCode.SEARCH_HISTORY_NOT_FOUND));
		searchHistoryRepository.delete(history);
	}

	public void deleteAllSearchHistories(Long memberId) {
		searchHistoryRepository.deleteByMemberId(memberId);
	}

	private void trimHistories(Long memberId) {
		List<SearchHistory> histories = searchHistoryRepository.findByMemberIdOrderByCreatedAtDesc(memberId);
		if (histories.size() <= MAX_HISTORY_SIZE) {
			return;
		}

		histories.subList(MAX_HISTORY_SIZE, histories.size())
				.forEach(searchHistoryRepository::delete);
	}

	private Member getMember(Long memberId) {
		return memberRepository.findById(memberId)
				.orElseThrow(() -> new BusinessException(ErrorCode.MEMBER_NOT_FOUND));
	}
}
