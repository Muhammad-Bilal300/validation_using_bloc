import 'package:bloc_app/screens/sign_in/bloc/sign_in_bloc.dart';
import 'package:bloc_app/screens/sign_in/bloc/sign_in_state.dart';
import 'package:bloc_app/screens/sign_in/bloc/sing_in_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SigninScreen extends StatelessWidget {
  const SigninScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text("SIGN IN"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Center(
          child: Form(
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                BlocBuilder<SignInBloc, SignInState>(builder: (context, state) {
                  if (state is SignInErrorState) {
                    return Text(
                      state.errorMessage,
                      style: TextStyle(color: Colors.red),
                    );
                  } else {
                    return Container();
                  }
                }),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: emailController,
                  onChanged: (value) {
                    BlocProvider.of<SignInBloc>(context).add(
                        SignInTextChangedEvent(
                            emailController.text, passwordController.text));
                  },
                  decoration: InputDecoration(hintText: "Email"),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: passwordController,
                  onChanged: (value) {
                    BlocProvider.of<SignInBloc>(context).add(
                        SignInTextChangedEvent(
                            emailController.text, passwordController.text));
                  },
                  decoration: InputDecoration(hintText: "Password"),
                ),
                SizedBox(
                  height: 20,
                ),
                BlocBuilder<SignInBloc, SignInState>(builder: (context, state) {
                  if (state is SignInLoadingState) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  return MaterialButton(
                      color: (state is SignInValidState)
                          ? Colors.blue
                          : Colors.grey,
                      onPressed: () {
                        if (state is SignInValidState) {
                          BlocProvider.of<SignInBloc>(context).add(
                              SignInSubmittedEvent(emailController.text,
                                  passwordController.text));
                        }
                      },
                      child: Text(
                        "SIGN IN",
                        style: TextStyle(color: Colors.white),
                      ));
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
