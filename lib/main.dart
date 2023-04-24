// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import "package:what_time/pages/home.dart";
import 'package:what_time/pages/loading.dart';
import 'package:what_time/pages/choose_location.dart';

void main() => runApp(MaterialApp(
  initialRoute:'/',
    routes: {
        '/':(context)=> SafeArea(child: Loading()),
      '/home':(context)=>SafeArea(child: Home()),
      '/location':(context)=>SafeArea(child: ChooseLocation()),
    },
    ));


