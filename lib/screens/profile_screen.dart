import 'package:book_store/models/user_model.dart';
import 'package:flutter/material.dart';

//import '../models/user_model.dart';

class profile_screen extends StatefulWidget {
  const profile_screen({super.key});

  @override
  State<profile_screen> createState() => _profile_screenState();
}

class _profile_screenState extends State<profile_screen> {
  // user_model user=user_model(first_name: first_name, last_name: last_name, password: password, email: email, id: id);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Your profile'), actions: [
        IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.menu,
            )),
      ]),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Padding(padding: EdgeInsets.all(8.0)),
              CircleAvatar(
                backgroundImage: AssetImage('assets/profile.png'),
                radius: 80.0,
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                'Full Name',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 8.0,
              ),
              Text(
                'abc@gmail.com',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue[600]),
              ),
              SizedBox(
                height: 8.0,
              ),
              Text(
                'Adress',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue[600]),
              ),
              SizedBox(
                height: 8.0,
              ),
              ElevatedButton(onPressed: () {}, child: Text('Edit Profile'))
            ],
          ),
        ],
      ),
    );
  }
}
