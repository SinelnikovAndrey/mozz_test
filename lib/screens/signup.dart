

import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

  class _SignUpPageState extends State<SignUpPage> {
    final formKey = GlobalKey<FormState>();
    final TextEditingController _nameController = TextEditingController();


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
                  child: Text("Вход",
                      style: TextStyle(
                        fontFamily: 'Gilroy',
                        fontSize: 50,
                        fontWeight: FontWeight.w300,
                      )
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                    width: MediaQuery.of(context).size.width * .9,
                    child: TextFormField(
                      validator: (value) =>
                      value!.isEmpty ? "Name cannot be empty." : null,
                      controller: _nameController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        label: Text("Name"),
                      ),
                    )),
              ],
            ),

          ),
        ),

      ),
    );

  }
}