import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import "package:shared_preferences/shared_preferences.dart";

//************** SHARED PERFERENCE ****************//
// it creates cache memory of the storage
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String name = "";

  final nameController = TextEditingController();

  setName() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString('cachename', nameController.text);
  }

  getName() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    setState(() {
      // name= sp.getString('cachename')!;
      // or
      name = sp.getString('cachename') ?? 'noname';
    });
  }

  // void initState() {
  //   super.initState();
  //   setState(() {
  //     name = sp.getString('cachename');
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Shared Preferences',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
          ),
        ),
        body: Center(
          child: Column(
            children: [
              const Text("enter your name"),
              //
              TextField(controller: nameController),
              //
              ElevatedButton(onPressed: setName, child: const Text("Set name")),
              //
              ElevatedButton(onPressed: getName, child: const Text("Get name")),
              //
              Text(
                'Your name is $name',
                style: const TextStyle(fontSize: 50),
              ),
              //
            ],
          ),
        ));
  }
}