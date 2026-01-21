import 'package:dio/dio.dart';

class GoogleFormClient {
  final Dio _dio = Dio(
    BaseOptions(
      headers: {
        'Content-Type': Headers.formUrlEncodedContentType,
      },
    ),
  );

  Future<void> submit({
    required String subject,
    required String email,
    required String message,
  }) async {
    const url =
        'https://docs.google.com/forms/d/e/1FAIpQLSeK10wEvCmb0H94mT4B718ImJqCe4adKBIBUh-cxcjKKRnfsw/formResponse';

    await _dio.post(
      url,
      data: {
        'entry.1065046570': subject,
        'entry.1166974658': email,
        'entry.839337160': message,
      },
      options: Options(
        followRedirects: false,
        validateStatus: (status) => status != null && status < 500,
      ),
    );
  }
}
