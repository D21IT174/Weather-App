// import 'package:flutter_spinkit/flutter_spinkit.dart';
// import 'package:flutter/material.dart';
// import 'main.dart';
// class loading extends StatefulWidget {
//   const loading({Key? key}) : super(key: key);
//
//   @override
//   State<loading> createState() => _loadingState();
// }
//
// class _loadingState extends State<loading> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         child: Center(
//           child: SpinKitRipple(
//             color: Colors.white,
//             size: 150.0,
//             duration: Duration(milliseconds: 1200),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

//import 'package:weather_flutter/utils/location.dart';
import 'config/location_helper.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  late LocationHelper locationData;

  Future<void> getLocationData() async {
    locationData = LocationHelper();
    await locationData.getCurrentLocation();

    if (locationData.latitude == null || locationData.longitude == null) {
      // todo: Handle no location
    }

    print(locationData.longitude);
    print(locationData.latitude);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLocationData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.purple, Colors.blue],
          ),
        ),
        child: Center(
          child: SpinKitRipple(
            color: Colors.white,
            size: 150.0,
            duration: Duration(seconds: 2),
          ),
        ),
      ),
    );
  }
}
