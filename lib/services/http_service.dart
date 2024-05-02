import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:parasat_queue/model/counter_model.dart';
import 'package:parasat_queue/services/server_service.dart';

class HttpService {
  static Future<CounterModel> getQueue() async {
    try {
      var response = await http.get(
        Uri.parse(ServerService.serverIp),
        headers: <String, String>{
          'Accept': '*/*',
          'Content-Type': 'application/json; charset=UTF-8',
        },
      ).timeout(const Duration(seconds: 3));
      debugPrint('getQueue ${response.body}');
      return counterModelFromJson(response.body);
    } catch (e) {
      debugPrint('getQueue $e');
      return CounterModel(regular: 0, special: 0);
    }
  }

  static Future<bool> addRegular() async {
    bool success = false;
    try {
      var response = await http.get(
        Uri.parse('${ServerService.serverIp}/add_regular'),
        headers: <String, String>{
          'Accept': '*/*',
          'Content-Type': 'application/json; charset=UTF-8',
        },
      ).timeout(const Duration(seconds: 3));
      debugPrint('addRegular ${response.body}');
      success = true;
    } catch (e) {
      debugPrint('addRegular $e');
    }
    return success;
  }

  static Future<bool> addSpecial() async {
    bool success = false;
    try {
      var response = await http.get(
        Uri.parse('${ServerService.serverIp}/add_special'),
        headers: <String, String>{
          'Accept': '*/*',
          'Content-Type': 'application/json; charset=UTF-8',
        },
      ).timeout(const Duration(seconds: 3));
      debugPrint('addSpecial ${response.body}');
      success = true;
    } catch (e) {
      debugPrint('addSpecial $e');
    }
    return success;
  }

  static Future<bool> minusRegular() async {
    bool success = false;
    try {
      var response = await http.get(
        Uri.parse('${ServerService.serverIp}/minus_regular'),
        headers: <String, String>{
          'Accept': '*/*',
          'Content-Type': 'application/json; charset=UTF-8',
        },
      ).timeout(const Duration(seconds: 3));
      debugPrint('minusRegular ${response.body}');
      success = true;
    } catch (e) {
      debugPrint('minusRegular $e');
    }
    return success;
  }

  static Future<bool> minusSpecial() async {
    bool success = false;
    try {
      var response = await http.get(
        Uri.parse('${ServerService.serverIp}/minus_special'),
        headers: <String, String>{
          'Accept': '*/*',
          'Content-Type': 'application/json; charset=UTF-8',
        },
      ).timeout(const Duration(seconds: 3));
      debugPrint('minusSpecial ${response.body}');
      success = true;
    } catch (e) {
      debugPrint('minusSpecial $e');
    }
    return success;
  }

  static Future<bool> resetQueueCounter() async {
    bool success = false;
    try {
      var response = await http.get(
        Uri.parse('${ServerService.serverIp}/reset_queue'),
        headers: <String, String>{
          'Accept': '*/*',
          'Content-Type': 'application/json; charset=UTF-8',
        },
      ).timeout(const Duration(seconds: 3));
      debugPrint('resetQueueCounter ${response.body}');
      success = true;
    } catch (e) {
      debugPrint('resetQueueCounter $e');
    }
    return success;
  }
}
