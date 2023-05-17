import 'dart:convert';
import 'package:babies/screen/register.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:babies/screen/home.dart';
import 'package:shared_preferences/shared_preferences.dart';


class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoading = false;
  String? _errorMessage;

  void _login() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    final email = _emailController.text;
    final password = _passwordController.text;

    final url = Uri.parse('http://10.0.2.2:3000/account/login');
    final response = await http.post(url, body: {'email': email, 'password': password});

    setState(() {
      _isLoading = false;
    });

    if (response.statusCode == 200) {
      // Successful login
      final data = jsonDecode(response.body);

      // Save JWT token to SharedPreferences
      final prefs = await SharedPreferences.getInstance();
      prefs.setString('jwtToken', data['token']);

      // Display message from server
      final message = data['message'];
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));

      // Navigate to MyHomePage
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => MyHomePage()),
      );
    } else {
      // Login failed
      setState(() {
        _errorMessage = 'Incorrect email or password';
      });
    }
  }





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your username';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  controller: _passwordController,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                  ),
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 32.0),
                ElevatedButton(
                  onPressed: _isLoading ? null : () {
                    if (_formKey.currentState!.validate()) {
                      _login();
                    }
                  },
                  child: _isLoading ? const CircularProgressIndicator() : const Text('Login'),
                ),
                const SizedBox(height: 16.0),
                if (_errorMessage != null) Text(_errorMessage!, style: const TextStyle(color: Colors.red)),
                const SizedBox(height: 8.0),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RegisterPage()),
                    );
                  },
                  child: const Text('Do not have an account?'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
