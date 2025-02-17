import 'package:flutter/material.dart';

class CourseDetailsScreen extends StatefulWidget {
  @override
  _CourseDetailsScreenState createState() => _CourseDetailsScreenState();
}

class _CourseDetailsScreenState extends State<CourseDetailsScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "VII Diplomado en Kinesiología Intensiva",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Imagen principal
          Container(
            width: double.infinity,
            height: 200,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/VIIcurso.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Pestañas
          TabBar(
            controller: _tabController,
            labelColor: Color(0xFF004B8D), // Azul corporativo
            unselectedLabelColor: Colors.grey,
            indicatorColor: Color(0xFFFFA500), // Naranjo corporativo
            tabs: [
              Tab(text: "Resumen"),
              Tab(text: "Plan de estudio"),
              Tab(text: "Docentes"),
              Tab(text: "Práctica clínica"),
            ],
          ),

          // Contenido de las pestañas
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _buildResumenTab(),
                _buildPlanDeEstudioTab(),
                _buildDocentesTab(context),
                _buildPracticaClinicaTab(),
              ],
            ),
          ),

          // Botón para descargar PDF
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton.icon(
              onPressed: () {
                // Acción para descargar PDF
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFFFA500), // Naranjo corporativo
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              ),
              icon: Icon(Icons.download, color: Colors.white),
              label: Text("Descargar PDF"),
            ),
          ),
        ],
      ),
    );
  }

  // Contenido de la pestaña "Resumen"
  Widget _buildResumenTab() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Text(
          "Facilitar y contribuir al desarrollo de competencias en kinesiología intensiva orientadas al perfil de egreso del área clínica, "
          "a través de un desempeño clínico adecuado a las actuales exigencias de los lineamientos del Colegio de Kinesiólogos de Chile.\n\n"
          "1. Formar Kinesiólogos especializados.\n"
          "2. Desarrollar habilidades clínicas en el manejo de pacientes críticos.\n"
          "3. Promover el uso de evidencia científica para la toma de decisiones clínicas.",
          style: TextStyle(fontSize: 16, color: Colors.black),
        ),
      ),
    );
  }

  // Contenido de la pestaña "Plan de estudio"
  Widget _buildPlanDeEstudioTab() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Text(
          "El plan de estudio incluye módulos teóricos y prácticos orientados a:\n"
          "- Fisiología y fisiopatología respiratoria.\n"
          "- Ventilación mecánica.\n"
          "- Cardiología básica.\n"
          "- Monitorización hemodinámica.\n"
          "- Evaluación funcional en pacientes críticos.\n"
          "- Talleres clínicos y simulación avanzada.",
          style: TextStyle(fontSize: 16, color: Colors.black),
        ),
      ),
    );
  }

  // Contenido de la pestaña "Docentes"
  Widget _buildDocentesTab(BuildContext context) {
    return Padding(
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
              onTap: () {
                Navigator.pushNamed(context, '/docentes');
              },
            ),
            ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage("assets/images/docente2.jpg"),
              ),
              title: Text("Dra. Mariana Sánchez"),
              subtitle: Text("Experta en Ventilación Mecánica"),
              onTap: () {
                Navigator.pushNamed(context, '/docentes');
              },
            ),
          ],
        ),
      ),
    );
  }

  // Contenido de la pestaña "Práctica clínica"
  Widget _buildPracticaClinicaTab() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.local_hospital, color: Color(0xFF004B8D)),
                SizedBox(width: 10),
                Text(
                  "Práctica Clínica",
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
              "El Curso cuenta con 94 horas prácticas, 10 de las cuales se realizan en talleres demostrativos y 84 horas en práctica clínica en una unidad de cuidados intensivos.",
              style: TextStyle(fontSize: 16, color: Colors.black),
            ),
            SizedBox(height: 20),
            Text(
              "La práctica clínica incluye simulaciones avanzadas y manejo de pacientes reales en unidades críticas.",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Image.asset("assets/images/practica_clinica.jpg", fit: BoxFit.cover),
          ],
        ),
      ),
    );
  }
}