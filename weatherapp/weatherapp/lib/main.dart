import 'package:flutter/material.dart';

//import 'package:weatherapp/config/LocationPage.dart';
import 'package:weatherapp/weather.dart';

import 'city.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather_App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: weather(),
    );
  }
}

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key, required this.title}) : super(key: key);
//
//   final String title;
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.blueAccent,
//         leading: IconButton(
//           icon: Icon(Icons.menu),
//           color: Colors.white,
//           onPressed: () {},
//         ),
//         centerTitle: true,
//         // Here we take the value from the MyHomePage object that was created by
//         // the App.build method, and use it to set our appbar title.
//         title: Text(
//           'Weather',
//           style: TextStyle(
//             color: Colors.white,
//           ),
//         ),
//       ),
//       body: ListView(
//         padding: EdgeInsets.symmetric(
//           horizontal: 30,
//           vertical: 25,
//         ),
//         // crossAxisAlignment: CrossAxisAlignment.start,
//         // mainAxisAlignment: MainAxisAlignment.start,
//         //
//         children: [
//           Container(
//             padding: EdgeInsets.symmetric(horizontal: 25, vertical: 25),
//             child: ClipRRect(
//               borderRadius: BorderRadius.circular(40),
//               child: Image.asset(
//                 "images/image1.jpg",
//                 height: 250,
//                 fit: BoxFit.cover,
//               ),
//             ),
//           ),
//           SizedBox(
//             height: 10,
//           ),
//           Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Text(
//                 '45°C',
//                 style: TextStyle(fontSize: 30, fontWeight: FontWeight.w400),
//               ),
//               SizedBox(
//                 height: 5,
//               ),
//               Text(
//                 'Sunny',
//                 style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
//               ),
//               SizedBox(
//                 height: 5,
//               ),
//               Text(
//                 'Wednesday  24 may ',
//                 style: TextStyle(
//                   fontSize: 15,
//                   fontWeight: FontWeight.w300,
//                 ),
//               ),
//             ],
//           ),
//           SizedBox(
//             height: 10,
//           ),
//           ListView(
//
//             scrollDirection: Axis.horizontal,
//             children: [
//               Container(
//                 padding: EdgeInsets.symmetric(horizontal: 8, vertical: 35),
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(25),
//                   color: Colors.blueAccent,
//                 ),
//                  child: Column(
//                    mainAxisSize: MainAxisSize.min,
//                    crossAxisAlignment: CrossAxisAlignment.start,
//                    children: [
//                      Text('24 may'),
//                      SizedBox(
//                        height: 3,
//                      ),
//                      Text('Wednesday'),
//                      SizedBox(
//                        height: 3,
//                      ),
//                      ClipRRect(
//                        borderRadius: BorderRadius.circular(3),
//                        child: Image.asset(
//                          "images/image1.jpg",
//                          height: 30,
//                          width: 35,
//                          fit: BoxFit.cover,
//                        ),
//                      ),
//                      SizedBox(
//                        height: 10,
//                      ),
//                      Text('45°')
//                    ],
//                  ),
//               ),
//               SizedBox(
//                 width: 15,
//               ),
//               Container(
//                 padding: EdgeInsets.symmetric(horizontal: 15, vertical: 35),
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(25),
//                   color: Colors.lightBlue.shade200,
//                 ),
//                  child: Column(
//                    mainAxisSize: MainAxisSize.min,
//                    crossAxisAlignment: CrossAxisAlignment.start,
//                    children: [
//                      Text('25 may'),
//                      SizedBox(
//                       height: 3,
//                     ),
//                     Text('Thursday'),
//                     SizedBox(
//                       height: 3,
//                     ),
//                     ClipRRect(
//                       borderRadius: BorderRadius.circular(3),
//                       child: Image.asset(
//                         "images/image2.jpg",
//                         height: 30,
//                         width: 35,
//                         fit: BoxFit.cover,
//                       ),
//                     ),
//                     SizedBox(
//                       height: 10,
//                     ),
//                     Text('42°')
//                   ],
//                 ),
//               ),
//               SizedBox(
//                 width: 15,
//               ),
//               Container(
//                 padding: EdgeInsets.symmetric(horizontal: 19, vertical: 35),
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(25),
//                   color: Colors.lightBlue.shade200,
//                 ),
//                 // child: Column(
//                 //   mainAxisSize: MainAxisSize.min,
//                 //   crossAxisAlignment: CrossAxisAlignment.start,
//                 //   children: [
//                 //     Text('26 may'),
//                 //     SizedBox(
//                 //       height: 3,
//                 //     ),
//                 //     Text('Friday'),
//                 //     SizedBox(
//                 //       height: 3,
//                 //     ),
//                 //     ClipRRect(
//                 //       borderRadius: BorderRadius.circular(3),
//                 //       child: Image.asset(
//                 //         "images/image3.jpg",
//                 //         height: 30,
//                 //         width: 35,
//                 //         fit: BoxFit.cover,
//                 //       ),
//                 //     ),
//                 //     SizedBox(
//                 //       height: 10,
//                 //     ),
//                 //     Text('38°')
//                 //   ],
//                 // ),
//               ),
//               SizedBox(
//                 width: 15,
//               ),
//               Container(
//                 padding: EdgeInsets.symmetric(horizontal: 19, vertical: 35),
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(25),
//                   color: Colors.lightBlue.shade200,
//                 ),
//                 // child: Column(
//                 //   mainAxisSize: MainAxisSize.min,
//                 //   crossAxisAlignment: CrossAxisAlignment.start,
//                 //   children: [
//                 //     Text('27 may'),
//                 //     SizedBox(
//                 //       height: 3,
//                 //     ),
//                 //     Text('Saturday'),
//                 //     SizedBox(
//                 //       height: 3,
//                 //     ),
//                 //     ClipRRect(
//                 //       borderRadius: BorderRadius.circular(3),
//                 //       child: Image.asset(
//                 //         "images/image3.jpg",
//                 //         height: 30,
//                 //         width: 35,
//                 //         fit: BoxFit.cover,
//                 //       ),
//                 //     ),
//                 //     SizedBox(
//                 //       height: 10,
//                 //     ),
//                 //     Text('35°')
//                 //   ],
//                 // ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
// //   Widget ListCard(int index, {VoidCallback? onTap}) {
// //     List<MaterialColor> colors = [
// //       Colors.blue,
// //     ];
// // }
