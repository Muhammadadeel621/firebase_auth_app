import 'package:assignfirebaseauthapp/screens/home_screen.dart';
import 'package:assignfirebaseauthapp/screens/login_screen.dart';
import 'package:assignfirebaseauthapp/utils/utila.dart';
import 'package:assignfirebaseauthapp/widgets/round_butoon.dart';
import 'package:assignfirebaseauthapp/widgets/space_widget.dart';
import 'package:assignfirebaseauthapp/widgets/text_form_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  FirebaseAuth _auth = FirebaseAuth.instance;

//  for SIgnup
  void signUp() {
    setState(() {
      loading = true;
    });
    _auth
        .createUserWithEmailAndPassword(
            email: emailController.text.toString(),
            password: passwordController.text.toString())
        .then((value) {
      setState(() {
        loading = false;
      });
    }).onError((error, stackTrace) {
      Utils().toastMessage(error.toString());
      setState(() {
        loading = false;
      });
    });
  }

  // for Google Sign-In
  Future<void> googleSignIn() async {
    setState(() {
      loading = true;
    });
    try {
      final GoogleSignIn googleSignIn = GoogleSignIn();
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      if (googleUser == null) {
        Utils().toastMessage("Google Sign-In canceled");
        setState(() {
          loading = false;
        });
        return;
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final UserCredential userCredential =
          await _auth.signInWithCredential(credential);

      Utils().toastMessage("Welcome, ${userCredential.user!.displayName}");
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomeScreen()));
    } catch (error) {
      Utils().toastMessage("Error: $error");
    } finally {
      setState(() {
        loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        title: Text(
          "SignUp Screen",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormFieldCustomWidget(
                prefixIcon: Icon(Icons.email_outlined),
                hintText: "Email",
                editingController: emailController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Enter email";
                  }
                  return null;
                },
              ),
              SpaceCustomWidget(
                height: 30,
              ),
              TextFormFieldCustomWidget(
                  prefixIcon: Icon(Icons.lock_outline),
                  suffixIcon: Icon(Icons.remove_red_eye),
                  hintText: "Password",
                  obscureText: true,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Enter Password";
                    }
                    return null;
                  },
                  editingController: passwordController),
              SpaceCustomWidget(
                height: 30,
              ),
              RoundButtonCustomWidget(
                title: "Login",
                loading: loading,
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    signUp();
                  }
                },
              ),
              SpaceCustomWidget(
                height: 15,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already have an account? "),
                  InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginScreen()));
                      },
                      child: Text(
                        "Login",
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ))
                ],
              ),
              SpaceCustomWidget(
                height: 30,
              ),
              GestureDetector(
                onTap: googleSignIn,
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.deepPurple,
                      border: Border.all(color: Colors.black, width: 2)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        FontAwesomeIcons.google,
                        size: 20,
                        color: Colors.white,
                      ),
                      SpaceCustomWidget(
                        width: 25,
                      ),
                      Text(
                        "Continue with Google",
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                    ],
                  ),
                ),
              )

              // SpaceCustomWidget(
              //   height: 30,
              // ),
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