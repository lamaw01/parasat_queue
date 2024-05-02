import 'package:flutter/material.dart';

import '../services/sharedpreference_service.dart';
import '../view/serversettings_view.dart';
import '../view/tellersettings_view.dart';

class SettingsButtonWidget extends StatelessWidget {
  const SettingsButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        if (SharedPreferencesService.getBool('isServer')!) {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const ServerSettingsView(),
            ),
          );
        } else {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const TellerSettingsView(),
            ),
          );
        }
      },
      icon: const Icon(Icons.settings),
    );
  }
}
