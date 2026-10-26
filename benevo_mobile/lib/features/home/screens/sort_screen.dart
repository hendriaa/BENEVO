import 'package:flutter/material.dart';

enum SortOption {
  palingMendesak('Paling Mendesak'),
  palingSesuai('Paling Sesuai'),
  terbaru('Terbaru');

  final String label;
  const SortOption(this.label);
}

class SortScreen extends StatefulWidget {
  final SortOption initialSort;
  final ValueChanged<SortOption>? onSortChanged;

  const SortScreen({
    super.key,
    this.initialSort = SortOption.palingMendesak,
    this.onSortChanged,
  });

  @override
  State<SortScreen> createState() => _SortScreenState();
}

class _SortScreenState extends State<SortScreen> {
  late SortOption _selectedOption;

  @override
  void initState() {
    super.initState();
    _selectedOption = widget.initialSort;
  }

  void _select(SortOption option) {
    setState(() {
      _selectedOption = option;
    });
    widget.onSortChanged?.call(option);
    Navigator.of(context).pop(option);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFF5B33A7),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.close_rounded, color: Colors.white, size: 24),
          onPressed: () => Navigator.of(context).pop(_selectedOption),
        ),
        title: const Text(
          'Urutkan',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: false,
      ),
      body: Column(
        children: [
          _buildSortTile(SortOption.palingMendesak),
          const Divider(height: 1, thickness: 1, color: Color(0xFFE5E0EE)),
          _buildSortTile(SortOption.palingSesuai),
          const Divider(height: 1, thickness: 1, color: Color(0xFFE5E0EE)),
          _buildSortTile(SortOption.terbaru),
          const Divider(height: 1, thickness: 1, color: Color(0xFFE5E0EE)),
        ],
      ),
    );
  }

  Widget _buildSortTile(SortOption option) {
    final isSelected = _selectedOption == option;
    return InkWell(
      onTap: () => _select(option),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              option.label,
              style: TextStyle(
                fontSize: 15,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                color: const Color(0xFF2C2438),
              ),
            ),
            if (isSelected)
              const Icon(
                Icons.check_rounded,
                color: Color(0xFF5B33A7),
                size: 22,
              ),
          ],
        ),
      ),
    );
  }
}
