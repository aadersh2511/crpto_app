import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import './homePage.dart';

void main() async{
  List currencies;
  currencies=await getCurrencies();
  runApp(MyApp(currencies));
}

class MyApp extends StatelessWidget{
  final List currencies;
  MyApp(this.currencies);
  @override
    Widget build(BuildContext context) {
      // TODO: implement build
      return MaterialApp(
        theme: new ThemeData(
          primarySwatch: Colors.pink
        ),
        home: Scaffold(
          appBar: AppBar(
            title: Text("Crypto Currency"),

          ),
          body: HomePage(currencies),

        )
      );
    }
}
Future<List> getCurrencies() async{
    http.Response response=await http.get("https://api.coinmarketcap.com/v1/ticker/?limit=50");
    return JSON.decode(response.body);
  }