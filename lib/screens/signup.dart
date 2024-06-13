

import 'package:flutter/material.dart';

import '../controllers/auth.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

  class _SignUpPageState extends State<SignUpPage> {
    final formKey = GlobalKey<FormState>();
    final TextEditingController _nameController = TextEditingController();
    final TextEditingController _emailController = TextEditingController();
    final TextEditingController _passwordController = TextEditingController();


    @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Center(
                  child: Text("Регистрация",
                      style: TextStyle(
                        fontFamily: 'Gilroy',
                        fontSize: 50,
                        fontWeight: FontWeight.w300,
                      )
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                SizedBox(
                    width: MediaQuery.of(context).size.width * .9,
                    child: TextFormField(
                      validator: (value) =>
                      value!.isEmpty ? "Укажите ваше Имя." : null,
                      controller: _nameController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        label: Text("Имя"),
                      ),
                    )),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                    width: MediaQuery.of(context).size.width * .9,
                    child: TextFormField(
                      validator: (value) =>
                      value!.isEmpty ? "Укажите ваш Email." : null,
                      controller: _emailController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        label: Text("Email"),
                      ),
                    )),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                    width: MediaQuery.of(context).size.width * .9,
                    child: TextFormField(
                      validator: (value) => value!.length < 8
                          ? "Пароль должен иметь не меньше 8 символов."
                          : null,
                      controller: _passwordController,
                      obscureText: true,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        label: Text("Пароль"),
                      ),
                    )),
                const SizedBox(
                  height: 40,
                ),
                SizedBox(
                    height: 65,
                    width: MediaQuery.of(context).size.width * .9,
                    child: ElevatedButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            createUser(
                                _nameController.text,
                                _emailController.text,
                                _passwordController.text)
                                .then((value) {
                              if (value == "все получилось!") {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                  content: const Text(
                                    "Аккаунт успешно создан",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  backgroundColor: Colors.green.shade400,
                                ));
                                Navigator.pop(context);
                              } else {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                  content: Text(
                                    value,
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                  backgroundColor: Colors.red.shade400,
                                ));
                              }
                            });
                          }
                        },
                        child: const Text(
                          "Зарегистрироваться",
                          style: TextStyle(fontSize: 16),
                        ))),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),

          ),
        ),

      ),
    );

  }
}