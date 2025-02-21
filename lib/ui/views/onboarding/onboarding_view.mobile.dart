import 'package:flutter/material.dart';
import 'package:gif/gif.dart';
import 'package:isomorph_iq/gen/assets.gen.dart';
import 'package:isomorph_iq/ui/common/app_colors.dart';
import 'package:isomorph_iq/ui/common/text_styles.dart';
import 'package:isomorph_iq/ui/common/ui_helpers.dart';
import 'package:isomorph_iq/ui/views/onboarding/onboarding_viewmodel.dart';
import 'package:isomorph_iq/ui/widgets/buttons.dart';
import 'package:isomorph_iq/ui/widgets/inline_link_text.dart';
import 'package:stacked/stacked.dart';

class OnboardingViewMobile extends StatelessWidget {
  const OnboardingViewMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<OnboardingViewModel>.reactive(
      viewModelBuilder: () => OnboardingViewModel(),
      onViewModelReady: (viewModel) => viewModel.initialise(),
      initialiseSpecialViewModelsOnce: true,
      builder: (context, viewModel, child) {
        return Scaffold(
          body: PageView(
            controller: viewModel.pageController,
            onPageChanged:
                viewModel.onPageChanged, // Update current page in ViewModel
            children: [
              _OnboardingView1(viewModel: viewModel),
              const _OnboardingView2(),
              _OnboardingView3(viewModel: viewModel),
            ],
          ),
        );
      },
    );
  }
}

class _OnboardingView1 extends StatefulWidget {
  final OnboardingViewModel viewModel;

  const _OnboardingView1({Key? key, required this.viewModel}) : super(key: key);

  @override
  State<_OnboardingView1> createState() => __OnboardingView1State();
}

class __OnboardingView1State extends State<_OnboardingView1>
    with SingleTickerProviderStateMixin {
  late GifController _gifController;

  @override
  void initState() {
    super.initState();
    // Provide `vsync: this` because this State object mixes in a TickerProvider
    _gifController = GifController(vsync: this);
  }

  @override
  void dispose() {
    _gifController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kcWhite,
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 20),
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(Assets.images.onboardingSlide1Bg.path),
                  fit: BoxFit.contain,
                  alignment: Alignment.topCenter,
                ),
              ),
            ),
            Positioned(
              top: 32,
              left: 0,
              right: 0,
              child: Center(
                child: Gif(
                  controller: _gifController,
                  autostart: Autostart.loop,
                  image: AssetImage(Assets.gifs.isomorphLogo.path),
                  width: 244,
                  height: 344,
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.all(24.0),
                decoration: BoxDecoration(
                  color: kcPrimaryColorLight,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  border: Border.all(color: kcStrokePrimary, width: 1),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hi ${widget.viewModel.userFirstName}!',
                      style: TextStyles.titlePrimary
                          .copyWith(color: kcPrimaryColor),
                    ),
                    verticalSpace16,
                    Text(
                      'I\'m IQ, your personal AI assistant that you train, here to cater to your unique needs with precision and care.',
                      style: TextStyles.titleTertiary
                          .copyWith(color: kcSecondaryColor),
                    ),
                    verticalSpace56,
                    Center(
                      child: InlineLinkText(
                        prefixText: '',
                        linkText: 'Privacy Policy',
                        onLinkTap: () {},
                      ),
                    ),
                    verticalSpace08,
                    verticalSpace04,
                    PrimaryButton(
                      text: 'Continue',
                      onPressed: () => widget.viewModel.onContinuePressed(),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _OnboardingView2 extends ViewModelWidget<OnboardingViewModel> {
  const _OnboardingView2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, OnboardingViewModel viewModel) {
    return Scaffold(
      backgroundColor: kcWhite,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Assets.images.onboardingSlide2Bg.image(
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(24.0),
              decoration: BoxDecoration(
                color: kcPrimaryColorLight,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                border: Border.all(color: kcStrokePrimary, width: 1),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Train and Earn!',
                    style:
                        TextStyles.titlePrimary.copyWith(color: kcPrimaryColor),
                  ),
                  verticalSpace16,
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Assets.icons.dollarCoin.image(width: 40),
                          horizontalSpace(6),
                          Flexible(
                            child: Text(
                              'The more you chat, the more points you earn.',
                              style: TextStyles.titleTertiary
                                  .copyWith(color: kcSecondaryColor),
                            ),
                          ),
                        ],
                      ),
                      verticalSpace16,
                      Row(
                        children: [
                          Assets.icons.trophy.image(width: 40),
                          horizontalSpace(6),
                          Flexible(
                            child: Text(
                              'Compete with others to win the ultimate jackpot!',
                              style: TextStyles.titleTertiary
                                  .copyWith(color: kcSecondaryColor),
                            ),
                          ),
                        ],
                      ),
                      verticalSpace16,
                      Row(
                        children: [
                          Assets.icons.atTheRate.image(width: 40),
                          horizontalSpace(6),
                          Flexible(
                            child: Text(
                              'Use data connectors to boost the points you earn.',
                              style: TextStyles.titleTertiary
                                  .copyWith(color: kcSecondaryColor),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  verticalSpace16,
                  Center(
                    child: InlineLinkText(
                      prefixText: '',
                      linkText: 'Privacy Policy',
                      onLinkTap: () {},
                    ),
                  ),
                  verticalSpace08,
                  verticalSpace04,
                  SecondaryButton(
                    text: 'Will my data be secure?',
                    onPressed: () {},
                  ),
                  verticalSpace(15),
                  PrimaryButton(
                    text: 'Continue',
                    onPressed: viewModel.onContinuePressed,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _OnboardingView3 extends StatefulWidget {
  final OnboardingViewModel viewModel;

  const _OnboardingView3({
    Key? key,
    required this.viewModel,
  }) : super(key: key);

  @override
  State<_OnboardingView3> createState() => __OnboardingView3State();
}

class __OnboardingView3State extends State<_OnboardingView3>
    with SingleTickerProviderStateMixin {
  late GifController _gifController;

  @override
  void initState() {
    super.initState();
    // Provide `vsync: this` because this State object mixes in a TickerProvider
    _gifController = GifController(vsync: this);
  }

  @override
  void dispose() {
    _gifController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kcWhite,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 24.0, right: 24.0, bottom: 24.0),
          child: Column(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Gif(
                      controller: _gifController,
                      autostart: Autostart.loop,
                      image: AssetImage(Assets.gifs.isomorphLogo.path),
                      width: 245,
                      height: 303,
                    ),
                    Text(
                      'Welcome to',
                      style: TextStyles.titlePrimary.copyWith(
                        color: kcPrimaryColor,
                      ),
                    ),
                    verticalSpace16,
                    Assets.images.isomorphLogoWithText.image(
                      width: 260,
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  InlineLinkText(
                    prefixText: 'By continuing, you are in agreement with\n',
                    linkText: 'IsomorphIQ Terms & Conditions',
                    onLinkTap: () {},
                  ),
                  verticalSpace08,
                  verticalSpace04,
                  PrimaryButton(
                    text: 'Let\'s Play',
                    onPressed: widget.viewModel.onContinuePressed,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
