
import 'package:reflectable/reflectable.dart';

class Reflector extends Reflectable {
  const Reflector()
      : super(subtypeQuantifyCapability, instanceInvokeCapability,
      typeRelationsCapability);
}


mixin ReflectorMixin {
  final Reflector _reflector = const Reflector();

  reflectOn<T>(Map<String, dynamic> map) {
    InstanceMirror instanceMirror = _reflector.reflect(map);
    return instanceMirror.reflectee as T?;
  }
}