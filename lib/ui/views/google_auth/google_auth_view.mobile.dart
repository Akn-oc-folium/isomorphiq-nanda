import 'package:flutter/material.dart';
import 'package:isomorph_iq/ui/views/google_auth/google_auth_viewmodel.dart';
import 'package:isomorph_iq/ui/widgets/google_auth_webview.dart';
import 'package:stacked/stacked.dart';

class GoogleAuthViewMobile extends StatelessWidget {
  const GoogleAuthViewMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<GoogleAuthViewModel>.reactive(
      viewModelBuilder: () => GoogleAuthViewModel(),
      builder: (context, viewModel, child) {
        return Scaffold(
          appBar: AppBar(title: const Text('Connect Google Account')),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (viewModel.isBusy)
                  const CircularProgressIndicator()
                else if (viewModel.errorMessage != null)
                  Text(
                    viewModel.errorMessage!,
                    style: const TextStyle(color: Colors.red),
                  )
                else
                  SizedBox(
                    width: 300,
                    height: 600,
                    child: GoogleAuthWebview(
                      initialUrl: 'a3209b97-548b-49ec-8e62-5c26dab3519f',
                      onSuccess: (code) {
                        // Handle successful auth code
                        // You can exchange code for tokens here
                        debugPrint('Authorization code: $code');
                      },
                      onError: (error) {},
                    ),
                  )
                // ElevatedButton(
                //   onPressed: () => viewModel.fetchGoogleAuthLink(
                //       userId: 'a3209b97-548b-49ec-8e62-5c26dab3519f'),
                //   child: const Text('Connect Google Account'),
                // ),
              ],
            ),
          ),
        );
      },
    );
  }
}
