import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:weatherapp/day.dart';
import 'package:weatherapp/model/weather_details.dart';
import 'package:weatherapp/model/forecast_model.dart';

void main() => runApp(const weather());

class weather extends StatefulWidget {
  const weather({super.key});

  @override
  State<weather> createState() => _weatherState();
}

class _weatherState extends State<weather> {
  int temperature = 0;
  int maxTemp = 0;
  String weatherStatename = 'Loading..';
  int humidity = 0;
  int windSpeed = 0;
  var currentDate = 'Loading..';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.blue[50],
        appBar: AppBar(
          /*leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const home()));
            },
          ),*/
          centerTitle: true,
          title: const Text('Weather'),
          elevation: 1,
        ),
        /*bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'homecity'),
            BottomNavigationBarItem(icon: Icon(Icons.add_circle), label: 'Add'),
          ],
        ),*/
        body: FutureBuilder(
            future: getWeatherDetails(),
            builder: (context, AsyncSnapshot<WeatherDetails> snapshot) {
              if (!snapshot.hasData) {
                return const LoadingWidget(loadingText: 'Fetching weather data');
              } else if (snapshot.hasData && snapshot.data != null) {
                return DataWidget(snapshot: snapshot);
              } else {
                return const SizedBox();
              }
            }),
      ),
    );
  }

  Future<WeatherDetails> getWeatherDetails() async {
    double lat = 23.033863, long = 72.585022;
    String apiKey = 'b30de56fcbd933743d24fc9004670526';
    final response = await http.get(Uri.parse('https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$long&appid=$apiKey&units=metric'));

    if (response.statusCode == 200) {
      print('Response: ${response.body}');
      return WeatherDetails.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load weather details');
    }
  }
}

class LoadingWidget extends StatelessWidget {
  final String? loadingText;

  const LoadingWidget({super.key, required this.loadingText});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Icon(
                Icons.wb_cloudy_rounded,
                color: Colors.blue[300],
                size: 32,
              ),
              SizedBox(
                height: 70,
                width: 70,
                child: CircularProgressIndicator(color: Colors.blue[300], strokeWidth: 1.5),
              ),
            ],
          ),
          const SizedBox(height: 30),
          Text(
            '$loadingText',
            style: const TextStyle(fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 60),
        ],
      ),
    );
  }
}

class DataWidget extends StatefulWidget {
  final AsyncSnapshot<WeatherDetails> snapshot;

  const DataWidget({super.key, required this.snapshot});

  @override
  State<DataWidget> createState() => _DataWidgetState();
}

