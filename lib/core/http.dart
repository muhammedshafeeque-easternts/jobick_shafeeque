
import 'package:dio/dio.dart';

class Http {
  final Dio _dio;
  final CancelToken _cancelToken;
  final Options _options;
  Http()
      : _dio =  Dio(),
        _cancelToken = CancelToken(),
        _options = Options();

  Future<dynamic> getRequest(String _url) async {
    try {
      Response _response =
      await _dio.get(_url, cancelToken: _cancelToken, options: _options);
      print(_response.data);
      return _response.data;
    } catch (e) {
      print(e);
    }
  }
}
