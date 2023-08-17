// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'donar_info_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DonorInfo _$DonorInfoFromJson(Map<String, dynamic> json) {
  return _DonorInfo.fromJson(json);
}

/// @nodoc
mixin _$DonorInfo {
  String get name => throw _privateConstructorUsedError;
  String get phoneNumber => throw _privateConstructorUsedError;
  String? get address => throw _privateConstructorUsedError;
  String get donationAmount => throw _privateConstructorUsedError;
  String get donationPlace => throw _privateConstructorUsedError;
  String? get photoURL => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DonorInfoCopyWith<DonorInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DonorInfoCopyWith<$Res> {
  factory $DonorInfoCopyWith(DonorInfo value, $Res Function(DonorInfo) then) =
      _$DonorInfoCopyWithImpl<$Res, DonorInfo>;
  @useResult
  $Res call(
      {String name,
      String phoneNumber,
      String? address,
      String donationAmount,
      String donationPlace,
      String? photoURL});
}

/// @nodoc
class _$DonorInfoCopyWithImpl<$Res, $Val extends DonorInfo>
    implements $DonorInfoCopyWith<$Res> {
  _$DonorInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? phoneNumber = null,
    Object? address = freezed,
    Object? donationAmount = null,
    Object? donationPlace = null,
    Object? photoURL = freezed,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      donationAmount: null == donationAmount
          ? _value.donationAmount
          : donationAmount // ignore: cast_nullable_to_non_nullable
              as String,
      donationPlace: null == donationPlace
          ? _value.donationPlace
          : donationPlace // ignore: cast_nullable_to_non_nullable
              as String,
      photoURL: freezed == photoURL
          ? _value.photoURL
          : photoURL // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DonorInfoCopyWith<$Res> implements $DonorInfoCopyWith<$Res> {
  factory _$$_DonorInfoCopyWith(
          _$_DonorInfo value, $Res Function(_$_DonorInfo) then) =
      __$$_DonorInfoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      String phoneNumber,
      String? address,
      String donationAmount,
      String donationPlace,
      String? photoURL});
}

/// @nodoc
class __$$_DonorInfoCopyWithImpl<$Res>
    extends _$DonorInfoCopyWithImpl<$Res, _$_DonorInfo>
    implements _$$_DonorInfoCopyWith<$Res> {
  __$$_DonorInfoCopyWithImpl(
      _$_DonorInfo _value, $Res Function(_$_DonorInfo) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? phoneNumber = null,
    Object? address = freezed,
    Object? donationAmount = null,
    Object? donationPlace = null,
    Object? photoURL = freezed,
  }) {
    return _then(_$_DonorInfo(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      donationAmount: null == donationAmount
          ? _value.donationAmount
          : donationAmount // ignore: cast_nullable_to_non_nullable
              as String,
      donationPlace: null == donationPlace
          ? _value.donationPlace
          : donationPlace // ignore: cast_nullable_to_non_nullable
              as String,
      photoURL: freezed == photoURL
          ? _value.photoURL
          : photoURL // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DonorInfo with DiagnosticableTreeMixin implements _DonorInfo {
  const _$_DonorInfo(
      {required this.name,
      required this.phoneNumber,
      this.address,
      required this.donationAmount,
      required this.donationPlace,
      this.photoURL});

  factory _$_DonorInfo.fromJson(Map<String, dynamic> json) =>
      _$$_DonorInfoFromJson(json);

  @override
  final String name;
  @override
  final String phoneNumber;
  @override
  final String? address;
  @override
  final String donationAmount;
  @override
  final String donationPlace;
  @override
  final String? photoURL;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'DonorInfo(name: $name, phoneNumber: $phoneNumber, address: $address, donationAmount: $donationAmount, donationPlace: $donationPlace, photoURL: $photoURL)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'DonorInfo'))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('phoneNumber', phoneNumber))
      ..add(DiagnosticsProperty('address', address))
      ..add(DiagnosticsProperty('donationAmount', donationAmount))
      ..add(DiagnosticsProperty('donationPlace', donationPlace))
      ..add(DiagnosticsProperty('photoURL', photoURL));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DonorInfo &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.donationAmount, donationAmount) ||
                other.donationAmount == donationAmount) &&
            (identical(other.donationPlace, donationPlace) ||
                other.donationPlace == donationPlace) &&
            (identical(other.photoURL, photoURL) ||
                other.photoURL == photoURL));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, phoneNumber, address,
      donationAmount, donationPlace, photoURL);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DonorInfoCopyWith<_$_DonorInfo> get copyWith =>
      __$$_DonorInfoCopyWithImpl<_$_DonorInfo>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DonorInfoToJson(
      this,
    );
  }
}

abstract class _DonorInfo implements DonorInfo {
  const factory _DonorInfo(
      {required final String name,
      required final String phoneNumber,
      final String? address,
      required final String donationAmount,
      required final String donationPlace,
      final String? photoURL}) = _$_DonorInfo;

  factory _DonorInfo.fromJson(Map<String, dynamic> json) =
      _$_DonorInfo.fromJson;

  @override
  String get name;
  @override
  String get phoneNumber;
  @override
  String? get address;
  @override
  String get donationAmount;
  @override
  String get donationPlace;
  @override
  String? get photoURL;
  @override
  @JsonKey(ignore: true)
  _$$_DonorInfoCopyWith<_$_DonorInfo> get copyWith =>
      throw _privateConstructorUsedError;
}
