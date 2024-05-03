import 'package:flutter/material.dart';

import '../services/sharedpreference_service.dart';

class LogoutButtonWidget extends StatelessWidget {
  const LogoutButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        SharedPreferencesService.removeValue('isServer');
        SharedPreferencesService.removeValue('serverIp');
        SharedPreferencesService.removeValue('regularCounter');
        SharedPreferencesService.removeValue('specialCounter');
      },
      icon: const Icon(Icons.logout),
    );
  }
}
