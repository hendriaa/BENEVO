import 'dart:async';
import 'package:flutter/material.dart';
import '../../../../core/constants/colors.dart';
import '../widgets/payment_method_widgets.dart';
import 'donation_success_screen.dart';

class PaymentScreen extends StatefulWidget {
  final String campaignTitle;
  final int initialAmount;

  const PaymentScreen({
    super.key,
    required this.campaignTitle,
    required this.initialAmount,
  });

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  late int _amount;
  bool _isAnonymous = false;
  bool _useCelenganBonus = false;
  PaymentType _selectedPayment = PaymentType.qris;
  bool _isMethodsExpanded = true;

  @override
  void initState() {
    super.initState();
    _amount = widget.initialAmount;
  }

  String _formatNumber(int val) {
    return val.toString().replaceAllMapped(
          RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
          (Match m) => '${m[1]}.',
        );
  }

  String _formatCurrency(int val) {
    return 'Rp${_formatNumber(val)}';
  }

  void _processPayment() {
    final totalAmount = _useCelenganBonus
        ? (_amount - 25000).clamp(1000, 999999999)
        : _amount;

    final selectedItem = PaymentMethodItem.availableMethods.firstWhere(
      (m) => m.type == _selectedPayment,
    );

    if (_selectedPayment == PaymentType.qris) {
      _showQrisModal(selectedItem, totalAmount);
    } else if (selectedItem.category == 'Virtual Account') {
      _showVirtualAccountModal(selectedItem, totalAmount);
    } else {
      _showEwalletModal(selectedItem, totalAmount);
    }
  }

