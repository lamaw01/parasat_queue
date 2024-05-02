import 'package:flutter/foundation.dart';
import 'package:parasat_queue/services/server_service.dart';

import '../services/sharedpreference_service.dart';

ValueNotifier<int> regular = ValueNotifier(0);
ValueNotifier<int> special = ValueNotifier(0);

void setPrefQueueValue() {
  regular.value = SharedPreferencesService.getInt('regularCounter') ?? 0;
  special.value = SharedPreferencesService.getInt('specialCounter') ?? 0;
  ServerService.setServerIp(
      SharedPreferencesService.getString('serverIp') ?? ServerService.serverIp);
}

void setQueueCounterFromServer(int reg, int spe) {
  regular.value = reg;
  special.value = spe;
}
