import 'package:flutter/material.dart';

import '../services/http_service.dart';
import '../static/globals.dart';
import '../widget/reset_button_widget.dart';
import '../widget/settings_button_widget.dart';
import '../widget/snackbar_widget.dart';

class TellerView extends StatefulWidget {
  const TellerView({super.key});

  @override
  State<TellerView> createState() => _TellerViewState();
}

class _TellerViewState extends State<TellerView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await HttpService.getQueue().then((result) {
        setQueueCounterFromServer(result.regular, result.special);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Teller'),
        actions: const [
          SettingsButtonWidget(),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 150.0,
                  width: 150.0,
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
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      ValueListenableBuilder(
                        valueListenable: regular,
                        builder: (ctx, value, widget) {
                          return Text(
                            value.toString(),
                            style: const TextStyle(
                              fontSize: 26,
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
                  width: 150.0,
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
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      ValueListenableBuilder(
                        valueListenable: special,
                        builder: (ctx, value, widget) {
                          return Text(
                            value.toString(),
                            style: const TextStyle(
                              fontSize: 26,
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
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 50.0,
                  width: 200.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        onPressed: () async {
                          await HttpService.minusRegular().then((success) {
                            if (!success) {
                              showSnackBar(context, 'Error adding queue');
                            }
                          });
                        },
                        icon: const Icon(
                          Icons.remove,
                          color: Colors.red,
                          size: 30.0,
                        ),
                      ),
                      const Text(
                        'Regular',
                        style: TextStyle(fontSize: 20.0),
                      ),
                      IconButton(
                        onPressed: () async {
                          await HttpService.addRegular().then((success) {
                            if (!success) {
                              showSnackBar(context, 'Error adding queue');
                            }
                          });
                        },
                        icon: const Icon(
                          Icons.add,
                          color: Colors.green,
                          size: 30.0,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 200.0,
                  child: Divider(),
                ),
                SizedBox(
                  height: 50.0,
                  width: 200.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        onPressed: () async {
                          await HttpService.minusSpecial().then((success) {
                            if (!success) {
                              showSnackBar(context, 'Error decreasing queue');
                            }
                          });
                        },
                        icon: const Icon(
                          Icons.remove,
                          color: Colors.red,
                          size: 30.0,
                        ),
                      ),
                      const Text(
                        'Special',
                        style: TextStyle(fontSize: 20.0),
                      ),
                      IconButton(
                        onPressed: () async {
                          await HttpService.addSpecial().then((success) {
                            if (!success) {
                              showSnackBar(context, 'Error decreasing queue');
                            }
                          });
                        },
                        icon: const Icon(
                          Icons.add,
                          color: Colors.green,
                          size: 30.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const ResetButtonWidget(),
          ],
        ),
      ),
    );
  }
}
