import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meragi_assignment/core/services/services_injector.dart';
import 'package:meragi_assignment/core/utils/colors.dart';
import 'package:meragi_assignment/core/utils/navigation.dart';
import 'package:meragi_assignment/firebase_options.dart';
import 'package:meragi_assignment/src/auth/presentation/bloc/auth_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => sl<AuthBloc>(),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: router,
        title: 'Flutter Demo',
        theme: ThemeData(
          primaryColor: primaryColor,
          useMaterial3: true,
          colorScheme:
              ColorScheme.fromSwatch().copyWith(secondary: secondaryColor),
        ),
      ),
    );
  }
}
