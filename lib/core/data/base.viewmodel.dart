import 'package:flutter_base_project/core/provider/remote.session.provider.mixin.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../provider/local.database.provider.mixin.dart';


abstract class BaseViewModel with RemoteSessionMixin, SQLDatabaseMixin {
}