import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'donar_info_model.freezed.dart';
part 'donar_info_model.g.dart';

@freezed
class DonorInfo with _$DonorInfo {
  const factory DonorInfo({
    required String name,
    required int phoneNumber,
    required String address,
    required int donationAmount,
    required String donationPlace,
    required String photoURL,
  }) = _DonorInfo;
  factory DonorInfo.fromJson(Map<String, Object> json) =>
      _$DonorInfoFromJson(json);
}
