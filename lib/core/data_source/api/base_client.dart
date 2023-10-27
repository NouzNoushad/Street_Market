import 'package:http/http.dart';

import 'api_consumer.dart';
import 'error_handler.dart';
import 'status_code.dart';

class ApiBaseClient extends ApiConsumer {
  late Client baseClient;
  ApiBaseClient({required this.baseClient});

  Map<String, String> headers = {"Content-Type": "application/json"};

  @override
  Future<String> getRequest(String url) async {
    Uri uri = Uri.parse(url);
    String responseBody = "";

    Response response = await baseClient.get(uri, headers: headers);
    if (response.statusCode == StatusCode.ok ||
        response.statusCode == StatusCode.created) {
      responseBody = response.body;
    } else {
      ErrorHandler.handleResponse(response);
    }
    return responseBody;
  }
}
