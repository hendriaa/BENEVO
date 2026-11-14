import 'package:flutter/material.dart';
import '../../../core/constants/colors.dart';
import '../widgets/benevo_logo.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/incognito_icon.dart';
import '../../home/screens/dashboard_screen.dart';
import 'forgot_password_screen.dart';
import 'register_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  final _identifierController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _obscurePassword = true;
  bool _rememberMe = true;
  bool _isLoading = false;

  @override
  void dispose() {
    _identifierController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _handleLogin() {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    setState(() {
      _isLoading = true;
    });

    Future.delayed(const Duration(milliseconds: 1000), () {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Berhasil masuk ke Benevo!'),
            backgroundColor: AppColors.primary,
          ),
        );
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const DashboardScreen(userName: 'Hanzel'),
          ),
        );
      }
    });
  }

  void _handleAnonymousLogin() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Melanjutkan sebagai pengguna anonim...'),
        backgroundColor: Color(0xFF8F7EBA),
      ),
    );
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const DashboardScreen(isAnonymous: true),
      ),
    );
  }

  void _handleForgotPassword() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const ForgotPasswordScreen(),
      ),
    );
  }

  void _navigateToRegister() {
    if (Navigator.canPop(context)) {
      Navigator.pop(context);
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const RegisterScreen(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight,
                ),
                child: IntrinsicHeight(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(height: 12),

                          // Top Navigation Bar (Back Chevron Button)
                          Align(
                            alignment: Alignment.centerLeft,
                            child: InkWell(
                              onTap: () {
                                if (Navigator.canPop(context)) {
                                  Navigator.pop(context);
                                }
                              },
                              borderRadius: BorderRadius.circular(20),
                              child: const Padding(
                                padding: EdgeInsets.all(4.0),
                                child: Icon(
                                  Icons.chevron_left_rounded,
                                  size: 34,
                                  color: Color(0xFF1E192B),
                                ),
                              ),
                            ),
                          ),

                          const SizedBox(height: 12),

                          // Benevo App Logo in dark rounded container matching mockup
                          const BenevoLogo(
                            size: 92,
                            borderRadius: 24,
                            showShadow: false,
                            transparentBackground: false,
                          ),

                          const SizedBox(height: 18),

                          // Header Title
                          const Text(
                            'Selamat Datang Kembali',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w800,
                              color: Color(0xFF1E192B),
                              letterSpacing: -0.4,
                            ),
                          ),

                          const SizedBox(height: 8),

                          // Subtitle
                          const Text(
                            'Masuk Kembali untuk melanjutkan jejak\nkebaikan mu di benevo!',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 12.5,
                              height: 1.45,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF6B6578),
                            ),
                          ),

                          const SizedBox(height: 24),

                          // Input: Email atau Nomor Handphone
                          CustomInputField(
                            label: 'Email atau Nomor Handphone.',
                            hintText: 'Masukkan Email...',
                            prefixIcon: Icons.mail_outline_rounded,
                            controller: _identifierController,
                            hasShadow: true,
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return 'Email atau nomor handphone tidak boleh kosong';
                              }
                              return null;
                            },
                          ),

                          const SizedBox(height: 16),

                          // Input: Kata Sandi & Lupa Kata Sandi?
                          CustomInputField(
                            label: 'Kata Sandi',
                            labelTrailing: GestureDetector(
                              onTap: _handleForgotPassword,
                              child: const Text(
                                'Lupa Kata Sandi?',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF53358D),
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                            hintText: 'Masukkan Kata Sandi...',
                            prefixIcon: Icons.lock_outline_rounded,
                            obscureText: _obscurePassword,
                            controller: _passwordController,
                            hasShadow: true,
                            suffixIcon: IconButton(
                              icon: Icon(
                                _obscurePassword
                                    ? Icons.visibility_outlined
                                    : Icons.visibility_off_outlined,
                                color: const Color(0xFF6B6578),
                                size: 22,
                              ),
                              onPressed: () {
                                setState(() {
                                  _obscurePassword = !_obscurePassword;
                                });
                              },
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Kata sandi tidak boleh kosong';
                              }
                              return null;
                            },
                          ),

                          const SizedBox(height: 16),

                          // Checkbox: Simpan Informasi akun
                          Row(
                            children: [
                              SizedBox(
                                width: 22,
                                height: 22,
                                child: Checkbox(
                                  value: _rememberMe,
                                  onChanged: (value) {
                                    setState(() {
                                      _rememberMe = value ?? false;
                                    });
                                  },
                                  activeColor: const Color(0xFF47306B),
                                  checkColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  side: const BorderSide(
                                    color: Color(0xFF615B6F),
                                    width: 1.5,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 8),
                              const Text(
                                'Simpan Informasi akun',
                                style: TextStyle(
                                  fontSize: 12.5,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFF4B5563),
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 22),

                          // Button 1: "Masuk ->"
                          Container(
                            width: double.infinity,
                            height: 52,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              boxShadow: [
                                BoxShadow(
                                  color: const Color(0xFF53358D).withValues(alpha: 0.38),
                                  blurRadius: 18,
                                  offset: const Offset(0, 8),
                                ),
                              ],
                            ),
                            child: ElevatedButton(
                              onPressed: _isLoading ? null : _handleLogin,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF53358D),
                                foregroundColor: Colors.white,
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                padding: EdgeInsets.zero,
                              ),
                              child: _isLoading
                                  ? const SizedBox(
                                      width: 22,
                                      height: 22,
                                      child: CircularProgressIndicator(
                                        strokeWidth: 2.5,
                                        color: Colors.white,
                                      ),
                                    )
                                  : const Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Masuk',
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700,
                                            letterSpacing: 0.3,
                                          ),
                                        ),
                                        SizedBox(width: 8),
                                        Icon(
                                          Icons.arrow_forward_rounded,
                                          size: 20,
                                          color: Colors.white,
                                        ),
                                      ],
                                    ),
                            ),
                          ),

                          const SizedBox(height: 14),

                          // Button 2: "Lanjutkan sebagai anonim" with Incognito Icon
                          Container(
                            width: double.infinity,
                            height: 52,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              boxShadow: [
                                BoxShadow(
                                  color: const Color(0xFF8F7EBA).withValues(alpha: 0.35),
                                  blurRadius: 18,
                                  offset: const Offset(0, 8),
                                ),
                              ],
                            ),
                            child: ElevatedButton(
                              onPressed: _handleAnonymousLogin,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF8F7EBA),
                                foregroundColor: Colors.white,
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                padding: EdgeInsets.zero,
                              ),
                              child: const FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      'Lanjutkan sebagai anonim',
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600,
                                        letterSpacing: 0.2,
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    IncognitoIcon(
                                      size: 22,
                                      color: Colors.white,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),

                          const Spacer(),

                          const SizedBox(height: 24),

                          // Divider Line Full-width
                          Container(
                            width: double.infinity,
                            height: 1,
                            color: const Color(0xFFEAEAEA),
                          ),

                          const SizedBox(height: 16),

                          // Footer: "Belum punya akun benevo? Daftar Sekarang"
                          Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  'Belum punya akun benevo? ',
                                  style: TextStyle(
                                    fontSize: 12.5,
                                    color: Color(0xFF4B5563),
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                GestureDetector(
                                  key: const ValueKey('register_link'),
                                  onTap: _navigateToRegister,
                                  child: const Text(
                                    'Daftar Sekarang',
                                    style: TextStyle(
                                      fontSize: 12.5,
                                      color: Color(0xFF53358D),
                                      fontWeight: FontWeight.w600,
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          const SizedBox(height: 16),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
