import 'package:flutter/material.dart';

import 'pages/chapters/chapters_view.dart';
import 'pages/discussions/discussions_view.dart';
import 'pages/gardens/gardens_view.dart';
import 'pages/help/help_view.dart';
import 'pages/help/help_view_local.dart';
import 'pages/home/home_view.dart';
import 'pages/outcomes/outcomes_view.dart';
import 'pages/page_not_found/page_not_found_view.dart';
import 'pages/sample_feature/sample_item_details_view.dart';
import 'pages/seeds/seeds_view.dart';
import 'pages/signin/signin_view.dart';
import 'pages/signup/signup_view.dart';
import 'pages/users/users_view.dart';
import 'settings/settings_controller.dart';
import 'settings/settings_view.dart';

/// The Widget that configures your application.
class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
    required this.settingsController,
  });

  final SettingsController settingsController;

  @override
  Widget build(BuildContext context) {
    // Glue the SettingsController to the MaterialApp.
    //
    // The ListenableBuilder Widget listens to the SettingsController for changes.
    // Whenever the user updates their settings, the MaterialApp is rebuilt.
    return ListenableBuilder(
      listenable: settingsController,
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          theme: ThemeData(),
          darkTheme: ThemeData.dark(),
          themeMode: settingsController.themeMode,
          onGenerateRoute: (RouteSettings routeSettings) {
            return MaterialPageRoute<void>(
              settings: routeSettings,
              builder: (BuildContext context) {
                switch (routeSettings.name) {
                  case SigninView.routeName:
                    return const SigninView();
                  case SignupView.routeName:
                    return const SignupView();
                  case HomeView.routeName:
                    return const HomeView();
                  case GardensView.routeName:
                    return const GardensView();
                  case ChaptersView.routeName:
                    return const ChaptersView();
                  case OutcomesView.routeName:
                    return const OutcomesView();
                  case SeedsView.routeName:
                    return const SeedsView();
                  case UsersView.routeName:
                    return const UsersView();
                  case DiscussionsView.routeName:
                    return const DiscussionsView();
                  case HelpView.routeName:
                    return const HelpView();
                  case HelpViewLocal.routeName:
                    return const HelpViewLocal();
                  case SettingsView.routeName:
                    return SettingsView(controller: settingsController);
                  case SampleItemDetailsView.routeName:
                    return const SampleItemDetailsView();
                  default:
                    return const PageNotFoundView();
                }
              },
            );
          },
        );
      },
    );
  }
}
