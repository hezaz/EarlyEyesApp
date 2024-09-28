// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'apiService.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
final class _$ApiService extends ApiService {
  _$ApiService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final Type definitionType = ApiService;

  @override
  Future<Response<dynamic>> registerAccount({
    required List<PartValue<dynamic>> data,
    required String filePath,
  }) {
    final Uri $url = Uri.parse('/student/register');
    final List<PartValue> $parts = <PartValue>[
      PartValueFile<String>(
        'profile_pic',
        filePath,
      )
    ];
    $parts.addAll(data);
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      parts: $parts,
      multipart: true,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> registerTeacher({
    required List<PartValue<dynamic>> data,
    required String filePath,
  }) {
    final Uri $url = Uri.parse('/teacher/register');
    final List<PartValue> $parts = <PartValue>[
      PartValueFile<String>(
        'profile_pic',
        filePath,
      )
    ];
    $parts.addAll(data);
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      parts: $parts,
      multipart: true,
    );
    return client.send<dynamic, dynamic>($request);
  }
}
