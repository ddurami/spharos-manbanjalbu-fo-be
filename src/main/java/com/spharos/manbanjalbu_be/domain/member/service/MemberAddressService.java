package com.spharos.manbanjalbu_be.domain.member.service;

import com.spharos.manbanjalbu_be.domain.member.dto.request.MemberAddressCreateRequest;
import com.spharos.manbanjalbu_be.domain.member.dto.request.MemberAddressUpdateRequest;
import com.spharos.manbanjalbu_be.domain.member.dto.response.MemberAddressResponse;
import com.spharos.manbanjalbu_be.domain.member.entity.Member;
import com.spharos.manbanjalbu_be.domain.member.entity.MemberAddress;
import com.spharos.manbanjalbu_be.domain.member.repository.MemberAddressRepository;
import com.spharos.manbanjalbu_be.domain.member.repository.MemberRepository;
import com.spharos.manbanjalbu_be.global.exception.BusinessException;
import com.spharos.manbanjalbu_be.global.exception.ErrorCode;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class MemberAddressService {

	private final MemberAddressRepository memberAddressRepository;
	private final MemberRepository memberRepository;

	public MemberAddressService(
			MemberAddressRepository memberAddressRepository,
			MemberRepository memberRepository
	) {
		this.memberAddressRepository = memberAddressRepository;
		this.memberRepository = memberRepository;
	}

	@Transactional(readOnly = true)
	public List<MemberAddressResponse> getAddresses(Long memberId) {
		return MemberAddressResponse.fromList(
				memberAddressRepository.findByMember_IdOrderByIsDefaultDescCreatedAtDesc(memberId)
		);
	}

	@Transactional(readOnly = true)
	public MemberAddressResponse getAddress(Long memberId, Long addressId) {
		return MemberAddressResponse.from(getOwnedAddress(memberId, addressId));
	}

	public MemberAddressResponse createAddress(Long memberId, MemberAddressCreateRequest request) {
		Member member = getMember(memberId);
		boolean shouldBeDefault = resolveDefaultOnCreate(memberId, request.isDefault());

		if (shouldBeDefault) {
			clearDefaultAddresses(memberId);
		}

		MemberAddress address = MemberAddress.create(
				member,
				request.addressName(),
				request.recipientName(),
				request.zipcode(),
				request.baseAddress(),
				request.detailAddress(),
				request.phone1(),
				request.phone2(),
				request.deliveryMemo(),
				shouldBeDefault
		);

		return MemberAddressResponse.from(memberAddressRepository.save(address));
	}

	public MemberAddressResponse updateAddress(Long memberId, Long addressId, MemberAddressUpdateRequest request) {
		MemberAddress address = getOwnedAddress(memberId, addressId);
		address.update(
				request.addressName(),
				request.recipientName(),
				request.zipcode(),
				request.baseAddress(),
				request.detailAddress(),
				request.phone1(),
				request.phone2(),
				request.deliveryMemo()
		);

		if (request.isDefault() != null) {
			applyDefaultChange(memberId, address, request.isDefault());
		}

		return MemberAddressResponse.from(address);
	}

	public MemberAddressResponse setDefaultAddress(Long memberId, Long addressId) {
		MemberAddress address = getOwnedAddress(memberId, addressId);
		clearDefaultAddresses(memberId);
		address.changeDefault(true);
		return MemberAddressResponse.from(address);
	}

	public void deleteAddress(Long memberId, Long addressId) {
		MemberAddress address = getOwnedAddress(memberId, addressId);
		boolean wasDefault = address.getIsDefault();

		memberAddressRepository.delete(address);

		if (wasDefault) {
			promoteLatestAddressAsDefault(memberId);
		}
	}

	private void applyDefaultChange(Long memberId, MemberAddress address, boolean isDefault) {
		if (isDefault) {
			clearDefaultAddresses(memberId);
			address.changeDefault(true);
			return;
		}

		if (address.getIsDefault()) {
			address.changeDefault(false);
			promoteLatestAddressAsDefault(memberId, address.getId());
		}
	}

	private boolean resolveDefaultOnCreate(Long memberId, Boolean requestedDefault) {
		if (memberAddressRepository.countByMember_Id(memberId) == 0) {
			return true;
		}
		return Boolean.TRUE.equals(requestedDefault);
	}

	private void clearDefaultAddresses(Long memberId) {
		memberAddressRepository.findByMember_IdOrderByIsDefaultDescCreatedAtDesc(memberId)
				.stream()
				.filter(MemberAddress::getIsDefault)
				.forEach(address -> address.changeDefault(false));
	}

	private void promoteLatestAddressAsDefault(Long memberId) {
		promoteLatestAddressAsDefault(memberId, null);
	}

	private void promoteLatestAddressAsDefault(Long memberId, Long excludedAddressId) {
		memberAddressRepository.findByMember_IdOrderByIsDefaultDescCreatedAtDesc(memberId)
				.stream()
				.filter(address -> excludedAddressId == null || !address.getId().equals(excludedAddressId))
				.findFirst()
				.ifPresent(address -> address.changeDefault(true));
	}

	private MemberAddress getOwnedAddress(Long memberId, Long addressId) {
		return memberAddressRepository.findByIdAndMember_Id(addressId, memberId)
				.orElseThrow(() -> new BusinessException(ErrorCode.MEMBER_ADDRESS_NOT_FOUND));
	}

	private Member getMember(Long memberId) {
		return memberRepository.findById(memberId)
				.orElseThrow(() -> new BusinessException(ErrorCode.MEMBER_NOT_FOUND));
	}
}
