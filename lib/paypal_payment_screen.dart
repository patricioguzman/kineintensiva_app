import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PayPalPaymentScreen extends StatefulWidget {
  @override
  _PayPalPaymentScreenState createState() => _PayPalPaymentScreenState();
}

class _PayPalPaymentScreenState extends State<PayPalPaymentScreen> {
  late final WebViewController _controller;

  final String paypalCheckoutUrl = "https://www.sandbox.paypal.com/checkoutnow?token=YOUR_PAYPAL_ORDER_ID";

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (String url) {
            print("Iniciando carga de: $url");
          },
          onPageFinished: (String url) {
            print("Finalizó carga de: $url");
            // Detecta si el usuario completó o canceló el pago y redirige
            if (url.contains("success")) {
              Navigator.pop(context, "Pago Exitoso");
            } else if (url.contains("cancel")) {
              Navigator.pop(context, "Pago Cancelado");
            }
          },
          onWebResourceError: (WebResourceError error) {
            print("Error en WebView: ${error.description}");
          },
        ),
      )
      ..loadRequest(Uri.parse(paypalCheckoutUrl));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pago con PayPal"),
        backgroundColor: Colors.white, // Cambiar a blanco
        foregroundColor: Color(0xFF004B8D), // Cambiar el color del texto a azul corporativo
      ),
      body: WebViewWidget(controller: _controller),
    );
  }
}