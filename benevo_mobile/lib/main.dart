import 'package:flutter/material.dart';
import 'core/constants/colors.dart';
import 'features/auth/screens/splash_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const BenevoApp());
}

class BenevoApp extends StatelessWidget {
  const BenevoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Benevo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: false,
        splashFactory: InkRipple.splashFactory,
        scaffoldBackgroundColor: AppColors.background,
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primary,
          primary: AppColors.primary,
        ),
      ),
      home: const SplashScreen(),
    );
  }
}
