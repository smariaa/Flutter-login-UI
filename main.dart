import 'package:flutter/material.dart';

void main() => runApp(
  MaterialApp(
    debugShowCheckedModeBanner: false,
    home: LoginPage(),
  ),
);

Widget buildInput(String hint, IconData icon, {bool obscure = false}) {
  return SizedBox(
    width: 300, // reduced width
    child: TextField(
      obscureText: obscure,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(color: Colors.pink[300]),
        prefixIcon: Icon(icon, color: Colors.pink[400]),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: BorderSide(color: Colors.pink.shade400),
        ),
      ),
    ),
  );
}

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AuthScaffold(
      title: 'Welcome Back',
      subtitle: 'Login to continue',
      fields: [
        buildInput('Username', Icons.person),
        SizedBox(height: 12),
        buildInput('Password', Icons.lock, obscure: true),
      ],
      buttonText: 'Log In',                 // updated text
      bottomText: "Don't have an account?",
      actionText: 'Create one',             // updated text
      onActionTap: () =>
          Navigator.push(context, MaterialPageRoute(builder: (_) => SignUpPage())),
    );
  }
}

class SignUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AuthScaffold(
      title: 'Create Account',
      subtitle: 'Join us by creating an account',
      fields: [
        buildInput('Username', Icons.person),
        SizedBox(height: 10),
        buildInput('Email', Icons.email),
        SizedBox(height: 10),
        buildInput('Password', Icons.lock, obscure: true),
        SizedBox(height: 10),
        buildInput('Confirm Password', Icons.lock_outline, obscure: true),
      ],
      buttonText: 'Sign Up',
      extraButton: SizedBox(
        width: 320,  // increased width
        child: OutlinedButton.icon(
          onPressed: () {},
          icon: Icon(Icons.g_mobiledata, color: Colors.pink[400]),
          label: Text('Sign In with Google'),
          style: OutlinedButton.styleFrom(
            foregroundColor: Colors.pink[400],
            side: BorderSide(color: Colors.pink[400]!),
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            padding: EdgeInsets.symmetric(vertical: 14),
          ),
        ),
      ),
      bottomText: "Already have an account?",
      actionText: 'Log In',                 // changed from 'Login' for consistency
      onActionTap: () => Navigator.pop(context),
    );
  }
}

class AuthScaffold extends StatelessWidget {
  final String title,
      subtitle,
      buttonText,
      bottomText,
      actionText;
  final List<Widget> fields;
  final Widget? extraButton;
  final VoidCallback onActionTap;

  const AuthScaffold({
    required this.title,
    required this.subtitle,
    required this.fields,
    required this.buttonText,
    required this.bottomText,
    required this.actionText,
    this.extraButton,
    required this.onActionTap,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.pink.shade300,
              Colors.pink.shade200,
              Colors.pink.shade100,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w700,
                    color: Colors.pink.shade900,
                  ),
                ),
                SizedBox(height: 6),
                Text(
                  subtitle,
                  style: TextStyle(
                    color: Colors.pink.shade700,
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 30),
                ...fields,
                SizedBox(height: 18),
                SizedBox(
                  width: 300,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.pink.shade400,
                      padding: EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: Text(
                      buttonText,
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
                if (extraButton != null) ...[
                  SizedBox(height: 14),
                  Text(
                    "Or",
                    style: TextStyle(color: Colors.pink.shade600),
                  ),
                  SizedBox(height: 12),
                  extraButton!,
                ],
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      bottomText,
                      style: TextStyle(color: Colors.pink.shade700),
                    ),
                    TextButton(
                      onPressed: onActionTap,
                      child: Text(
                        actionText,
                        style: TextStyle(color: Colors.pink.shade900),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
