import 'package:flutter_test/flutter_test.dart';
import 'package:isomorph_iq/app/app.locator.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('ChoosePlanViewModel Tests -', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());
  });
}
