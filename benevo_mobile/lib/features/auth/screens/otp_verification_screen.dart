import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../core/constants/colors.dart';
import '../widgets/benevo_logo.dart';
import 'reset_password_screen.dart';

class OtpVerificationScreen extends StatefulWidget {
  final String destination;

  const OtpVerificationScreen({
    super.key,
    this.destination = '',
  });

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  static const int _otpLength = 6;
  final List<TextEditingController> _controllers =
      List.generate(_otpLength, (_) => TextEditingController());
  final List<FocusNode> _focusNodes =
      List.generate(_otpLength, (_) => FocusNode());

  bool _isLoading = false;

  @override
  void dispose() {
    for (final controller in _controllers) {
      controller.dispose();
    }
    for (final node in _focusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  String get _enteredOtp =>
      _controllers.map((controller) => controller.text).join();

  void _onOtpChanged(int index, String value) {
    if (value.length > 1) {
      // Handle paste of multiple characters
      final cleanDigits =
          value.replaceAll(RegExp(r'\D'), '').substring(0, _otpLength.clamp(0, value.length));
      for (int i = 0; i < cleanDigits.length && i < _otpLength; i++) {
        _controllers[i].text = cleanDigits[i];
      }
      final nextIndex = (cleanDigits.length < _otpLength) ? cleanDigits.length : _otpLength - 1;
      _focusNodes[nextIndex].requestFocus();
      setState(() {});
      return;
    }

    if (value.isNotEmpty) {
      if (index < _otpLength - 1) {
        _focusNodes[index + 1].requestFocus();
      } else {
        _focusNodes[index].unfocus();
      }
    }
    setState(() {});
  }

  void _onKeyDown(int index, KeyEvent event) {
    if (event is KeyDownEvent &&
        event.logicalKey == LogicalKeyboardKey.backspace) {
      if (_controllers[index].text.isEmpty && index > 0) {
        _controllers[index - 1].clear();
        _focusNodes[index - 1].requestFocus();
        setState(() {});
      }
    }
  }

  void _handleVerifyOtp() {
    final otp = _enteredOtp;
    if (otp.length < _otpLength) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Silakan masukkan 6 digit kode OTP secara lengkap'),
          backgroundColor: Colors.redAccent,
        ),
      );
      return;
    }

    setState(() {
      _isLoading = true;
    });

    Future.delayed(const Duration(milliseconds: 1200), () {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Verifikasi OTP berhasil!'),
            backgroundColor: AppColors.primary,
          ),
        );

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const ResetPasswordScreen(),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 12),

                // Top navigation bar with Back Button
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
                      padding: EdgeInsets.all(6.0),
                      child: Icon(
                        Icons.chevron_left_rounded,
                        size: 32,
                        color: AppColors.textPrimary,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                // Benevo App Logo
                const BenevoLogo(size: 96),

                const SizedBox(height: 24),

                // Header Title
                const Text(
                  'Lupa Password?',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w800,
                    color: AppColors.textPrimary,
                    letterSpacing: -0.5,
                  ),
                ),

                const SizedBox(height: 36),

                // 6 OTP Input Boxes
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(_otpLength, (index) {
                    final isFilled = _controllers[index].text.isNotEmpty;
                    return Expanded(
                      child: Container(
                        height: 62,
                        margin: EdgeInsets.only(
                          right: index < _otpLength - 1 ? 8 : 0,
                        ),
                        decoration: BoxDecoration(
                          color: isFilled
                              ? Colors.white
                              : const Color(0xFFE2E0E8),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: _focusNodes[index].hasFocus
                                ? AppColors.primary
                                : (isFilled
                                    ? AppColors.inputBorder
                                    : Colors.transparent),
                            width: 1.6,
                          ),
                          boxShadow: [
                            if (_focusNodes[index].hasFocus || isFilled)
                              BoxShadow(
                                color: AppColors.primary.withValues(alpha: 0.12),
                                blurRadius: 10,
                                offset: const Offset(0, 4),
                              ),
                          ],
                        ),
                        child: KeyboardListener(
                          focusNode: FocusNode(),
                          onKeyEvent: (event) => _onKeyDown(index, event),
                          child: TextFormField(
                            controller: _controllers[index],
                            focusNode: _focusNodes[index],
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            maxLength: 1,
                            style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w700,
                              color: AppColors.textPrimary,
                            ),
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                            decoration: const InputDecoration(
                              counterText: '',
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.zero,
                            ),
                            onChanged: (val) => _onOtpChanged(index, val),
                          ),
                        ),
                      ),
                    );
                  }),
                ),

                const SizedBox(height: 36),

                // "Kirim Kode OTP" Button
                Container(
                  width: double.infinity,
                  height: 52,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.primary.withValues(alpha: 0.45),
                        blurRadius: 18,
                        offset: const Offset(0, 8),
                      ),
                    ],
                  ),
                  child: ElevatedButton(
                    onPressed: _isLoading ? null : _handleVerifyOtp,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
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
                        : const Text(
                            'Kirim Kode OTP',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 0.3,
                            ),
                          ),
                  ),
                ),

                const SizedBox(height: 32),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
