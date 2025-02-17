import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ScheduleScreen extends StatelessWidget {
  final List<Map<String, dynamic>> schedule = [
    {
      "module": "Módulo 1: Fisiología y Fisiopatología Respiratoria",
      "date": "Sábado 22 de Marzo 2025",
      "sessions": [
        {"time": "08:00 - 08:30", "topic": "Recepción y entrega de información"},
        {"time": "08:30 - 09:30", "topic": "Sistema respiratorio y fisiología aplicada"},
        {"time": "09:30 - 10:30", "topic": "Intercambio gaseoso y Transporte de oxígeno"},
        {"time": "10:30 - 11:00", "topic": "Receso"},
        {"time": "11:00 - 11:45", "topic": "Fisiopatología respiratoria básica"},
      ],
    },
    {
      "module": "Módulo 2: Cardiología Básica",
      "date": "Sábado 29 de Marzo 2025",
      "sessions": [
        {"time": "08:30 - 09:15", "topic": "Anatomía y fisiología cardiovascular"},
        {"time": "09:15 - 10:00", "topic": "Monitorización Hemodinámica"},
        {"time": "10:00 - 10:30", "topic": "Receso - Primer control teórico"},
        {"time": "10:30 - 11:15", "topic": "Bases del ECG"},
      ],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Horario del Diplomado"),
        backgroundColor: Colors.white, // Cambiar a blanco
        foregroundColor: Color(0xFF004B8D), // Cambiar el color del texto a azul corporativo
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16.0),
        itemCount: schedule.length,
        itemBuilder: (context, index) {
          final module = schedule[index];
          return Card(
            color: Colors.white,
            elevation: 3,
            margin: EdgeInsets.symmetric(vertical: 8.0),
            child: ExpansionTile(
              title: Text(
                module['module'],
                style: TextStyle(
                  color: Color(0xFF004B8D), // Azul corporativo
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                module['date'],
                style: TextStyle(color: Color(0xFFFFA500)), // Naranjo corporativo
              ),
              iconColor: Color(0xFF004B8D),
              collapsedIconColor: Color(0xFF004B8D),
              children: module['sessions'].map<Widget>((session) {
                return ListTile(
                  leading: FaIcon(FontAwesomeIcons.clock, color: Color(0xFFFFA500)),
                  title: Text(session['topic']),
                  subtitle: Text(session['time']),
                );
              }).toList(),
            ),
          );
        },
      ),
    );
  }
}