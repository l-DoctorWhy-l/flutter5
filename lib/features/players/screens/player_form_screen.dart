import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PlayerFormScreen extends StatefulWidget {
  final Function(String fullName, int age, int jerseyNumber) onSave;

  const PlayerFormScreen({
    Key? key,
    required this.onSave,
  }) : super(key: key);

  @override
  State<PlayerFormScreen> createState() => _PlayerFormScreenState();
}

class _PlayerFormScreenState extends State<PlayerFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final _fullNameController = TextEditingController();
  final _ageController = TextEditingController();
  final _jerseyNumberController = TextEditingController();

  @override
  void dispose() {
    _fullNameController.dispose();
    _ageController.dispose();
    _jerseyNumberController.dispose();
    super.dispose();
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      final fullName = _fullNameController.text;
      final age = int.parse(_ageController.text);
      final jerseyNumber = int.parse(_jerseyNumberController.text);
      widget.onSave(fullName, age, jerseyNumber);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Добавить игрока'),
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: _submit,
          ),
        ],
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextFormField(
                controller: _fullNameController,
                decoration: const InputDecoration(labelText: 'ФИО'),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Пожалуйста, введите ФИО';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _ageController,
                decoration: const InputDecoration(labelText: 'Возраст'),
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Пожалуйста, введите возраст';
                  }
                  if (int.tryParse(value) == null || int.parse(value) <= 0) {
                    return 'Введите корректный возраст';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _jerseyNumberController,
                decoration: const InputDecoration(labelText: 'Игровой номер'),
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Пожалуйста, введите номер';
                  }
                   if (int.tryParse(value) == null || int.parse(value) < 0) {
                    return 'Введите корректный номер';
                  }
                  return null;
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
