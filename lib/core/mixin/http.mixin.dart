



import 'package:flutter/foundation.dart';


enum EndPoint {
  x
}


extension EndPointStringValue on EndPoint {
  String value() {
    switch(this) {
      case EndPoint.x: return '<endpoint-url>';
    }
  }
}

class EndpointWithParam {
  final String endpoint;
  final Map<String, dynamic> _container = {};

  EndpointWithParam({required this.endpoint});

  EndpointWithParam put({
    required String key,
    required String value
  }) {
    _container[key] = value;
    return this;
  }

  String value() {
    for (var key in _container.keys) {
      Object value = _container[key];
      endpoint.replaceAll(key, '$value');
    }
    return endpoint;
  }
}

mixin EnvironmentMixin {
  String _baseUrl() {
    if (kDebugMode) return '<base-url>';
    if (kReleaseMode) return '<base-url>';
    return '';
  }

  Uri? getURL({EndPoint? endPoint,  EndpointWithParam? param}) {
    Uri? url;

    if ( endPoint != null) {
      url = Uri.https(_baseUrl(), endPoint.value());
    }

    if ( param != null) {
      url = Uri.https(_baseUrl(), param.value());
    }

    return  url;
  }
}
