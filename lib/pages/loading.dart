// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:what_time/services/world_time.dart';
import "package:flutter_spinkit/flutter_spinkit.dart";

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  // void getData()async{
  //   Response res= await get(Uri.https('jsonplaceholder.typicode.com','todos/1'));
  //   Map data=jsonDecode(res.body);
  //   print(data);
  //
  //
  // }

  void setupWorldTime() async {
    WorldTime instance = WorldTime(
        location: "Berlin", flag: "germany.png", url: 'Europe/Berlin');
    // while(!instance.ok){
      await instance.getTime();
    // }
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      "isDaytime": instance.isDaytime,
    });
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();

    // getData();
    // must be a void method without a async keyword
    //do only when this widget load
    //does once for every lifecycle
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Center(
        child: SpinKitCubeGrid(
          color: Colors.white,
          size: 80,
        ),
      ),
    );
  }
}
