import 'package:flutter/material.dart';

enum PaymentType {
  qris,
  gopay,
  shopeepay,
  dana,
  ovo,
  bcaVA,
  mandiriVA,
  bniVA,
}

class PaymentMethodItem {
  final PaymentType type;
  final String title;
  final String subtitle;
  final String category; // 'Instan', 'E-Wallet', or 'Virtual Account'

  const PaymentMethodItem({
    required this.type,
    required this.title,
    required this.subtitle,
    required this.category,
  });

  static const List<PaymentMethodItem> availableMethods = [
    // 1. Instan
    PaymentMethodItem(
      type: PaymentType.qris,
      title: 'QRIS',
      subtitle: 'Semua e-wallet & mobile banking',
      category: 'Instan',
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
    // 3. Virtual Accounts
    PaymentMethodItem(
      type: PaymentType.bcaVA,
      title: 'BCA (Virtual Account)',
      subtitle: 'Virtual Account BCA',
      category: 'Virtual Account',
    ),
    PaymentMethodItem(
      type: PaymentType.mandiriVA,
      title: 'Mandiri (Virtual Account)',
      subtitle: 'Virtual Account Mandiri',
      category: 'Virtual Account',
    ),
    PaymentMethodItem(
      type: PaymentType.bniVA,
      title: 'BNI (Virtual Account)',
      subtitle: 'Virtual Account BNI',
      category: 'Virtual Account',
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
    this.height = 24,
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
      case PaymentType.bcaVA:
        return _buildBcaLogo();
      case PaymentType.mandiriVA:
        return _buildMandiriLogo();
      case PaymentType.bniVA:
        return _buildBniLogo();
    }
  }

  Widget _buildQrisLogo() {
    return Container(
      width: width,
      height: height,
      alignment: Alignment.centerLeft,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 14,
            height: 14,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black87, width: 2),
              borderRadius: BorderRadius.circular(2),
            ),
            child: Center(
              child: Container(
                width: 4,
                height: 4,
                color: Colors.black87,
              ),
            ),
          ),
          const SizedBox(width: 3),
          const Text(
            'QRIS',
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w900,
              fontStyle: FontStyle.italic,
              letterSpacing: 0.3,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGopayLogo() {
    return Container(
      width: width,
      height: height,
      alignment: Alignment.centerLeft,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 12,
            height: 12,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: const Color(0xFF00AED6), width: 2.5),
            ),
          ),
          const SizedBox(width: 3),
          const Text(
            'gopay',
            style: TextStyle(
              color: Color(0xFF00AED6),
              fontWeight: FontWeight.w900,
              fontSize: 10,
              letterSpacing: -0.3,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildShopeepayLogo() {
    return Container(
      width: width,
      height: height,
      alignment: Alignment.centerLeft,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
              color: const Color(0xFFEE4D2D),
              borderRadius: BorderRadius.circular(3),
            ),
            child: const Icon(
              Icons.shopping_bag_outlined,
              color: Colors.white,
              size: 10,
            ),
          ),
          const SizedBox(width: 3),
          const Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Shopee',
                style: TextStyle(
                  color: Color(0xFFEE4D2D),
                  fontWeight: FontWeight.w800,
                  fontSize: 7,
                  height: 1.0,
                ),
              ),
              Text(
                'Pay',
                style: TextStyle(
                  color: Color(0xFFEE4D2D),
                  fontWeight: FontWeight.w800,
                  fontSize: 7,
                  height: 1.0,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDanaLogo() {
    return Container(
      width: width,
      height: height,
      alignment: Alignment.centerLeft,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 11,
            height: 11,
            decoration: const BoxDecoration(
              color: Color(0xFF108EE9),
              shape: BoxShape.circle,
            ),
            child: const Center(
              child: Text(
                'D',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w900,
                  fontSize: 7,
                ),
              ),
            ),
          ),
          const SizedBox(width: 2.5),
          const Text(
            'DANA',
            style: TextStyle(
              color: Color(0xFF108EE9),
              fontWeight: FontWeight.w900,
              fontSize: 9.5,
              letterSpacing: 0.3,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOvoLogo() {
    return Container(
      width: width,
      height: height,
      alignment: Alignment.centerLeft,
      child: const Text(
        'OVO',
        style: TextStyle(
          color: Color(0xFF4C3494),
          fontWeight: FontWeight.w900,
          fontSize: 12,
          letterSpacing: 0.8,
        ),
      ),
    );
  }

  Widget _buildBcaLogo() {
    return Container(
      width: width,
      height: height,
      alignment: Alignment.centerLeft,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 10,
            height: 10,
            decoration: BoxDecoration(
              color: const Color(0xFF003D79),
              borderRadius: BorderRadius.circular(2),
            ),
            child: const Center(
              child: Icon(
                Icons.check,
                color: Colors.white,
                size: 7,
              ),
            ),
          ),
          const SizedBox(width: 3),
          const Text(
            'BCA',
            style: TextStyle(
              color: Color(0xFF003D79),
              fontWeight: FontWeight.w900,
              fontSize: 10.5,
              letterSpacing: 0.2,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMandiriLogo() {
    return Container(
      width: width,
      height: height,
      alignment: Alignment.centerLeft,
      child: const Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'mandiri',
            style: TextStyle(
              color: Color(0xFF003D79),
              fontWeight: FontWeight.w900,
              fontSize: 9,
              letterSpacing: -0.2,
            ),
          ),
          SizedBox(width: 2),
          Text(
            '~',
            style: TextStyle(
              color: Color(0xFFFFB800),
              fontWeight: FontWeight.w900,
              fontSize: 11,
              height: 0.7,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBniLogo() {
    return Container(
      width: width,
      height: height,
      alignment: Alignment.centerLeft,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 8,
            height: 8,
            decoration: const BoxDecoration(
              color: Color(0xFFF15A24),
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 3),
          const Text(
            'BNI',
            style: TextStyle(
              color: Color(0xFF005E6A),
              fontWeight: FontWeight.w900,
              fontSize: 10,
              letterSpacing: 0.4,
            ),
          ),
        ],
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
        height: 38,
        padding: const EdgeInsets.symmetric(horizontal: 14),
        decoration: const BoxDecoration(
          color: Colors.white,
          border: Border(
            bottom: BorderSide(
              color: Color(0xFFF0F0F0),
              width: 1,
            ),
          ),
        ),
        child: Row(
          children: [
            SizedBox(
              width: 52,
              child: PaymentMethodLogo(type: item.type),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Text(
                item.title,
                style: const TextStyle(
                  fontSize: 11.5,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF333333),
                ),
              ),
            ),
            if (isSelected)
              const Icon(
                Icons.check,
                color: Color(0xFF4CAF50),
                size: 18,
              ),
          ],
        ),
      ),
    );
  }
}
