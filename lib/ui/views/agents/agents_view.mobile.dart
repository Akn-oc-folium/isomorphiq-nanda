import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:isomorph_iq/gen/assets.gen.dart';
import 'package:isomorph_iq/ui/common/app_colors.dart';
import 'package:isomorph_iq/ui/common/text_styles.dart';
import 'package:isomorph_iq/ui/widgets/buttons.dart';
import 'package:stacked/stacked.dart';

import 'agents_viewmodel.dart';

class AgentsViewMobile extends ViewModelWidget<AgentsViewModel> {
  const AgentsViewMobile({super.key});

  @override
  Widget build(BuildContext context, AgentsViewModel viewModel) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'AI Agents',
          style: TextStyles.titlePrimary.copyWith(color: kcSecondaryColor),
        ),
        titleSpacing: 16.0,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Use IsomorphIQ AI Personas that enhance your interactions with the world around you.',
                  style: TextStyles.titleTertiary
                      .copyWith(color: kcSecondaryColor),
                ),
                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFFB43B18), Color(0xFFE05A2F)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 7,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Pro Agent Plan',
                                style: TextStyles.titleSecondary
                                    .copyWith(color: kcPrimaryColorLight)),
                            const SizedBox(height: 4),
                            Text(
                              '3 day trial • 50 credits left',
                              style: TextStyles.bodyPrimary
                                  .copyWith(color: kcPrimaryColorLight),
                            ),
                          ],
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          foregroundColor: Colors.white,
                          elevation: 0,
                          side: BorderSide(
                              color: Colors.white.withOpacity(0.7), width: 1.5),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Text('Upgrade',
                            style: TextStyles.titleTertiary
                                .copyWith(color: kcPrimaryColorLight)),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                _buildAgentOption(
                  title: 'Twitter Persona',
                  description:
                      'Create your own unique Twitter AI Persona that tweets for you!',
                  imagePath: Assets.icons.xLogo.path,
                  onPressed: () => viewModel.onTwitterPersonaPressed(),
                ),
                _buildAgentOption(
                  title: 'AI Persona',
                  description:
                      'Customize the tone and style of your AI Persona.',
                  imagePath: Assets.icons.xLogo.path,
                  onPressed: () {},
                ),
                _buildAgentOption(
                  title: 'Crypto News',
                  description:
                      'Monitor AI-curated news that matches your interests!',
                  imagePath: Assets.icons.xLogo.path,
                  onPressed: () {},
                ),
                const SizedBox(height: 20),
                ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 400),
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.orange.shade50,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: Text('Many more agents coming soon!',
                          style: TextStyles.bodyPrimary.copyWith(
                              color: kcPrimaryColor, letterSpacing: -0.5)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAgentOption({
    required String title,
    required String description,
    required String imagePath,
    required VoidCallback onPressed,
  }) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: kcPrimaryColorLight,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: kcStrokePrimary,
            blurRadius: 0,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: Row(
        children: [
          PrimaryButton.icon(
              icon: Image.asset(
                imagePath,
                height: 24,
                width: 24,
              ),
              onPressed: () {}),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              children: [
                Text(title, style: TextStyles.titleSecondary),
                const SizedBox(height: 4),
                Text(description, style: TextStyles.bodyPrimary),
              ],
            ),
          ),
          const SizedBox(width: 12),
          PrimaryButton.icon(
              icon: SvgPicture.asset(
                Assets.icons.arrowRight,
                height: 24,
                width: 24,
              ),
              onPressed: onPressed)
        ],
      ),
    );
  }
}
