import 'package:flutter/material.dart';
import 'package:weatherapp/weather.dart';

class day extends StatefulWidget {
  const day({Key? key}) : super(key: key);

  @override
  State<day> createState() => _dayState();
}

class _dayState extends State<day> {
  @override
  Widget build(BuildContext context) {
    var time = DateTime.now();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => weather()));
            },
          ),
          centerTitle: true,
          title: Text('Day'),
        ),
        // bottomNavigationBar: BottomNavigationBar(
        //   items: const [
        //     BottomNavigationBarItem(icon: Icon(Icons.home), label: 'homecity'),
        //     BottomNavigationBarItem(icon: Icon(Icons.add_circle),label: 'Add'),
        //   ],
        // ),

        body: Container(
          padding: EdgeInsets.symmetric().copyWith(top: 10),
          child: ListView(
            scrollDirection: Axis.vertical,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 3),
                color: Colors.white,
                child: Row(
                  children: [
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 5, vertical: 25),
                      color: Colors.white,
                      child: Column(
                        children: [
                          Text(
                            ' ${time.hour}:${time.minute}',
                          ),
                          Text('${time.weekday}')
                        ],
                      ),
                    ),
                    Spacer(),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Image.asset(
                        "images/image5.jpg",
                        height: 50,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Spacer(),
                    Text(
                      '40°',
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                color: Colors.cyanAccent,
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                color: Colors.cyanAccent,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
