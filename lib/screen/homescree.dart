import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class Homescreen2 extends StatefulWidget {
  const Homescreen2({super.key});

  @override
  State<Homescreen2> createState() => _Homescreen2State();
}

class _Homescreen2State extends State<Homescreen2> {
  List res = [];
  void get()async{
    try{
      final response = await http.get(Uri.parse("http://10.10.192.198:8006/api/todo"));
      print(response.body); 
      final res1 = jsonDecode(response.body);
      setState(() {
        res = res1;
      });
    }
    catch(e){

    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home Page"),),
      body: Center(
        child: Column(
          
          children: [
          Text("CLick the button below"),
          ElevatedButton(onPressed: () {
            get();
          }, child: Icon(Icons.add_comment_rounded)),
          Expanded(
            child: ListView.builder(
              itemCount: res.length,
              itemBuilder: (context, index) {
              return Text(res[index]["desc"]);
            },),
          )

        ],),
      ),
    );
  }
}