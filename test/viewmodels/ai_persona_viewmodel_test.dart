import 'package:flutter_test/flutter_test.dart';
import 'package:isomorph_iq_nanda/app/app.locator.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('AiPersonaViewModel Tests -', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());
  });
}
