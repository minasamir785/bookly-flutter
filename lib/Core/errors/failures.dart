import 'package:dio/dio.dart';

abstract class Faliure {
  final String errorMessage;

  Faliure({
    required this.errorMessage,
  });
}

class ServerFailure extends Faliure {
  ServerFailure({
    required super.errorMessage,
  });

  factory ServerFailure.fromDioError({required DioError dioError}) {
    switch (dioError.type) {
      case DioErrorType.connectionTimeout:
        return ServerFailure(errorMessage: "Checks your internet connection!");

      case DioErrorType.sendTimeout:
        return ServerFailure(errorMessage: "Send request Timeout!");

      case DioErrorType.receiveTimeout:
        return ServerFailure(errorMessage: "Receive request Timeout!");

      case DioErrorType.badCertificate:
        return ServerFailure.fromResponse(
          statusCode: dioError.response!.statusCode!,
          response: dioError.response!.data,
        );
      //
      case DioErrorType.badResponse:
        return ServerFailure(errorMessage: "Something went wrong");
      //
      case DioErrorType.cancel:
        return ServerFailure(
            errorMessage: "Request to Api Server has been cancelled");
      //
      case DioErrorType.connectionError:
        return ServerFailure(errorMessage: "Checks your internet connection!");

      case DioErrorType.unknown:
        if ((dioError.message!.toLowerCase()).contains("socket")) {
          return ServerFailure(
              errorMessage: "Checks your internet connection!");
        }
        return ServerFailure(
            errorMessage: 'Opps There was an Error, Please try again');

      default:
        return ServerFailure(
            errorMessage: 'Opps There was an Error, Please try again');
    }
  }

  factory ServerFailure.fromResponse({int? statusCode, dynamic response}) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(errorMessage: response['error']['message']);
    } else if (statusCode == 404) {
      return ServerFailure(
          errorMessage: 'Your request not found, Please try later!');
    } else if (statusCode == 500) {
      return ServerFailure(
          errorMessage: 'Internal Server error, Please try later');
    } else {
      return ServerFailure(
          errorMessage: 'Opps There was an Error, Please try again');
    }
  }
}