  void _navigateToSuccess(String methodTitle, int finalAmount) {
    final txId =
        'BNV-${DateTime.now().millisecondsSinceEpoch.toString().substring(5)}';
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (_) => DonationSuccessScreen(
          campaignTitle: widget.campaignTitle,
          amount: finalAmount,
          paymentMethod: methodTitle,
          isAnonymous: _isAnonymous,
          transactionId: txId,
        ),
      ),
    );
  }

  void _showQrisModal(PaymentMethodItem item, int payAmount) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (ctx) => _QrisPaymentModal(
        amount: payAmount,
        campaignTitle: widget.campaignTitle,
        onPaid: () {
          Navigator.of(ctx).pop();
          _navigateToSuccess('QRIS Instan', payAmount);
        },
      ),
    );
  }

  void _showEwalletModal(PaymentMethodItem item, int payAmount) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (ctx) => Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        ),
        padding: const EdgeInsets.all(22),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 44,
              height: 4,
              decoration: BoxDecoration(
                color: const Color(0xFFDDD6E8),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            const SizedBox(height: 18),
            PaymentMethodLogo(type: item.type, width: 64, height: 38),
            const SizedBox(height: 14),
            Text(
              'Pembayaran dengan ${item.title}',
              style: const TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w800,
                color: Color(0xFF503287),
              ),
            ),
            const SizedBox(height: 6),
            Text(
              'Total yang harus dibayar: ${_formatCurrency(payAmount)}',
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Color(0xFF503287),
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Kamu akan diarahkan ke aplikasi untuk menyelesaikan pembayaran secara instan.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 12.5,
                color: AppColors.textSecondary,
              ),
            ),
            const SizedBox(height: 22),
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(ctx).pop();
                  _navigateToSuccess(item.title, payAmount);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF503287),
                  foregroundColor: Colors.white,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                child: Text(
                  'Buka Aplikasi ${item.title}',
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }

  void _showVirtualAccountModal(PaymentMethodItem item, int payAmount) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (ctx) => Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        ),
        padding: const EdgeInsets.all(22),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 44,
              height: 4,
              decoration: BoxDecoration(
                color: const Color(0xFFDDD6E8),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            const SizedBox(height: 18),
            PaymentMethodLogo(type: item.type, width: 64, height: 38),
            const SizedBox(height: 14),
            Text(
              item.title,
              style: const TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w800,
                color: Color(0xFF503287),
              ),
            ),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: const Color(0xFFF5F5F5),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    '8277 0812 3456 7890',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 1.0,
                      color: Color(0xFF333333),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text('Nomor VA berhasil disalin!')),
                      );
                    },
                    child: const Text(
                      'Salin',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF503287),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            Text(
              'Total Pembayaran: ${_formatCurrency(payAmount)}',
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Color(0xFF503287),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(ctx).pop();
                  _navigateToSuccess(item.title, payAmount);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF503287),
                  foregroundColor: Colors.white,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  'Saya Sudah Bayar',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final totalAmount = _useCelenganBonus
        ? (_amount - 25000).clamp(1000, 999999999)
        : _amount;

    final qrisMethod = PaymentMethodItem.availableMethods
        .firstWhere((m) => m.type == PaymentType.qris);
    final ewalletMethods = PaymentMethodItem.availableMethods
        .where((m) => m.category == 'E-Wallet')
        .toList();
    final vaMethods = PaymentMethodItem.availableMethods
        .where((m) => m.category == 'Virtual Account')
        .toList();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFF503287),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          widget.campaignTitle,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 1. Nominal Donasi Section
              const Text(
                'Nominal Donasi',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF333333),
                ),
              ),
              const SizedBox(height: 6),

              // Nominal Box
              Container(
                height: 38,
                padding: const EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  color: const Color(0xFFF2F2F2),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'RP',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF333333),
                      ),
                    ),
                    Text(
                      _formatNumber(_amount),
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF333333),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),

              // Gray divider bar
              Container(
                height: 5,
                decoration: BoxDecoration(
                  color: const Color(0xFFD6D6D6),
                  borderRadius: BorderRadius.circular(2.5),
                ),
              ),
              const SizedBox(height: 12),

              // Toggle Sembunyikan Nama Saya (Donasi Anonim)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'sembunyikan nama saya (donasi anonim)',
                    style: TextStyle(
                      fontSize: 12,
                      color: Color(0xFF4A4A4A),
                    ),
                  ),
                  Transform.scale(
                    scale: 0.75,
                    child: Switch(
                      value: _isAnonymous,
                      onChanged: (val) => setState(() => _isAnonymous = val),
                      activeColor: const Color(0xFF503287),
                      activeTrackColor:
                          const Color(0xFF503287).withOpacity(0.4),
                      inactiveThumbColor: Colors.white,
                      inactiveTrackColor: const Color(0xFFD6D6D6),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),

              // 2. Pilih Metode Pembayaran Section Box
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: const Color(0xFFE5E5E5),
                    width: 1,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Dropdown Header
                    InkWell(
                      onTap: () {
                        setState(() {
                          _isMethodsExpanded = !_isMethodsExpanded;
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 10,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Pilih Metode Pembayaran',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF555555),
                              ),
                            ),
                            Icon(
                              _isMethodsExpanded
                                  ? Icons.keyboard_arrow_up_rounded
                                  : Icons.keyboard_arrow_down_rounded,
                              color: const Color(0xFF503287),
                              size: 20,
                            ),
                          ],
                        ),
                      ),
                    ),

                    if (_isMethodsExpanded) ...[
                      // Category 1: Pembayaran Instan
                      Container(
                        width: double.infinity,
                        color: const Color(0xFFDCDCDC),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 6,
                        ),
                        child: const Text(
                          'Pembayaran Instan (verifikasi otomatis, minimal nominal donasi RP1.000)',
                          style: TextStyle(
                            fontSize: 9.5,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF222222),
                          ),
                        ),
                      ),
                      PaymentMethodTile(
                        item: qrisMethod,
                        isSelected: _selectedPayment == PaymentType.qris,
                        onTap: () => setState(
                            () => _selectedPayment = PaymentType.qris),
                      ),

                      // Category 2: Pembayaran E-wallet
                      Container(
                        width: double.infinity,
                        color: const Color(0xFFDCDCDC),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 6,
                        ),
                        child: const Text(
                          'Pembayaran E-wallet (verifikasi otomatis, minimal nominal donasi RP1.000)',
                          style: TextStyle(
                            fontSize: 9.5,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF222222),
                          ),
                        ),
                      ),
                      ...ewalletMethods.map((method) {
                        return PaymentMethodTile(
                          item: method,
                          isSelected: _selectedPayment == method.type,
                          onTap: () => setState(
                              () => _selectedPayment = method.type),
                        );
                      }),

                      // Category 3: Pembayaran Virtual Account
                      Container(
                        width: double.infinity,
                        color: const Color(0xFFDCDCDC),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 6,
                        ),
                        child: const Text(
                          'Pembayaran Virtual Account (verifikasi otomatis, minimal nominal donasi RP10.000)',
                          style: TextStyle(
                            fontSize: 9.5,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF222222),
                          ),
                        ),
                      ),
                      ...vaMethods.map((method) {
                        return PaymentMethodTile(
                          item: method,
                          isSelected: _selectedPayment == method.type,
                          onTap: () =>
                              setState(() => _selectedPayment = method.type),
                        );
                      }),
                    ],
                  ],
                ),
              ),

              const SizedBox(height: 14),

              // Bonus Tambahan dari Celengan! Row
              Row(
                children: [
                  const Text(
                    'Bonus Tambahan dari Celengan!',
                    style: TextStyle(
                      fontSize: 11.5,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF222222),
                    ),
                  ),
                  const SizedBox(width: 4),
                  Container(
                    width: 14,
                    height: 14,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: const Color(0xFFFFD54F),
                      border: Border.all(
                          color: const Color(0xFFE5B800), width: 0.8),
                    ),
                    child: const Center(
                      child: Text(
                        'Rp',
                        style: TextStyle(
                          fontSize: 6.5,
                          fontWeight: FontWeight.w900,
                          color: Color(0xFFB78103),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 4),
                  const Text(
                    '-Rp 25.000',
                    style: TextStyle(
                      fontSize: 11.5,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFFD4A017),
                    ),
                  ),
                  const Spacer(),
                  Transform.scale(
                    scale: 0.75,
                    child: Switch(
                      value: _useCelenganBonus,
                      activeColor: const Color(0xFF503287),
                      activeTrackColor:
                          const Color(0xFF503287).withOpacity(0.4),
                      inactiveThumbColor: Colors.white,
                      inactiveTrackColor: const Color(0xFFD6D6D6),
                      onChanged: (val) {
                        setState(() {
                          _useCelenganBonus = val;
                        });
                      },
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 24),
            ],
          ),
        ),
      ),

      // 3. Bottom Bar: Total Pembayaran & "Lanjut Pembayaran"
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: const BoxDecoration(
          color: Colors.white,
          border: Border(
            top: BorderSide(
              color: Color(0xFFEEEEEE),
              width: 1,
            ),
          ),
        ),
        child: SafeArea(
          child: Row(
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Total Pembayaran',
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF333333),
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    'Rp${_formatNumber(totalAmount)}',
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w800,
                      color: Color(0xFF503287),
                    ),
                  ),
                ],
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: _processPayment,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF503287),
                  foregroundColor: Colors.white,
                  elevation: 0,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 22,
                    vertical: 12,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  'Lanjut Pembayaran',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Interactive QRIS Modal Dialog
