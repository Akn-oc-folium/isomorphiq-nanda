import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gif/gif.dart';
import 'package:isomorph_iq_nanda/gen/assets.gen.dart';
import 'package:isomorph_iq_nanda/ui/common/app_colors.dart';
import 'package:isomorph_iq_nanda/ui/common/text_styles.dart';
import 'package:isomorph_iq_nanda/ui/common/ui_helpers.dart';
import 'package:isomorph_iq_nanda/ui/views/onboarding/onboarding_viewmodel.dart';
import 'package:isomorph_iq_nanda/ui/widgets/buttons.dart';
import 'package:isomorph_iq_nanda/ui/widgets/inline_link_text.dart';
import 'package:stacked/stacked.dart';

class OnboardingViewDesktop extends StatefulWidget {
  const OnboardingViewDesktop({super.key});

  @override
  State<OnboardingViewDesktop> createState() => _OnboardingViewDesktopState();
}

class _OnboardingViewDesktopState extends State<OnboardingViewDesktop>
    with SingleTickerProviderStateMixin {
  late GifController _gifController;

  @override
  void initState() {
    super.initState();
    _gifController = GifController(vsync: this);
  }

  @override
  void dispose() {
    _gifController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<OnboardingViewModel>.reactive(
      viewModelBuilder: () => OnboardingViewModel(),
      onViewModelReady: (viewModel) => viewModel.initialise(),
      initialiseSpecialViewModelsOnce: true,
      builder: (context, viewModel, child) {
        return Scaffold(
          backgroundColor: kcWhite,
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 490.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Spacer(),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Gif(
                        controller: _gifController,
                        autostart: Autostart.loop,
                        image: AssetImage(Assets.gifs.isomorphLogo.path),
                        width: 245,
                        height: 303,
                      ),
                      horizontalSpace16,
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Welcome to',
                            style: TextStyles.titlePrimary
                                .copyWith(color: kcPrimaryColor, height: 1.h),
                          ),
                          verticalSpace16,
                          verticalSpace04,
                          Assets.images.isomorphLogoWithText.image(
                            width: 260,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.only(bottom: 18.0),
                  child: Column(
                    children: [
                      InlineLinkText(
                        prefixText:
                            'By continuing, you are in agreement with\n',
                        linkText: 'IsomorphIQ Terms & Conditions',
                        onLinkTap: () {},
                      ),
                      verticalSpace08,
                      verticalSpace04,
                      PrimaryButton(
                        text: 'Let\'s Play',
                        onPressed: viewModel.onContinuePressedWeb,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
