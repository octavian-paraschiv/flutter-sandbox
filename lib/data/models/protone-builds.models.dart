import 'package:json_annotation/json_annotation.dart';

part 'protone-builds.models.g.dart';

@JsonSerializable()
class BuildInfo {
  final String? title;
  final BuildVersion? version;
  final DateTime? buildDate;
  final bool? isRelease;
  final String? comment;
  final String? url;

  BuildInfo(this.title, this.version, this.buildDate, 
    this.isRelease, this.comment, this.url);
  
  factory BuildInfo.fromJson(Map<String, dynamic> json) => _$BuildInfoFromJson(json);
  Map<String, dynamic> toJson() => _$BuildInfoToJson(this);
}

@JsonSerializable()
class BuildVersion {
  final int? major;
  final int? minor;
  final int? build;

  BuildVersion(this.major, this.minor, this.build);

  factory BuildVersion.fromJson(Map<String, dynamic> json) => _$BuildVersionFromJson(json);
  Map<String, dynamic> toJson() => _$BuildVersionToJson(this);

  @override
  String toString() {
    return "${major ?? 0}.${minor ?? 0}.${build ?? 0}";
  }
}