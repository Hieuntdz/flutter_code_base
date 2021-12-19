import 'package:dio/dio.dart';
import 'package:flutter_code_base/data/models/base_result_model.dart';
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class BaseResponseModel<T> {
  BaseResponseModel({
    this.result,
    this.data,
  });

  BaseResultModel? result;
  dynamic data;

  factory BaseResponseModel.fromResponse(Response response) {
    dynamic input = response.data;
    int _status = response.statusCode ?? 0;
    try {
      if (_status >= 200 && _status <= 299) {
        BaseResultModel success = BaseResultModel(
          code: '$_status',
          message: 'Thành công',
        );
        if (input is List) {
          return BaseResponseModel<T>(result: success, data: input);
        } else if (input is Map<int, dynamic>) {
          return BaseResponseModel<T>(
              result: success, data: input.values.map((e) => e).toList());
        } else if (input is Map<String, dynamic>) {
          return BaseResponseModel<T>(result: success, data: input);
        }
        return BaseResponseModel<T>(
            result: BaseResultModel(
              code: '103',
              message: 'Dữ liệu không đúng định dạng',
            ),
            data: null);
      } else {
        if (input is Map<String, dynamic>) {
          String message = input['message'];
          return BaseResponseModel<T>(
              result: BaseResultModel(
                code: '$_status',
                message: message,
              ),
              data: null);
        } else {
          return BaseResponseModel<T>(
              result: BaseResultModel(
                code: '$_status',
                message: 'Dữ liệu không đúng định dạng',
              ),
              data: null);
        }
      }
    } catch (e) {
      print(e);
    }
    return BaseResponseModel<T>(
        result: BaseResultModel(
          code: '$_status',
          message: 'Dữ liệu không đúng định dạng',
        ),
        data: null);
  }

  T? toModel(T Function(Map<String, dynamic> json) modelConverter) {
    if (data == null) return null;
    if (data is Map<String, dynamic>) {
      return modelConverter(data!);
    }
    return null;
  }

  List<T> toArrayModel(T Function(dynamic json) modelConverter) {
    List<T> items = [];
    if (data == null) return items;
    final List? list = data as List;
    if (list != null) {
      items.addAll(list.map((e) => modelConverter(e)).toList());
    }
    return items;
  }

  @override
  String toString() {
    return 'result: ${result?.toJson().toString()} \ndata: ${data?.toString()}';
  }
}
