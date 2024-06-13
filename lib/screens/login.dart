import 'package:flutter/material.dart';

import '../controllers/auth.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
  final resetKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _resetController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Center(
            child: Form(
              key: formKey,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Вход",
                        style: TextStyle(
                          fontFamily: 'Gilroy',
                          fontSize: 50,
                          fontWeight: FontWeight.w300,
                        )
                    ),
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
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                            onTap: () {
                              showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    title: const Text("Востановить пароль"),
                                    content: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        const Text(
                                            "Укажите ваш Email, мы отправим на него ссылку для востановления пароля."),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Form(
                                          key: resetKey,
                                          child: TextFormField(
                                            controller: _resetController,
                                            validator: (value) => value!
                                                .isEmpty
                                                ? "Email указан неверно."
                                                : null,
                                            decoration: const InputDecoration(
                                              border: OutlineInputBorder(),
                                              label: Text("Email"),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    actions: [
                                      TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: const Text("Закрыть")),
                                      TextButton(
                                          onPressed: () {
                                            if (resetKey.currentState!
                                                .validate()) {
                                              sendRecoveryMail(
                                                  _resetController.text)
                                                  .then((value) {
                                                Navigator.pop(context);
                                                if (value) {
                                                  ScaffoldMessenger.of(
                                                      context)
                                                      .showSnackBar(
                                                      SnackBar(
                                                        content: const Text(
                                                          "Письмо для востановленич пароля отправленно",
                                                          style: TextStyle(
                                                              color:
                                                              Colors.white),
                                                        ),
                                                        backgroundColor: Colors
                                                            .green.shade400,
                                                      ));
                                                } else {
                                                  ScaffoldMessenger.of(
                                                      context)
                                                      .showSnackBar(
                                                      SnackBar(
                                                        content: const Text(
                                                          "Не удается отправить письмо для восстановления",
                                                          style: TextStyle(
                                                              color:
                                                              Colors.white),
                                                        ),
                                                        backgroundColor:
                                                        Colors.red.shade400,
                                                      ));
                                                }
                                              });
                                            }
                                          },
                                          child: const Text("Отправить ссылку"))
                                    ],
                                  ));
                            },
                            child: Text(
                              "Забыли пароль?",
                              style: TextStyle(color: Colors.blue.shade700),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                        height: 65,
                        width: MediaQuery.of(context).size.width * .9,
                        child: ElevatedButton(
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                loginUser(_emailController.text,
                                    _passwordController.text)
                                    .then((value) {
                                  if (value == "все получилось!") {
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(SnackBar(
                                      content: const Text(
                                        "Успешный вход",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      backgroundColor: Colors.green.shade400,
                                    ));
                                    Navigator.pushReplacementNamed(
                                        context, "/home");
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
                              "Войти",
                              style: TextStyle(fontSize: 17),
                            ))),
                    const SizedBox(
                      height: 10,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Нет аккаунта?"),
                        TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, "/signup");
                            },
                            child: const Text("Зарегистрироваться"))
                      ],
                    )
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}