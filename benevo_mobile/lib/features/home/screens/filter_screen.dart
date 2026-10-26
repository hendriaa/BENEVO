import 'package:flutter/material.dart';

class FilterScreen extends StatefulWidget {
  final bool initialOlehBenevo;
  final bool initialDigalangYayasan;
  final bool initialDigalangPublik;
  final Function(bool olehBenevo, bool digalangYayasan, bool digalangPublik)?
      onFilterChanged;

  const FilterScreen({
    super.key,
    this.initialOlehBenevo = true,
    this.initialDigalangYayasan = true,
    this.initialDigalangPublik = false,
    this.onFilterChanged,
  });

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  late bool _olehBenevo;
  late bool _digalangYayasan;
  late bool _digalangPublik;

  @override
  void initState() {
    super.initState();
    _olehBenevo = widget.initialOlehBenevo;
    _digalangYayasan = widget.initialDigalangYayasan;
    _digalangPublik = widget.initialDigalangPublik;
  }

  void _popWithResult() {
    widget.onFilterChanged?.call(_olehBenevo, _digalangYayasan, _digalangPublik);
    Navigator.of(context).pop({
      'olehBenevo': _olehBenevo,
      'digalangYayasan': _digalangYayasan,
      'digalangPublik': _digalangPublik,
    });
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
          onPressed: _popWithResult,
        ),
        title: const Text(
          'Filter',
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
          _buildFilterTile(
            title: 'Oleh Benevo',
            value: _olehBenevo,
            onChanged: (val) {
              setState(() => _olehBenevo = val ?? false);
            },
          ),
          const Divider(height: 1, thickness: 1, color: Color(0xFFE5E0EE)),
          _buildFilterTile(
            title: 'Digalang Oleh Yayasan',
            value: _digalangYayasan,
            onChanged: (val) {
              setState(() => _digalangYayasan = val ?? false);
            },
          ),
          const Divider(height: 1, thickness: 1, color: Color(0xFFE5E0EE)),
          _buildFilterTile(
            title: 'Digalang Oleh Publik',
            value: _digalangPublik,
            onChanged: (val) {
              setState(() => _digalangPublik = val ?? false);
            },
          ),
          const Divider(height: 1, thickness: 1, color: Color(0xFFE5E0EE)),
        ],
      ),
    );
  }

  Widget _buildFilterTile({
    required String title,
    required bool value,
    required ValueChanged<bool?> onChanged,
  }) {
    return InkWell(
      onTap: () => onChanged(!value),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: Color(0xFF2C2438),
              ),
            ),
            Checkbox(
              value: value,
              onChanged: onChanged,
              activeColor: const Color(0xFF5B33A7),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
