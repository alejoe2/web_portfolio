part of'./../services.dart';

class ApiServices {

  static final Dio _dio = Dio(); 

  static int timeOut = 30 * 1000;
  

  static Future<Options> headerOption() async {
    return Options(
      headers: {
        'Access-Control-Allow-Origin': '*',
        'Content-Type': 'application/json',
        'Authorization': 'Bearer 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' 
      }
    );
  }


  static Future httpGet({ required String path, required Map<String, dynamic> data }) async {
    
    try {
      final resp = await _dio.get( path, queryParameters: data, options: await headerOption() ).timeout(Duration(milliseconds: timeOut));
      return resp.data;
    }  on DioError catch (err) {
      debugPrint('error en el Get $err');
      throw(err.response!.data);
    }

  }

  static Future<Response> httpPost({ required String path, required data  }) async {

    try {

      final resp = await _dio.post( path, data: data, options: await headerOption() ).timeout(Duration(milliseconds: timeOut));

      return resp;
      
    }  on DioError catch (err) {
      debugPrint('error en el response ${err.response}');
      debugPrint('error en el message ${err.message}');
      throw(err.response!.data);
    }

  }

    static Future httpPatch({ required String path, required data  }) async {

    try {

      final resp = await _dio.patch( path, data: data, options: await headerOption() ).timeout(Duration(milliseconds: timeOut));

      return resp.data;
      
    }  on DioError catch (err) {
      debugPrint('error en el response ${err.response}');
      debugPrint('error en el message ${err.message}');
      throw(err.response!.data);
    }

  }

  static Future httpPostString({ required String path, required String data  }) async {

    try {

    final resp = await _dio.put( path, data: data, options: await headerOption() ).timeout(Duration(milliseconds: timeOut));

    return resp.data;
    
    } on DioError catch (err) {
      debugPrint('error en el httpPut $err');
      throw(err.response!.data);
    }

  }

  static Future httpPut({ required String path, required Map<String, dynamic> data  }) async {

  try {

    final resp = await _dio.put( path, data: data, options: await headerOption() ).timeout(Duration(milliseconds: timeOut));

    return resp.data;
    
    } on DioError catch (err) {
      debugPrint('error en el httpPut $err');
      throw(err.response!.data);
    }

  }

  static Future httpDelete({ required String path }) async {

    try {

      final resp = await _dio.delete( path, options: await headerOption() ).timeout(Duration(milliseconds: timeOut));
      return resp.data;
      
    }  on DioError catch (err) {
      debugPrint('error en el httpDelete $err');
      throw(err.response!.data);
    }
  }






}