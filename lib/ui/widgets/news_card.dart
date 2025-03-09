import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:isomorph_iq/ui/common/app_colors.dart';
import 'package:isomorph_iq/ui/common/text_styles.dart';
import 'package:isomorph_iq/ui/common/ui_helpers.dart';

class NewsCard extends StatelessWidget {
  /// Whether to show a loading indicator instead of the headline/read-more content.
  final bool isLoading;

  final String headline;
  final VoidCallback? onReadMore;

  const NewsCard({
    super.key,
    required this.headline,
    this.onReadMore,
    this.isLoading = false, // Defaults to false
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 154.w,
      height: 120.h,
      padding: const EdgeInsets.all(12.0).r,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0).r,
        border: Border.all(color: kcStrokeSecondary, width: 1),
      ),
      // If we're loading, show a spinner; otherwise, show the normal content
      child: isLoading
          ? Center(
              child: SizedBox(
                height: 24.r,
                width: 24.r,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(kcPrimaryColor),
                ),
              ),
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Headline / snippet
                Text(
                  headline,
                  style: TextStyles.bodyPrimary.copyWith(
                    color: const Color(0xFF5D2B2B),
                  ),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
                verticalSpace04,

                Spacer(),
                // "Read More"
                GestureDetector(
                  onTap: onReadMore,
                  child: Text(
                    'Read More',
                    style: TextStyles.bodyPrimary.copyWith(
                      color: kcPrimaryColor,
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
