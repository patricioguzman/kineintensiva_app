import 'package:flutter/material.dart';

class DocentesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white, // AppBar en blanco
        elevation: 0, // Sin sombra
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "Docentes",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(Icons.people, color: Color(0xFF004B8D)),
                  SizedBox(width: 10),
                  Text(
                    "Docentes Calificados:",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF004B8D),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Text(
                "El curso de Kinesiología intensiva cuenta con un gran grupo de docentes formado por: "
                "21 Kinesiólogos, 9 Médicos, 1 Enfermera, 1 Psicóloga y 1 Abogado.",
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
              SizedBox(height: 20),
              ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage("assets/images/docente1.jpg"),
                ),
                title: Text("Dr. Eduardo Figueroa"),
                subtitle: Text("Especialista en Kinesiología Intensiva"),
              ),
              ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage("assets/images/docente2.jpg"),
                ),
                title: Text("Dra. Mariana Sánchez"),
                subtitle: Text("Experta en Ventilación Mecánica"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}