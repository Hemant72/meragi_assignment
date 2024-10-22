import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:meragi_assignment/src/auth/presentation/bloc/auth_bloc.dart';
import 'package:meragi_assignment/src/auth/presentation/widgets/custom_textfield.dart';
import 'package:meragi_assignment/src/auth/presentation/widgets/gradient_button.dart';
import 'package:meragi_assignment/src/auth/presentation/widgets/recent_login_card.dart';
import 'package:meragi_assignment/src/auth/presentation/widgets/social_label.dart';

class DesktopLoginPage extends StatelessWidget {
  const DesktopLoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    return BlocConsumer(
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
            : Column(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 64.0, vertical: 32),
                      child: Row(
                        children: [
                          const Expanded(
                            flex: 3,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                // Logo and welcome text
                                Row(
                                  children: [
                                    Icon(Icons.widgets,
                                        size: 48, color: Colors.black),
                                    SizedBox(width: 8),
                                    Text(
                                      'Design Guild',
                                      style: TextStyle(
                                          fontSize: 32,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 32),
                                Text(
                                  'Welcome to Design Guild',
                                  style: TextStyle(
                                      fontSize: 28,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  'Join the world’s largest community for designers',
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.black54),
                                ),
                                SizedBox(height: 32),
                                // Recent Logins
                                Row(
                                  children: [
                                    RecentLoginCard(
                                      imgUrl: 'assets/avatar3.jpg',
                                      name: 'Alina Smith',
                                    ),
                                    SizedBox(width: 10),
                                    RecentLoginCard(
                                      imgUrl: 'assets/avatar1.jpg',
                                      name: 'Andrew',
                                    ),
                                    SizedBox(width: 10),
                                    RecentLoginCard(
                                      imgUrl: 'assets/avatar2.jpg',
                                      name: 'john smith',
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          // Right section - Login Form
                          Expanded(
                            flex: 2,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                // Email Input
                                CustomTextField(
                                    hintText: "Email",
                                    controller: emailController,
                                    obscureText: false),
                                const SizedBox(height: 16),
                                // Password Input
                                CustomTextField(
                                    hintText: "Password",
                                    controller: passwordController,
                                    obscureText: true),
                                const SizedBox(height: 10),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: TextButton(
                                    onPressed: () {},
                                    child: const Text('Forgot password?',
                                        style: TextStyle(color: Colors.black)),
                                  ),
                                ),
                                const SizedBox(height: 16),
                                // Login Button
                                SizedBox(
                                  height: 50,
                                  child: GradientButton(
                                      onTap: () {}, text: "Login"),
                                ),
                                const SizedBox(height: 32),
                                // Sign Up Section
                                const Text(
                                  'Join our community today',
                                  style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                                const SizedBox(height: 16),
                                const Text(
                                  'Get connected, find designers to start a project',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black45,
                                  ),
                                ),
                                const SizedBox(height: 16),
                                // Sign Up Button
                                SizedBox(
                                  height: 40,
                                  child: GradientButton(
                                    onTap: () {},
                                    text: 'Sign Up',
                                  ),
                                ),
                                const SizedBox(height: 10),
                                const Center(
                                  child: Text(
                                    "Or Login with",
                                    style: TextStyle(
                                      color: Colors.black45,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 14),
                                // Social Login Buttons
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
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 70.0, // Adjust the height of the border as needed
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.pinkAccent, Colors.deepPurpleAccent],
                      ),
                    ),
                  ),
                ],
              );
      },
    );
  }
}
