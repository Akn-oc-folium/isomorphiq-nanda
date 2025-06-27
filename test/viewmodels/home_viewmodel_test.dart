import 'package:flutter_test/flutter_test.dart';
import 'package:isomorph_iq_nanda/app/app.bottomsheets.dart';
import 'package:isomorph_iq_nanda/app/app.locator.dart';
import 'package:isomorph_iq_nanda/ui/common/app_strings.dart';
import 'package:mockito/mockito.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('MainViewmodelTest -', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());

    group('showBottomSheet -', () {
      test('When called, should show custom bottom sheet using notice variant',
          () {
        final bottomSheetService = getAndRegisterBottomSheetService();

        verify(bottomSheetService.showCustomSheet(
          variant: BottomSheetType.notice,
          title: ksHomeBottomSheetTitle,
          description: ksHomeBottomSheetDescription,
        ));
      });
    });
  });
}
