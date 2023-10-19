import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mk_mining_admin/views/dashboard/dashboard_scr.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(15),
        children: [
          SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.2,
          ),
          Image.asset(
            "assets/images/logo.png",
            width: 50,
            height: 50,
          ),
          const Text(
            "\nAdministrator Login",
            style: TextStyle(fontSize: 20),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.1,
          ),
          Form(
              child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: "Username"),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: "Password",
                ),
              ),
            ],
          )),
          SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.1,
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(context,
                    CupertinoPageRoute(builder: (_) => const DashboardScreen()));
              },
              child: const Text("Login"))
        ],
      ),
    );
  }
}
