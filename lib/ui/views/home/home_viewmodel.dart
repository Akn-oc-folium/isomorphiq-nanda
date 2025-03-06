import 'package:stacked/stacked.dart';

class HomeViewModel extends IndexTrackingViewModel {
  // int sourcesViewKey = 0;

  // void reloadSourcesView() {
  //   sourcesViewKey++; // Change the key to force widget recreation
  //   rebuildUi(); // Rebuild the parent UI (triggers IndexedStack refresh)
  // }
}

/*
IndexedStack(
          index: viewModel.currentIndex,
          children: [
            SourcesView(key: ValueKey('SourcesView_${viewModel.sourcesViewKey}')),
            EarnView(),  //key: ValueKey('EarnView_${viewModel.earnViewKey}')),
            AgentsView(),  //key: ValueKey('AgentsView_${viewModel.agentsViewKey}')),
            JackpotView(), //key: ValueKey('JackpotView_${viewModel.jackpotViewKey}')),
          ],
        ),
        */
