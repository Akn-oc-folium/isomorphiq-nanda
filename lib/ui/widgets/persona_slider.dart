import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:isomorph_iq_nanda/ui/common/app_colors.dart';
import 'package:isomorph_iq_nanda/ui/common/text_styles.dart';
import 'package:isomorph_iq_nanda/ui/common/ui_helpers.dart';

class PersonaSlider extends StatelessWidget {
  final String title;
  final double? minValue;
  final double? maxValue;
  final String leftLabel;
  final String rightLabel;
  final double value;
  final ValueChanged<double> onChanged;
  final int? divisions;
  final String? label;

  const PersonaSlider({
    super.key,
    this.minValue,
    this.maxValue,
    required this.title,
    required this.leftLabel,
    required this.rightLabel,
    required this.value,
    required this.onChanged,
    this.divisions,
    this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
            style: TextStyles.titleSecondary.copyWith(color: kcSecondaryColor)),
        SliderTheme(
          data: SliderThemeData(
            trackHeight: 2.0.h,
            trackShape: CustomTrackShape(),
            thumbShape: RoundSliderThumbShape(enabledThumbRadius: 8.0.r),
            tickMarkShape: RoundSliderTickMarkShape(tickMarkRadius: 3.0.r),
            overlayShape: RoundSliderOverlayShape(overlayRadius: 16.0.r),
            padding: EdgeInsets.only(top: 0, bottom: 4.0.h),
          ),
          child: Slider(
            value: value,
            onChanged: onChanged,
            min: minValue ?? 1,
            max: maxValue ?? 5,
            divisions: divisions,
            activeColor: kcSecondaryColor,
            inactiveColor: kcPrimaryColorAccent,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              leftLabel,
              style: TextStyles.bodyPrimary.copyWith(color: kcSecondaryColor),
            ),
            Text(
              rightLabel,
              style: TextStyles.bodyPrimary.copyWith(color: kcSecondaryColor),
            ),
          ],
        ),
        verticalSpace08,
        verticalSpace16
      ],
    );
  }
}

class CustomTrackShape extends RoundedRectSliderTrackShape {
  @override
  Rect getPreferredRect({
    required RenderBox parentBox,
    Offset offset = Offset.zero,
    required SliderThemeData sliderTheme,
    bool isEnabled = false,
    bool isDiscrete = false,
  }) {
    final double trackHeight = sliderTheme.trackHeight ?? 4.0;
    final double trackLeft = offset.dx;
    final double trackTop = offset.dy + 10;
    final double trackWidth = parentBox.size.width;
    return Rect.fromLTWH(trackLeft, trackTop, trackWidth, trackHeight);
  }
}
