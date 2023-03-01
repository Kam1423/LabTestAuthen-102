import 'package:authentest_102/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class MyRegisterPage extends StatefulWidget {
  const MyRegisterPage({super.key});

  @override
  State<MyRegisterPage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyRegisterPage> {

  @override
  Widget build(BuildContext context) {
    final _fromkey = GlobalKey<FormState>();
    TextEditingController email = TextEditingController();
    TextEditingController password = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: Text("Register page"),),
      body: SafeArea(child: ListView(children: [
        Form(
        key: _fromkey,
        child: Column(
          children: [
            Text('\nPlease In Inform the detail below\n', textAlign: TextAlign.center,style: TextStyle(fontSize: 20),),
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
            // ---------------------------------------------E-mail--------------------------------------------- 
            Text('Password\n', textAlign: TextAlign.left,style: TextStyle(fontSize: 20),),
            TextFormField(
              controller: password,
              validator: (value) {
                 if (value!.isEmpty) {
                      return 'Please enter email';
                    }
                    return null;
                  }
            ),
          ],
          ),
        ),
        ElevatedButton(onPressed:() {
          if (_fromkey.currentState!.validate()){
            AuthService.registerFunc(email.text, password.text);
            Navigator.pop(context);
          }
        },
        child: Text("Sumit info", textAlign: TextAlign.left,style: TextStyle(fontSize: 20))
        )
      ],)
      ),
    );
  }
}