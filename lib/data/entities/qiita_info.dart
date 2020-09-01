import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:qiita_sample/data/entities/qiita_user.dart';

part 'qiita_info.freezed.dart';

part 'qiita_info.g.dart';

@freezed
abstract class QiitaInfo with _$QiitaInfo {
  factory QiitaInfo({
    String title,
    String url,
    @JsonKey(name: 'user') QiitaUser qiitaUser,
  }) = _QiitaInfo;

  factory QiitaInfo.fromJson(Map<String, dynamic> json) =>
      _$QiitaInfoFromJson(json);
}
