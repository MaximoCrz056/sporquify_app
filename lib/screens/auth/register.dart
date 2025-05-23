import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sporquify_app/screens/auth/login.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscurePassword = true;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.grey.withValues(alpha: 0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.arrow_back,
              color: Theme.of(context).primaryColor,
              size: 24,
            ),
          ),
          onPressed: () {
            Navigator.pushNamed(context, '/chose');
          },
        ),
        centerTitle: true,
        title: SvgPicture.asset(
          'assets/Vector.svg',
          height: 33,
          width: 108,
          colorFilter: ColorFilter.mode(
              Theme.of(context).colorScheme.primary,
              BlendMode.srcIn,
            ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Logo
                // Eliminado el logo duplicado aquí
                const SizedBox(height: 45),
                // Register Title
                Text(
                  'Register',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ),
                const SizedBox(height: 20),

                // Support Text
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'If You Need Any Support ',
                      style: TextStyle(
                        fontSize: 16,
                        color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        // Handle support action
                      },
                      child: Text(
                        'Click Here',
                        style: TextStyle(
                          fontSize: 16,
                          color: Theme.of(context).colorScheme.primary,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),

                // Name Field
                TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    hintText: 'Full Name',
                    hintStyle: TextStyle(color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6), fontSize: 18, fontWeight: FontWeight.bold),
                    filled: true,
                    fillColor: Theme.of(context).scaffoldBackgroundColor,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(color: Theme.of(context).colorScheme.primary),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 28, // Ajusta para altura total de 80
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),

                // Email Field
                TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: 'Enter Email',
                    hintStyle: TextStyle(color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6), fontSize: 18, fontWeight: FontWeight.bold),
                    filled: true,
                    fillColor: Theme.of(context).scaffoldBackgroundColor,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(color: Theme.of(context).colorScheme.primary),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 28, // Ajusta para altura total de 80
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    if (!RegExp(
                      r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                    ).hasMatch(value)) {
                      return 'Please enter a valid email';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),

                // Password Field
                TextFormField(
                  controller: _passwordController,
                  obscureText: _obscurePassword,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    hintStyle: TextStyle(color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6), fontSize: 18, fontWeight: FontWeight.bold),
                    filled: true,
                    fillColor: Theme.of(context).scaffoldBackgroundColor,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(color: Theme.of(context).colorScheme.primary),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 28, // Ajusta para altura total de 80
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscurePassword
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                        color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
                      ),
                      onPressed: () {
                        setState(() {
                          _obscurePassword = !_obscurePassword;
                        });
                      },
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    if (value.length < 6) {
                      return 'Password must be at least 6 characters';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 30),

                // Create Account Button
                SizedBox(
                  width: double.infinity,
                  height: 80, // Cambia la altura del botón a 80
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // Handle registration logic
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      elevation: 0,
                    ),
                    child: const Text(
                      'Create Account',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                // Or Divider
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 24.0),
                  child: Row(
                    children: [
                      const Expanded(child: Divider(color: Color(0xFFE0E0E0))),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Text(
                          'Or',
                        style: TextStyle(color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6)),
                        ),
                      ),
                      const Expanded(child: Divider(color: Color(0xFFE0E0E0))),
                    ],
                  ),
                ),

                // Social Sign Up Options
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Google Sign Up
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: const Color(0xFFE0E0E0)),
                      ),
                      child: IconButton(
                        icon: const Icon(Icons.g_mobiledata, size: 38),
                        onPressed: () {
                          // Handle Google sign up
                        },
                      ),
                    ),
                    const SizedBox(width: 20),
                    // Apple Sign Up
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: const Color(0xFFE0E0E0)),
                      ),
                      child: IconButton(
                        icon: const Icon(Icons.apple, size: 28),
                        onPressed: () {
                          // Handle Apple sign up
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),

                // Login Option
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Do You Have An Account? ',
                    style: TextStyle(
                      fontSize: 18,
                      color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
                    ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginScreen(),
                          ),
                        );
                      },
                      child: Text(
                        'Sign In',
                        style: TextStyle(
                          fontSize: 18,
                          color: Theme.of(context).colorScheme.primary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
