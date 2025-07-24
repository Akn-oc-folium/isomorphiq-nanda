import 'package:flutter/material.dart';
import 'package:isomorph_iq_nanda/ui/views/agent_home/agent_home_view.dart';
import 'package:stacked/stacked.dart';

import 'agents_viewmodel.dart';

class AgentsViewMobile extends ViewModelWidget<AgentsViewModel> {
  const AgentsViewMobile({super.key});

  @override
  Widget build(BuildContext context, AgentsViewModel viewModel) {
    return AgentHomeView();
  }
}
