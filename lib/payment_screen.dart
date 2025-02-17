import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PaymentScreen extends StatelessWidget {
  final double registrationFee = 60000; // Matrícula en CLP
  final double totalCost = 940000; // Costo total del diplomado en CLP

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pago del Diplomado"),
        backgroundColor: Colors.white, // Cambiar a blanco
        foregroundColor: Color(0xFF004B8D), // Cambiar el color del texto a azul corporativo
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "VII Diplomado en Kinesiología Intensiva",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color(0xFF004B8D),
              ),
            ),
            SizedBox(height: 10),

            Text(
              "Para completar tu inscripción, debes realizar el pago de la matrícula y/o el total del diplomado.",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),

            Card(
              color: Colors.white,
              elevation: 3,
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        FaIcon(FontAwesomeIcons.moneyBillWave, color: Color(0xFFFFA500)),
                        SizedBox(width: 10),
                        Text("Matrícula: \$${registrationFee.toStringAsFixed(0)} CLP",
                            style: TextStyle(fontSize: 16)),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        FaIcon(FontAwesomeIcons.solidCreditCard, color: Color(0xFFFFA500)),
                        SizedBox(width: 10),
                        Text("Costo Total: \$${totalCost.toStringAsFixed(0)} CLP",
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 20),

            Center(
              child: Column(
                children: [
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.pushNamed(context, '/paypal_payment');
                    },
                    icon: FaIcon(FontAwesomeIcons.paypal, color: Colors.white),
                    label: Text('Pagar con PayPal'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF004B8D), // Azul PayPal
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      textStyle: TextStyle(fontSize: 18),
                    ),
                  ),
                  SizedBox(height: 10),
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: FaIcon(FontAwesomeIcons.timesCircle, color: Colors.white),
                    label: Text('Cancelar'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey,
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      textStyle: TextStyle(fontSize: 18),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}