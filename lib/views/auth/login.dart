import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mk_mining_admin/blocs/sign_in/sign_in_bloc.dart';
import 'package:mk_mining_admin/views/dashboard/dashboard_scr.dart';
import 'package:mk_mining_admin/widgets/app_alert_dialog.dart';
import 'package:mk_mining_admin/widgets/app_loader.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController mailCon = TextEditingController();
  TextEditingController passCon = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<SignInBloc, SignInState>(
        listener: (context, state) {
          if (state is SignInLoading) {
            appLoader(context);
          } else if (state is SignInSuccess) {
            Navigator.pop(context);
            Navigator.pushReplacement(context,
                CupertinoPageRoute(builder: (_) => const DashboardScreen()));
          } else if (state is SignInException) {
            appAlertDialog(context, "Warning", state.message, actions: [
              CupertinoDialogAction(
                  child: const Text("OK"),
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.pop(context);
                  })
            ]);
          }
        },
        child: ListView(
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
                  controller: mailCon,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(labelText: "Username"),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: passCon,
                  keyboardType: TextInputType.visiblePassword,
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
                  context.read<SignInBloc>().add(DoSignInEvent(
                      email: mailCon.text, password: "Admin${passCon.text}"));
                },
                child: const Text("Login"))
          ],
        ),
      ),
    );
  }
}
