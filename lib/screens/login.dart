import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 245, 240),
        leading: IconButton(
            onPressed: () {},
            color: Colors.brown,
            icon: const Icon(Icons.arrow_back)),
        title: const Text(
          "Log In",
          style: TextStyle(color: Colors.brown),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 40),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const TextField(
            decoration: InputDecoration(labelText: 'E-mail'),
          ),
          const SizedBox(height: 16.0),
          const TextField(
            decoration: InputDecoration(
              suffixIcon: Icon(Icons.remove_red_eye),
              labelText: 'Goodreads password',
            ),
            obscureText: true,
          ),
          const SizedBox(
            height: 16.0,
          ),
          const Text(
            "Forgot your password?",
            style: TextStyle(
                fontSize: 12, color: Color.fromARGB(255, 106, 160, 253)),
          ),
          const SizedBox(
            height: 16.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.all(18.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        )),
                    onPressed: () {},
                    child: const Text("Log In")),
              ),
            ],
          ),
          const SizedBox(
            height: 16.0,
          ),
          const Expanded(
            child: Text.rich(TextSpan(
              text: "By using Goodreads,you agree to our",
              children: [
                TextSpan(
                  text: ' Terms of Use, Privacy Policy ',
                  style: TextStyle(
                    color: Color.fromARGB(
                        255, 33, 205, 228), // Change the color here
                  ),
                ),
                TextSpan(
                  text: ' and ',
                ),
                TextSpan(
                  text: ' Ads Policy ',
                  style: TextStyle(
                    color: Color.fromARGB(
                        255, 33, 205, 228), // Change the color here
                  ),
                ),
                
              ],
            )),
          ),
        ]),
      ),
    );
  }
}
