import 'package:ecommerce/screens/Login/login_screen.dart';
import 'package:flutter/material.dart';

class RegistrationScreen extends StatefulWidget {
  RegistrationScreen({Key? key}) : super(key: key);

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey ,
      body:Center(child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 30.0),
        width: MediaQuery.of(context).size.width * 0.8,
        height: MediaQuery.of(context).size.height * 0.7,
        decoration: BoxDecoration(
          color: Colors.green[200],
          borderRadius: BorderRadius.circular(30.0),
          boxShadow: [
            BoxShadow(
              spreadRadius: 7.0,
              blurRadius: 7.0,
              color: Colors.purple.withOpacity(.3),
              offset: const Offset(0, 3)
            ),
          ],
          ),
          child: Column(
            children: [
            Text(
            
            "Регистрация",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w500
             ),
            ),
            Spacer(

            ),
            TextField(
              decoration: InputDecoration(
                hintText: 'Введите логин',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40.0)
                )
              ),
            ),
            SizedBox(
              height: 30,
            ),
            TextField(
              maxLength: 20,
              decoration: InputDecoration(
                hintText: 'Введите пароль',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40.0)
                )
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              maxLength: 20,
              decoration: InputDecoration(
                hintText: 'Повторите пароль',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40.0)
                )
              ),
            ),
            SizedBox(height: 10,),
            TextButton(
              onPressed:() {},
               child: Text(
                 "Зарегестрироваться",
                style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500
             ),
                 ),
                 
                 ),
            Spacer(
              flex: 3,
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context)=>Login_screen()
                  ),
                );
              },
               child: Text(
                 "Уже есть аккаунт?",
                 style: TextStyle(
                 fontSize: 16,
                 fontWeight: FontWeight.w500,
                ),
              ),
              style:TextButton.styleFrom(
                   primary:Colors.teal,
                 ),
            ),
            ]
          ),
        )
      ) ,
    );
  }
}