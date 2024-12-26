import 'package:flutter/material.dart';

class DateFormWidget extends StatefulWidget {
  const DateFormWidget({super.key});

  @override
  State<DateFormWidget> createState() => _DateFormWidgetState();
}

class _DateFormWidgetState extends State<DateFormWidget> {
  final _startDateController = TextEditingController();
  final _endDateController = TextEditingController();

  @override
  void dispose() {
    // Liberar recursos ao sair
    _startDateController.dispose();
    _endDateController.dispose();
    super.dispose();
  }

  void _saveForm() {
    String startDate = _startDateController.text;
    String endDate = _endDateController.text;

    if (startDate.isEmpty || endDate.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Por favor, preencha todos os campos.")),
      );
      return;
    }

    // Simular salvamento
    print("Data de início: $startDate, Data de fim: $endDate");

    // Fechar o modal após salvar
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              "Nova notificação",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _startDateController,
              decoration: const InputDecoration(
                labelText: "Data de Início",
                border: OutlineInputBorder(),
                hintText: "Ex: 2024-01-01",
              ),
              keyboardType: TextInputType.datetime,
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _endDateController,
              decoration: const InputDecoration(
                labelText: "Data de Fim",
                border: OutlineInputBorder(),
                hintText: "Ex: 2024-12-31",
              ),
              keyboardType: TextInputType.datetime,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _saveForm,
              child: const Text("Salvar"),
            ),
          ],
        ),
      ],
    );
  }
}