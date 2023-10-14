import 'package:flutter_riverpod/flutter_riverpod.dart';



abstract class BaseStatelessWidget extends ConsumerWidget {
  const BaseStatelessWidget({super.key});

  void bind({required WidgetRef ref}) {}
}