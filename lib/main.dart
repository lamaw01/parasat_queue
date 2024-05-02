import 'package:flutter/material.dart';
import 'package:parasat_queue/services/sharedpreference_service.dart';
import 'package:window_manager/window_manager.dart';

import 'services/server_service.dart';
import 'view/intro_view.dart';
import 'view/server_view.dart';
import 'view/teller_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SharedPreferencesService.init();

  await windowManager.ensureInitialized();

  WindowOptions windowOptions = const WindowOptions(
    size: Size(400, 800),
    center: true,
    backgroundColor: Colors.transparent,
    skipTaskbar: false,
    titleBarStyle: TitleBarStyle.normal,
    windowButtonVisibility: true,
  );

  windowManager.waitUntilReadyToShow(windowOptions, () async {
    await windowManager.show();
    await windowManager.focus();
  });

  runApp(const MyApp());

  ServerService.init();
}

Widget _redirect() {
  bool? isServer = SharedPreferencesService.getBool('isServer');

  switch (isServer) {
    case true:
      return const ServerView();
    case false:
      return const TellerView();
    default:
      return const IntroView();
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Parasat Queue',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlueAccent),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: _redirect(),
    );
  }
}
