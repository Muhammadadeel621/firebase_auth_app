import 'package:assignfirebaseauthapp/screens/home_screen.dart';
import 'package:assignfirebaseauthapp/widgets/round_butoon.dart';
import 'package:assignfirebaseauthapp/screens/sign_up_screen.dart';
import 'package:assignfirebaseauthapp/utils/utila.dart';
import 'package:assignfirebaseauthapp/widgets/space_widget.dart';
import 'package:assignfirebaseauthapp/widgets/text_form_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  FirebaseAuth _auth = FirebaseAuth.instance;
  bool loading = false;

//  for Email SIgn-In
  void login() {
    setState(() {
      loading = true;
    });
    _auth
        .signInWithEmailAndPassword(
            email: emailController.text.toString(),
            password: passwordController.text.toString())
        .then((value) {
      Utils().toastMessage(value.user!.email.toString());
      setState(() {
        loading = false;
      });
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomeScreen()));
    }).onError((error, StackTrace) {
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
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormFieldCustomWidget(
                  prefixIcon: Icon(Icons.email_outlined),
                  hintText: "Email",
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Enter email";
                    }
                    return null;
                  },
                  editingController: emailController),
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
                      return "Enter email";
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
                    login();
                  }
                },
              ),
              SpaceCustomWidget(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account? "),
                  InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignUpScreen()));
                      },
                      child: Text(
                        "SignUp",
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
            ],
          ),
        ),
      ),
    );
  }
}
