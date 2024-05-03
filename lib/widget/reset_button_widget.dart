import 'package:flutter/material.dart';

import '../services/http_service.dart';
import '../static/globals.dart';
import 'snackbar_widget.dart';

class ResetButtonWidget extends StatelessWidget {
  const ResetButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40.0,
      width: 100.0,
      child: TextButton(
        style: TextButton.styleFrom(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(2.0)),
          ),
          backgroundColor: Colors.redAccent,
        ),
        child: const Text(
          'Reset',
          style: TextStyle(color: Colors.white),
        ),
        onPressed: () async {
          await HttpService.resetQueueCounter().then((success) {
            if (!success) {
              showSnackBar(context, 'Error reseting queue');
            }
          });
          await HttpService.getQueue().then((result) {
            setQueueCounterFromServer(result.regular, result.special);
          });
        },
      ),
    );
  }
}
