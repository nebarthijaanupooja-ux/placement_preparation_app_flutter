import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../services/firestore_service.dart';
import '../services/storage_service.dart';
import 'admin/admin_login.dart';
import 'dashboard_screen.dart';
import 'profile_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({
    super.key,
    required this.storage,
  });

  final StorageService storage;

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  final _auth = FirebaseAuth.instance;
  final _firestoreService = FirestoreService();

  bool _isLoading = false;
  bool _obscurePassword = true;

  static const Color primaryPurple = Color(0xFF7E57C2);
  static const Color darkPurple = Color(0xFF43245F);

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  // ------------------------------------------------------------
  // STUDENT LOGIN
  // ------------------------------------------------------------

  Future<void> _login() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    FocusScope.of(context).unfocus();

    setState(() {
      _isLoading = true;
    });

    try {
      final credential = await _auth.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text,
      );

      final user = credential.user;

      if (user == null) {
        throw FirebaseAuthException(
          code: 'user-not-found',
          message: 'Unable to find your account.',
        );
      }

      final student = await _firestoreService.getStudent(user.uid);

      if (!mounted) return;

      if (student == null) {
        _showMessage(
          'Profile details not found. Please create your profile again.',
          isError: true,
        );

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) => ProfileScreen(
              storage: widget.storage,
            ),
          ),
        );

        return;
      }

      await widget.storage.saveStudent(student);

      if (!mounted) return;

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => DashboardScreen(
            storage: widget.storage,
            student: student,
          ),
        ),
      );
    } on FirebaseAuthException catch (e) {
      if (!mounted) return;

      String message;

      switch (e.code) {
        case 'invalid-credential':
        case 'wrong-password':
        case 'user-not-found':
          message = 'Email or password is incorrect.';
          break;

        case 'invalid-email':
          message = 'Please enter a valid email address.';
          break;

        case 'user-disabled':
          message = 'This account has been disabled.';
          break;

        case 'too-many-requests':
          message = 'Too many attempts. Please try again later.';
          break;

        case 'network-request-failed':
          message = 'Please check your internet connection.';
          break;

        default:
          message = e.message ?? 'Login failed. Please try again.';
      }

      _showMessage(
        message,
        isError: true,
      );
    } on FirebaseException catch (e) {
      if (!mounted) return;

      _showMessage(
        e.message ?? 'Unable to load your profile.',
        isError: true,
      );
    } catch (e) {
      if (!mounted) return;

      _showMessage(
        'Something went wrong. Please try again.',
        isError: true,
      );
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  // ------------------------------------------------------------
  // FORGOT PASSWORD
  // ------------------------------------------------------------

  Future<void> _resetPassword() async {
    final email = _emailController.text.trim();

    if (email.isEmpty) {
      _showMessage(
        'Enter your email address first.',
        isError: true,
      );
      return;
    }

    try {
      await _auth.sendPasswordResetEmail(
        email: email,
      );

      if (!mounted) return;

      _showMessage(
        'Password reset email sent. Please check your inbox.',
      );
    } on FirebaseAuthException catch (e) {
      if (!mounted) return;

      _showMessage(
        e.message ?? 'Unable to send password reset email.',
        isError: true,
      );
    }
  }

  // ------------------------------------------------------------
  // ADMIN LOGIN
  // ------------------------------------------------------------

  void _openAdminLogin() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => AdminLoginScreen(
          storage: widget.storage,
        ),
      ),
    );
  }

  // ------------------------------------------------------------
  // MESSAGE
  // ------------------------------------------------------------

  void _showMessage(
    String message, {
    bool isError = false,
  }) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(message),
          backgroundColor:
              isError ? Colors.redAccent : primaryPurple,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
      );
  }

  // ------------------------------------------------------------
  // INPUT DECORATION
  // ------------------------------------------------------------

  InputDecoration _inputDecoration({
    required String label,
    required IconData icon,
    Widget? suffixIcon,
  }) {
    return InputDecoration(
      labelText: label,
      prefixIcon: Icon(
        icon,
        color: primaryPurple,
      ),
      suffixIcon: suffixIcon,
      filled: true,
      fillColor: Colors.white.withValues(
        alpha: 0.9,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(18),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(18),
        borderSide: BorderSide(
          color: primaryPurple.withValues(
            alpha: 0.12,
          ),
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(18),
        borderSide: const BorderSide(
          color: primaryPurple,
          width: 1.5,
        ),
      ),
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 18,
        vertical: 17,
      ),
    );
  }

  // ------------------------------------------------------------
  // BUILD
  // ------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFFF8EEFF),
              Color(0xFFFFF3F8),
              Color(0xFFF1EDFF),
            ],
          ),
        ),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: ConstrainedBox(
                constraints: const BoxConstraints(
                  maxWidth: 500,
                ),
                child: Column(
                  children: [
                    // ------------------------------------------------
                    // APP ICON
                    // ------------------------------------------------

                    Container(
                      height: 90,
                      width: 90,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [
                            Color(0xFF9C6ADE),
                            Color(0xFF7E57C2),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(28),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.purple.withValues(
                              alpha: 0.20,
                            ),
                            blurRadius: 20,
                            offset: const Offset(0, 10),
                          ),
                        ],
                      ),
                      child: const Icon(
                        Icons.school_rounded,
                        size: 46,
                        color: Colors.white,
                      ),
                    ),

                    const SizedBox(height: 24),

                    // ------------------------------------------------
                    // TITLE
                    // ------------------------------------------------

                    const Text(
                      'Welcome Back! 💜',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: darkPurple,
                      ),
                    ),

                    const SizedBox(height: 8),

                    Text(
                      'Login to continue your placement preparation',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey.shade700,
                      ),
                    ),

                    const SizedBox(height: 30),

                    // ------------------------------------------------
                    // LOGIN CARD
                    // ------------------------------------------------

                    Container(
                      padding: const EdgeInsets.all(24),
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(
                          alpha: 0.92,
                        ),
                        borderRadius: BorderRadius.circular(28),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.purple.withValues(
                              alpha: 0.08,
                            ),
                            blurRadius: 25,
                            offset: const Offset(0, 12),
                          ),
                        ],
                      ),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment:
                              CrossAxisAlignment.stretch,
                          children: [
                            // ------------------------------------------------
                            // EMAIL
                            // ------------------------------------------------

                            TextFormField(
                              controller: _emailController,
                              keyboardType:
                                  TextInputType.emailAddress,
                              textInputAction:
                                  TextInputAction.next,
                              decoration: _inputDecoration(
                                label: 'Email Address',
                                icon: Icons.email_outlined,
                              ),
                              validator: (value) {
                                final email =
                                    value?.trim() ?? '';

                                if (email.isEmpty) {
                                  return 'Please enter your email';
                                }

                                if (!email.contains('@')) {
                                  return 'Please enter a valid email';
                                }

                                return null;
                              },
                            ),

                            const SizedBox(height: 18),

                            // ------------------------------------------------
                            // PASSWORD
                            // ------------------------------------------------

                            TextFormField(
                              controller: _passwordController,
                              obscureText: _obscurePassword,
                              textInputAction:
                                  TextInputAction.done,
                              onFieldSubmitted: (_) => _login(),
                              decoration: _inputDecoration(
                                label: 'Password',
                                icon:
                                    Icons.lock_outline_rounded,
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      _obscurePassword =
                                          !_obscurePassword;
                                    });
                                  },
                                  icon: Icon(
                                    _obscurePassword
                                        ? Icons
                                            .visibility_outlined
                                        : Icons
                                            .visibility_off_outlined,
                                    color: primaryPurple,
                                  ),
                                ),
                              ),
                              validator: (value) {
                                if (value == null ||
                                    value.isEmpty) {
                                  return 'Please enter your password';
                                }

                                return null;
                              },
                            ),

                            const SizedBox(height: 8),

                            // ------------------------------------------------
                            // FORGOT PASSWORD
                            // ------------------------------------------------

                            Align(
                              alignment:
                                  Alignment.centerRight,
                              child: TextButton(
                                onPressed: _isLoading
                                    ? null
                                    : _resetPassword,
                                child: const Text(
                                  'Forgot Password?',
                                  style: TextStyle(
                                    fontWeight:
                                        FontWeight.w600,
                                    color: primaryPurple,
                                  ),
                                ),
                              ),
                            ),

                            const SizedBox(height: 10),

                            // ------------------------------------------------
                            // STUDENT LOGIN BUTTON
                            // ------------------------------------------------

                            SizedBox(
                              height: 56,
                              child: ElevatedButton(
                                onPressed:
                                    _isLoading ? null : _login,
                                style:
                                    ElevatedButton.styleFrom(
                                  backgroundColor:
                                      primaryPurple,
                                  foregroundColor:
                                      Colors.white,
                                  elevation: 4,
                                  shape:
                                      RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(
                                      18,
                                    ),
                                  ),
                                ),
                                child: _isLoading
                                    ? const SizedBox(
                                        height: 24,
                                        width: 24,
                                        child:
                                            CircularProgressIndicator(
                                          strokeWidth: 2.5,
                                          color: Colors.white,
                                        ),
                                      )
                                    : const Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment
                                                .center,
                                        children: [
                                          Icon(
                                            Icons.login_rounded,
                                          ),
                                          SizedBox(width: 10),
                                          Text(
                                            'Student Login',
                                            style: TextStyle(
                                              fontSize: 17,
                                              fontWeight:
                                                  FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                              ),
                            ),

                            const SizedBox(height: 18),

                            // ------------------------------------------------
                            // ADMIN LOGIN BUTTON
                            // ------------------------------------------------

                            SizedBox(
                              height: 56,
                              child: OutlinedButton.icon(
                                onPressed: _isLoading
                                    ? null
                                    : _openAdminLogin,
                                icon: const Icon(
                                  Icons
                                      .admin_panel_settings_rounded,
                                ),
                                label: const Text(
                                  'Admin Login',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                style:
                                    OutlinedButton.styleFrom(
                                  foregroundColor:
                                      darkPurple,
                                  side: BorderSide(
                                    color: primaryPurple
                                        .withValues(
                                      alpha: 0.45,
                                    ),
                                    width: 1.3,
                                  ),
                                  shape:
                                      RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(
                                      18,
                                    ),
                                  ),
                                ),
                              ),
                            ),

                            const SizedBox(height: 22),

                            // ------------------------------------------------
                            // OR
                            // ------------------------------------------------

                            Row(
                              children: [
                                Expanded(
                                  child: Divider(
                                    color:
                                        Colors.grey.shade300,
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets
                                          .symmetric(
                                    horizontal: 12,
                                  ),
                                  child: Text(
                                    'OR',
                                    style: TextStyle(
                                      color:
                                          Colors.grey.shade500,
                                      fontWeight:
                                          FontWeight.w600,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Divider(
                                    color:
                                        Colors.grey.shade300,
                                  ),
                                ),
                              ],
                            ),

                            const SizedBox(height: 18),

                            // ------------------------------------------------
                            // CREATE PROFILE
                            // ------------------------------------------------

                            Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Don't have an account?",
                                  style: TextStyle(
                                    color:
                                        Colors.grey.shade700,
                                  ),
                                ),
                                TextButton(
                                  onPressed: _isLoading
                                      ? null
                                      : () {
                                          Navigator
                                              .pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                              builder: (_) =>
                                                  ProfileScreen(
                                                storage:
                                                    widget
                                                        .storage,
                                              ),
                                            ),
                                          );
                                        },
                                  child: const Text(
                                    'Create Profile',
                                    style: TextStyle(
                                      fontWeight:
                                          FontWeight.bold,
                                      color: primaryPurple,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 22),

                    // ------------------------------------------------
                    // FOOTER
                    // ------------------------------------------------

                    Text(
                      'Placement Preparation • Learn • Practice • Grow 🚀',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}