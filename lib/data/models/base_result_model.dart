import 'package:json_annotation/json_annotation.dart';

part 'base_result_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class BaseResultModel {
  BaseResultModel({
    this.code,
    this.message,
  }) {
    //Check session expried
    if (code == '403') {}
  }

  factory BaseResultModel.fromJson(Map<String, dynamic> json) =>
      _$BaseResultModelFromJson(json);

  Map<String, dynamic> toJson() => _$BaseResultModelToJson(this);

  String? code;
  String? message;

  bool isSuccess() => code == null
      ? false
      : RegExp(r'^2[0-9]{2}').hasMatch(code!) && code!.length == 3;
}
