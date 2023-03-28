import 'package:crud_database_provider/providers/auth_provider.dart';
import 'package:crud_database_provider/widgets/textfield_decoration.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterPageView extends StatefulWidget {
  const RegisterPageView({super.key});

  @override
  State<RegisterPageView> createState() => RegisterPageViewState();
}

class RegisterPageViewState extends State<RegisterPageView> {

  bool obsecurePass = true;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AuthProvider(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Consumer<AuthProvider>(
          builder: (context, value, child) {
            return SafeArea(
              child: Container(
                padding: const EdgeInsets.all(20),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Register",
                          style: TextStyle(
                            fontSize: 36,
                            fontWeight: FontWeight.bold,
                          )),
                      const SizedBox(height: 10),
                      const Text("Silahkan register untuk melanjutkan",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                          )),
                      const SizedBox(height: 30),
                      textFieldDecoration(
                        child: TextFormField(
                          controller: value.usernameController,
                          decoration: const InputDecoration(
                            hintText: "Username",
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      textFieldDecoration(
                        child: TextFormField(
                          controller: value.emailController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: const InputDecoration(
                            hintText: "Email",
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      textFieldDecoration(
                        child: TextFormField(
                          controller: value.passwordController,
                          obscureText: obsecurePass,
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                              icon: obsecurePass
                                  ? const Icon(Icons.visibility_off)
                                  : const Icon(Icons.remove_red_eye),
                              onPressed: () {
                                showHidePass();
                              },
                            ),
                            hintText: "Password",
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      InkWell(
                        onTap: () => value.createUser(context),
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.blue,
                          ),
                          child: const Center(
                            child: Text("Register",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                )),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Sudah punya akun?",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                                fontWeight: FontWeight.w400,
                              )),
                          const SizedBox(width: 5),
                          GestureDetector(
                            onTap: () => Navigator.pushNamed(context, '/login'),
                            child: const Text("Masuk",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.blue,
                                )),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  showHidePass() {
    setState(() {
      obsecurePass = !obsecurePass;
    });
  }
}
