// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};
  @override
  Widget build(BuildContext context) {
    data =
        data.isNotEmpty ?data: ModalRoute.of(context)?.settings.arguments as Map ;

    print(data);
    String bgImage = data['isDaytime'] ? "day.png" : "night.png";
    Color bgColor = data['isDaytime'] ? Colors.blue : Colors.purple;

    return Scaffold(
      backgroundColor: bgColor,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/$bgImage"),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
          child: Column(
            children: [
              TextButton.icon(
                  onPressed: () async {
                    dynamic result =
                        await Navigator.pushNamed(context, "/location");
                    setState(() {
                      data = {
                        'location': result["location"],
                        'flag': result["flag"],
                        'time': result["time"],
                        "isDaytime": result["isDaytime"],
                      };
                    });
                  },
                  icon: Icon(
                    Icons.edit_location_alt,
                    color: Colors.grey[300],
                  ),
                  label: Text(
                    "Edit Location",
                    style: TextStyle(
                      color: Colors.grey[300],
                    ),
                  )),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    data["location"],
                    style: TextStyle(
                      fontSize: 28,
                      letterSpacing: 2,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                data["time"],
                style: TextStyle(
                  fontSize: 66,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
