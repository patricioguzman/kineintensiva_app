import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart'; // Importar url_launcher
import 'dart:async';
import 'package:animated_text_kit/animated_text_kit.dart'; // Importar animated_text_kit

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final List<String> sliderImages = [
    "assets/images/slide1.jpg",
    "assets/images/slide2.jpg",
    "assets/images/slide3.jpg",
  ];

  Duration remainingTime = Duration();
  final GlobalKey _quienesSomosKey = GlobalKey();
  final GlobalKey _cursosKey = GlobalKey();
  final GlobalKey _contactoKey = GlobalKey();

  void _scrollToSection(GlobalKey key) {
    Scrollable.ensureVisible(
      key.currentContext!,
      duration: Duration(seconds: 1),
      curve: Curves.easeInOut,
    );
  }

  @override
  void initState() {
    super.initState();
    _startCountdown();
  }

  void _startCountdown() {
    final targetDate = DateTime(2025, 3, 22);
    Timer.periodic(Duration(seconds: 1), (timer) {
      final now = DateTime.now();
      final difference = targetDate.difference(now);
      if (difference.isNegative) {
        timer.cancel();
      } else {
        setState(() {
          remainingTime = difference;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white, // Cambiar a blanco
        foregroundColor: Color(0xFF004B8D), // Cambiar el color del texto a azul corporativo
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0), // Agregar padding superior e inferior
              child: Image.asset("assets/images/logo.png", width: 120), // Ajustar el tamaño del logo
            ),
            SizedBox(width: 10),
          ],
        ),
        centerTitle: true,
        actions: [
          Builder(
            builder: (context) => IconButton(
              icon: Icon(Icons.menu, color: Color(0xFF004B8D)),
              onPressed: () => Scaffold.of(context).openEndDrawer(),
            ),
          ),
        ],
      ),
      endDrawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xFF004B8D),
              ),
              child: Text(
                'Menú',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                Navigator.pop(context);
                _scrollToSection(GlobalKey());
              },
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: Text('Quienes Somos'),
              onTap: () {
                Navigator.pop(context);
                _scrollToSection(_quienesSomosKey);
              },
            ),
            ListTile(
              leading: Icon(Icons.book),
              title: Text('Cursos'),
              onTap: () {
                Navigator.pop(context);
                _scrollToSection(_cursosKey);
              },
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Docentes'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/docentes');
              },
            ),
            ListTile(
              leading: Icon(Icons.contact_mail),
              title: Text('Contacto'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/registration');
              },
            ),
          ],
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          HeroSection(),
          SizedBox(height: 20),
          QuienesSomosSection(), // Agregar sección Quienes Somos
          CoursesSection(key: _cursosKey), // Agregar key a la sección Cursos
          SizedBox(height: 20),
          ScheduleSection(),
          SizedBox(height: 20),
          PaymentSection(),
          SizedBox(height: 20),
          CountdownSection(remainingTime: remainingTime),
          SizedBox(height: 20),
          WhyChooseUsSection(), // Agregar sección Por Qué Elegir Nuestros Cursos
          SizedBox(height: 20),
          ContactInfoSection(),
        ],
      ),
    );
  }
}

class HeroSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: 400,
            autoPlay: true,
            enlargeCenterPage: true,
            autoPlayInterval: Duration(seconds: 3),
            viewportFraction: 1.0,
          ),
          items: [
            "assets/images/slide1.jpg",
            "assets/images/slide2.jpg",
            "assets/images/slide3.jpg",
          ].map((imagePath) {
            return Container(
              margin: EdgeInsets.symmetric(horizontal: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: AssetImage(imagePath),
                  fit: BoxFit.cover,
                  alignment: Alignment.topCenter,
                ),
              ),
            );
          }).toList(),
        ),
        Positioned.fill(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.black54,
              borderRadius: BorderRadius.circular(10),
            ),
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                AnimatedTextKit(
                  animatedTexts: [
                    TypewriterAnimatedText(
                      "VII Diplomado en Kinesiología Intensiva",
                      textStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                      speed: Duration(milliseconds: 100),
                    ),
                  ],
                  totalRepeatCount: 1,
                ),
                SizedBox(height: 10),
                AnimatedOpacity(
                  opacity: 1.0,
                  duration: Duration(seconds: 1),
                  child: Row(
                    children: [
                      Icon(Icons.school, color: Colors.white70),
                      SizedBox(width: 10),
                      Text(
                        "Modalidad: Semipresencial, Teórico-Práctico",
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
                AnimatedOpacity(
                  opacity: 1.0,
                  duration: Duration(seconds: 1),
                  child: Row(
                    children: [
                      Icon(Icons.calendar_today, color: Colors.white70),
                      SizedBox(width: 10),
                      Text(
                        "Inicio: Sábado 22 de marzo, 2025",
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
                AnimatedOpacity(
                  opacity: 1.0,
                  duration: Duration(seconds: 1),
                  child: Row(
                    children: [
                      Icon(Icons.attach_money, color: Colors.white70),
                      SizedBox(width: 10),
                      Text(
                        "Matrícula: \$60.000",
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
                AnimatedOpacity(
                  opacity: 1.0,
                  duration: Duration(seconds: 1),
                  child: Row(
                    children: [
                      Icon(Icons.money, color: Colors.white70),
                      SizedBox(width: 10),
                      Text(
                        "Diplomado: \$940.000",
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
                AnimatedOpacity(
                  opacity: 1.0,
                  duration: Duration(seconds: 1),
                  child: Row(
                    children: [
                      Icon(Icons.access_time, color: Colors.white70),
                      SizedBox(width: 10),
                      Text(
                        "Duración: 220 horas",
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Align(
                  alignment: Alignment.centerRight,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/registration');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFFFA500),
                      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero, // Hacer el botón rectangular
                      ),
                    ),
                    child: Text(
                      "Inscribirse",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class CoursesSection extends StatelessWidget {
  const CoursesSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Cursos Disponibles",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Color(0xFF004B8D),
          ),
        ),
        SizedBox(height: 10),
        Card(
          color: Colors.white,
          elevation: 3,
          margin: EdgeInsets.symmetric(vertical: 8.0),
          child: ListTile(
            leading: FaIcon(FontAwesomeIcons.book, color: Color(0xFFFFA500)), // Icono de libro
            title: Text(
              "VII Diplomado en Kinesiología Intensiva",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text("Inicio: 22 de marzo de 2025"),
            trailing: FaIcon(FontAwesomeIcons.arrowRight, color: Color(0xFF004B8D)),
            onTap: () {
              Navigator.pushNamed(context, '/course_details');
            },
          ),
        ),
        Card(
          color: Colors.white,
          elevation: 3,
          margin: EdgeInsets.symmetric(vertical: 8.0),
          child: ListTile(
            leading: FaIcon(FontAwesomeIcons.chalkboardTeacher, color: Color(0xFFFFA500)), // Icono de docente
            title: Text(
              "Conozca a nuestros Docentes",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            trailing: FaIcon(FontAwesomeIcons.arrowRight, color: Color(0xFF004B8D)),
            onTap: () {
              Navigator.pushNamed(context, '/docentes');
            },
          ),
        ),
        Card(
          color: Colors.white,
          elevation: 3,
          margin: EdgeInsets.symmetric(vertical: 8.0),
          child: ListTile(
            leading: FaIcon(FontAwesomeIcons.userPlus, color: Color(0xFFFFA500)), // Icono de inscripción
            title: Text(
              "Formulario de Inscripción",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            trailing: FaIcon(FontAwesomeIcons.arrowRight, color: Color(0xFF004B8D)),
            onTap: () {
              Navigator.pushNamed(context, '/registration');
            },
          ),
        ),
      ],
    );
  }
}

class ScheduleSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Mis Horarios",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Color(0xFF004B8D),
          ),
        ),
        SizedBox(height: 10),
        Card(
          color: Colors.white,
          elevation: 3,
          margin: EdgeInsets.symmetric(vertical: 8.0),
          child: ListTile(
            leading: FaIcon(FontAwesomeIcons.calendar, color: Color(0xFFFFA500)), // Icono calendario
            title: Text("Horario del Diplomado"),
            subtitle: Text("Ver fechas y horarios"),
            trailing: FaIcon(FontAwesomeIcons.arrowRight, color: Color(0xFF004B8D)),
            onTap: () {
              Navigator.pushNamed(context, '/schedule');
            },
          ),
        ),
      ],
    );
  }
}

class PaymentSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Pagos y Matriculación",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Color(0xFF004B8D),
          ),
        ),
        SizedBox(height: 10),
        Card(
          color: Colors.white,
          elevation: 3,
          margin: EdgeInsets.symmetric(vertical: 8.0),
          child: ListTile(
            leading: FaIcon(FontAwesomeIcons.creditCard, color: Color(0xFFFFA500)), // Icono pago
            title: Text("Realizar Pago"),
            subtitle: Text("Matrícula: \$60.000 - Costo total: \$940.000"),
            trailing: FaIcon(FontAwesomeIcons.arrowRight, color: Color(0xFF004B8D)),
            onTap: () {
              Navigator.pushNamed(context, '/payment');
            },
          ),
        ),
      ],
    );
  }
}

class CountdownSection extends StatelessWidget {
  final Duration remainingTime;

  CountdownSection({required this.remainingTime});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 600) {
          // Pantallas grandes
          return Container(
            height: 600, // Definir un alto para la sección
            child: Stack(
              children: [
                // Imagen de fondo
                Positioned.fill(
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/contador.jpg"), // Cambia por tu imagen de fondo
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),

                // Contenido superpuesto
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Título principal
                            Text(
                              "ADQUIERA NUEVAS\nCOMPETENCIAS Y CONOCIMIENTOS",
                              style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(height: 10),

                            // Subtítulo
                            Text(
                              "Inscríbase a un diplomado Certificado por el Colegio de Kinesiólogos de Chile",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white70,
                              ),
                            ),
                            SizedBox(height: 30),

                            // Contador de tiempo
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                _buildCounterBox("DÍAS", remainingTime.inDays.toString().padLeft(2, '0')),
                                _buildCounterBox("HORAS", (remainingTime.inHours % 24).toString().padLeft(2, '0')),
                                _buildCounterBox("MINUTOS", (remainingTime.inMinutes % 60).toString().padLeft(2, '0')),
                                _buildCounterBox("SEGUNDOS", (remainingTime.inSeconds % 60).toString().padLeft(2, '0')),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.4,
                            padding: EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 10,
                                  offset: Offset(0, 5),
                                ),
                              ],
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "INSCRÍBETE AHORA",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  "Cupos Limitados",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey,
                                  ),
                                ),
                                SizedBox(height: 20),
                                _buildTextField("Nombre"),
                                SizedBox(height: 10),
                                _buildTextField("Email"),
                                SizedBox(height: 10),
                                _buildTextField("Teléfono"),
                                SizedBox(height: 20),
                                ElevatedButton(
                                  onPressed: () {
                                    // Acción al enviar
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Color(0xFFFFA500), // Naranjo corporativo
                                    padding: EdgeInsets.symmetric(vertical: 15),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "ENVIAR",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        } else {
          // Pantallas pequeñas
          return Container(
            height: 600, // Definir un alto para la sección
            child: Stack(
              children: [
                // Imagen de fondo
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/contador.jpg"), // Cambia por tu imagen de fondo
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                // Contenido superpuesto
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Título principal
                      Text(
                        "ADQUIERA NUEVAS\nCOMPETENCIAS Y CONOCIMIENTOS",
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 10),

                      // Subtítulo
                      Text(
                        "Inscríbase a un diplomado Certificado por el Colegio de Kinesiólogos de Chile",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white70,
                        ),
                      ),
                      SizedBox(height: 30),

                      // Contador de tiempo
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          _buildCounterBox("DÍAS", remainingTime.inDays.toString().padLeft(2, '0')),
                          _buildCounterBox("HORAS", (remainingTime.inHours % 24).toString().padLeft(2, '0')),
                          _buildCounterBox("MINUTOS", (remainingTime.inMinutes % 60).toString().padLeft(2, '0')),
                          _buildCounterBox("SEGUNDOS", (remainingTime.inSeconds % 60).toString().padLeft(2, '0')),
                        ],
                      ),

                      Spacer(),

                      // Formulario flotante
                      Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.8,
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black12,
                                blurRadius: 10,
                                offset: Offset(0, 5),
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "INSCRÍBETE AHORA",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 5),
                              Text(
                                "Cupos Limitados",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey,
                                ),
                              ),
                              SizedBox(height: 20),
                              _buildTextField("Nombre"),
                              SizedBox(height: 10),
                              _buildTextField("Email"),
                              SizedBox(height: 10),
                              _buildTextField("Teléfono"),
                              SizedBox(height: 20),
                              ElevatedButton(
                                onPressed: () {
                                  // Acción al enviar
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Color(0xFFFFA500), // Naranjo corporativo
                                  padding: EdgeInsets.symmetric(vertical: 15),
                                ),
                                child: Center(
                                  child: Text(
                                    "ENVIAR",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }
      },
    );
  }

  Widget _buildCounterBox(String label, String value) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: Colors.white70,
          ),
        ),
      ],
    );
  }

  Widget _buildTextField(String hintText) {
    return TextField(
      decoration: InputDecoration(
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        filled: true,
        fillColor: Colors.grey[200],
      ),
    );
  }
}

class ContactInfoSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white, // Cambiar a blanco
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Información de contacto",
            style: TextStyle(
              color: Color(0xFF004B8D), // Azul corporativo
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        FaIcon(FontAwesomeIcons.mapMarkerAlt, color: Color(0xFF004B8D)),
                        SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            "Irarrazaval 5150, depto. 2109. Ñuñoa",
                            style: TextStyle(color: Color(0xFF004B8D)),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 5),
                    GestureDetector(
                      onTap: () => launch("tel:+56223154661"),
                      child: Row(
                        children: [
                          FaIcon(FontAwesomeIcons.phone, color: Color(0xFF004B8D)),
                          SizedBox(width: 10),
                          Text(
                            "+56 22 3154 661",
                            style: TextStyle(color: Color(0xFF004B8D)),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 5),
                    GestureDetector(
                      onTap: () => launch("mailto:info@www.kineintensiva.cl"),
                      child: Row(
                        children: [
                          FaIcon(FontAwesomeIcons.envelope, color: Color(0xFF004B8D)),
                          SizedBox(width: 10),
                          Text(
                            "info@www.kineintensiva.cl",
                            style: TextStyle(color: Color(0xFF004B8D)),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  Row(
                    children: [
                      FaIcon(FontAwesomeIcons.facebook, color: Color(0xFF004B8D)),
                      SizedBox(width: 10),
                      FaIcon(FontAwesomeIcons.twitter, color: Color(0xFF004B8D)),
                      SizedBox(width: 10),
                      FaIcon(FontAwesomeIcons.instagram, color: Color(0xFF004B8D)),
                    ],
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 10),
          Divider(color: Color(0xFF004B8D)),
          SizedBox(height: 10),
          Text(
            "© 2025 KineIntensiva",
            style: TextStyle(
              color: Color(0xFF004B8D),
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}

class QuienesSomosSection extends StatelessWidget {
  const QuienesSomosSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Quienes Somos",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Color(0xFF004B8D),
          ),
        ),
        SizedBox(height: 10),
        Text(
          "Somos una institución dedicada a la formación de Kinesiólogos especializados en el área de Kinesiología Intensiva. "
          "Nuestro objetivo es proporcionar una educación de alta calidad que permita a nuestros estudiantes adquirir las competencias "
          "necesarias para desempeñarse de manera efectiva en el manejo de pacientes críticos.",
          style: TextStyle(fontSize: 16, color: Colors.black),
        ),
      ],
    );
  }
}

class WhyChooseUsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "POR QUÉ ELEGIR NUESTROS CURSOS",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Color(0xFF004B8D),
          ),
        ),
        SizedBox(height: 20),
        Row(
          children: [
            Icon(Icons.verified, color: Color(0xFF004B8D)),
            SizedBox(width: 10),
            Expanded(
              child: Text(
                "Certificación\nCurso certificado por el Colegio de Kinesiólogos de Chile, miembro de la Confederación Mundial de Terapia Física (WCPT), con el patrocinio de la UDLA, U. de los Andes y la Sociedad de Medicina Crítica y Urgencias (RED INTENSIVA).",
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
            ),
          ],
        ),
        SizedBox(height: 20),
        Row(
          children: [
            Icon(Icons.school, color: Color(0xFF004B8D)),
            SizedBox(width: 10),
            Expanded(
              child: Text(
                "Formación Integral\nLos Cursos de Kineintensiva no sólo entregan formación en materias técnicas específicas, si no que también aborda elementos transversales del desempeño profesional como aspectos legales, psicológicos y de gestión.",
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
            ),
          ],
        ),
        SizedBox(height: 20),
        Row(
          children: [
            Icon(Icons.attach_money, color: Color(0xFF004B8D)),
            SizedBox(width: 10),
            Expanded(
              child: Text(
                "Costos asequibles\nEl Curso de Kinesiología Intensiva tiene la categoría académica (220 horas) de un Diplomado Universitario a un costo significativamente menor.",
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
            ),
          ],
        ),
        SizedBox(height: 20),
        Row(
          children: [
            Icon(Icons.support, color: Color(0xFF004B8D)),
            SizedBox(width: 10),
            Expanded(
              child: Text(
                "Apoyo a la Docencia\nContamos con un sistema Moodle que permite contar con herramientas docentes adicionales a la actividad presencial, como: foros, videos, lectura complementaria, información académica, etc.",
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
            ),
          ],
        ),
        SizedBox(height: 20),
        Row(
          children: [
            Icon(Icons.discount, color: Color(0xFF004B8D)),
            SizedBox(width: 10),
            Expanded(
              child: Text(
                "Convenios y descuentos\nLos kinesiólogos Colegiados (por 1 año o más) tienen un 20% de descuento en el valor del Curso. Egresados de la Universidad de los Andes cuentan con un descuento del 25%, mientras que egresados UDLA y Socios de la Red Intensiva un 30%.",
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
            ),
          ],
        ),
      ],
    );
  }
}