import 'package:flutter/material.dart';
import 'other_category_select_screen.dart';
import 'fundraiser_success_screen.dart';

/// Form screen for non-medical fundraiser categories
/// Contains 4 steps: Tujuan, Rincian, Dokumen, Review
class OtherFundraiserFormScreen extends StatefulWidget {
  final FundraiserCategory category;

  const OtherFundraiserFormScreen({
    super.key,
    required this.category,
  });

  @override
  State<OtherFundraiserFormScreen> createState() =>
      _OtherFundraiserFormScreenState();
}

class _OtherFundraiserFormScreenState extends State<OtherFundraiserFormScreen> {
  int _currentStep = 1; // 1 to 4

  // Step 1: Tujuan Galang Dana
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _targetController = TextEditingController();
  String _startDate = '';
  String _endDate = '';
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _storyController = TextEditingController();

  // Step 2: Rincian Dana
  final List<Map<String, String>> _expenseList = [
    {'title': '', 'amount': ''},
  ];

  // Step 3: Dokumen
  bool _ktpUploaded = false;
  bool _supportDocUploaded = false;
  bool _photoUploaded = false;

  @override
  void dispose() {
    _titleController.dispose();
    _targetController.dispose();
    _locationController.dispose();
    _storyController.dispose();
    super.dispose();
  }

  void _nextStep() {
    if (_currentStep < 4) {
      setState(() => _currentStep++);
    }
  }

  void _prevStep() {
    if (_currentStep > 1) {
      setState(() => _currentStep--);
    } else {
      Navigator.of(context).pop();
    }
  }

