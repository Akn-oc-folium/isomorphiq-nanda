import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:gif/gif.dart';
import 'package:isomorph_iq/gen/assets.gen.dart';
import 'package:stacked/stacked.dart';

import 'startup_viewmodel.dart';

class StartupView extends StatefulWidget {
  const StartupView({super.key});

  @override
  State<StartupView> createState() => _StartupViewState();
}

class _StartupViewState extends State<StartupView>
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
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => StartupViewModel(),
      onViewModelReady: (viewModel) => SchedulerBinding.instance
          .addPostFrameCallback((timeStamp) => viewModel.runStartupLogic()),
      builder: (context, viewModel, child) => Scaffold(
        body: Center(
          child: Column(
            children: [
              Gif(
                controller: _gifController,
                autostart: Autostart.loop,
                image: AssetImage(Assets.gifs.isomorphLogo.path),
                width: 244,
                height: 344,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
