import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'donar_info_model.freezed.dart';
part "donar_info_model.g.dart";

@freezed
class DonorInfo with _$DonorInfo {
  const factory DonorInfo({
    required String name,
    required String phoneNumber,
    String? address,
    required String donationAmount,
    required String donationPlace,
    String? photoURL,
  }) = _DonorInfo;
  factory DonorInfo.fromJson(Map<String, Object> json) =>
      _$DonorInfoFromJson(json);
}
