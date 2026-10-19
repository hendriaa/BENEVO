import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../../core/constants/colors.dart';

class NominalSelectionBottomSheet extends StatefulWidget {
  final int initialAmount;
  final ValueChanged<int> onProceed;

  const NominalSelectionBottomSheet({
    super.key,
    this.initialAmount = 50000,
    required this.onProceed,
  });

  static Future<int?> show(
    BuildContext context, {
    int initialAmount = 50000,
  }) {
    return showModalBottomSheet<int>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => NominalSelectionBottomSheet(
        initialAmount: initialAmount,
        onProceed: (amount) {
          Navigator.of(context).pop(amount);
        },
      ),
    );
  }

  @override
  State<NominalSelectionBottomSheet> createState() =>
      _NominalSelectionBottomSheetState();
}

class _NominalSelectionBottomSheetState
    extends State<NominalSelectionBottomSheet> {
  late int _selectedAmount;
  final TextEditingController _customController = TextEditingController();
  bool _isCustom = false;

  final List<Map<String, dynamic>> _presets = [
    {
      'amount': 50000,
      'label': 'Rp50.000',
      'icon': null,
    },
    {
      'amount': 100000,
      'label': 'Rp100.000',
      'icon': Icons.inventory_2_outlined, // Paket Sembako
    },
    {
      'amount': 150000,
      'label': 'Rp150.000',
      'icon': Icons.cottage_outlined, // Tempat Tinggal / Tenda
    },
    {
      'amount': 200000,
      'label': 'Rp200.000',
      'icon': Icons.airport_shuttle_outlined, // Medis / Ambulans
    },
  ];

  @override
  void initState() {
    super.initState();
    _selectedAmount = widget.initialAmount;
    final isPreset = _presets.any((p) => p['amount'] == widget.initialAmount);
    if (!isPreset && widget.initialAmount > 0) {
      _isCustom = true;
      _customController.text = _formatNumber(widget.initialAmount);
    }
  }

  @override
  void dispose() {
    _customController.dispose();
    super.dispose();
  }

  String _formatNumber(int number) {
    return number.toString().replaceAllMapped(
          RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
          (Match m) => '${m[1]}.',
        );
  }

  void _selectPreset(int amount) {
    setState(() {
      _selectedAmount = amount;
      _isCustom = false;
      _customController.clear();
    });
  }

  void _onCustomChanged(String value) {
    final clean = value.replaceAll('.', '').trim();
    final parsed = int.tryParse(clean) ?? 0;
    setState(() {
      _selectedAmount = parsed;
      _isCustom = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;

    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
      ),
      padding: EdgeInsets.only(
        left: 20,
        right: 20,
        top: 14,
        bottom: 24 + bottomInset,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Top Notch Handle
          Center(
            child: Container(
              width: 44,
              height: 4.5,
              decoration: BoxDecoration(
                color: const Color(0xFFD1CBD9),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          const SizedBox(height: 18),

          // Presets List
          ..._presets.map((preset) {
            final int amount = preset['amount'] as int;
            final String label = preset['label'] as String;
            final IconData? icon = preset['icon'] as IconData?;
            final bool isSelected = !_isCustom && _selectedAmount == amount;

            return Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: InkWell(
                onTap: () => _selectPreset(amount),
                borderRadius: BorderRadius.circular(14),
                child: Container(
                  height: 52,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    color: isSelected
                        ? const Color(0xFFF3ECFC)
                        : Colors.white,
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(
                      color: isSelected
                          ? AppColors.primary
                          : const Color(0xFFE5DFEC),
                      width: isSelected ? 1.6 : 1.0,
                    ),
                  ),
                  child: Row(
                    children: [
                      if (icon != null) ...[
                        Icon(
                          icon,
                          color: isSelected
                              ? AppColors.primary
                              : const Color(0xFF7A659B),
                          size: 22,
                        ),
                        const SizedBox(width: 12),
                      ],
                      Expanded(
                        child: Text(
                          label,
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: isSelected
                                ? FontWeight.w800
                                : FontWeight.w600,
                            color: isSelected
                                ? AppColors.primaryDark
                                : AppColors.textPrimary,
                          ),
                        ),
                      ),
                      Icon(
                        Icons.chevron_right_rounded,
                        color: isSelected
                            ? AppColors.primary
                            : const Color(0xFFA094B3),
                        size: 22,
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),

          const SizedBox(height: 8),

          // "Nominal Donasi Lainnya"
          const Text(
            'Nominal Donasi Lainnya',
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w700,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 8),

          Container(
            height: 48,
            padding: const EdgeInsets.symmetric(horizontal: 14),
            decoration: BoxDecoration(
              color: const Color(0xFFF7F5FA),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: _isCustom
                    ? AppColors.primary
                    : const Color(0xFFDDD6E8),
                width: _isCustom ? 1.5 : 1.0,
              ),
            ),
            child: Row(
              children: [
                const Text(
                  'Rp',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF6B5885),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    controller: _customController,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    onChanged: _onCustomChanged,
                    style: const TextStyle(
                      fontSize: 14.5,
                      fontWeight: FontWeight.w700,
                      color: AppColors.textPrimary,
                    ),
                    decoration: const InputDecoration(
                      hintText: '0',
                      hintStyle: TextStyle(
                        fontSize: 14,
                        color: Color(0xFFA89EB5),
                      ),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.zero,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 5),
          const Text(
            'Min. Donasi sebesar Rp1.000',
            style: TextStyle(
              fontSize: 11,
              color: Color(0xFF8B7F9E),
            ),
          ),

          const SizedBox(height: 20),

          // "Lanjut Pembayaran" Button
          SizedBox(
            width: double.infinity,
            height: 48,
            child: ElevatedButton(
              onPressed: _selectedAmount >= 1000
                  ? () => widget.onProceed(_selectedAmount)
                  : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                disabledBackgroundColor: const Color(0xFFC7BED4),
                foregroundColor: Colors.white,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
              child: const Text(
                'Lanjut Pembayaran',
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
