import 'package:dio/dio.dart';
import 'package:flutter_code_base/core/core.dart';


import '../../data/apis/user_api.dart';
import '../../data/models/app_user.dart';

class UserSevice with DataStateConvertable {
  final UserApi _api;
  UserSevice(this._api);

  Future<DataState<List<AppUser>>> getUsers() async {
    try {
      final _response = await _api.getUsers();
      return convertToDataState(_response);
    } on DioError catch (e) {
      return DataFailed(e);
    }
  }
}