class _DataWidgetState extends State<DataWidget> {
  @override
  Widget build(BuildContext context) {
    DateTime time = DateTime.now();
    return Column(
      children: [
        const SizedBox(height: 10),
        Text(
          '${time.day} ${DateFormat('MMMM').format(time)}, ${DateFormat('EEEE').format(time)}',
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${widget.snapshot.data!.main!.temp!.round()}',
                        style: const TextStyle(fontSize: 52),
                      ),
                      const SizedBox(width: 2),
                      const Text(
                        '°C',
                        style: TextStyle(fontSize: 20, height: 1.6),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Text(
                    'Feels like ${widget.snapshot.data!.main!.feelsLike!.round()}°C',
                  ),
                ],
              ),
              const Spacer(),
              Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset(
                      "images/image1.jpg",
                      height: 80,
                      width: 80,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '${widget.snapshot.data!.weatherList![0].main}',
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ],
          ),
        ),
        Text(
          '${widget.snapshot.data!.name}',
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 8),
        Text('(${widget.snapshot.data!.coOrd!.lat},${widget.snapshot.data!.coOrd!.long})'),
        const Divider(color: Colors.blue, height: 40),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        const Text(
                          'Humidity',
                        ),
                        const SizedBox(height: 5),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          mainAxisAlignment: MainAxisAlignment.center,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              '${widget.snapshot.data!.main!.humidity}',
                              style: const TextStyle(fontSize: 24),
                            ),
                            const Text(' %'),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        const Text(
                          'Pressure',
                        ),
                        const SizedBox(height: 5),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          mainAxisAlignment: MainAxisAlignment.center,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              '${widget.snapshot.data!.main!.pressure}',
                              style: const TextStyle(fontSize: 24),
                            ),
                            const Text(' mBar'),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        const Text(
                          'Wind',
                        ),
                        const SizedBox(height: 5),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          mainAxisAlignment: MainAxisAlignment.center,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              '${widget.snapshot.data!.wind!.speed}',
                              style: const TextStyle(fontSize: 24),
                            ),
                            const Text(' km/h'),
                          ],
                        ),
                        Text(
                          'From ${windDirection(widget.snapshot.data!.wind!.deg!)}',
                          style: const TextStyle(fontSize: 11, color: Colors.black54),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        const Text(
                          'Visibility',
                        ),
                        const SizedBox(height: 5),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          mainAxisAlignment: MainAxisAlignment.center,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              '${((widget.snapshot.data!.visibility!) / 1000).round()}',
                              style: const TextStyle(fontSize: 24),
                            ),
                            const Text(' km'),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          child: Column(
            children: [
              Row(
                children: [
                  Column(
                    children: [
                      const Text('Sunrise'),
                      const SizedBox(height: 5),
                      Text(
                        '${DateTime.fromMillisecondsSinceEpoch(widget.snapshot.data!.sys!.sunrise! * 1000).hour.toString().padLeft(2, '0')}:${DateTime.fromMillisecondsSinceEpoch(widget.snapshot.data!.sys!.sunrise! * 1000).minute.toString().padLeft(2, '0')} am',
                        style: const TextStyle(fontSize: 24),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Column(
                    children: [
                      const Text('Sunset'),
                      const SizedBox(height: 5),
                      Text(
                        '${(DateTime.fromMillisecondsSinceEpoch(widget.snapshot.data!.sys!.sunset! * 1000).hour - 12).toString().padLeft(2, '0')}:${DateTime.fromMillisecondsSinceEpoch(widget.snapshot.data!.sys!.sunset! * 1000).minute.toString().padLeft(2, '0')} pm',
                        style: const TextStyle(fontSize: 24),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Column(
                children: [
                  const Text('Length of the day'),
                  const SizedBox(height: 5),
                  Text(
                    dayLength(),
                    style: const TextStyle(fontSize: 24),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        // const Spacer(),
        /*FutureBuilder(
          future: getForecastDetails(),
          builder: (context, AsyncSnapshot<ForecastResponse> snapshot) {
            if (!snapshot.hasData) {
              return const LoadingWidget(loadingText: 'Fetching forecast data');
            } else if (snapshot.hasData && snapshot.data != null) {
              return const ForecastWidget();
            }
            return const SizedBox();
          },
        ),*/
      ],
    );
  }

  Future<ForecastResponse> getForecastDetails() async {
    double lat = 23.033863, long = 72.585022;
    String apiKey = 'b30de56fcbd933743d24fc9004670526';
    final response = await http.get(Uri.parse('https://api.openweathermap.org/data/2.5/forecast/daily?lat=$lat&lon=$long&cnt=7&appid=$apiKey'));

    if (response.statusCode == 200) {
      print('Response: ${response.body}');
      print('Parsed Data: ${ForecastResponse.fromJson(jsonDecode(response.body)).toString()}');
      return ForecastResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load weather details');
    }
  }

  windDirection(int value) {
    if (value > 359) {
      value = value - 360;
    }
    if (value == 0) {
      return 'north';
    } else if (value > 0 && value < 90) {
      return 'northeast';
    } else if (value == 90) {
      return 'east';
    } else if (value > 90 && value < 180) {
      return 'southeast';
    } else if (value == 180) {
      return 'south';
    } else if (value > 180 && value < 270) {
      return 'southwest';
    } else if (value == 270) {
      return 'west';
    } else if (value > 270 && value < 360) {
      return 'northwest';
    }
    //0 - 90
    //90 - 180
    //180 - 270
    //270 - 360
  }

  String dayLength() {
    DateTime sunrise = DateTime.fromMillisecondsSinceEpoch(widget.snapshot.data!.sys!.sunrise! * 1000);
    DateTime sunset = DateTime.fromMillisecondsSinceEpoch(widget.snapshot.data!.sys!.sunset! * 1000);
    Duration diff = sunset.difference(sunrise);

    return '${diff.inHours}h ${(diff.inMinutes) % 60}m';
  }
}

class ForecastWidget extends StatelessWidget {
  const ForecastWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueGrey.shade200,
      padding: const EdgeInsets.symmetric(vertical: 2),
      height: 110,
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 1),
        // This next line does the trick.
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          GestureDetector(
            onTap: () {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const day()));
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(15),
              ),
              width: 100,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                //crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('24 may'),
                  const SizedBox(
                    height: 3,
                  ),
                  const Text('Wednesday'),
                  const SizedBox(
                    height: 3,
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(3),
                    child: Image.asset(
                      "images/image1.jpg",
                      height: 30,
                      width: 35,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text('45°')
                ],
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Container(
            width: 100,
            decoration: BoxDecoration(
              color: Colors.lightBlue,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              //crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('26 may'),
                const SizedBox(
                  height: 3,
                ),
                const Text('Thursday'),
                const SizedBox(
                  height: 3,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(3),
                  child: Image.asset(
                    "images/image2.jpg",
                    height: 30,
                    width: 35,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text('42°')
              ],
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Container(
            width: 100,
            decoration: BoxDecoration(
              color: Colors.lightBlue,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              //crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('27 may'),
                const SizedBox(
                  height: 3,
                ),
                const Text('Friday'),
                const SizedBox(
                  height: 3,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(3),
                  child: Image.asset(
                    "images/image2.jpg",
                    height: 30,
                    width: 35,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text('42°')
              ],
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Container(
            width: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.lightBlue,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              //crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('28 may'),
                const SizedBox(
                  height: 3,
                ),
                const Text('Saturday'),
                const SizedBox(
                  height: 3,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(3),
                  child: Image.asset(
                    "images/image2.jpg",
                    height: 30,
                    width: 35,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text('42°')
              ],
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.lightBlue,
            ),
            width: 100,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              //crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('29 may'),
                const SizedBox(
                  height: 3,
                ),
                const Text('Sunday'),
                const SizedBox(
                  height: 3,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(3),
                  child: Image.asset(
                    "images/image2.jpg",
                    height: 30,
                    width: 35,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text('42°')
              ],
            ),
          ),
          const SizedBox(
            width: 10,
          ),
        ],
      ),
    );
  }
}
