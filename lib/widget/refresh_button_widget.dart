import 'package:flutter/material.dart';

import '../services/http_service.dart';
import '../static/globals.dart';

class RefreshButtonWidget extends StatelessWidget {
  const RefreshButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () async {
        await HttpService.getQueue().then((result) {
          setQueueCounterFromServer(result.regular, result.special);
        });
      },
      icon: const Icon(Icons.refresh),
    );
  }
}
