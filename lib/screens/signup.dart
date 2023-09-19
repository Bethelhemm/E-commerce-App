// ignore_for_file: avoid_print, unnecessary_null_comparison
import 'package:book_store/models/user_model.dart';
import 'package:book_store/api/api_services.dart';
import 'package:book_store/screens/homepage.dart';

import '../screens/login.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool _obscureText = true;
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  void dispose() {
    super.dispose();
    _userNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  void _signupPressed() async {
    String userName = _userNameController.text;
    String email = _emailController.text;
    String password = _passwordController.text;

    // Check if any of the fields are empty
    if (userName.isEmpty || email.isEmpty || password.isEmpty) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('Please fill in all the fields.'),
            actions: <Widget>[
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
      return;
    }

    ApiService apiservices = ApiService();
    Future<RegistrationResponse?> future = apiservices.registration(
      userName,
      email,
      password,
      "user",
    );
    RegistrationResponse? response = await future;
    // print(response);
    if (response == null) {
      // Email is already registered
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('Email address is already registered.'),
            actions: <Widget>[
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
      return;
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          title: Text.rich(
            TextSpan(
              text: "Page",
              style: TextStyle(
                fontSize: 50,
                fontFamily: AutofillHints.birthday,
                color: Colors.brown.shade200,
                fontWeight: FontWeight.w400,
              ),
              children: const [
                TextSpan(
                  text: "Turner",
                  style: TextStyle(
                    fontSize: 50,
                    color: Colors.brown,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          centerTitle: true,
        ),
        body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
              return SingleChildScrollView(
                  child: Column(children: [
                const SizedBox(height: 16),
                const Text(
                  "Create Account",
                  style: TextStyle(
                    fontFamily: AutofillHints.telephoneNumberLocalSuffix,
                    fontSize: 27,
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    border: Border.all(
                      color: const Color.fromARGB(255, 224, 218, 218),
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: TextField(
                    controller: _userNameController,
                    keyboardType: TextInputType.name,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Username',
                      contentPadding: EdgeInsets.all(10.0),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    border: Border.all(
                      color: const Color.fromARGB(255, 224, 218, 218),
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: TextField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Your email address',
                      contentPadding: EdgeInsets.all(10.0),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    border: Border.all(
                      color: const Color.fromARGB(255, 224, 218, 218),
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: TextField(
                    controller: _passwordController,
                    keyboardType: TextInputType.visiblePassword,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Create a password',
                      contentPadding: EdgeInsets.all(10.0),
                    ),
                    obscureText: _obscureText,
                  ),
                ),
                const SizedBox(height: 24),
                Column(
                  children: [
                    const Row(
                      children: [
                        Icon(Icons.info_outline, size: 16),
                        Text(
                          " Password must be at least 6 characters.",
                          style: TextStyle(
                              color: Color.fromARGB(255, 165, 165, 165)),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            _togglePasswordVisibility();
                          },
                          icon: Icon(
                            _obscureText
                                ? Icons.check_box_outline_blank_sharp
                                : Icons.check_box,
                            size: 25,
                          ),
                        ),
                        const Text(
                          "Show password.",
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          padding: const EdgeInsets.all(18.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                        ),
                        onPressed: () {
                          _signupPressed();
                        },
                        child: const Text("Create account"),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 14),
                Text.rich(
                  TextSpan(
                    text: 'By creating an account, you agree to the Goodreads',
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                    children: [
                      TextSpan(
                        text: ' Terms of Service',
                        style: const TextStyle(
                          fontSize: 18,
                          decoration: TextDecoration.underline,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            const url =
                                'https://example.com/terms-of-service'; // Replace with your Terms of Service URL
                            launchUrl(url as Uri);
                          },
                      ),
                      const TextSpan(text: ' and '),
                      TextSpan(
                        text: 'Privacy Policy',
                        style: const TextStyle(
                          fontSize: 18,
                          decoration: TextDecoration.underline,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            const url =
                                'https://example.com/privacy-policy'; // Replace with your Privacy Policy URL
                            launchUrl(url as Uri);
                          },
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Container(
                  color: Colors.white,
                  child: (const Row(
                    children: <Widget>[
                      // ...
                      Expanded(
                        child: Column(
                          children: <Widget>[
                            Text("Already have an account?"),
                            Divider(color: Colors.black)
                          ],
                        ),
                      )
                    ],
                  )),
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const LoginPage()));
                        },
                        style: OutlinedButton.styleFrom(
                            padding: const EdgeInsets.all(18.0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25.0),
                            )),
                        child: const Text(
                          'Sign-In now',
                          style: TextStyle(
                              color: Color.fromARGB(255, 100, 100, 100)),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Column(children: [
                      Text.rich(
                        TextSpan(children: [
                          TextSpan(
                            text: ' Terms of Service',
                            style: const TextStyle(
                              fontSize: 16,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                const url =
                                    'https://example.com/terms-of-service'; // Replace with your Terms of Service URL
                                launchUrl(url as Uri);
                              },
                          ),
                          const TextSpan(
                            text: ' ',
                            style: TextStyle(fontSize: 20),
                          ),
                          TextSpan(
                            text: ' Privacy',
                            style: const TextStyle(
                              fontSize: 16,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                const url =
                                    'https://example.com/terms-of-service'; // Replace with your Terms of Service URL
                                launchUrl(url as Uri);
                              },
                          ),
                          const TextSpan(
                            text: ' ',
                            style: TextStyle(fontSize: 20),
                          ),
                          TextSpan(
                            text: ' Help',
                            style: const TextStyle(
                              fontSize: 16,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                const url =
                                    'https://example.com/terms-of-service'; // Replace with your Terms of Service URL
                                launchUrl(url as Uri);
                              },
                          ),
                        ]),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 20),
                      const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 50),
                          child: Row(
                            children: [
                              Icon(
                                Icons.copyright,
                                size: 14,
                                color: Colors.grey,
                              ),
                              Text("2023 Goodreads, Inc."),
                            ],
                          ))
                    ]))
              ]));
            })));
  }
}
