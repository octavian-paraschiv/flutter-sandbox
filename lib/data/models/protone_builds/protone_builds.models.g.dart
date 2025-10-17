// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'protone_builds.models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BuildInfo _$BuildInfoFromJson(Map<String, dynamic> json) => BuildInfo(
  json['title'] as String?,
  json['version'] == null
      ? null
      : BuildVersion.fromJson(json['version'] as Map<String, dynamic>),
  json['buildDate'] == null
      ? null
      : DateTime.parse(json['buildDate'] as String),
  json['isRelease'] as bool?,
  json['comment'] as String?,
  json['url'] as String?,
);

Map<String, dynamic> _$BuildInfoToJson(BuildInfo instance) => <String, dynamic>{
  'title': instance.title,
  'version': instance.version,
  'buildDate': instance.buildDate?.toIso8601String(),
  'isRelease': instance.isRelease,
  'comment': instance.comment,
  'url': instance.url,
};

BuildVersion _$BuildVersionFromJson(Map<String, dynamic> json) => BuildVersion(
  (json['major'] as num?)?.toInt(),
  (json['minor'] as num?)?.toInt(),
  (json['build'] as num?)?.toInt(),
);

Map<String, dynamic> _$BuildVersionToJson(BuildVersion instance) =>
    <String, dynamic>{
      'major': instance.major,
      'minor': instance.minor,
      'build': instance.build,
    };
