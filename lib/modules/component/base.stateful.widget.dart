import 'package:flutter_riverpod/flutter_riverpod.dart';



abstract class BaseStatefulWidget extends ConsumerStatefulWidget {
  const BaseStatefulWidget({super.key});

  ConsumerState<ConsumerStatefulWidget> getState();
}


abstract class BaseState<T extends BaseStatefulWidget> extends ConsumerState<T> {
  void provide({required WidgetRef ref}) {}
}