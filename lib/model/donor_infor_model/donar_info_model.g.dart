// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'donar_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DonorInfo _$$_DonorInfoFromJson(Map<String, dynamic> json) => _$_DonorInfo(
      name: json['name'] as String,
      phoneNumber: json['phoneNumber'] as int,
      address: json['address'] as String,
      donationAmount: json['donationAmount'] as int,
      donationPlace: json['donationPlace'] as String,
      photoURL: json['photoURL'] as String,
    );

Map<String, dynamic> _$$_DonorInfoToJson(_$_DonorInfo instance) =>
    <String, dynamic>{
      'name': instance.name,
      'phoneNumber': instance.phoneNumber,
      'address': instance.address,
      'donationAmount': instance.donationAmount,
      'donationPlace': instance.donationPlace,
      'photoURL': instance.photoURL,
    };
