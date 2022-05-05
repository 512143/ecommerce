import 'package:flutter/material.dart';

class Login_screen extends StatefulWidget {
  Login_screen({Key? key}) : super(key: key);

  @override
  _Login_screenState createState() => _Login_screenState();
}

class _Login_screenState extends State<Login_screen> {
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
            
            "Вход",
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
            SizedBox(height: 10,),
            TextButton(
              onPressed:() {},
               child: Text(
                 "Войти",
                style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500
             ),
                 ),
                 
                 ),
            Spacer(
              flex: 3,
            )
            ]
          ),
        )
      ) ,
    );
    
  }
}