  void _submitForm() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (_) => FundraiserSuccessScreen(
          campaignTitle: _titleController.text.isNotEmpty
              ? _titleController.text
              : 'Galang Dana ${widget.category.name}',
        ),
      ),
    );
  }

  Future<void> _pickDate(BuildContext context, bool isStart) async {
    final now = DateTime.now();
    final picked = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: now,
      lastDate: DateTime(now.year + 2),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: Color(0xFF5B33A7),
              onPrimary: Colors.white,
              surface: Colors.white,
              onSurface: Color(0xFF261943),
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null) {
      final months = [
        '', 'Januari', 'Februari', 'Maret', 'April', 'Mei', 'Juni',
        'Juli', 'Agustus', 'September', 'Oktober', 'November', 'Desember',
      ];
      final formatted = '${picked.day} ${months[picked.month]} ${picked.year}';
      setState(() {
        if (isStart) {
          _startDate = formatted;
        } else {
          _endDate = formatted;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFF5B33A7),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded, color: Colors.white),
          onPressed: _prevStep,
        ),
        title: Text(
          'Pengajuan - ${widget.category.name}',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.w700,
          ),
          overflow: TextOverflow.ellipsis,
        ),
        centerTitle: false,
      ),
      body: Column(
        children: [
          // Step progress bar
          _buildStepIndicator(),

          // Form content
          Expanded(
            child: SingleChildScrollView(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 18.0),
              child: _buildCurrentStep(),
            ),
          ),

          // Bottom buttons
          _buildBottomButtons(),
        ],
      ),
    );
  }

  Widget _buildStepIndicator() {
    const steps = ['Tujuan', 'Rincian', 'Dokumen', 'Review'];
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
      color: const Color(0xFFF8F5FD),
      child: Row(
        children: List.generate(steps.length, (i) {
          final stepNum = i + 1;
          final isActive = stepNum == _currentStep;
          final isDone = stepNum < _currentStep;
          return Expanded(
            child: Row(
              children: [
                if (i > 0)
                  Expanded(
                    child: Container(
                      height: 2,
                      color: isDone || isActive
                          ? const Color(0xFF5B33A7)
                          : const Color(0xFFD6C6EC),
                    ),
                  ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 28,
                      height: 28,
                      decoration: BoxDecoration(
                        color: isDone
                            ? const Color(0xFF5B33A7)
                            : isActive
                                ? const Color(0xFF5B33A7)
                                : const Color(0xFFEDE7F6),
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: isDone || isActive
                              ? const Color(0xFF5B33A7)
                              : const Color(0xFFD6C6EC),
                          width: 2,
                        ),
                      ),
                      alignment: Alignment.center,
                      child: isDone
                          ? const Icon(Icons.check_rounded,
                              color: Colors.white, size: 16)
                          : Text(
                              '$stepNum',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w800,
                                color: isActive
                                    ? Colors.white
                                    : const Color(0xFF887D9C),
                              ),
                            ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      steps[i],
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight:
                            isActive ? FontWeight.w800 : FontWeight.w600,
                        color: isActive || isDone
                            ? const Color(0xFF5B33A7)
                            : const Color(0xFF887D9C),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        }),
      ),
    );
  }

  Widget _buildCurrentStep() {
    switch (_currentStep) {
      case 1:
        return _buildStep1Tujuan();
      case 2:
        return _buildStep2Rincian();
      case 3:
        return _buildStep3Dokumen();
      case 4:
        return _buildStep4Review();
      default:
        return const SizedBox.shrink();
    }
  }

  // ── Step 1: Tujuan Galang Dana ──
  Widget _buildStep1Tujuan() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Category badge
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: widget.category.bgColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(widget.category.icon,
                  color: widget.category.iconColor, size: 16),
              const SizedBox(width: 6),
              Text(
                widget.category.name,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  color: widget.category.iconColor,
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 18),

        _buildLabel('Judul Galang Dana'),
        const SizedBox(height: 6),
        _buildTextField(
          controller: _titleController,
          hint: 'Contoh: Bantu Renovasi Sekolah Desa ...',
          maxLines: 2,
        ),

        const SizedBox(height: 16),

        _buildLabel('Target Dana (Rp)'),
        const SizedBox(height: 6),
        _buildTextField(
          controller: _targetController,
          hint: 'Contoh: 50.000.000',
          keyboardType: TextInputType.number,
        ),

        const SizedBox(height: 16),

        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildLabel('Tanggal Mulai'),
                  const SizedBox(height: 6),
                  _buildDateButton(
                    value: _startDate,
                    hint: 'Pilih tanggal',
                    onTap: () => _pickDate(context, true),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildLabel('Tanggal Selesai'),
                  const SizedBox(height: 6),
                  _buildDateButton(
                    value: _endDate,
                    hint: 'Pilih tanggal',
                    onTap: () => _pickDate(context, false),
                  ),
                ],
              ),
            ),
          ],
        ),

        const SizedBox(height: 16),

        _buildLabel('Lokasi / Daerah'),
        const SizedBox(height: 6),
        _buildTextField(
          controller: _locationController,
          hint: 'Contoh: Jawa Barat, Bandung',
        ),

        const SizedBox(height: 16),

        _buildLabel('Cerita / Latar Belakang'),
        const SizedBox(height: 6),
        _buildTextField(
          controller: _storyController,
          hint: 'Ceritakan latar belakang dan tujuan galang dana ini...',
          maxLines: 6,
        ),
      ],
    );
  }

  // ── Step 2: Rincian Dana ──
  Widget _buildStep2Rincian() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Rincian Penggunaan Dana',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w800,
            color: Color(0xFF261943),
          ),
        ),
        const SizedBox(height: 6),
        const Text(
          'Tuliskan rincian penggunaan dana agar donatur lebih percaya.',
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: Color(0xFF887D9C),
          ),
        ),
        const SizedBox(height: 16),

        // Expense items
        ...List.generate(_expenseList.length, (i) {
          return Container(
            margin: const EdgeInsets.only(bottom: 12),
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: const Color(0xFFF8F5FD),
              borderRadius: BorderRadius.circular(14),
              border: Border.all(
                color: const Color(0xFFEDE7F6),
                width: 1.0,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'Item ${i + 1}',
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w800,
                        color: Color(0xFF5B33A7),
                      ),
                    ),
                    const Spacer(),
                    if (_expenseList.length > 1)
                      GestureDetector(
                        onTap: () {
                          setState(() => _expenseList.removeAt(i));
                        },
                        child: const Icon(
                          Icons.close_rounded,
                          size: 18,
                          color: Color(0xFFB39DDB),
                        ),
                      ),
                  ],
                ),
                const SizedBox(height: 8),
                _buildTextField(
                  hint: 'Nama keperluan',
                  initialValue: _expenseList[i]['title'],
                  onChanged: (v) => _expenseList[i]['title'] = v,
                ),
                const SizedBox(height: 8),
                _buildTextField(
                  hint: 'Jumlah (Rp)',
                  keyboardType: TextInputType.number,
                  initialValue: _expenseList[i]['amount'],
                  onChanged: (v) => _expenseList[i]['amount'] = v,
                ),
              ],
            ),
          );
        }),

        const SizedBox(height: 6),

        // Add item button
        OutlinedButton.icon(
          onPressed: () {
            setState(() {
              _expenseList.add({'title': '', 'amount': ''});
            });
          },
          icon: const Icon(Icons.add_rounded, size: 18),
          label: const Text('Tambah item'),
          style: OutlinedButton.styleFrom(
            foregroundColor: const Color(0xFF5B33A7),
            side: const BorderSide(color: Color(0xFF5B33A7), width: 1.2),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          ),
        ),
      ],
    );
  }

  // ── Step 3: Dokumen ──
  Widget _buildStep3Dokumen() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Unggah Dokumen Pendukung',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w800,
            color: Color(0xFF261943),
          ),
        ),
        const SizedBox(height: 6),
        const Text(
          'Dokumen akan digunakan untuk verifikasi pengajuan galang dana.',
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: Color(0xFF887D9C),
          ),
        ),
        const SizedBox(height: 20),

        _buildUploadCard(
          title: 'KTP / Identitas Penggalang Dana',
          subtitle: 'Foto KTP yang jelas dan masih berlaku',
          icon: Icons.badge_rounded,
          isUploaded: _ktpUploaded,
          onTap: () => setState(() => _ktpUploaded = !_ktpUploaded),
        ),

        const SizedBox(height: 14),

        _buildUploadCard(
          title: 'Dokumen Pendukung',
          subtitle: _getSupportDocHint(),
          icon: Icons.description_rounded,
          isUploaded: _supportDocUploaded,
          onTap: () =>
              setState(() => _supportDocUploaded = !_supportDocUploaded),
        ),

        const SizedBox(height: 14),

        _buildUploadCard(
          title: 'Foto Dokumentasi',
          subtitle: 'Foto terkait kondisi atau kegiatan yang akan dibantu',
          icon: Icons.photo_camera_rounded,
          isUploaded: _photoUploaded,
          onTap: () => setState(() => _photoUploaded = !_photoUploaded),
        ),

        const SizedBox(height: 20),

        // Info box
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: const Color(0xFFF6F0FC),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: const Color(0xFFD6C6EC),
              width: 1.0,
            ),
          ),
          child: const Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 1.0),
                child: Icon(
                  Icons.info_rounded,
                  size: 16,
                  color: Color(0xFF5B33A7),
                ),
              ),
              SizedBox(width: 8),
              Expanded(
                child: Text(
                  'Format file yang diterima: JPG, PNG, PDF. Maksimal ukuran file 5 MB per dokumen.',
                  style: TextStyle(
                    fontSize: 10.5,
                    color: Color(0xFF53456D),
                    height: 1.35,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  String _getSupportDocHint() {
    final name = widget.category.name.toLowerCase();
    if (name.contains('pendidikan')) {
      return 'Surat keterangan sekolah / tagihan biaya pendidikan';
    } else if (name.contains('bencana')) {
      return 'Surat keterangan dari RT/RW / dokumentasi bencana';
    } else if (name.contains('difabel')) {
      return 'Surat keterangan disabilitas dari dokter';
    } else if (name.contains('infrastruktur')) {
      return 'Proposal dan RAB pembangunan/perbaikan';
    } else if (name.contains('kreatif')) {
      return 'Proposal proyek dan portofolio karya';
    } else if (name.contains('sosial')) {
      return 'Proposal kegiatan sosial';
    } else if (name.contains('lingkungan')) {
      return 'Proposal program lingkungan';
    } else if (name.contains('ibadah')) {
      return 'Surat dari pengurus tempat ibadah dan RAB';
    } else if (name.contains('panti')) {
      return 'Surat keterangan dari panti asuhan';
    }
    return 'Dokumen pendukung terkait';
  }

  // ── Step 4: Review ──
  Widget _buildStep4Review() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Periksa Pengajuan',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w800,
            color: Color(0xFF261943),
          ),
        ),
        const SizedBox(height: 6),
        const Text(
          'Pastikan semua data sudah benar sebelum mengirim pengajuan.',
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: Color(0xFF887D9C),
          ),
        ),

        const SizedBox(height: 20),

        // Category
        _buildReviewItem(
          'Kategori',
          widget.category.name,
          widget.category.icon,
        ),

        const SizedBox(height: 12),

        // Judul
        _buildReviewRow('Judul',
            _titleController.text.isNotEmpty ? _titleController.text : '-'),

        const SizedBox(height: 8),

        // Target
        _buildReviewRow(
          'Target Dana',
          _targetController.text.isNotEmpty
              ? 'Rp ${_targetController.text}'
              : '-',
        ),

        const SizedBox(height: 8),

        // Periode
        _buildReviewRow(
          'Periode',
          _startDate.isNotEmpty && _endDate.isNotEmpty
              ? '$_startDate - $_endDate'
              : '-',
        ),

        const SizedBox(height: 8),

        // Lokasi
        _buildReviewRow(
          'Lokasi',
          _locationController.text.isNotEmpty
              ? _locationController.text
              : '-',
        ),

        const SizedBox(height: 16),

        // Cerita
        const Text(
          'Cerita / Latar Belakang',
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w800,
            color: Color(0xFF5B33A7),
          ),
        ),
        const SizedBox(height: 6),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: const Color(0xFFF8F5FD),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: const Color(0xFFEDE7F6)),
          ),
          child: Text(
            _storyController.text.isNotEmpty ? _storyController.text : '-',
            style: const TextStyle(
              fontSize: 12,
              color: Color(0xFF341B5C),
              height: 1.4,
            ),
          ),
        ),

        const SizedBox(height: 16),

        // Rincian Dana
        const Text(
          'Rincian Penggunaan Dana',
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w800,
            color: Color(0xFF5B33A7),
          ),
        ),
        const SizedBox(height: 8),

        ..._expenseList.where((e) =>
            (e['title'] ?? '').isNotEmpty || (e['amount'] ?? '').isNotEmpty
        ).map((e) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 6),
            child: Row(
              children: [
                const Text('• ',
                    style: TextStyle(
                        fontWeight: FontWeight.w800,
                        color: Color(0xFF261943))),
                Expanded(
                  child: Text(
                    e['title'] ?? '-',
                    style: const TextStyle(
                      fontSize: 12,
                      color: Color(0xFF341B5C),
                    ),
                  ),
                ),
                Text(
                  'Rp ${e['amount'] ?? '-'}',
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF5B33A7),
                  ),
                ),
              ],
            ),
          );
        }),

        const SizedBox(height: 16),

        // Dokumen status
        const Text(
          'Dokumen',
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w800,
            color: Color(0xFF5B33A7),
          ),
        ),
        const SizedBox(height: 8),
        _buildDocStatus('KTP / Identitas', _ktpUploaded),
        const SizedBox(height: 4),
        _buildDocStatus('Dokumen Pendukung', _supportDocUploaded),
        const SizedBox(height: 4),
        _buildDocStatus('Foto Dokumentasi', _photoUploaded),

        const SizedBox(height: 20),
      ],
    );
  }

  // ── Helper widgets ──

  Widget _buildLabel(String text) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.w700,
        color: Color(0xFF341B5C),
      ),
    );
  }

  Widget _buildTextField({
    TextEditingController? controller,
    String? hint,
    int maxLines = 1,
    TextInputType? keyboardType,
    String? initialValue,
    ValueChanged<String>? onChanged,
  }) {
    return TextFormField(
      controller: controller,
      initialValue: controller == null ? initialValue : null,
      maxLines: maxLines,
      keyboardType: keyboardType,
      onChanged: onChanged,
      style: const TextStyle(
        fontSize: 13,
        color: Color(0xFF261943),
      ),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(
          fontSize: 12.5,
          color: Color(0xFFB0A3C7),
        ),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        filled: true,
        fillColor: const Color(0xFFFAF8FE),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide:
              const BorderSide(color: Color(0xFFE0D6F2), width: 1.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide:
              const BorderSide(color: Color(0xFFE0D6F2), width: 1.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide:
              const BorderSide(color: Color(0xFF5B33A7), width: 1.5),
        ),
      ),
    );
  }

  Widget _buildDateButton({
    required String value,
    required String hint,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        decoration: BoxDecoration(
          color: const Color(0xFFFAF8FE),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: const Color(0xFFE0D6F2),
            width: 1.0,
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                value.isNotEmpty ? value : hint,
                style: TextStyle(
                  fontSize: 12.5,
                  color: value.isNotEmpty
                      ? const Color(0xFF261943)
                      : const Color(0xFFB0A3C7),
                ),
              ),
            ),
            const Icon(
              Icons.calendar_today_rounded,
              size: 16,
              color: Color(0xFF5B33A7),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildUploadCard({
    required String title,
    required String subtitle,
    required IconData icon,
    required bool isUploaded,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: isUploaded ? const Color(0xFFEDE7F6) : Colors.white,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: isUploaded
                ? const Color(0xFF5B33A7)
                : const Color(0xFFE0D6F2),
            width: isUploaded ? 1.5 : 1.0,
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: isUploaded
                    ? const Color(0xFF5B33A7)
                    : const Color(0xFFF8F5FD),
                borderRadius: BorderRadius.circular(12),
              ),
              alignment: Alignment.center,
              child: Icon(
                isUploaded ? Icons.check_rounded : icon,
                color: isUploaded ? Colors.white : const Color(0xFF5B33A7),
                size: 22,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF261943),
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    isUploaded ? 'Dokumen berhasil diunggah ✓' : subtitle,
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w500,
                      color: isUploaded
                          ? const Color(0xFF43A047)
                          : const Color(0xFF887D9C),
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              isUploaded ? Icons.check_circle_rounded : Icons.upload_rounded,
              color: isUploaded
                  ? const Color(0xFF43A047)
                  : const Color(0xFFB0A3C7),
              size: 22,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildReviewItem(String label, String value, IconData icon) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: widget.category.bgColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(icon, color: widget.category.iconColor, size: 20),
          const SizedBox(width: 10),
          Text(
            value,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w700,
              color: widget.category.iconColor,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildReviewRow(String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 90,
          child: Text(
            label,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: Color(0xFF887D9C),
            ),
          ),
        ),
        Expanded(
          child: Text(
            value,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w700,
              color: Color(0xFF261943),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDocStatus(String label, bool uploaded) {
    return Row(
      children: [
        Icon(
          uploaded ? Icons.check_circle_rounded : Icons.cancel_rounded,
          size: 16,
          color: uploaded ? const Color(0xFF43A047) : const Color(0xFFE53935),
        ),
        const SizedBox(width: 8),
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            color: Color(0xFF341B5C),
          ),
        ),
        const Spacer(),
        Text(
          uploaded ? 'Terunggah' : 'Belum diunggah',
          style: TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w600,
            color: uploaded ? const Color(0xFF43A047) : const Color(0xFFE53935),
          ),
        ),
      ],
    );
  }

  Widget _buildBottomButtons() {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 12, 20, 20),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.06),
            blurRadius: 10,
            offset: const Offset(0, -3),
          ),
        ],
      ),
      child: Row(
        children: [
          if (_currentStep > 1)
            Expanded(
              child: OutlinedButton(
                onPressed: _prevStep,
                style: OutlinedButton.styleFrom(
                  foregroundColor: const Color(0xFF5B33A7),
                  side: const BorderSide(
                      color: Color(0xFF5B33A7), width: 1.2),
                  padding: const EdgeInsets.symmetric(vertical: 13),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  'Kembali',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          if (_currentStep > 1) const SizedBox(width: 12),
          Expanded(
            flex: _currentStep > 1 ? 1 : 0,
            child: SizedBox(
              width: _currentStep == 1 ? double.infinity : null,
              child: ElevatedButton(
                onPressed: _currentStep < 4 ? _nextStep : _submitForm,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF5B33A7),
                  foregroundColor: Colors.white,
                  elevation: 2,
                  padding: const EdgeInsets.symmetric(vertical: 13),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  _currentStep < 4 ? 'Selanjutnya' : 'Kirim Pengajuan',
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
