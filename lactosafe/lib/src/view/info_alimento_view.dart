import 'package:flutter/material.dart';

class InfoAlimentoPage extends StatefulWidget {
  const InfoAlimentoPage({super.key});
  static const routeName = '/InfoAlimentoPage';

  @override
  State<InfoAlimentoPage> createState() => _InfoAlimentoPage();
}

class _InfoAlimentoPage extends State<InfoAlimentoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TESTE'),
      ),
      body: const Text('aaaaaa'),
    );
  }
}
