// import 'package:firebase_remote_config/firebase_remote_config.dart';
//
// class FirebaseRemoteConfigService {
//   final FirebaseRemoteConfig remoteConfig = FirebaseRemoteConfig.instance;
//
//   void initialize() async {
//     await remoteConfig.setConfigSettings(RemoteConfigSettings(
//       fetchTimeout: const Duration(minutes: 1),
//       minimumFetchInterval: const Duration(minutes: 10),
//     ));
//     await remoteConfig.fetchAndActivate();
//     print(getData(key: 'baseUrl'));
//   }
//
//   String getData({required String key}) {
//     return remoteConfig.getString(key);
//   }
// }
