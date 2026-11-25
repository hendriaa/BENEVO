import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
      'asset': 'assets/images/preset_sandang.png',
    },
    {
      'amount': 100000,
      'label': 'Rp100.000',
      'asset': 'assets/images/preset_pangan.png',
    },
    {
      'amount': 150000,
      'label': 'Rp150.000',
      'asset': 'assets/images/preset_papan.png',
    },
    {
      'amount': 200000,
      'label': 'Rp200.000',
      'asset': 'assets/images/preset_medis.png',
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
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      padding: EdgeInsets.only(
        left: 18,
        right: 18,
        top: 20,
        bottom: 24 + bottomInset,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Presets List
          ..._presets.map((preset) {
            final int amount = preset['amount'] as int;
            final String label = preset['label'] as String;
            final String asset = preset['asset'] as String;
            final bool isSelected = !_isCustom && _selectedAmount == amount;

            return Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: InkWell(
                onTap: () => _selectPreset(amount),
                borderRadius: BorderRadius.circular(12),
                child: Container(
                  height: 48,
                  padding: const EdgeInsets.symmetric(horizontal: 14),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: isSelected
                          ? const Color(0xFF503287)
                          : const Color(0xFFE2DFE9),
                      width: isSelected ? 1.6 : 1.0,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.04),
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Image.asset(
                        asset,
                        width: 24,
                        height: 24,
                        fit: BoxFit.contain,
                      ),
                      const SizedBox(width: 14),
                      Expanded(
                        child: Text(
                          label,
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                            color: isSelected
                                ? const Color(0xFF503287)
                                : const Color(0xFF2A282F),
                          ),
                        ),
                      ),
                      const Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: Color(0xFF503287),
                        size: 15,
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),

          const SizedBox(height: 6),

          // Custom Input Box (Gray container with right-aligned text)
          Container(
            height: 42,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              color: const Color(0xFFD6D6D6),
              borderRadius: BorderRadius.circular(6),
              border: _isCustom
                  ? Border.all(color: const Color(0xFF503287), width: 1.2)
                  : null,
            ),
            alignment: Alignment.centerRight,
            child: TextField(
              controller: _customController,
              keyboardType: TextInputType.number,
              textAlign: TextAlign.right,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
              ],
              onChanged: _onCustomChanged,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w700,
                color: Color(0xFF333333),
              ),
              decoration: const InputDecoration(
                hintText: '0',
                hintStyle: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF666666),
                ),
                border: InputBorder.none,
                isDense: true,
                contentPadding: EdgeInsets.zero,
              ),
            ),
          ),
          const SizedBox(height: 4),
          const Text(
            'Min. Donasi sebesar Rp1.000',
            style: TextStyle(
              fontSize: 10,
              color: Color(0xFF757575),
            ),
          ),

          const SizedBox(height: 24),

          // "Lanjut Pembayaran" Button
          SizedBox(
            width: double.infinity,
            height: 48,
            child: ElevatedButton(
              onPressed: _selectedAmount >= 1000
                  ? () => widget.onProceed(_selectedAmount)
                  : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF503287),
                disabledBackgroundColor: const Color(0xFFC7BED4),
                foregroundColor: Colors.white,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                'Lanjut Pembayaran',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
