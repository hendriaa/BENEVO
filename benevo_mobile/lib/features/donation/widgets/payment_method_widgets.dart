import 'package:flutter/material.dart';
import '../../../../core/constants/colors.dart';

enum PaymentType {
  qris,
  gopay,
  shopeepay,
  dana,
  ovo,
}

class PaymentMethodItem {
  final PaymentType type;
  final String title;
  final String subtitle;
  final String category; // 'QRIS' or 'E-Wallet'

  const PaymentMethodItem({
    required this.type,
    required this.title,
    required this.subtitle,
    required this.category,
  });

  static const List<PaymentMethodItem> availableMethods = [
    // 1. QRIS (Instant verification)
    PaymentMethodItem(
      type: PaymentType.qris,
      title: 'QRIS',
      subtitle: 'Semua e-wallet & mobile banking',
      category: 'QRIS',
    ),
    // 2. E-Wallets
    PaymentMethodItem(
      type: PaymentType.gopay,
      title: 'GoPay',
      subtitle: 'Saldo GoPay & GoPay Coins',
      category: 'E-Wallet',
    ),
    PaymentMethodItem(
      type: PaymentType.shopeepay,
      title: 'ShopeePay',
      subtitle: 'Saldo ShopeePay',
      category: 'E-Wallet',
    ),
    PaymentMethodItem(
      type: PaymentType.dana,
      title: 'DANA',
      subtitle: 'Saldo DANA Cash',
      category: 'E-Wallet',
    ),
    PaymentMethodItem(
      type: PaymentType.ovo,
      title: 'OVO',
      subtitle: 'Saldo OVO Cash & Points',
      category: 'E-Wallet',
    ),
  ];
}

class PaymentMethodLogo extends StatelessWidget {
  final PaymentType type;
  final double width;
  final double height;

  const PaymentMethodLogo({
    super.key,
    required this.type,
    this.width = 44,
    this.height = 28,
  });

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case PaymentType.qris:
        return _buildQrisLogo();
      case PaymentType.gopay:
        return _buildGopayLogo();
      case PaymentType.shopeepay:
        return _buildShopeepayLogo();
      case PaymentType.dana:
        return _buildDanaLogo();
      case PaymentType.ovo:
        return _buildOvoLogo();
    }
  }

  Widget _buildQrisLogo() {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: const Color(0xFFE5E7EB), width: 1),
      ),
      child: Center(
        child: RichText(
          text: const TextSpan(
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w900,
              fontStyle: FontStyle.italic,
              letterSpacing: 0.5,
              color: Colors.black87,
            ),
            children: [
              TextSpan(text: 'QR'),
              TextSpan(
                text: 'IS',
                style: TextStyle(color: Color(0xFFE11D48)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildGopayLogo() {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: const Color(0xFF00AED6),
        borderRadius: BorderRadius.circular(6),
      ),
      child: const Center(
        child: Text(
          'gopay',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w900,
            fontSize: 10,
            letterSpacing: -0.3,
          ),
        ),
      ),
    );
  }

  Widget _buildShopeepayLogo() {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: const Color(0xFFEE4D2D),
        borderRadius: BorderRadius.circular(6),
      ),
      child: const Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 2),
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.shopping_bag_outlined, color: Colors.white, size: 12),
                SizedBox(width: 2),
                Text(
                  'SPay',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                    fontSize: 9.5,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDanaLogo() {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: const Color(0xFF108EE9),
        borderRadius: BorderRadius.circular(6),
      ),
      child: const Center(
        child: Text(
          'DANA',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w900,
            fontSize: 10,
            letterSpacing: 0.5,
          ),
        ),
      ),
    );
  }

  Widget _buildOvoLogo() {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: const Color(0xFF4C3494),
        borderRadius: BorderRadius.circular(6),
      ),
      child: const Center(
        child: Text(
          'OVO',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w900,
            fontSize: 10.5,
            letterSpacing: 0.8,
          ),
        ),
      ),
    );
  }
}

class PaymentMethodTile extends StatelessWidget {
  final PaymentMethodItem item;
  final bool isSelected;
  final VoidCallback onTap;

  const PaymentMethodTile({
    super.key,
    required this.item,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 13),
        decoration: BoxDecoration(
          color: isSelected
              ? const Color(0xFFF9F5FF)
              : Colors.white,
          border: Border(
            bottom: BorderSide(
              color: Colors.grey.withValues(alpha: 0.15),
              width: 1,
            ),
          ),
        ),
        child: Row(
          children: [
            PaymentMethodLogo(type: item.type),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.title,
                    style: const TextStyle(
                      fontSize: 13.5,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 1),
                  Text(
                    item.subtitle,
                    style: const TextStyle(
                      fontSize: 11,
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
            ),
            if (isSelected)
              const Icon(
                Icons.check_circle_rounded,
                color: Color(0xFF10B981),
                size: 22,
              )
            else
              Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: const Color(0xFFD1D5DB),
                    width: 1.5,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
