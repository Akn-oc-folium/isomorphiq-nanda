import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:isomorph_iq/gen/assets.gen.dart';

class CustomAppBar extends AppBar {
  CustomAppBar({
    super.key,
    required BuildContext context,
    super.title,
    super.actions,
    super.automaticallyImplyLeading,
  }) : super(
          leading: automaticallyImplyLeading
              ? IconButton(
                  iconSize: 48.r,
                  icon: SvgPicture.asset(
                    Assets.icons.arrowBack,
                    height: 24.r,
                  ),
                  onPressed: () => Navigator.maybePop(context),
                )
              : null,
        );
}
