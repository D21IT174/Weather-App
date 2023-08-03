import 'package:flutter/material.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:google_maps_webservice/directions.dart';

// import 'package:google_places_flutter/google_places_flutter.dart';
// import 'package:google_places_flutter/model/prediction.dart' as pre;

import 'home.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String? countryValue = '';
  String? stateValue = '';
  String? cityValue = '';
  bool loading = true;
  TextEditingController controller = TextEditingController();

  // late GoogleMapsPlaces places;
  // List<pre.Prediction> predictions = [];

  @override
  void initState() {
    super.initState();
    getLocationData();
    // places = GoogleMapsPlaces(apiKey: 'AIzaSyDKe1vNHHWUQMKk_J0lIYi_YgZdwISmEXZk');
  }

  getLocationData() {
    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        loading = false;
      });
    });
  }

  /*void autoCompletePredictions(String value) async {
    PlacesAutocompleteResponse result = await places.autocomplete(value);
    if (result != null && result.predictions != null && mounted) {
      print('predictions: ${result.predictions}');
      setState(() {
        predictions = result.predictions.cast<pre.Prediction>();
      });
    }
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const home()));
          },
        ),
        title: const Text('Select your Location'),
      ),
      body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              PlacesAutocompleteField(
                apiKey: 'AIzaSyB41DRUbKWJHPxaFjMAwdrzWzbVKartNGg',
                mode: Mode.overlay,
                types: const ['geocode', 'establishment', 'address', '(cities)', '(regions)'],
                components: [],
                strictbounds: false,
                language: 'en',
                onSelected: (prediction) {
                  print('Prediction $prediction');
                },
              ),
              /* GooglePlaceAutoCompleteTextField(
                  textEditingController: controller,
                  googleAPIKey: 'AIzaSyDKe1vNHHWUQMKk_J0lIYi_YgZdwISmEXZk',
                  inputDecoration: InputDecoration(hintText: "Search your location"),
                  debounceTime: 800,
                  countries: ["in", "fr"],
                  isLatLngRequired: true,
                  getPlaceDetailWithLatLng: (pre.Prediction prediction) {
                    print("placeDetails" + prediction.lng.toString());
                  },
                  itmClick: (pre.Prediction prediction) {
                    controller.text = prediction.description!;

                    controller.selection = TextSelection.fromPosition(TextPosition(offset: prediction.description!.length));
                  }),*/
              /*AnimatedCrossFade(
                crossFadeState: loading ? CrossFadeState.showFirst : CrossFadeState.showSecond,
                duration: const Duration(milliseconds: 500),
                firstChild: const SizedBox(
                  height: 180,
                  width: double.maxFinite,
                  child: Center(
                    child: SizedBox(
                      height: 40,
                      width: 40,
                      child: CircularProgressIndicator(),
                    ),
                  ),
                ),
                secondChild: SelectState(
                  onCountryChanged: (value) {
                    setState(() {
                      countryValue = value;
                    });
                  },
                  onStateChanged: (value) {
                    setState(() {
                      stateValue = value;
                    });
                  },
                  onCityChanged: (value) {
                    setState(() {
                      cityValue = value;
                    });
                  },
                ),
              ),
              ElevatedButton(
                onPressed: checkEnabled()
                    ? () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const weather()));
                      }
                    : null,
                style: TextButton.styleFrom(
                    // backgroundColor: Colors.blue,
                    ),
                child: const Text(
                  'Done',
                  style: TextStyle(color: Colors.white),
                ),
              ),*/
              // InkWell(
              //   onTap:(){
              //     print('country selected is $countryValue');
              //     print('country selected is $stateValue');
              //     print('country selected is $cityValue');
              //   },
              //   child: Text(' Check')
              // )
            ],
          )),
    );
  }

  bool checkEnabled() {
    return ((countryValue != '' && countryValue != 'Choose Country') &&
        (stateValue != '' && stateValue != 'Choose State') &&
        (cityValue != '' && cityValue != 'Choose City'));
  }
}
