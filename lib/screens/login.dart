import 'package:bookstore/screens/signup.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text.rich(
          TextSpan(
              text: "good",
              style: TextStyle(
                  fontSize: 50,
                  fontFamily: AutofillHints.birthday,
                  color: Colors.brown.shade200,
                  fontWeight: FontWeight.w400),
              children: const [
                TextSpan(
                    text: "reads",
                    style: TextStyle(
                        fontSize: 50,
                        color: Colors.brown,
                        fontWeight: FontWeight.bold))
              ]),
        ),
        centerTitle: true,
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            children: [
              const SizedBox(
                height: 16,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Sign in",
                    style: TextStyle(
                        fontFamily: AutofillHints.telephoneNumberLocalSuffix,
                        fontSize: 27),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text.rich(
                    TextSpan(
                        text: "Forgot password?",
                        style: const TextStyle(
                            decoration: TextDecoration.underline),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            const url =
                                'https://www.heroku.com/'; // Replace with your Terms of Service URL
                            launchUrl(url as Uri);
                          }),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  border: Border.all(
                    color: const Color.fromARGB(255, 224, 218, 218),
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(30.0),
                ),
                child: const TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'email',
                    contentPadding: EdgeInsets.all(10.0),
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  border: Border.all(
                    color: const Color.fromARGB(255, 224, 218, 218),
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(30.0),
                ),
                child: const TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'password',
                    contentPadding: EdgeInsets.all(10.0),
                  ),
                  obscureText: true,
                ),
              ),
              Column(
                children: [
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.check_box_outline_blank_sharp,
                            size: 25,
                          )),
                      const Text(
                        "Show password.",
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 24,
              ),
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
                            )),
                        onPressed: () {},
                        child: const Text("Sign in")),
                  ),
                ],
              ),
              const SizedBox(
                height: 14,
              ),
              Text.rich(
                TextSpan(
                  text: 'By signing in, you agree to the Goodreads',
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
                                builder: (context) => const SignUpPage()));
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
                            Text("2023 Goodreads, Inc."),
                          ],
                        )),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
