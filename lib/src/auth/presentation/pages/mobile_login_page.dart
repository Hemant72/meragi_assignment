import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:meragi_assignment/src/auth/presentation/bloc/auth_bloc.dart';
import 'package:meragi_assignment/src/auth/presentation/widgets/custom_textfield.dart';
import 'package:meragi_assignment/src/auth/presentation/widgets/gradient_button.dart';
import 'package:meragi_assignment/src/auth/presentation/widgets/semi_circle_widget.dart';
import 'package:meragi_assignment/src/auth/presentation/widgets/social_label.dart';

class MobileLoginPage extends StatelessWidget {
  const MobileLoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthSuccess) {
            // Navigate to the home page
            context.go("/home");
          } else if (state is AuthSignUpSuccess) {
            context.go("/home");
          } else if (state is AuthFailure) {
            // Show an error message
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.error),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        builder: (context, state) {
          return state is AuthLoading
              ? const Center(
                  child: CircularProgressIndicator.adaptive(),
                )
              : Stack(
                  children: [
                    Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      child: CustomPaint(
                        size: Size(MediaQuery.of(context).size.width,
                            200), // adjust height as needed
                        painter: SemicirclePainter(),
                      ),
                    ),
                    SingleChildScrollView(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 32.0, vertical: 64),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          const SizedBox(height: 20),
                          const Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.widgets,
                                    size: 52, color: Colors.white),
                                SizedBox(width: 8),
                                Text(
                                  'Design Guild',
                                  style: TextStyle(
                                    fontSize: 28,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 60),
                          const Text(
                            'Join our \ncommunity today',
                            style: TextStyle(
                              fontSize: 22,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.start,
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            'Get connected, find designers to start a project',
                            style: TextStyle(fontSize: 16, color: Colors.black),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 30),
                          SizedBox(
                              height: 50,
                              child: GradientButton(
                                  onTap: () {
                                    context.read<AuthBloc>().add(
                                          AuthSingUpWithEmail(
                                            email: emailController.text,
                                            password: passwordController.text,
                                          ),
                                        );
                                  },
                                  text: "Sign Up")),
                          const SizedBox(height: 10),
                          const Center(
                            child: Text(
                              "Or Login with",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SocialLabels(
                                label: 'Facebook',
                                onTap: () {},
                              ),
                              const SizedBox(width: 10),
                              SocialLabels(
                                label: 'LinkedIn',
                                onTap: () {},
                              ),
                              const SizedBox(width: 10),
                              SocialLabels(
                                label: 'Google',
                                onTap: () {},
                              ),
                            ],
                          ),
                          const SizedBox(height: 40),
                          CustomTextField(
                              hintText: "Email",
                              controller: emailController,
                              obscureText: false),
                          const SizedBox(height: 20),
                          CustomTextField(
                            hintText: "Password",
                            controller: passwordController,
                            obscureText: true,
                          ),
                          const SizedBox(height: 6),
                          Align(
                            alignment: Alignment.centerRight,
                            child: TextButton(
                              onPressed: () {},
                              child: const Text('Forgot password?',
                                  style: TextStyle(color: Colors.black)),
                            ),
                          ),
                          const SizedBox(height: 10),
                          SizedBox(
                              height: 50,
                              child: GradientButton(
                                  onTap: () {
                                    context.read<AuthBloc>().add(
                                          AuthWithEmail(
                                            email: emailController.text,
                                            password: passwordController.text,
                                          ),
                                        );
                                  },
                                  text: "Login")),
                        ],
                      ),
                    ),
                  ],
                );
        },
      ),
    );
  }
}
