import 'package:flutter/material.dart';
import 'package:stepper1/splash.dart';

import 'first.dart';

void main() {
  runApp(const HomePage());
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
            primary: Colors.red.shade900, secondary: Colors.red.shade900),
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: 'splash',
      routes: {
        '/': (context) => const MyApp(),
        'splash': (context) => const Splash(),
        'homePage': (context) => const First()
      },
    );
  }
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int val = 0;
  GlobalKey<FormState> pageKey = GlobalKey();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController userController = TextEditingController();
  TextEditingController password2Controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Stepper App",
          style: TextStyle(
            fontSize: 30,
          ),
        ),
        backgroundColor: Colors.red.shade900,
      ),
      body: Stepper(
        currentStep: val,
        controlsBuilder: (context, _) {
          return Row(
            children: [
              (val == 2)
                  ? ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed('homePage');
                      },
                      child: const Text("Home Page"))
                  : ElevatedButton(
                      onPressed: () {
                        setState(() {
                          if (val < 2) {
                            val++;
                          }
                        });
                      },
                      child: (val == 2)
                          ? const Text("Home Page")
                          : const Text("Continue")),
              const SizedBox(
                width: 20,
              ),
              (val != 0)
                  ? OutlinedButton(
                      onPressed: () {
                        setState(() {
                          if (val > 0) {
                            val--;
                          }
                        });
                      },
                      child: const Text("Cancel"))
                  : Container()
            ],
          );
        },
        steps: [
          Step(
              state: (val == 0) ? StepState.indexed : StepState.complete,
              isActive: (val == 0) ? true : false,
              title: const Text("SignUp"),
              content: Form(
                key: pageKey,
                child: Column(
                  children: [
                    TextFormField(
                      validator: (val) {
                        if (val!.isEmpty) {
                          return "enter first name..";
                        }
                        return null;
                      },
                      controller: nameController,
                      onSaved: (val) {
                        setState(() {
                          nameController.text;
                        });
                      },
                      decoration: const InputDecoration(
                          hintText: 'Full Name',
                          prefixIcon: Icon(Icons.person_outline)),
                    ),
                    TextFormField(
                      validator: (val) {
                        if (val!.isEmpty) {
                          return "enter first email..";
                        }
                        return null;
                      },
                      controller: emailController,
                      onSaved: (val) {
                        setState(() {
                          emailController.text;
                        });
                      },
                      decoration: const InputDecoration(
                          hintText: 'Email Id',
                          prefixIcon: Icon(Icons.email_outlined)),
                    ),
                    TextFormField(
                      validator: (val) {
                        if (val!.isEmpty) {
                          return "enter first password..";
                        }
                        return null;
                      },
                      controller: passwordController,
                      onSaved: (val) {
                        setState(() {
                          passwordController.text;
                        });
                      },
                      decoration: const InputDecoration(
                          hintText: 'Password*',
                          prefixIcon: Icon(Icons.lock_outline)),
                    ),
                    TextFormField(
                      validator: (val) {
                        if (val!.isEmpty) {
                          return "enter first password..";
                        }
                        return null;
                      },
                      controller: confirmPasswordController,
                      onSaved: (val) {
                        setState(() {
                          confirmPasswordController.text;
                        });
                      },
                      decoration: const InputDecoration(
                          hintText: 'Confirm Password*',
                          prefixIcon: Icon(Icons.lock_outline)),
                    ),
                  ],
                ),
              )),
          Step(
              state: (val == 1)
                  ? StepState.editing
                  : (val <= 1)
                      ? StepState.indexed
                      : StepState.complete,
              isActive: (val == 1) ? true : false,
              title: const Text("Login"),
              content: Column(
                children: [
                  TextFormField(
                    validator: (val) {
                      if (val!.isEmpty) {
                        return "enter first user..";
                      }
                      return null;
                    },
                    controller: userController,
                    onSaved: (val) {
                      setState(() {
                        userController.text;
                      });
                    },
                    decoration: const InputDecoration(
                        hintText: 'User Name',
                        prefixIcon: Icon(Icons.person_outline)),
                  ),
                  TextFormField(
                    validator: (val) {
                      if (val!.isEmpty) {
                        return "enter first password..";
                      }
                      return null;
                    },
                    controller: password2Controller,
                    onSaved: (val) {
                      setState(() {
                        password2Controller.text;
                      });
                    },
                    decoration: const InputDecoration(
                        hintText: 'Password*',
                        prefixIcon: Icon(Icons.email_outlined)),
                  ),
                ],
              )),
          Step(
              state: (val == 2)
                  ? StepState.editing
                  : (val <= 2)
                      ? StepState.indexed
                      : StepState.complete,
              isActive: (val == 2) ? true : false,
              title: const Text("Home"),
              content: Container())
        ],
      ),
    );
  }
}
