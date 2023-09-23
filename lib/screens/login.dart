import 'package:book_store/api/api_services.dart';
import 'package:book_store/models/user_model.dart';
import 'package:book_store/screens/homepage.dart';

import '../screens/signup.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _obscureText = true;
  final TextEditingController _userNameController = TextEditingController();
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
    _passwordController.dispose();
  }

  void _signinPressed() async {
    String username = _userNameController.text;
    String password = _passwordController.text;

    // Check if any of the fields are empty
    if (username.isEmpty || password.isEmpty) {
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
    Future<LoginResponse?> future = apiservices.login(
      username,
      password,
    );
    LoginResponse? response = await future;
    print(response);
    if (response == null) {
      // Email is already registered
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('Invaild Username or Password'),
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
        body: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: 16),
                    Text(
                      "Sign in",
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
                        controller: _passwordController,
                        keyboardType: TextInputType.visiblePassword,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'password',
                          contentPadding: EdgeInsets.all(10.0),
                        ),
                        obscureText: _obscureText,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Checkbox(
                          value: !_obscureText,
                          onChanged: (value) {
                            _togglePasswordVisibility();
                          },
                        ),
                        const Text("Show password"),
                        const Spacer(),
                        TextButton(
                          onPressed: () {
                            // Forgot password action
                          },
                          child: const Text(
                            "Forgot password?",
                            style:
                                TextStyle(decoration: TextDecoration.underline),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        padding: const EdgeInsets.all(18.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                      ),
                      onPressed: () {
                        _signinPressed();
                      },
                      child: const Text("Sign in"),
                    ),
                    const SizedBox(height: 14),
                    Text.rich(
                      TextSpan(
                        text: 'By signing in, you agree to the Pageturner',
                        style: const TextStyle(
                          fontSize: 18,
                        ),
                        children: [
                          TextSpan(
                            text: 'Terms of Service',
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
                                Text("New to ?"),
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
                                      builder: (context) =>
                                          const SignUpPage()));
                            },
                            style: OutlinedButton.styleFrom(
                                padding: const EdgeInsets.all(18.0),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25.0),
                                )),
                            child: const Text(
                              'Sign up',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 100, 100, 100)),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Column(
                        children: [
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
                                  Text("2023 Pageturner, Inc."),
                                ],
                              )),
                        ],
                      ),
                    ),
                    const SizedBox(height: 30)
                  ])),
        ));
  }
}
