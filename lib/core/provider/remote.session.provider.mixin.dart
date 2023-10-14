import 'package:flutter_base_project/core/data/remote.session.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../mixin/http.mixin.dart';


class Request {
  final EndPoint? endPoint;
  final EndpointWithParam? param;
  final Map<String, dynamic> request;

  const Request({
    required this.endPoint,
    required this.param,
    required this.request,
  });
}

mixin RemoteSessionMixin {

  final getRemoteWithEndpointProvider = FutureProvider.family<dynamic, EndPoint>((ref, endPoint) async {
    final session = RemoteSession();
    return session.get(endPoint: endPoint, param: null);
  });


  final getRemoteWithParamProvider = FutureProvider.family<dynamic, EndpointWithParam>((ref, param) async {
    final session = RemoteSession();
    return session.get(endPoint: null, param: param);
  });


  final postRemoteProvider = FutureProvider.family<dynamic, Request>((ref, request) async {
    final session = RemoteSession();
    return session.post(endPoint: request.endPoint, param: request.param, request: request.request);
  });

  final putRemoteProvider = FutureProvider.family<dynamic, Request>((ref, request) async {
    final session = RemoteSession();
    return session.put(endPoint: request.endPoint, param: request.param, request: request.request);
  });
}