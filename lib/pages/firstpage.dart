import 'package:authentest_102/pages/register_page.dart';
import 'package:authentest_102/pages/succese_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:authentest_102/auth_service.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // Varibale
    final _fromkey = GlobalKey<FormState>();
    TextEditingController email = TextEditingController();
    TextEditingController password = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text("Authen Test 102"),
      ),
      body: SafeArea(
        child: ListView(
          children: [
             Text('\nWelcome to Authen test application\n', textAlign: TextAlign.center,style: TextStyle(fontSize: 25),),
            Form(
              key: _fromkey,
              child: Column(
              children: [
              // ---------------------------------------------E-mail--------------------------------------------- 
              Text('Email\n', textAlign: TextAlign.left,style: TextStyle(fontSize: 20),),
              TextFormField(
                controller: email,
                validator: (value) {
                   if (value!.isEmpty) {
                        return 'Please enter email';
                      }
                      return null;
                    }
              ),

              // ---------------------------------------------Password--------------------------------------------- 
              Text('password\n', textAlign: TextAlign.left,style: TextStyle(fontSize: 20),),
              TextFormField(
                controller: password,
                validator: (value) {
                   if (value!.isEmpty) {
                        return 'Please enter password';
                      }
                      return null;
                    }
              ),
              ],
            )),
            ElevatedButton(
                onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => MyRegisterPage(),));
                },
                child: Text("Register here")
              ),
              ElevatedButton(
                onPressed: (){
                  if (_fromkey.currentState!.validate()){
                    AuthService.signInFunc(email.text, password.text);
                    Navigator.push(
                    context,MaterialPageRoute(builder: (context) => MySuccesePage()));
                  }
                },
                child: Text("Sign in", textAlign: TextAlign.left,style: TextStyle(fontSize: 20),)
              )
          ],
        )
      )
    );
  }
}