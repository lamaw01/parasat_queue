import 'package:flutter/material.dart';

import '../services/sharedpreference_service.dart';

class LogoutButtonWidget extends StatelessWidget {
  const LogoutButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        SharedPreferencesService.removeValue('isServer');
      },
      icon: const Icon(Icons.logout),
    );
  }
}
