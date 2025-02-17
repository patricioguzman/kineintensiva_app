import 'package:flutter/material.dart';

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _formKey = GlobalKey<FormState>();

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
          "Formulario de Inscripción",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTextField("Nombre Completo", "Nombre Completo", true),
              _buildTextField("Fecha de Nacimiento", "dd/mm/yyyy", false),
              _buildTextField("R.U.T.", "Rut", false),
              _buildTextField("Dirección", "Dirección", false),
              _buildTextField("Teléfono", "Teléfono", false),
              _buildTextField("Teléfono 2", "Teléfono 2", false),
              _buildTextField("Universidad de Egreso", "Universidad", false),
              _buildTextField("Fecha de Egreso", "dd/mm/yyyy", false),
              _buildTextField("Lugar de Trabajo", "Lugar de Trabajo", false),
              _buildExperienceField(),
              _buildPaymentConditionsField(),
              _buildTextField("Tu Correo", "Correo", true),
              _buildTextField("Tu Mensaje", "Mensaje (Opcional)", false),
              SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Acción al enviar el formulario
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFFFA500), // Naranjo corporativo
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  ),
                  child: Text(
                    "Enviar",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String label, String hint, bool required) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: label,
          hintText: hint,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        validator: required
            ? (value) {
                if (value == null || value.isEmpty) {
                  return 'Este campo es requerido';
                }
                return null;
              }
            : null,
      ),
    );
  }

  Widget _buildExperienceField() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("¿Experiencia en UPC?", style: TextStyle(fontSize: 16)),
          Row(
            children: [
              Expanded(
                child: ListTile(
                  title: const Text('Sí'),
                  leading: Radio(
                    value: true,
                    groupValue: true,
                    onChanged: (bool? value) {},
                  ),
                ),
              ),
              Expanded(
                child: ListTile(
                  title: const Text('No'),
                  leading: Radio(
                    value: false,
                    groupValue: true,
                    onChanged: (bool? value) {},
                  ),
                ),
              ),
            ],
          ),
          _buildTextField("Años de Experiencia", "Años de Experiencia", false),
        ],
      ),
    );
  }

  Widget _buildPaymentConditionsField() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Condiciones de Pago:", style: TextStyle(fontSize: 16)),
          Row(
            children: [
              Expanded(
                child: ListTile(
                  title: const Text('Matrícula'),
                  leading: Radio(
                    value: 'Matrícula',
                    groupValue: 'Matrícula',
                    onChanged: (String? value) {},
                  ),
                ),
              ),
              Expanded(
                child: ListTile(
                  title: const Text('Depósito'),
                  leading: Radio(
                    value: 'Depósito',
                    groupValue: 'Matrícula',
                    onChanged: (String? value) {},
                  ),
                ),
              ),
              Expanded(
                child: ListTile(
                  title: const Text('Transferencia'),
                  leading: Radio(
                    value: 'Transferencia',
                    groupValue: 'Matrícula',
                    onChanged: (String? value) {},
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
