import 'package:flutter/material.dart';
import 'package:stepper1/splash.dart';

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
        'splash': (context) => const Splash()
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
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      if (val < 2) {
                        val++;
                      }
                    });
                  },
                  child: (val == 2) ? Text("Home Page") : Text("Continue")),
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
              state: (val == 0) ? StepState.editing : StepState.complete,
              isActive: (val == 0) ? true : false,
              title: const Text("SignUp"),
              content: Column(
                children: const [
                  TextField(
                    decoration: InputDecoration(
                        hintText: 'Full Name',
                        prefixIcon: Icon(Icons.person_outline)),
                  ),
                  TextField(
                    decoration: InputDecoration(
                        hintText: 'Email Id',
                        prefixIcon: Icon(Icons.email_outlined)),
                  ),
                  TextField(
                    decoration: InputDecoration(
                        hintText: 'Password*',
                        prefixIcon: Icon(Icons.lock_outline)),
                  ),
                  TextField(
                    decoration: InputDecoration(
                        hintText: 'Confirm Password*',
                        prefixIcon: Icon(Icons.lock_outline)),
                  ),
                ],
              )),
          Step(
              state: (val == 1) ? StepState.editing : StepState.complete,
              isActive: (val == 1) ? true : false,
              title: const Text("Login"),
              content: Column(
                children: const [
                  TextField(
                    decoration: InputDecoration(
                        hintText: 'User Name',
                        prefixIcon: Icon(Icons.person_outline)),
                  ),
                  TextField(
                    decoration: InputDecoration(
                        hintText: 'Password*',
                        prefixIcon: Icon(Icons.email_outlined)),
                  ),
                ],
              )),
          Step(
              state: (val == 2) ? StepState.editing : StepState.complete,
              isActive: (val == 2) ? true : false,
              title: const Text("Home"),
              content: Container())
        ],
      ),
    );
  }
}
