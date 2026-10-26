import 'package:flutter/material.dart';
import '../widgets/payout_method_dropdown.dart';
import 'fundraiser_success_screen.dart';

/// Comprehensive 5-Step Medical Fundraiser Application Screen
/// Matching media_1793020262294_6ffdce03.png and media_1793020288802_044c36af.png
class MedicalFundraiserFormScreen extends StatefulWidget {
  const MedicalFundraiserFormScreen({super.key});

  @override
  State<MedicalFundraiserFormScreen> createState() =>
      _MedicalFundraiserFormScreenState();
}

class _MedicalFundraiserFormScreenState
    extends State<MedicalFundraiserFormScreen> {
  int _currentStep = 1; // 1 to 5

  // Step 1: Tujuan Controllers
  final TextEditingController _titleController = TextEditingController(
    text: 'Bantu Operasi Jantung Adik Vasya',
  );
  final TextEditingController _targetController = TextEditingController(
    text: '85.000.000',
  );
  String _startDate = '25 Oktober 2026';
  String _endDate = '30 Oktober 2026';
  final TextEditingController _locationController = TextEditingController(
    text: 'Kepulauan Riau, Tanjung Pinang',
  );
  final TextEditingController _storyController = TextEditingController(
    text:
        'Halo, Orang Baik. Perkenalkan, Vasya Melissa Sasha, putri kami yang didiagnosis Tetralogy of Fallot, kelainan jantung bawaan yang membuat tubuhnya mudah biru dan lemas. Dokter di RS Pelita Kencana menyatakan Vasya harus segera menjalani operasi jantung terbuka dan perawatan intensif di ICU anak.\n\nKami keluarga sederhana, dan penghasilan kami belum cukup untuk menutup biaya operasi, perawatan ICU 7 hari, obat, serta nutrisi khusus setelah operasi. Total kebutuhan sebesar Rp85.000.000, sesuai rincian dari rumah sakit.\n\nSeluruh dana yang terkumpul akan dipakai untuk pengobatan Vasya, dan kami akan melaporkan penggunaannya secara terbuka. Bantuan sekecil apa pun sangat berarti bagi kesembuhan Vasya. Terima kasih atas kebaikan Anda.',
  );

  // Step 2: Data Pasien Controllers
  final TextEditingController _patientNameController = TextEditingController(
    text: 'Vasya Melissa Sasha',
  );
  final TextEditingController _patientAgeController = TextEditingController(
    text: '2 tahun',
  );
  final TextEditingController _relationController = TextEditingController(
    text: 'Saudara keluarga Ibu',
  );
  final TextEditingController _hospitalController = TextEditingController(
    text: 'Rumah Sakit Pelita Kencana',
  );
  final TextEditingController _diagnosisController = TextEditingController(
    text:
        'Tetralogy of Fallot (kelainan jantung bawaan), perlu operasi jantung terbuka dan perawatan ICU anak',
  );
  bool _isChild = true; // Balita/Anak vs Dewasa

  // Step 3: Rencana Biaya Controllers
  final List<Map<String, String>> _expenseList = [
    {
      'title': 'Operasi corrective jantung terbuka',
      'amount': '45.000.000',
    },
    {
      'title': 'Perawatan ICU anak 7 hari',
      'amount': '20.000.000',
    },
    {
      'title': 'Obat dan alat medis habis pakai',
      'amount': '8.000.000',
    },
    {
      'title': 'Pemeriksaan penunjang',
      'amount': '5.000.000',
    },
    {
      'title': 'Nutrisi khusus dan kontrol pasca operasi',
      'amount': '4.000.000',
    },
    {
      'title': 'Transportasi dan akomodasi keluarga selama perawatan',
      'amount': '15.000.000',
    },
  ];

  String _selectedPaymentMethod = 'BCA (VA)';

  final TextEditingController _accountNumberController = TextEditingController(
    text: '3901 2345 6789 0123',
  );
  final TextEditingController _accountHolderController = TextEditingController(
    text: 'Nursiti',
  );

  // Step 5: Checkboxes
  bool _agreeRelevance = true;
  bool _agreeValid = true;
  bool _agreeTerms = true;

  @override
  void dispose() {
    _titleController.dispose();
    _targetController.dispose();
    _locationController.dispose();
    _storyController.dispose();
    _patientNameController.dispose();
    _patientAgeController.dispose();
    _relationController.dispose();
    _hospitalController.dispose();
    _diagnosisController.dispose();
    _accountNumberController.dispose();
    _accountHolderController.dispose();
    super.dispose();
  }

  void _nextStep() {
    if (_currentStep < 5) {
      setState(() {
        _currentStep++;
      });
    } else {
      // Step 5 Submit
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => FundraiserSuccessScreen(
            campaignTitle: _titleController.text.trim().isEmpty
                ? 'Bantu Operasi Jantung Adik Vasya'
                : _titleController.text.trim(),
          ),
        ),
      );
    }
  }

  void _prevStep() {
    if (_currentStep > 1) {
      setState(() {
        _currentStep--;
      });
    } else {
      Navigator.of(context).pop();
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
        title: const Text(
          'Orang sakit / Keperluan Medis',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16.5,
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: false,
      ),
      body: SafeArea(
        child: Column(
          children: [
            // 1. Step Indicator Bar
            _buildStepperHeader(),

            const Divider(height: 1, thickness: 1, color: Color(0xFFEDE7F6)),

            // 2. Active Step Content
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
                child: _buildStepContent(),
              ),
            ),

            // 3. Bottom Navigation Buttons
            _buildBottomActionBar(),
          ],
        ),
      ),
    );
  }

  /// Horizontal Stepper Header: 1. Tujuan - 2. Pasien - 3. Rencana - 4. Dokumen - 5. Review
  Widget _buildStepperHeader() {
    final steps = [
      {'num': '1', 'name': 'Tujuan'},
      {'num': '2', 'name': 'Pasien'},
      {'num': '3', 'name': 'Rencana'},
      {'num': '4', 'name': 'Dokumen'},
      {'num': '5', 'name': 'Review'},
    ];

    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(steps.length * 2 - 1, (index) {
          if (index.isOdd) {
            // Connector line
            return Container(
              width: 8,
              height: 1.5,
              color: const Color(0xFFD3CADC),
            );
          }

          final stepIndex = index ~/ 2;
          final stepNum = stepIndex + 1;
          final isSelected = _currentStep == stepNum;
          final isCompleted = _currentStep > stepNum;

          return Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 19,
                height: 19,
                decoration: BoxDecoration(
                  color: isSelected
                      ? const Color(0xFF5B33A7)
                      : (isCompleted ? const Color(0xFF8F71C6) : const Color(0xFFE2DCE8)),
                  shape: BoxShape.circle,
                ),
                alignment: Alignment.center,
                child: Text(
                  '${steps[stepIndex]['num']}',
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                    color: (isSelected || isCompleted) ? Colors.white : const Color(0xFF756E87),
                  ),
                ),
              ),
              const SizedBox(width: 4),
              Text(
                '${steps[stepIndex]['name']}',
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: isSelected ? FontWeight.w800 : FontWeight.w500,
                  color: isSelected
                      ? const Color(0xFF261943)
                      : (isCompleted ? const Color(0xFF5B33A7) : const Color(0xFF887D9C)),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }

  /// Switcher for steps 1 through 5
  Widget _buildStepContent() {
    switch (_currentStep) {
      case 1:
        return _buildStep1Tujuan();
      case 2:
        return _buildStep2Pasien();
      case 3:
        return _buildStep3Rencana();
      case 4:
        return _buildStep4Dokumen();
      case 5:
        return _buildStep5Review();
      default:
        return const SizedBox.shrink();
    }
  }

  // ==========================================================================
  // STEP 1: TUJUAN PENGGALANGAN DANA
  // ==========================================================================
  Widget _buildStep1Tujuan() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Tujuan Penggalangan Dana*',
          style: TextStyle(
            fontSize: 14.5,
            fontWeight: FontWeight.w800,
            color: Color(0xFF261943),
          ),
        ),
        const SizedBox(height: 14),

        // Judul Kampanye
        _buildFormFieldLabel('Judul Kampanye*'),
        _buildTextField(
          controller: _titleController,
          hintText: 'Minimal 10 Karakter',
        ),

        const SizedBox(height: 14),

        // Target Dana
        _buildFormFieldLabel('Target Dana*'),
        _buildTextField(
          controller: _targetController,
          hintText: 'Ketik Nominal',
          prefixText: 'Rp  ',
          keyboardType: TextInputType.number,
        ),

        const SizedBox(height: 14),

        // Dates Row: Mulai & Selesai
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildFormFieldLabel('Mulai*'),
                  _buildDateBox(_startDate, () async {
                    final picked = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2025),
                      lastDate: DateTime(2030),
                    );
                    if (picked != null) {
                      setState(() {
                        _startDate = '${picked.day} ${_getMonthName(picked.month)} ${picked.year}';
                      });
                    }
                  }),
                ],
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildFormFieldLabel('Selesai*'),
                  _buildDateBox(_endDate, () async {
                    final picked = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now().add(const Duration(days: 5)),
                      firstDate: DateTime(2025),
                      lastDate: DateTime(2030),
                    );
                    if (picked != null) {
                      setState(() {
                        _endDate = '${picked.day} ${_getMonthName(picked.month)} ${picked.year}';
                      });
                    }
                  }),
                ],
              ),
            ),
          ],
        ),

        const SizedBox(height: 14),

        // Lokasi perawatan
        _buildFormFieldLabel('Lokasi perawatan*'),
        _buildTextField(
          controller: _locationController,
          hintText: 'Provinsi, Kabupaten/Kota',
        ),

        const SizedBox(height: 14),

        // Cerita Kampanye
        _buildFormFieldLabel('Cerita Kampanye*'),
        _buildTextField(
          controller: _storyController,
          hintText: 'Ceritakan kondisi pasien dan kebutuhan',
          maxLines: 8,
        ),

        const SizedBox(height: 16),

        // Warning Box
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: const Color(0xFFF7F1FB),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: const Color(0xFFE2D6EE)),
          ),
          child: const Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                Icons.warning_amber_rounded,
                color: Color(0xFFE53935),
                size: 20,
              ),
              SizedBox(width: 10),
              Expanded(
                child: Text(
                  'Catatan: Perubahan kategori di langkah berikutnya akan mereset form data penerima manfaat dan prasyarat dokumen wajib yang telah diisi.',
                  style: TextStyle(
                    fontSize: 11,
                    color: Color(0xFF5A4870),
                    height: 1.35,
                  ),
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 14),
      ],
    );
  }

  // ==========================================================================
  // STEP 2: DATA PASIEN
  // ==========================================================================
  Widget _buildStep2Pasien() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Data Pasien*',
          style: TextStyle(
            fontSize: 14.5,
            fontWeight: FontWeight.w800,
            color: Color(0xFF261943),
          ),
        ),
        const SizedBox(height: 12),

        // Privacy Lock Banner
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          decoration: BoxDecoration(
            color: const Color(0xFFF7F1FB),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: const Color(0xFFE2D6EE)),
          ),
          child: const Row(
            children: [
              Icon(
                Icons.lock_outline_rounded,
                color: Color(0xFF5B33A7),
                size: 18,
              ),
              SizedBox(width: 10),
              Expanded(
                child: Text(
                  'Data Pasien bersifat pribadi dan hanya pengelola yang berpihak dan berhak yang dapat melihat dan mengakses informasi pasien.',
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

        const SizedBox(height: 14),

        // Pasien Name
        _buildFormFieldLabel('Pasien*'),
        _buildTextField(
          controller: _patientNameController,
          hintText: 'Sesuai KK / Akta Kelahiran',
        ),

        const SizedBox(height: 14),

        // Usia & Relasi Row
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildFormFieldLabel('Usia*'),
                  _buildTextField(
                    controller: _patientAgeController,
                    hintText: 'Angka',
                  ),
                ],
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildFormFieldLabel('Relasi Dengan Penggalang*'),
                  _buildTextField(
                    controller: _relationController,
                    hintText: 'Keterkaitan dengan pasien',
                  ),
                ],
              ),
            ),
          ],
        ),

        const SizedBox(height: 14),

        // Rumah Sakit
        _buildFormFieldLabel('Rumah Sakit / Tempat Fasilitasi*'),
        _buildTextField(
          controller: _hospitalController,
          hintText: 'Masukkan Nama Rumah Sakit',
          prefixIcon: const Icon(
            Icons.local_hospital_outlined,
            size: 18,
            color: Color(0xFF756E87),
          ),
        ),

        const SizedBox(height: 14),

        // Diagnosis Singkat
        _buildFormFieldLabel('Diagnosis Singkat*'),
        _buildTextField(
          controller: _diagnosisController,
          hintText: 'Penyakit, atau tindakan medis yang dibutuhkan',
          maxLines: 3,
        ),
        const SizedBox(height: 4),
        const Text(
          'sesuaikan sesuai surat keterangan medis dari dokter.',
          style: TextStyle(
            fontSize: 10.5,
            color: Color(0xFF887D9C),
            fontStyle: FontStyle.italic,
          ),
        ),

        const SizedBox(height: 14),

        // Jenis Pasien (Segmented toggle: Balita/Anak vs Dewasa)
        _buildFormFieldLabel('Jenis Pasien*'),
        Row(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    _isChild = true;
                  });
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 11),
                  decoration: BoxDecoration(
                    color: _isChild ? const Color(0xFF5B33A7) : Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: _isChild ? const Color(0xFF5B33A7) : const Color(0xFFD6C8E6),
                      width: 1.2,
                    ),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    'Balita / Anak',
                    style: TextStyle(
                      fontSize: 12.5,
                      fontWeight: FontWeight.w700,
                      color: _isChild ? Colors.white : const Color(0xFF756E87),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    _isChild = false;
                  });
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 11),
                  decoration: BoxDecoration(
                    color: !_isChild ? const Color(0xFF5B33A7) : Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: !_isChild ? const Color(0xFF5B33A7) : const Color(0xFFD6C8E6),
                      width: 1.2,
                    ),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    'Dewasa',
                    style: TextStyle(
                      fontSize: 12.5,
                      fontWeight: FontWeight.w700,
                      color: !_isChild ? Colors.white : const Color(0xFF756E87),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),

        const SizedBox(height: 16),

        // Foto Pasien*
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildFormFieldLabel('Foto Pasien*'),
            GestureDetector(
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Menambahkan foto pasien...'),
                    duration: Duration(seconds: 1),
                  ),
                );
              },
              child: Container(
                width: 26,
                height: 26,
                decoration: BoxDecoration(
                  color: const Color(0xFF5B33A7),
                  borderRadius: BorderRadius.circular(6),
                ),
                alignment: Alignment.center,
                child: const Icon(Icons.add, color: Colors.white, size: 18),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),

        // Photo Gallery Preview
        Row(
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  'assets/images/patient_photo1.png',
                  height: 95,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    height: 95,
                    color: const Color(0xFFEDE7F6),
                    alignment: Alignment.center,
                    child: const Icon(Icons.image, color: Color(0xFF5B33A7)),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  'assets/images/patient_photo2.png',
                  height: 95,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    height: 95,
                    color: const Color(0xFFEDE7F6),
                    alignment: Alignment.center,
                    child: const Icon(Icons.image, color: Color(0xFF5B33A7)),
                  ),
                ),
              ),
            ),
          ],
        ),

        const SizedBox(height: 14),
      ],
    );
  }

  // ==========================================================================
  // STEP 3: RENCANA BIAYA PENGOBATAN
  // ==========================================================================
  Widget _buildStep3Rencana() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Rencana Biaya Pengobatan*',
              style: TextStyle(
                fontSize: 14.5,
                fontWeight: FontWeight.w800,
                color: Color(0xFF261943),
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  _expenseList.add({
                    'title': 'Pengeluaran tambahan #${_expenseList.length + 1}',
                    'amount': '1.000.000',
                  });
                });
              },
              child: Container(
                width: 26,
                height: 26,
                decoration: BoxDecoration(
                  color: const Color(0xFF5B33A7),
                  borderRadius: BorderRadius.circular(6),
                ),
                alignment: Alignment.center,
                child: const Icon(Icons.add, color: Colors.white, size: 18),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),

        // Expense rows
        ...List.generate(_expenseList.length, (index) {
          final item = _expenseList[index];
          return Container(
            margin: const EdgeInsets.only(bottom: 8),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            decoration: BoxDecoration(
              color: const Color(0xFFF7F2FB),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: const Color(0xFFE4DAEE)),
            ),
            child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Text(
                    item['title']!,
                    style: const TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF341B5C),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  flex: 2,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(color: const Color(0xFFD3C8DF)),
                    ),
                    child: Text(
                      'Rp  ${item['amount']}',
                      style: const TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF261943),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.delete_outline_rounded, size: 18),
                  color: const Color(0xFF887D9C),
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(minWidth: 28, minHeight: 28),
                  onPressed: () {
                    if (_expenseList.length > 1) {
                      setState(() {
                        _expenseList.removeAt(index);
                      });
                    }
                  },
                ),
              ],
            ),
          );
        }),

        const SizedBox(height: 18),

        // Section: Metode Pencairan Dana
        const Text(
          'Metode Pencairan Dana*',
          style: TextStyle(
            fontSize: 14.5,
            fontWeight: FontWeight.w800,
            color: Color(0xFF261943),
          ),
        ),
        const SizedBox(height: 10),

        PayoutMethodDropdown(
          selectedMethod: _selectedPaymentMethod,
          onChanged: (newVal) {
            setState(() {
              _selectedPaymentMethod = newVal;
            });
          },
        ),

        const SizedBox(height: 14),

        _buildFormFieldLabel('Virtual Account / Nomor E-wallet'),
        _buildTextField(
          controller: _accountNumberController,
          hintText: 'Isi dengan relevan',
          keyboardType: TextInputType.number,
        ),

        const SizedBox(height: 14),

        _buildFormFieldLabel('Nama pemilik metode pembayaran'),
        _buildTextField(
          controller: _accountHolderController,
          hintText: 'Nama sesuai KTP',
        ),

        const SizedBox(height: 14),
      ],
    );
  }

  // ==========================================================================
  // STEP 4: DOKUMEN WAJIB
  // ==========================================================================
  Widget _buildStep4Dokumen() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Dokumen wajib',
              style: TextStyle(
                fontSize: 14.5,
                fontWeight: FontWeight.w800,
                color: Color(0xFF261943),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: const Color(0xFFF3EDFA),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Text(
                '2 dari 3 wajib',
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF5B33A7),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 14),

        // Document Card 1
        _buildDocUploadCard(
          title: 'Surat Diagnosis atau rekam Medis*',
          subtitle: 'Dari dokter atau rumah sakit. PDF, JPG, atau PNG, maksimal 2 MB.',
          files: ['Surat Di...', 'Surat Re...'],
        ),

        const SizedBox(height: 14),

        // Document Card 2
        _buildDocUploadCard(
          title: 'Rincian estimasi biaya rumah sakit*',
          subtitle: 'Rincian biaya operasi, rawat inap, dan obat. Total harus sesuai rencana.',
          files: ['Diagnosa...', 'Rincian O...'],
        ),

        const SizedBox(height: 14),

        // Document Card 3
        _buildDocUploadCard(
          title: 'KTP dan KK Penanggung Jawab*',
          subtitle: 'Foto jelas, tidak buram, semua data terbaca.',
          files: ['KTP', 'KK'],
        ),

        const SizedBox(height: 14),

        // Optional Upload Card 4
        Container(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: const Color(0xFFE2D6EE)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Dokumen Tambahan (Surat rujukan, Kartu BPJS)',
                style: TextStyle(
                  fontSize: 12.5,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFF261943),
                ),
              ),
              const SizedBox(height: 2),
              const Text(
                '(opsional) Foto jelas, tidak buram, semua data terbaca.',
                style: TextStyle(
                  fontSize: 10.5,
                  color: Color(0xFF756E87),
                ),
              ),
              const SizedBox(height: 12),
              GestureDetector(
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Pilih dokumen tambahan dari galeri atau berkas...'),
                      duration: Duration(seconds: 1),
                    ),
                  );
                },
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF7F2FB),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: const Color(0xFFD6C8E6),
                      style: BorderStyle.solid,
                    ),
                  ),
                  child: const Column(
                    children: [
                      Icon(
                        Icons.cloud_upload_outlined,
                        size: 32,
                        color: Color(0xFF5B33A7),
                      ),
                      SizedBox(height: 6),
                      Text(
                        'Unggah dokumentasi tambahan',
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF53456D),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 14),
      ],
    );
  }

  Widget _buildDocUploadCard({
    required String title,
    required String subtitle,
    required List<String> files,
  }) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xFFE2D6EE)),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF5B33A7).withValues(alpha: 0.04),
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 12.5,
              fontWeight: FontWeight.w800,
              color: Color(0xFF261943),
            ),
          ),
          const SizedBox(height: 2),
          Text(
            subtitle,
            style: const TextStyle(
              fontSize: 10.5,
              color: Color(0xFF756E87),
            ),
          ),
          const SizedBox(height: 12),

          // File tiles
          Row(
            children: [
              ...files.map((file) {
                return Container(
                  margin: const EdgeInsets.only(right: 10),
                  width: 68,
                  height: 68,
                  decoration: BoxDecoration(
                    color: const Color(0xFFF7F2FB),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: const Color(0xFFD8CCEC)),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.description_outlined,
                        size: 26,
                        color: Color(0xFF5B33A7),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        file,
                        style: const TextStyle(
                          fontSize: 9.5,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF341B5C),
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                );
              }),

              // Add file tile
              Container(
                width: 68,
                height: 68,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: const Color(0xFFD3C8DF),
                    width: 1.2,
                  ),
                ),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.note_add_outlined,
                      size: 24,
                      color: Color(0xFF756E87),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // ==========================================================================
  // STEP 5: REVIEW
  // ==========================================================================
  Widget _buildStep5Review() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Top Banner
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 14),
          decoration: BoxDecoration(
            color: const Color(0xFFE8DEF8),
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.check_rounded, color: Color(0xFF5B33A7), size: 16),
              SizedBox(width: 8),
              Text(
                'Semua Data Wajib terisi dengan lengkap!',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFF341B5C),
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 16),

        // Summary Table Card
        Container(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: const Color(0xFFE2D6EE)),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF5B33A7).withValues(alpha: 0.04),
                blurRadius: 10,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            children: [
              _buildReviewRow('Kategori', 'Medis'),
              _buildReviewRow('Judul', _titleController.text.trim()),
              _buildReviewRow('Target Dana', 'Rp ${_targetController.text.trim()}'),
              _buildReviewRow('Durasi', '5 hari'),
              _buildReviewRow('Lokasi', _locationController.text.trim()),
              _buildReviewRow('Pasien', '${_patientNameController.text.trim()} / ${_patientAgeController.text.trim()}'),
              _buildReviewRow('Rumah Sakit', _hospitalController.text.trim()),
              _buildReviewRow('Diagnosa', 'Tetralogy Of Fallot (TOF)'),
              _buildReviewRow('Dokumen', '2 file valid'),
              _buildReviewRow('Gambar', '5 foto valid'),
              _buildReviewRow('Pencairan', _selectedPaymentMethod),
            ],
          ),
        ),

        const SizedBox(height: 18),

        // Agreement Checkboxes
        _buildCheckboxRow(
          value: _agreeRelevance,
          text: 'Data yang saya isi sangat relevan dan sesuai untuk mengajukan galang dana',
          onChanged: (val) {
            setState(() {
              _agreeRelevance = val ?? false;
            });
          },
        ),
        const SizedBox(height: 8),
        _buildCheckboxRow(
          value: _agreeValid,
          text: 'Gambar dan dokumen yang saya lampirkan valid',
          onChanged: (val) {
            setState(() {
              _agreeValid = val ?? false;
            });
          },
        ),
        const SizedBox(height: 8),
        _buildCheckboxRow(
          value: _agreeTerms,
          text: 'Saya setuju dengan S&K dan wajib membuat laporan LPJ',
          onChanged: (val) {
            setState(() {
              _agreeTerms = val ?? false;
            });
          },
        ),

        const SizedBox(height: 14),
      ],
    );
  }

  Widget _buildReviewRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Text(
              label,
              style: const TextStyle(
                fontSize: 11.5,
                color: Color(0xFF756E87),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              value,
              textAlign: TextAlign.right,
              style: const TextStyle(
                fontSize: 11.5,
                fontWeight: FontWeight.w700,
                color: Color(0xFF261943),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCheckboxRow({
    required bool value,
    required String text,
    required ValueChanged<bool?> onChanged,
  }) {
    return GestureDetector(
      onTap: () => onChanged(!value),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 22,
            height: 22,
            child: Checkbox(
              value: value,
              onChanged: onChanged,
              activeColor: const Color(0xFF5B33A7),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w600,
                color: Color(0xFF341B5C),
                height: 1.35,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ==========================================================================
  // HELPER WIDGETS
  // ==========================================================================
  Widget _buildFormFieldLabel(String label) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6.0),
      child: Text(
        label,
        style: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w700,
          color: Color(0xFF341B5C),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String hintText,
    String? prefixText,
    Widget? prefixIcon,
    int maxLines = 1,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color(0xFFD6C8E6)),
      ),
      child: TextField(
        controller: controller,
        maxLines: maxLines,
        keyboardType: keyboardType,
        style: const TextStyle(
          fontSize: 12.5,
          fontWeight: FontWeight.w600,
          color: Color(0xFF261943),
        ),
        decoration: InputDecoration(
          isDense: true,
          hintText: hintText,
          prefixText: prefixText,
          prefixIcon: prefixIcon,
          hintStyle: const TextStyle(
            fontSize: 12,
            color: Color(0xFFA197B0),
            fontWeight: FontWeight.normal,
          ),
          prefixStyle: const TextStyle(
            fontSize: 12.5,
            fontWeight: FontWeight.w700,
            color: Color(0xFF261943),
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
          border: InputBorder.none,
        ),
      ),
    );
  }

  Widget _buildDateBox(String dateText, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 11),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: const Color(0xFFD6C8E6)),
        ),
        child: Row(
          children: [
            const Icon(
              Icons.calendar_today_rounded,
              size: 15,
              color: Color(0xFF756E87),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                dateText,
                style: const TextStyle(
                  fontSize: 11.5,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF261943),
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const Icon(
              Icons.arrow_drop_down_rounded,
              size: 18,
              color: Color(0xFF756E87),
            ),
          ],
        ),
      ),
    );
  }

  /// Bottom action bar with "Halaman sebelumnya" and "Halaman Berikutnya" (or "Setuju dan Lanjutkan")
  Widget _buildBottomActionBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Color(0x0C000000),
            blurRadius: 10,
            offset: Offset(0, -3),
          ),
        ],
      ),
      child: _currentStep == 5
          ? Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ElevatedButton(
                  onPressed: (_agreeRelevance && _agreeValid && _agreeTerms)
                      ? _nextStep
                      : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF5B33A7),
                    foregroundColor: Colors.white,
                    minimumSize: const Size(double.infinity, 44),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    'Setuju dan Lanjutkan',
                    style: TextStyle(
                      fontSize: 13.5,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                ElevatedButton(
                  onPressed: _prevStep,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFDCD2EA),
                    foregroundColor: const Color(0xFF261943),
                    minimumSize: const Size(double.infinity, 44),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    'Kembali',
                    style: TextStyle(
                      fontSize: 13.5,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            )
          : Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: _currentStep > 1 ? _prevStep : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFE9DCF8),
                      foregroundColor: const Color(0xFF341B5C),
                      disabledBackgroundColor: const Color(0xFFF3ECFA),
                      disabledForegroundColor: const Color(0xFFA699B8),
                      elevation: 0,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text(
                      'Halaman sebelumnya',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: ElevatedButton(
                    onPressed: _nextStep,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF5B33A7),
                      foregroundColor: Colors.white,
                      elevation: 2,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text(
                      'Halaman Berikutnya',
                      style: TextStyle(
                        fontSize: 12,
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

  String _getMonthName(int month) {
    const months = [
      'Januari',
      'Februari',
      'Maret',
      'April',
      'Mei',
      'Juni',
      'Juli',
      'Agustus',
      'September',
      'Oktober',
      'November',
      'Desember',
    ];
    if (month >= 1 && month <= 12) {
      return months[month - 1];
    }
    return '';
  }
}
