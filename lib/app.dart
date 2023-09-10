import 'package:flutter/material.dart';

import 'pages/chapters/chapters_view.dart';
import 'pages/discussions/discussions_view.dart';
import 'pages/gardens/gardens_view.dart';
import 'pages/help/help_view.dart';
import 'pages/home/home_view.dart';
import 'pages/members/members_view.dart';
import 'pages/outcomes/outcomes_view.dart';
import 'pages/page_not_found/page_not_found_view.dart';
import 'pages/seeds/seeds_view.dart';
import 'pages/signin/signin_view.dart';
import 'pages/signup/signup_view.dart';
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

          // Define a function to handle named routes in order to support
          // Flutter web url navigation and deep linking.
          onGenerateRoute: (RouteSettings routeSettings) {
            return MaterialPageRoute<void>(
              settings: routeSettings,
              builder: (BuildContext context) {
                switch (routeSettings.name) {
                  case ChaptersView.routeName:
                    return const ChaptersView();
                  case DiscussionsView.routeName:
                    return const DiscussionsView();
                  case GardensView.routeName:
                    return const GardensView();
                  case HelpView.routeName:
                    return const HelpView();
                  case HomeView.routeName:
                    return HomeView();
                  case MembersView.routeName:
                    return const MembersView();
                  case OutcomesView.routeName:
                    return const OutcomesView();
                  case SeedsView.routeName:
                    return const SeedsView();
                  case SettingsView.routeName:
                    return SettingsView(controller: settingsController);
                  case SigninView.routeName:
                    return const SigninView();
                  case SignupView.routeName:
                    return const SignupView();
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
