import 'package:flutter/material.dart';
import 'dashboard_screen.dart';
import 'course_details_screen.dart';
import 'schedule_screen.dart';
import 'payment_screen.dart';
import 'paypal_payment_screen.dart';
import 'docentes_screen.dart'; // Importar DocentesScreen
import 'registration_screen.dart'; // Importar RegistrationScreen

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "KineIntensiva App",
      theme: ThemeData(
        useMaterial3: true, // Habilitar Material 3
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.white, // Cambiar a blanco
          foregroundColor: Color(0xFF004B8D), // Cambiar el color del texto a azul corporativo
        ),
        primaryColor: Color(0xFF004B8D), // Azul corporativo
        scaffoldBackgroundColor: Colors.white,
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Color(0xFFFFA500)), // Naranjo corporativo
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => DashboardScreen(),
        '/course_details': (context) => CourseDetailsScreen(),
        '/schedule': (context) => ScheduleScreen(),
        '/payment': (context) => PaymentScreen(),
        '/paypal_payment': (context) => PayPalPaymentScreen(),
        '/docentes': (context) => DocentesScreen(), // Agregar ruta para DocentesScreen
        '/registration': (context) => RegistrationScreen(), // Agregar ruta para RegistrationScreen
      },
    );
  }
}