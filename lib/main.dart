import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:todo/screen/homescree.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: false,
      ),
      home: Homescreen2(),
    );
  }
}




















class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {


   List data1=[];
  void getApi()async{
    try{
    final respone = await http.get(Uri.parse("http://10.10.192.198:8006/api/todo"));
    print(respone.body);
    final data =json.decode(respone.body);
    setState(() {
      data1 =data;
    });
    }catch(e){

    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getApi();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( title: Text("Home"),),
      drawer: Drawer(),
      body: Container(
        // color: Colors.green,
        child: Column(children: [
          Text("hiiiiiiiiiiiiiiiiiiiiiihhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhgf"),
          Text("data"),
          Text("${data1}"),
          ElevatedButton(onPressed: () {
            getApi();
          }, child: Text("Click"))
        ],),
      ),
    );
  }
}