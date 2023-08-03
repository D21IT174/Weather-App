import 'package:location/location.dart';

class LocationHelper {
  late double latitude;
  late double longitude;

  Future<void> getCurrentLocation() async {
    Location location = Location();

    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    LocationData _locationData;

    //check weather we have permission for location
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }
    // if permission are not there , return
    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }
    //if permission are there , find the location and store longi&latitu
    _locationData = await location.getLocation();
    latitude = _locationData.latitude!;
    longitude = _locationData.longitude!;
  }
}
