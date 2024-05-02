import 'package:flutter/material.dart';

// import '../services/server_service.dart';
import '../static/globals.dart';
import '../widget/settings_button_widget.dart';

class ServerView extends StatefulWidget {
  const ServerView({super.key});

  @override
  State<ServerView> createState() => _ServerViewState();
}

class _ServerViewState extends State<ServerView> {
  @override
  void initState() {
    super.initState();
    // ServerService.init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Server'),
        actions: const [
          SettingsButtonWidget(),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 195.0,
              width: 260.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.lightGreenAccent,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text(
                    'Regular',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  ValueListenableBuilder(
                    valueListenable: regular,
                    builder: (ctx, value, widget) {
                      return Text(
                        value.toString(),
                        style: const TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.w500,
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            Container(
              height: 150.0,
              width: 200.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.amberAccent,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text(
                    'Special',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  ValueListenableBuilder(
                    valueListenable: special,
                    builder: (ctx, value, widget) {
                      return Text(
                        value.toString(),
                        style: const TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.w500,
                        ),
                      );
                    },
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
