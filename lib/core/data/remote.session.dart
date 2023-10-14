


import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter_base_project/core/mixin/http.mixin.dart';

import '../mixin/reflector.mixin.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';


abstract class IRemoteSession {
  Future<R?> post<R>({EndPoint? endPoint, EndpointWithParam? param, Map<String, dynamic>? request});
  Future<R?> put<R>({EndPoint? endPoint, EndpointWithParam? param, Map<String, dynamic>? request});
  Future<R?> get<R>({EndPoint? endPoint, EndpointWithParam? param});
}

@Injectable(as: IRemoteSession)
class RemoteSession with EnvironmentMixin, ReflectorMixin implements IRemoteSession {

  Map<String, String>? _headers() {
    Map<String, String> objects = {};
    return objects;
  }

  Future<R?> _mapOn<R>(Uint8List bodyBytes) async {
    var decodedResponse = jsonDecode(utf8.decode(bodyBytes)) as Map<String, dynamic>;
    return reflectOn(decodedResponse);
  }

  @override
  Future<R?> get<R>({EndPoint? endPoint, EndpointWithParam? param}) async {
    Uri? url = getURL(endPoint:endPoint, param: null);
    if (url == null) return null;

    var response = await http.get(url, headers: _headers());
    return _mapOn(response.bodyBytes);
  }

  @override
  Future<R?> post<R>({EndPoint? endPoint, EndpointWithParam? param, Map<String, dynamic>? request}) async{
    Uri? url = getURL(endPoint:endPoint, param: null);
    if (url == null) return null;

    var response = await http.post(url, headers: _headers(), body: request);
    return _mapOn(response.bodyBytes);
  }

  @override
  Future<R?> put<R>({EndPoint? endPoint, EndpointWithParam? param, Map<String, dynamic>? request}) async {
    Uri? url = getURL(endPoint:endPoint, param: null);
    if (url == null) return null;

    var response = await http.post(url, headers: _headers(), body: request);
    return _mapOn(response.bodyBytes);
  }

}