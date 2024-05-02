import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:parasat_queue/services/sharedpreference_service.dart';

import 'server_view.dart';
import 'teller_view.dart';

class IntroView extends StatefulWidget {
  const IntroView({super.key});

  @override
  State<IntroView> createState() => _IntroViewState();
}

class _IntroViewState extends State<IntroView> {
  @override
  Widget build(BuildContext context) {
    final listPagesViewModel = <PageViewModel>[
      PageViewModel(
        title: "Welcome to Parasat Queue setup.",
        body: "Proceed to next screen to configure setup.",
        image: const Center(
          child: Icon(Icons.waving_hand, size: 100.0),
        ),
      ),
      PageViewModel(
        title: "Configure as Screen/Server.",
        body: "Click yes to setup this device as server click next otherwise.",
        footer: SizedBox(
          height: 50.0,
          width: 100.0,
          child: TextButton(
            style: TextButton.styleFrom(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(2.0)),
              ),
              backgroundColor: Colors.greenAccent,
            ),
            child: const Text('Yes'),
            onPressed: () {
              SharedPreferencesService.setBool('isServer', true);
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => const ServerView(),
                ),
              );
            },
          ),
        ),
        image: const Center(
          child: Icon(Icons.monitor, size: 100.0),
        ),
      ),
      PageViewModel(
        title: "Configure as CSR/Teller.",
        body: "Click yes to setup this device as CSR/Teller.",
        footer: SizedBox(
          height: 50.0,
          width: 100.0,
          child: TextButton(
            style: TextButton.styleFrom(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(2.0)),
              ),
              backgroundColor: Colors.greenAccent,
            ),
            child: const Text('Yes'),
            onPressed: () {
              SharedPreferencesService.setBool('isServer', false);
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => const TellerView(),
                ),
              );
            },
          ),
        ),
        image: const Center(
          child: Icon(Icons.phone_android, size: 100.0),
        ),
      ),
    ];

    return Scaffold(
      body: IntroductionScreen(
        pages: listPagesViewModel,
        showNextButton: true,
        showBackButton: true,
        showDoneButton: false,
        back: const Text("Back"),
        next: const Text("Next"),
      ),
    );
  }
}
