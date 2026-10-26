import 'package:flutter/material.dart';

/// Representation of each payout method with its official-styled logo
class PayoutMethodItem {
  final String name;

  const PayoutMethodItem({required this.name});

  static const List<String> methodNames = [
    'QRIS',
    'GoPay',
    'ShopeePay',
    'DANA',
    'OVO',
    'BCA (VA)',
    'Mandiri (VA)',
    'BNI (VA)',
  ];
}

/// Helper widget to render the official logo of each payment method
/// exactly matching media_1793034090387_f0a70fb3.png
class PayoutMethodLogo extends StatelessWidget {
  final String method;

  const PayoutMethodLogo({super.key, required this.method});

  @override
  Widget build(BuildContext context) {
    if (method == 'QRIS') {
      return _buildQrisLogo();
    } else if (method == 'GoPay') {
      return _buildGopayLogo();
    } else if (method == 'ShopeePay') {
      return _buildShopeePayLogo();
    } else if (method == 'DANA') {
      return _buildDanaLogo();
    } else if (method == 'OVO') {
      return _buildOvoLogo();
    } else if (method.contains('BCA')) {
      return _buildBcaLogo();
    } else if (method.contains('Mandiri')) {
      return _buildMandiriLogo();
    } else if (method.contains('BNI')) {
      return _buildBniLogo();
    }
    return const Icon(Icons.account_balance_wallet_rounded, size: 20);
  }

  Widget _buildQrisLogo() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: Colors.black87, width: 1.2),
      ),
      child: const Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Q',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w900,
              fontSize: 11,
              fontStyle: FontStyle.italic,
            ),
          ),
          Text(
            'RIS',
            style: TextStyle(
              color: Color(0xFFC41230),
              fontWeight: FontWeight.w900,
              fontSize: 11,
              fontStyle: FontStyle.italic,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGopayLogo() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 15,
          height: 15,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: const Color(0xFF00AED6), width: 3.5),
          ),
        ),
        const SizedBox(width: 4),
        const Text(
          'gopay',
          style: TextStyle(
            color: Color(0xFF001E28),
            fontWeight: FontWeight.w900,
            fontSize: 12.5,
            letterSpacing: -0.5,
          ),
        ),
      ],
    );
  }

  Widget _buildShopeePayLogo() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 22,
          height: 22,
          decoration: BoxDecoration(
            color: const Color(0xFFEE4D2D),
            borderRadius: BorderRadius.circular(5),
          ),
          alignment: Alignment.center,
          child: const Icon(
            Icons.shopping_bag_rounded,
            color: Colors.white,
            size: 14,
          ),
        ),
        const SizedBox(width: 5),
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Shopee',
              style: TextStyle(
                color: Color(0xFFEE4D2D),
                fontWeight: FontWeight.w800,
                fontSize: 9.5,
                height: 1.0,
              ),
            ),
            Text(
              'Pay',
              style: TextStyle(
                color: Color(0xFFEE4D2D),
                fontWeight: FontWeight.w800,
                fontSize: 9.5,
                height: 1.0,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildDanaLogo() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 16,
          height: 16,
          decoration: const BoxDecoration(
            color: Color(0xFF118EEA),
            shape: BoxShape.circle,
          ),
          alignment: Alignment.center,
          child: const Text(
            'D',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w900,
              fontSize: 9.5,
            ),
          ),
        ),
        const SizedBox(width: 5),
        const Text(
          'DANA',
          style: TextStyle(
            color: Color(0xFF118EEA),
            fontWeight: FontWeight.w900,
            fontSize: 12,
            letterSpacing: 0.5,
          ),
        ),
      ],
    );
  }

  Widget _buildOvoLogo() {
    return const Text(
      'OVO',
      style: TextStyle(
        color: Color(0xFF4C2A86),
        fontWeight: FontWeight.w900,
        fontSize: 14,
        letterSpacing: 1.0,
      ),
    );
  }

  Widget _buildBcaLogo() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 15,
          height: 15,
          decoration: BoxDecoration(
            color: const Color(0xFF00569B),
            borderRadius: BorderRadius.circular(3),
          ),
          alignment: Alignment.center,
          child: const Icon(
            Icons.account_balance_rounded,
            color: Colors.white,
            size: 10,
          ),
        ),
        const SizedBox(width: 5),
        const Text(
          'BCA',
          style: TextStyle(
            color: Color(0xFF00569B),
            fontWeight: FontWeight.w900,
            fontSize: 12.5,
            fontStyle: FontStyle.italic,
          ),
        ),
      ],
    );
  }

  Widget _buildMandiriLogo() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(width: 8),
            Container(
              width: 16,
              height: 3,
              decoration: BoxDecoration(
                color: const Color(0xFFF9B800),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ],
        ),
        const Text(
          'mandırı',
          style: TextStyle(
            color: Color(0xFF002D62),
            fontWeight: FontWeight.w900,
            fontSize: 11.5,
            letterSpacing: -0.2,
          ),
        ),
      ],
    );
  }

  Widget _buildBniLogo() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 14,
          height: 14,
          decoration: BoxDecoration(
            color: const Color(0xFFF15A24),
            borderRadius: BorderRadius.circular(3),
          ),
          alignment: Alignment.center,
          child: const Text(
            '46',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w900,
              fontSize: 7.5,
            ),
          ),
        ),
        const SizedBox(width: 5),
        const Text(
          'BNI',
          style: TextStyle(
            color: Color(0xFF005E6A),
            fontWeight: FontWeight.w900,
            fontSize: 12.5,
          ),
        ),
      ],
    );
  }
}

