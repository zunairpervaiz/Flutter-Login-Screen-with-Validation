import 'package:flutter/material.dart';

main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Demo(),
    );
  }
}

class Demo extends StatefulWidget {
  const Demo({Key? key}) : super(key: key);

  @override
  State<Demo> createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  var formKey = GlobalKey<FormState>();
  var isValid = false;
  var isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/logo.png",
                  width: 250,
                ),
                const Text(
                  "HELLO DEVS!",
                  style: TextStyle(
                    fontFamily: "poppins",
                    fontSize: 34,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  "Welcome back, you've been missed",
                  style: TextStyle(
                    fontFamily: "poppins",
                    fontSize: 18,
                    color: Colors.grey[700],
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.grey[200],
                              border: Border.all(
                                color: Colors.white,
                              )),
                          child: TextFormField(
                            onChanged: (value) {
                              if (value.contains("@gmail.com")) {
                                setState(() {
                                  isValid = true;
                                });
                              } else {
                                setState(() {
                                  isValid = false;
                                });
                              }
                            },
                            validator: (value) {
                              if (value!.length < 6) {
                                return "Please enter your email correctly";
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              suffixIcon: isValid
                                  ? const Icon(
                                      Icons.done,
                                      color: Colors.grey,
                                    )
                                  : null,
                              prefixIcon: const Icon(
                                Icons.email,
                                color: Colors.grey,
                              ),
                              border: InputBorder.none,
                              hintText: "Email",
                              hintStyle: const TextStyle(
                                fontFamily: "poppins",
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.grey[200],
                              border: Border.all(
                                color: Colors.white,
                              )),
                          child: TextFormField(
                            obscureText: isObscure,
                            decoration: InputDecoration(
                              suffixIcon: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    isObscure = !isObscure;
                                  });
                                },
                                child: Icon(
                                  Icons.remove_red_eye,
                                  color: isObscure ? Colors.grey : Colors.deepPurple,
                                ),
                              ),
                              prefixIcon: const Icon(
                                Icons.lock,
                                color: Colors.grey,
                              ),
                              border: InputBorder.none,
                              hintText: "Password",
                              hintStyle: const TextStyle(
                                fontFamily: "poppins",
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            "Recover password?",
                            style: TextStyle(
                              fontFamily: "poppins",
                              color: Colors.grey[800],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        GestureDetector(
                          onTap: () {
                            if (formKey.currentState!.validate()) {}
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.deepPurple,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            padding: const EdgeInsets.all(22),
                            alignment: Alignment.center,
                            width: double.infinity,
                            child: const Text(
                              "Log in",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontFamily: "poppins",
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    children: [
                      const Expanded(child: Divider()),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Or continue with",
                          style: TextStyle(color: Colors.grey[700], fontFamily: "poppins"),
                        ),
                      ),
                      const Expanded(child: Divider()),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.grey[200],
                      ),
                      child: Image.asset("assets/g_ic.png"),
                    ),
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.grey[200],
                      ),
                      child: Image.asset("assets/fb_ic.png"),
                    ),
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.grey[200],
                      ),
                      child: Image.asset("assets/apple_ic.png"),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Not a member?",
                      style: TextStyle(
                        fontFamily: "poppins",
                        color: Colors.grey[800],
                      ),
                    ),
                    const Text(
                      " Register now",
                      style: TextStyle(
                        color: Colors.blue,
                        fontFamily: "poppins",
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
