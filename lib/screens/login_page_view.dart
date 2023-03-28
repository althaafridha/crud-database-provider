import 'package:crud_database_provider/providers/auth_provider.dart';
import 'package:crud_database_provider/widgets/textfield_decoration.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPageView extends StatefulWidget {
  const LoginPageView({super.key});

  @override
  State<LoginPageView> createState() => _LoginPageViewState();
}

enum LoginStatus { notSignin, signIn }

class _LoginPageViewState extends State<LoginPageView> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => AuthProvider(),
        child: Scaffold(
          body: Consumer<AuthProvider>(
            builder: (context, value, child) {
              return SafeArea(
                child: Container(
                  padding: const EdgeInsets.all(20),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Login",
                            style: TextStyle(
                              fontSize: 36,
                              fontWeight: FontWeight.bold,
                            )),
                        const SizedBox(height: 10),
                        const Text("Silahkan login untuk melanjutkan",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w300,
                            )),
                        const SizedBox(height: 30),
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: TextFormField(
                            controller: value.emailController,
                            decoration: const InputDecoration(
                              hintText: "Email",
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        textFieldDecoration(
                          child: TextFormField(
                            obscureText: true,
                            controller: value.passwordController,
                            decoration: const InputDecoration(
                              suffixIcon: Icon(Icons.remove_red_eye),
                              hintText: "Password",
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Align(
                          alignment: Alignment.centerRight,
                          child: InkWell(
                            onTap: () {},
                            child: const Text("Lupa Password?",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.blue,
                                )),
                          ),
                        ),
                        const SizedBox(height: 30),
                        InkWell(
                          onTap: () {
                            value.login();
                            Navigator.pushReplacementNamed(context, '/');
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.blue,
                            ),
                            child: const Center(
                              child: Text("Login",
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
                            const Text("Belum punya akun?",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w400,
                                )),
                            const SizedBox(width: 5),
                            GestureDetector(
                              onTap: () =>
                                  Navigator.pushNamed(context, '/register'),
                              child: const Text("Daftar",
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
        ));
  }
}
