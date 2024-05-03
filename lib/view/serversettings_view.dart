import 'package:flutter/material.dart';

import '../services/server_service.dart';
// import '../widget/logout_button_widget.dart';

class ServerSettingsView extends StatelessWidget {
  const ServerSettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Server Settings'),
        actions: const [
          // LogoutButtonWidget(),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              // color: Colors.pink,
              width: 200.0,
              child: Column(
                children: [
                  const Text(
                    'Ip Address and Port: ',
                    style:
                        TextStyle(fontWeight: FontWeight.w500, fontSize: 18.0),
                  ),
                  const Divider(),
                  Text(
                    ServerService.serverIp,
                    style: const TextStyle(
                        fontWeight: FontWeight.w400, fontSize: 15.0),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
