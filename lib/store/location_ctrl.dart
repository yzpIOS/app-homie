// import 'package:app/tools.dart';
// import 'package:geocoding/geocoding.dart';
// import 'package:geolocator/geolocator.dart';
//
// class LocationCtrl extends GetxService {
//   @override
//   void onReady() {}
//
//   Future<Position?> getPosition() async {
//     if (await checkPermission()) {
//       try {
//         final position = await Geolocator.getCurrentPosition(
//           forceAndroidLocationManager: true,
//           desiredAccuracy: LocationAccuracy.low,
//           timeLimit: const Duration(seconds: 30),
//         );
//
//         return position;
//       } catch (e) {
//         final position = await Geolocator.getLastKnownPosition(
//           forceAndroidLocationManager: true,
//         );
//
//         return position;
//       }
//     }
//
//     return null;
//   }
//
//   Future<bool> checkPermission() async {
//     Future<bool> requestPermission() async {
//       const granted = {
//         LocationPermission.always,
//         LocationPermission.whileInUse,
//       };
//
//       return granted.contains(
//         await Geolocator.requestPermission(),
//       );
//     }
//
//     if (await Geolocator.isLocationServiceEnabled()) {
//       return await requestPermission();
//     } else {
//       if (await Geolocator.openLocationSettings()) {
//         if (await Geolocator.isLocationServiceEnabled()) {
//           return await requestPermission();
//         }
//       }
//     }
//
//     return false;
//   }
//
//   Future<String?> findPoi({required double lat, required double lng}) async {
//     final result = await placemarkFromCoordinates(lat, lng, localeIdentifier: 'zh_CN');
//
//     return result.firstOrNull?.name;
//   }
// }
