import 'package:dio/dio.dart';
import 'package:motopay_assessment_test/src/core/utils/app_utils.dart';

class NetworkExceptions implements Exception {
  late String message;

  NetworkExceptions.fromDioException(DioException dioException) {
    logger.e("dioException ${dioException.toString()}");
    switch (dioException.type) {
      case DioExceptionType.cancel:
        message = "Request to API server was cancelled";
        showErrorMessage(message);
        break;
      case DioExceptionType.connectionTimeout:
        message = "Connection timeout with API server";
        showErrorMessage(message);
        break;
      case DioExceptionType.receiveTimeout:
        message = "Receive timeout in connection with API server";
        showErrorMessage(message);
        break;
      case DioExceptionType.badResponse:
        message = _handleError(
          dioException.response?.statusCode,
          dioException.response?.data,
        );
        break;
      case DioExceptionType.sendTimeout:
        message = "Send timeout in connection with API server";
        showErrorMessage(message);
        break;
      case DioExceptionType.connectionError:
        if (dioException.message!.contains("Failed host lookup")) {
          message = 'No Internet';
          showErrorMessage(message);
          break;
        }
        message = "Unexpected error occurred";
        showErrorMessage(message);
        break;
      default:
        message = "Something went wrong";
        showErrorMessage(message);
        break;
    }
  }

  void showErrorMessage(String message) {
    logger.i("Error message : $message");
  }

  String _handleError(int? statusCode, dynamic error) {
    switch (statusCode) {
      case 400:
        return 'Bad request';
      case 401:
        return 'Unauthorized';
      case 403:
        return 'Forbidden';
      case 404:
        return error['message'];
      case 406:
        return handleError404(error);
      case 500:
        return 'Internal server error';
      case 502:
        return 'Bad gateway';
      default:
        return 'Oops something went wrong';
    }
  }

  String handleError404(dynamic error) {
    return error.toString();
  }

  static String unexpectedError() {
    return "Unexpected error occurred";
  }

  @override
  String toString() => message;
}