class _QrisPaymentModal extends StatefulWidget {
  final int amount;
  final String campaignTitle;
  final VoidCallback onPaid;

  const _QrisPaymentModal({
    required this.amount,
    required this.campaignTitle,
    required this.onPaid,
  });

  @override
  State<_QrisPaymentModal> createState() => _QrisPaymentModalState();
}

class _QrisPaymentModalState extends State<_QrisPaymentModal> {
  int _secondsRemaining = 900; // 15 mins
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 1), (t) {
      if (_secondsRemaining > 0) {
        setState(() => _secondsRemaining--);
      } else {
        _timer?.cancel();
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  String _formatTimer(int totalSec) {
    final m = (totalSec ~/ 60).toString().padLeft(2, '0');
    final s = (totalSec % 60).toString().padLeft(2, '0');
    return '$m:$s';
  }

  String _formatCurrency(int val) {
    return 'Rp${val.toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]}.')}';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      padding: const EdgeInsets.all(22),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 44,
            height: 4,
            decoration: BoxDecoration(
              color: const Color(0xFFDDD6E8),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          const SizedBox(height: 16),

          // Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const PaymentMethodLogo(type: PaymentType.qris, width: 56, height: 32),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: const Color(0xFFFEF2F2),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: const Color(0xFFFECACA)),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.timer_outlined, size: 14, color: Color(0xFFDC2626)),
                    const SizedBox(width: 4),
                    Text(
                      _formatTimer(_secondsRemaining),
                      style: const TextStyle(
                        color: Color(0xFFDC2626),
                        fontWeight: FontWeight.w700,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),
          Text(
            _formatCurrency(widget.amount),
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w900,
              color: AppColors.primaryDark,
            ),
          ),
          const SizedBox(height: 2),
          const Text(
            'NMID: ID1020038918291 • BENEVO PEDULI',
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w500,
              color: Color(0xFF8C7F9E),
            ),
          ),
          const SizedBox(height: 16),

          // QR Code Container
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: const Color(0xFFE5E7EB), width: 1.5),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.05),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: CustomPaint(
              size: const Size(180, 180),
              painter: _MockQrCodePainter(),
            ),
          ),

          const SizedBox(height: 12),
          const Text(
            'Pindai QR ini melalui aplikasi e-wallet (GoPay, ShopeePay, DANA, OVO) atau mobile banking apa pun.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 11.5,
              color: AppColors.textSecondary,
              height: 1.3,
            ),
          ),

          const SizedBox(height: 20),

          // Actions
          SizedBox(
            width: double.infinity,
            height: 48,
            child: ElevatedButton(
              onPressed: widget.onPaid,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: Colors.white,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
              child: const Text(
                'Saya Sudah Bayar',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Stylized Mock QR Code Painter
class _MockQrCodePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black87
      ..style = PaintingStyle.fill;

    final w = size.width;
    final h = size.height;

    // 3 Big Corner Markers
    _drawMarker(canvas, const Offset(0, 0), w * 0.28, paint);
    _drawMarker(canvas, Offset(w * 0.72, 0), w * 0.28, paint);
    _drawMarker(canvas, Offset(0, h * 0.72), w * 0.28, paint);

    // Decorative Data Blocks
    final randBlocks = [
      Rect.fromLTWH(w * 0.35, h * 0.08, w * 0.12, h * 0.12),
      Rect.fromLTWH(w * 0.52, h * 0.08, w * 0.12, h * 0.06),
      Rect.fromLTWH(w * 0.35, h * 0.24, w * 0.08, h * 0.18),
      Rect.fromLTWH(w * 0.48, h * 0.22, w * 0.16, h * 0.08),
      Rect.fromLTWH(w * 0.68, h * 0.35, w * 0.24, h * 0.08),
      Rect.fromLTWH(w * 0.08, h * 0.36, w * 0.18, h * 0.10),
      Rect.fromLTWH(w * 0.32, h * 0.46, w * 0.12, h * 0.12),
      Rect.fromLTWH(w * 0.50, h * 0.44, w * 0.18, h * 0.18),
      Rect.fromLTWH(w * 0.74, h * 0.48, w * 0.16, h * 0.12),
      Rect.fromLTWH(w * 0.36, h * 0.66, w * 0.14, h * 0.10),
      Rect.fromLTWH(w * 0.56, h * 0.68, w * 0.12, h * 0.18),
      Rect.fromLTWH(w * 0.74, h * 0.66, w * 0.18, h * 0.12),
      Rect.fromLTWH(w * 0.36, h * 0.82, w * 0.16, h * 0.10),
    ];

    for (final rect in randBlocks) {
      canvas.drawRRect(
        RRect.fromRectAndRadius(rect, const Radius.circular(3)),
        paint,
      );
    }
  }

  void _drawMarker(Canvas canvas, Offset offset, double size, Paint paint) {
    // Outer square
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(offset.dx, offset.dy, size, size),
        const Radius.circular(6),
      ),
      paint,
    );
    // Inner white
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(
          offset.dx + size * 0.18,
          offset.dy + size * 0.18,
          size * 0.64,
          size * 0.64,
        ),
        const Radius.circular(4),
      ),
      Paint()..color = Colors.white,
    );
    // Center black dot
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(
          offset.dx + size * 0.36,
          offset.dy + size * 0.36,
          size * 0.28,
          size * 0.28,
        ),
        const Radius.circular(2),
      ),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
