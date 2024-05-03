import 'package:flutter/material.dart';

import '../services/server_service.dart';
// import '../widget/logout_button_widget.dart';

class TellerSettingsView extends StatefulWidget {
  const TellerSettingsView({super.key});

  @override
  State<TellerSettingsView> createState() => _TellerSettingsViewState();
}

class _TellerSettingsViewState extends State<TellerSettingsView> {
  final TextEditingController ip = TextEditingController();
  final TextEditingController port = TextEditingController();

  @override
  void initState() {
    super.initState();
    ip.text = ServerService.serverIp;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Teller Settings'),
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
              // color: Colors.green,
              width: 250.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Server',
                    style:
                        TextStyle(fontWeight: FontWeight.w500, fontSize: 18.0),
                  ),
                  const Divider(),
                  const SizedBox(height: 15.0),
                  SizedBox(
                    width: 250.0,
                    child: TextField(
                      controller: ip,
                      decoration: InputDecoration(
                        labelText: 'Ip',
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.black,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.red,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30.0),
            SizedBox(
              // color: Colors.pink,
              width: 200.0,
              child: Column(
                children: [
                  const Text(
                    'Ip Address',
                    style:
                        TextStyle(fontWeight: FontWeight.w500, fontSize: 18.0),
                  ),
                  const Divider(),
                  Text(
                    ServerService.localIp,
                    style: const TextStyle(
                        fontWeight: FontWeight.w400, fontSize: 15.0),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Ink(
        height: 50.0,
        color: Colors.greenAccent,
        child: InkWell(
          child: const Center(child: Text('Save')),
          onTap: () {
            ServerService.setServerIp(ip.text.trim());
          },
        ),
      ),
    );
  }
}
