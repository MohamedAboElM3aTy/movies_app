import 'package:equatable/equatable.dart';

class ErrorMessageModel extends Equatable {
  final String statusMessage;
  final int statusCode;
  final bool success;

  const ErrorMessageModel({
    required this.statusMessage,
    required this.statusCode,
    required this.success,
  });

  factory ErrorMessageModel.fromJson(Map<String, dynamic> map) {
    return ErrorMessageModel(
      statusMessage: map['status_message'] as String,
      statusCode: map['status_code'] as int,
      success: map['success'] as bool,
    );
  }

  @override
  List<Object> get props => [statusMessage, statusCode, success];
}
