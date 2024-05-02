import 'dart:developer';
import 'dart:io';

import '/services/sharedpreference_service.dart';
import 'package:server_nano/server_nano.dart';

import '../static/globals.dart';
import 'http_service.dart';

class ServerService {
  static final _server = Server();
  static const int _port = 8080;

  static String _localIp = 'http://';
  static String get localIp => _localIp;

  static String _serverIp = 'http://';
  static String get serverIp => _serverIp;

  static void setServerIp(String value) async {
    _serverIp = value;
    SharedPreferencesService.setString('serverIp', value);
    await HttpService.getQueue().then((result) {
      setQueueCounterFromServer(result.regular, result.special);
    });
  }

  static Future<void> getLocalIp() async {
    try {
      final List<NetworkInterface> interfaces = await NetworkInterface.list();

      final NetworkInterface firstInterface = interfaces.first;

      if (SharedPreferencesService.getBool('isServer') ?? false) {
        //server get get ip and port
        _serverIp =
            '$_serverIp${firstInterface.addresses.first.address}:$_port';
      } else {
        //teller get ip
        _localIp = '$_localIp${firstInterface.addresses.first.address}';
        // _serverIp = '$_serverIp${firstInterface.addresses.first.address}:$_port';
      }
    } catch (e) {
      log('getLocalIp $e');
    }
  }

  static void init() async {
    await getLocalIp();

    ServerService.setServerIp(SharedPreferencesService.getString('serverIp') ??
        ServerService.serverIp);

    if (SharedPreferencesService.getBool('isServer') == false) {
      return;
    }

    setPrefQueueValue();

    _server.get('/', (req, res) {
      // res.send(
      //     'Current Queue: regular -> ${regular.value} | special -> ${special.value}');
      res.sendJson({'regular': regular.value, 'special': special.value});
    });

    _server.get('/add_regular', (req, res) {
      regular.value++;
      res.send('Added Queue: regular -> ${regular.value}');
      SharedPreferencesService.setInt('regularCounter', regular.value);
    });

    _server.get('/add_special', (req, res) {
      special.value++;
      res.send('Added Queue: special -> ${special.value}');
      SharedPreferencesService.setInt('specialCounter', special.value);
    });

    _server.get('/minus_regular', (req, res) {
      if (regular.value > 0) regular.value--;
      res.send('Minus Queue: regular -> ${regular.value}');
      SharedPreferencesService.setInt('regularCounter', regular.value);
    });

    _server.get('/minus_special', (req, res) {
      if (special.value > 0) special.value--;
      res.send('Minus Queue: special -> ${special.value}');
      SharedPreferencesService.setInt('specialCounter', special.value);
    });

    _server.get('/reset_queue', (req, res) {
      regular.value = 0;
      special.value = 0;
      res.send(
          'Reset Queue: regular -> ${regular.value} | special -> ${special.value}');
      SharedPreferencesService.setInt('regularCounter', 0);
      SharedPreferencesService.setInt('specialCounter', 0);
    });

    _server.listen(
      port: _port,
      serverMode: ServerMode.compatibility,
    );

    log('server ip and port: $_serverIp');
  }
}