/// Interactive Dropdown matching media_1793034090387_f0a70fb3.png
class PayoutMethodDropdown extends StatefulWidget {
  final String? selectedMethod;
  final ValueChanged<String> onChanged;

  const PayoutMethodDropdown({
    super.key,
    required this.selectedMethod,
    required this.onChanged,
  });

  @override
  State<PayoutMethodDropdown> createState() => _PayoutMethodDropdownState();
}

class _PayoutMethodDropdownState extends State<PayoutMethodDropdown> {
  bool _isOpen = false;

  @override
  Widget build(BuildContext context) {
    final hasSelection = widget.selectedMethod != null &&
        widget.selectedMethod!.isNotEmpty &&
        widget.selectedMethod != 'Pilih Metode';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Label: "Bank / e-wallet"
        const Text(
          'Bank / e-wallet',
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: Color(0xFF756C8A),
          ),
        ),
        const SizedBox(height: 6),

        // Main dropdown selector box
        GestureDetector(
          onTap: () {
            setState(() {
              _isOpen = !_isOpen;
            });
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: _isOpen
                  ? const BorderRadius.vertical(top: Radius.circular(10))
                  : BorderRadius.circular(10),
              border: Border.all(
                color: _isOpen
                    ? const Color(0xFF5B33A7)
                    : const Color(0xFFD6CDDC),
                width: 1.2,
              ),
            ),
            child: Row(
              children: [
                if (hasSelection) ...[
                  SizedBox(
                    width: 70,
                    child: PayoutMethodLogo(method: widget.selectedMethod!),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      widget.selectedMethod!,
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF261943),
                      ),
                    ),
                  ),
                ] else ...[
                  const Expanded(
                    child: Text(
                      'Pilih Metode',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF5B33A7),
                      ),
                    ),
                  ),
                ],
                Icon(
                  _isOpen
                      ? Icons.arrow_drop_up_rounded
                      : Icons.arrow_drop_down_rounded,
                  color: const Color(0xFF5B33A7),
                  size: 24,
                ),
              ],
            ),
          ),
        ),

        // Dropdown List Items (exactly matching media_1793034090387_f0a70fb3.png)
        if (_isOpen)
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius:
                  const BorderRadius.vertical(bottom: Radius.circular(10)),
              border: Border.all(
                color: const Color(0xFFD6CDDC),
                width: 1.2,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.08),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              children: List.generate(PayoutMethodItem.methodNames.length, (index) {
                final method = PayoutMethodItem.methodNames[index];
                final isSelected = widget.selectedMethod == method;

                return Column(
                  children: [
                    InkWell(
                      onTap: () {
                        widget.onChanged(method);
                        setState(() {
                          _isOpen = false;
                        });
                      },
                      child: Container(
                        color: isSelected
                            ? const Color(0xFF5B33A7).withValues(alpha: 0.06)
                            : Colors.white,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 12),
                        child: Row(
                          children: [
                            // Logo Box
                            SizedBox(
                              width: 72,
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: PayoutMethodLogo(method: method),
                              ),
                            ),
                            const SizedBox(width: 14),

                            // Method Name
                            Expanded(
                              child: Text(
                                method,
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: isSelected
                                      ? FontWeight.w800
                                      : FontWeight.w600,
                                  color: const Color(0xFF261943),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    if (index < PayoutMethodItem.methodNames.length - 1)
                      const Divider(
                        height: 1,
                        thickness: 1,
                        color: Color(0xFFEDE7F2),
                      ),
                  ],
                );
              }),
            ),
          ),
      ],
    );
  }
}
