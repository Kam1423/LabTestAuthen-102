import 'package:authentest_102/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class MySuccesePage extends StatefulWidget {
  const MySuccesePage({super.key});

  @override
  State<MySuccesePage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MySuccesePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Congrats You succeseful Sign in"),),
      body: ListView(children: [
        Text("Sign In Succeseful.",textAlign: TextAlign.center,style: TextStyle(fontSize: 25),),
        ElevatedButton(onPressed:(() {
          AuthService.signOutFunc();
          Navigator.pop(context);
        }), child: Text("Sign out"))

      ],),
    );
  }
}