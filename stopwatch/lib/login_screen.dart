import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool loggedIn = false;
  String name = '';

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Center(
        child: loggedIn ? _buildSuccess() : _buildLoginForm(),
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  Widget _buildSuccess() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(Icons.check, color: Colors.orangeAccent),
        Text('Hello $name'),
      ],
    );
  }

  Widget _buildLoginForm() {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Runner'),
              validator: (text) =>
                  text!.isEmpty ? 'Enter runner\'s name' : null,
            ),
            TextFormField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: 'Email'),
              validator: (text) => null,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _validate,
              child: const Text('Continue'),
            ),
          ],
        ),
      ),
    );
  }

  void _validate() {
    final form = _formKey.currentState;
    if (form?.validate() != true) return;

    setState(() {
      loggedIn = true;
      name = _nameController.text;
    });
  }
}
