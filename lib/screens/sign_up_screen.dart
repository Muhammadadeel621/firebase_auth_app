import 'package:assignfirebaseauthapp/screens/round_butoon.dart';
import 'package:assignfirebaseauthapp/widgets/space_widget.dart';
import 'package:assignfirebaseauthapp/widgets/text_form_field.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        title: Text(
          "Login Screen",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormFieldCustomWidget(
                prefixIcon: Icon(Icons.email_outlined),
                hintText: "Email",
                editingController: emailController),
            SpaceCustomWidget(
              height: 30,
            ),
            TextFormFieldCustomWidget(
                prefixIcon: Icon(Icons.lock_outline),
                suffixIcon: Icon(Icons.remove_red_eye),
                hintText: "Password",
                editingController: passwordController),
            SpaceCustomWidget(
              height: 30,
            ),
            RoundButtonCustomWidget(
              title: "Login",
              onTap: () {},
            ),
            SpaceCustomWidget(
              height: 15,
            ),

            Row(
              children: [
                Text("Don't have an account?"),
                InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignUpScreen()));
                    },
                    child: Text("SignUp"))
              ],
            ),

            SpaceCustomWidget(
              height: 30,
            ),
            // Container(
            //   height: 50,
            //   decoration: BoxDecoration(
            //       color: Colors.deepPurple,
            //       border: Border.all(color: Colors.black, width: 2)),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children: [
            //       Icon(
            //         FontAwesomeIcons.google,
            //         size: 20,
            //         color: Colors.white,
            //       ),
            //       SpaceCustomWidget(
            //         width: 25,
            //       ),
            //       Text(
            //         "Continue with Google",
            //         style: TextStyle(color: Colors.white, fontSize: 15),
            //       ),
            //     ],
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}






//        Rich Text Code

    //  RichText(
    //           text: TextSpan(
    //             text: 'Don\'t have an account ',
    //             style: TextStyle(color: Colors.black, fontSize: 18),
    //             children: const <TextSpan>[
    //               TextSpan(
    //                   text: 'Sign Up',
    //                   style: TextStyle(
    //                       decoration: TextDecoration.underline,
    //                       fontWeight: FontWeight.bold,
    //                       color: Colors.black,
    //                       fontSize: 18)),
    //             ],
    //           ),
    //         ),