import 'package:flutter/material.dart';
import '../widgets/payout_method_dropdown.dart';
import 'fundraiser_success_screen.dart';
import 'other_category_select_screen.dart';

/// Form screen for non-medical fundraiser categories (e.g. Bencana Alam, Pendidikan, dll)
/// Matching media_1793032636381_835bf20c.png and media_1793032668834_018a1d36.png
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

  // ── Step 1: Tujuan Controllers ──
  late final TextEditingController _campaignTitleController;
  final TextEditingController _targetController = TextEditingController(
    text: 'Rp 69.000.000',
  );
  String _startDate = '05/11/2026';
  String _endDate = '25/11/2026';
  final TextEditingController _locationController = TextEditingController(
    text: 'Teyvat, Fontaine',
  );
  final TextEditingController _recipientController = TextEditingController(
    text: 'Warga Korban Banjir Fontaine',
  );
  final TextEditingController _narrativeController = TextEditingController(
    text:
        'Pada malam tanggal 30/10/2026 telah terjadi banjir bandang yang merendam pemukiman warga desa Fontaine. Banyak rumah warga yang hanyut terbawa arus deras, persawahan rusak parah, dan infrastruktur desa hancur. Warga desa Fontaine membutuhkan uluran tangan kita untuk bangkit kembali dari musibah ini. Donasi yang terkumpul akan dialokasikan untuk kebutuhan mendesak seperti makanan, selimut, pakaian, obat-obatan, serta perbaikan rumah warga...',
  );

  // ── Step 2: Rencana Controllers ──
  final List<Map<String, String>> _expenseList = [
    {
      'title': 'Logistik dan Sembako',
      'amount': 'Rp  30.000.000',
    },
    {
      'title': 'Obat-obatan & Medis Tanggap',
      'amount': 'Rp  21.000.000',
    },
    {
      'title': 'Tenda Tempat Tinggal Sementara',
      'amount': 'Rp  18.000.000',
    },
  ];

  String _selectedPayoutMethod = 'Mandiri (VA)';
  final TextEditingController _accountNumberController = TextEditingController(
    text: '9000 0210 5876 2052',
  );
  final TextEditingController _accountHolderController = TextEditingController(
    text: 'Wina Fikria',
  );

  // ── Step 3: Dokumen State ──
  final List<String> _proofImages = [
    'assets/images/campaigns/s2_banjir.png',
    'assets/images/campaigns/s2_karhutla.png',
    'assets/images/campaigns/s2_ntt.png',
    'assets/images/campaigns/c1_jalan.png',
    'assets/images/campaigns/s2_anak_ntt.png',
  ];

  // ── Step 4: Agreement Checkboxes ──
  bool _agreeRelevance = true;
  bool _agreeValidity = true;
  bool _agreeTerms = true;

  @override
  void initState() {
    super.initState();
    final defaultTitle = widget.category.name == 'Bencana Alam'
        ? 'Bantu Korban Banjir Bandang Fontaine'
        : 'Bantu ${widget.category.name} Peduli Sesama';
    _campaignTitleController = TextEditingController(text: defaultTitle);
  }

  @override
  void dispose() {
    _campaignTitleController.dispose();
    _targetController.dispose();
    _locationController.dispose();
    _recipientController.dispose();
    _narrativeController.dispose();
    _accountNumberController.dispose();
    _accountHolderController.dispose();
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
          campaignTitle: _campaignTitleController.text.isNotEmpty
              ? _campaignTitleController.text
              : 'Banjir Bandang Fontaine',
        ),
      ),
    );
  }

  Future<void> _pickDate(bool isStart) async {
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
      final formatted =
          '${picked.day.toString().padLeft(2, '0')}/${picked.month.toString().padLeft(2, '0')}/${picked.year}';
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
          widget.category.name,
          style: const TextStyle(
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
            // 1. Horizontal Stepper
            _buildStepper(),

            // 2. Scrollable Body
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 16.0),
                child: _buildCurrentStepContent(),
              ),
            ),

            // 3. Bottom Action Buttons
            _buildBottomButtons(),
          ],
        ),
      ),
    );
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // Stepper Header: (1) Tujuan --- (2) Rencana --- (3) Dokumen --- (4) Review
  // ═══════════════════════════════════════════════════════════════════════════
  Widget _buildStepper() {
    const stepNames = ['Tujuan', 'Rencana', 'Dokumen', 'Review'];
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(color: Color(0xFFEFEAF6), width: 1.0),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(stepNames.length, (index) {
          final stepNum = index + 1;
          final isActive = stepNum == _currentStep;
          final isPast = stepNum < _currentStep;

          return Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Circle Node
              Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isActive || isPast
                      ? const Color(0xFF5B33A7)
                      : const Color(0xFFE9E4F0),
                ),
                alignment: Alignment.center,
                child: isPast
                    ? const Icon(
                        Icons.check_rounded,
                        size: 14,
                        color: Colors.white,
                      )
                    : Text(
                        '$stepNum',
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w700,
                          color: isActive
                              ? Colors.white
                              : const Color(0xFF887D9C),
                        ),
                      ),
              ),
              const SizedBox(width: 5),

              // Step Title
              Text(
                stepNames[index],
                style: TextStyle(
                  fontSize: 11.5,
                  fontWeight: isActive ? FontWeight.w800 : FontWeight.w600,
                  color: isActive
                      ? const Color(0xFF5B33A7)
                      : const Color(0xFF756C8A),
                ),
              ),

              // Connecting line
              if (index < stepNames.length - 1)
                Container(
                  width: 18,
                  height: 1.5,
                  margin: const EdgeInsets.symmetric(horizontal: 6),
                  color: isPast
                      ? const Color(0xFF5B33A7)
                      : const Color(0xFFD6CDDC),
                ),
            ],
          );
        }),
      ),
    );
  }

  Widget _buildCurrentStepContent() {
    switch (_currentStep) {
      case 1:
        return _buildStep1Tujuan();
      case 2:
        return _buildStep2Rencana();
      case 3:
        return _buildStep3Dokumen();
      case 4:
        return _buildStep4Review();
      default:
        return const SizedBox.shrink();
    }
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // STEP 1: Tujuan Penggalangan Dana
  // ═══════════════════════════════════════════════════════════════════════════
  Widget _buildStep1Tujuan() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Section Header
        const Text(
          'Tujuan Penggalangan Dana*',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w800,
            color: Color(0xFF261943),
          ),
        ),
        const SizedBox(height: 14),

        // Judul Kampanye
        _buildFieldLabel('Judul Kampanye*'),
        const SizedBox(height: 6),
        _buildInputField(
          controller: _campaignTitleController,
          hintText: 'Minimal 10 karakter',
        ),
        const SizedBox(height: 14),

        // Target Dana
        _buildFieldLabel('Target Dana*'),
        const SizedBox(height: 6),
        _buildInputField(
          controller: _targetController,
          hintText: 'Nominal minimal',
          keyboardType: TextInputType.number,
        ),
        const SizedBox(height: 14),

        // Mulai & Selesai (Row)
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildFieldLabel('Mulai*'),
                  const SizedBox(height: 6),
                  _buildDateField(
                    value: _startDate,
                    onTap: () => _pickDate(true),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildFieldLabel('Selesai*'),
                  const SizedBox(height: 6),
                  _buildDateField(
                    value: _endDate,
                    onTap: () => _pickDate(false),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 14),

        // Lokasi Kejadian
        _buildFieldLabel('Lokasi Kejadian*'),
        const SizedBox(height: 6),
        _buildInputField(
          controller: _locationController,
          hintText: 'Provinsi, Kabupaten/Kota',
        ),
        const SizedBox(height: 14),

        // Penerima Donasi
        _buildFieldLabel('Penerima Donasi*'),
        const SizedBox(height: 6),
        _buildInputField(
          controller: _recipientController,
          hintText: 'Nama Individu, kelompok, atau lembaga penerima',
        ),
        const SizedBox(height: 14),

        // Narasi Penggalangan Dana
        _buildFieldLabel('Narasi Penggalangan Dana*'),
        const SizedBox(height: 6),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: const Color(0xFFD6CDDC)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TextFormField(
                controller: _narrativeController,
                maxLines: 5,
                minLines: 4,
                onChanged: (_) => setState(() {}),
                style: const TextStyle(
                  fontSize: 12.5,
                  color: Color(0xFF261943),
                  height: 1.4,
                ),
                decoration: const InputDecoration(
                  hintText: 'Menceritakan rincian untuk penggalangan dana',
                  hintStyle: TextStyle(
                    fontSize: 12,
                    color: Color(0xFFACA1BA),
                  ),
                  contentPadding: EdgeInsets.all(12),
                  border: InputBorder.none,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10, bottom: 8),
                child: Text(
                  '${_narrativeController.text.length}/1000',
                  style: const TextStyle(
                    fontSize: 10,
                    color: Color(0xFF887D9C),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 18),

        // Catatan Banner
        _buildWarningBanner(
          text:
              'Catatan: Perubahan kategori di langkah berikutnya akan mereset form data penerima manfaat dan prasyarat dokumen wajib yang telah diisi.',
        ),
        const SizedBox(height: 10),
      ],
    );
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // STEP 2: Rencana Penggalangan Dana
  // ═══════════════════════════════════════════════════════════════════════════
  Widget _buildStep2Rencana() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Header Row: Title + Add Button
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Rencana Penggalangan Dana*',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w800,
                color: Color(0xFF261943),
              ),
            ),
            InkWell(
              borderRadius: BorderRadius.circular(8),
              onTap: _showAddExpenseDialog,
              child: Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  color: const Color(0xFF5B33A7),
                  borderRadius: BorderRadius.circular(8),
                ),
                alignment: Alignment.center,
                child: const Icon(
                  Icons.add_rounded,
                  color: Colors.white,
                  size: 20,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 14),

        // Expense Items List
        ...List.generate(_expenseList.length, (index) {
          final item = _expenseList[index];
          return Container(
            margin: const EdgeInsets.only(bottom: 10),
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
            decoration: BoxDecoration(
              color: const Color(0xFFF6F2FA),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: const Color(0xFFE4DFEC)),
            ),
            child: Row(
              children: [
                // Left Column: Item label & description
                Expanded(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Pengeluaran #${index + 1}',
                        style: const TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF5B33A7),
                        ),
                      ),
                      const SizedBox(height: 3),
                      Text(
                        item['title'] ?? '',
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF261943),
                        ),
                      ),
                    ],
                  ),
                ),

                // Right Column: Amount & Delete Button
                Expanded(
                  flex: 2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        item['amount'] ?? 'Rp 0',
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF261943),
                        ),
                      ),
                      const SizedBox(width: 8),
                      GestureDetector(
                        onTap: () {
                          if (_expenseList.length > 1) {
                            setState(() {
                              _expenseList.removeAt(index);
                            });
                          }
                        },
                        child: const Icon(
                          Icons.delete_outline_rounded,
                          size: 18,
                          color: Color(0xFF887D9C),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }),

        const SizedBox(height: 20),

        // Section: Metode Pencairan Dana
        const Text(
          'Metode Pencairan Dana*',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w800,
            color: Color(0xFF261943),
          ),
        ),
        const SizedBox(height: 12),

        // Payout Method Selector Dropdown (matching media_1793034090387_f0a70fb3.png)
        PayoutMethodDropdown(
          selectedMethod: _selectedPayoutMethod,
          onChanged: (newMethod) {
            setState(() {
              _selectedPayoutMethod = newMethod;
            });
          },
        ),
        const SizedBox(height: 14),

        // Virtual Account / E-Wallet Number
        _buildFieldLabel('Virtual Account / Nomor E-wallet*'),
        const SizedBox(height: 6),
        _buildInputField(
          controller: _accountNumberController,
          hintText: 'Isi dengan nomor...',
          keyboardType: TextInputType.number,
        ),
        const SizedBox(height: 14),

        // Account Holder Name
        _buildFieldLabel('Nama pemilik metode pembayaran*'),
        const SizedBox(height: 6),
        _buildInputField(
          controller: _accountHolderController,
          hintText: 'Nama sesuai KTP',
        ),
        const SizedBox(height: 4),
        const Text(
          'Nama sesuai KTP',
          style: TextStyle(
            fontSize: 10.5,
            color: Color(0xFF887D9C),
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // STEP 3: Dokumen
  // ═══════════════════════════════════════════════════════════════════════════
  Widget _buildStep3Dokumen() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 1. Dokumentasi Gambar Bukti
        Row(
          children: [
            const Text(
              'Dokumentasi gambar Bukti*',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w800,
                color: Color(0xFF261943),
              ),
            ),
            const SizedBox(width: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
              decoration: BoxDecoration(
                color: const Color(0xFFEDE7F6),
                borderRadius: BorderRadius.circular(4),
              ),
              child: const Text(
                'INFO',
                style: TextStyle(
                  fontSize: 9.5,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFF5B33A7),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),

        // Image Grid of Proofs (matching Screen 7)
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: const Color(0xFFF7F4FB),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: const Color(0xFFE4DFEC)),
          ),
          child: Column(
            children: [
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  childAspectRatio: 1.25,
                ),
                itemCount: _proofImages.length + 1,
                itemBuilder: (context, index) {
                  if (index < _proofImages.length) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          Image.asset(
                            _proofImages[index],
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) => Container(
                              color: const Color(0xFFD6CDDC),
                              child: const Icon(
                                Icons.image_rounded,
                                color: Color(0xFF5B33A7),
                              ),
                            ),
                          ),
                          Positioned(
                            top: 4,
                            right: 4,
                            child: Container(
                              padding: const EdgeInsets.all(2),
                              decoration: const BoxDecoration(
                                color: Colors.black54,
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.check_rounded,
                                size: 12,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  } else {
                    // Add more photo button
                    return Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: const Color(0xFF5B33A7),
                          style: BorderStyle.solid,
                          width: 1.0,
                        ),
                      ),
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.add_photo_alternate_rounded,
                            color: Color(0xFF5B33A7),
                            size: 22,
                          ),
                          SizedBox(height: 2),
                          Text(
                            'Tambah',
                            style: TextStyle(
                              fontSize: 9.5,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF5B33A7),
                            ),
                          ),
                        ],
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
        const SizedBox(height: 6),
        const Text(
          'Pastikan Gambar yang dicantumkan memiliki Timestamp Keseluruhan.',
          style: TextStyle(
            fontSize: 10.5,
            color: Color(0xFF887D9C),
          ),
        ),
        const SizedBox(height: 18),

        // 2. Foto KTP dan KK Penanggung Jawab
        _buildFieldLabel('Foto KTP dan KK Penanggung Jawab*  (2/2)'),
        const SizedBox(height: 6),
        _buildUploadCard(
          text: 'Foto jelas, tidak buram, semua data terbaca',
          isUploaded: true,
        ),
        const SizedBox(height: 16),

        // 3. Tambahkan Dokumen Pendukung
        _buildFieldLabel('Tambahkan Dokumen Pendukung'),
        const SizedBox(height: 6),
        _buildUploadCard(
          text: 'Foto jelas, tidak buram, semua data terbaca',
          isUploaded: true,
        ),
        const SizedBox(height: 20),

        // Warning banner
        _buildWarningBanner(
          text:
              'Pastikan berkas/dokumen/foto diupload sesuai dengan format yang telah ditentukan serta tidak ada unsur tindak kejahatan/manipulasi yang akan dipertanggungjawabkan melalui kurasi dalam 1 x 24 jam',
        ),
        const SizedBox(height: 10),
      ],
    );
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // STEP 4: Review (Screen 1 in Image 2)
  // ═══════════════════════════════════════════════════════════════════════════
  Widget _buildStep4Review() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Top Banner: Checkmark with message
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
          decoration: BoxDecoration(
            color: const Color(0xFFEADBFA),
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.check_rounded,
                color: Color(0xFF5B33A7),
                size: 18,
              ),
              SizedBox(width: 6),
              Text(
                'Semua Data Wajib Terisi dengan Lengkap!',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF3B1E6D),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),

        // Summary Card
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: const Color(0xFFE4DFEC)),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF5B33A7).withValues(alpha: 0.05),
                blurRadius: 10,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            children: [
              _buildReviewRow('Kategori', widget.category.name),
              const Divider(height: 1, color: Color(0xFFEFEAF6)),
              _buildReviewRow(
                'Judul',
                _campaignTitleController.text.isNotEmpty
                    ? _campaignTitleController.text
                    : 'Banjir Bandang Fontaine',
              ),
              const Divider(height: 1, color: Color(0xFFEFEAF6)),
              _buildReviewRow('Target Dana', _targetController.text),
              const Divider(height: 1, color: Color(0xFFEFEAF6)),
              _buildReviewRow('Durasi', '20 Hari'),
              const Divider(height: 1, color: Color(0xFFEFEAF6)),
              _buildReviewRow('Lokasi', _locationController.text),
              const Divider(height: 1, color: Color(0xFFEFEAF6)),
              _buildReviewRow('Dokumen', '2 File Valid'),
              const Divider(height: 1, color: Color(0xFFEFEAF6)),
              _buildReviewRow('Gambar', '5 Foto/Video'),
              const Divider(height: 1, color: Color(0xFFEFEAF6)),
              _buildReviewPayoutRow(),
            ],
          ),
        ),
        const SizedBox(height: 18),

        // 3 Agreement Checkboxes
        _buildCheckboxRow(
          value: _agreeRelevance,
          text:
              'Data pengajuan ini sangat relevan dan sesuai untuk menyelesaikan sponsorship',
          onChanged: (val) => setState(() => _agreeRelevance = val ?? false),
        ),
        const SizedBox(height: 10),

        _buildCheckboxRow(
          value: _agreeValidity,
          text: 'Gambar dan dokumen yang dilampirkan telah valid',
          onChanged: (val) => setState(() => _agreeValidity = val ?? false),
        ),
        const SizedBox(height: 10),

        _buildCheckboxRow(
          value: _agreeTerms,
          text: 'Saya setuju dengan S&K dan wajib membuat laporan jika...',
          onChanged: (val) => setState(() => _agreeTerms = val ?? false),
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // Bottom Buttons: Row for Step 1,2,3; Stacked for Step 4
  // ═══════════════════════════════════════════════════════════════════════════
  Widget _buildBottomButtons() {
    if (_currentStep < 4) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        decoration: const BoxDecoration(
          color: Colors.white,
          border: Border(
            top: BorderSide(color: Color(0xFFEFEAF6), width: 1.0),
          ),
        ),
        child: Row(
          children: [
            // Left Button: Halaman sebelumnya
            Expanded(
              child: OutlinedButton(
                onPressed: _prevStep,
                style: OutlinedButton.styleFrom(
                  side:
                      const BorderSide(color: Color(0xFF5B33A7), width: 1.2),
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  'Halaman sebelumnya',
                  style: TextStyle(
                    fontSize: 12.5,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF5B33A7),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 12),

            // Right Button: Halaman Berikutnya
            Expanded(
              child: ElevatedButton(
                onPressed: _nextStep,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF5B33A7),
                  foregroundColor: Colors.white,
                  elevation: 1.5,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  'Halaman Berikutnya',
                  style: TextStyle(
                    fontSize: 12.5,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    } else {
      // Step 4: Vertical Stack (Setuju dan Lanjutkan, then Kembali)
      return Container(
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 16),
        decoration: const BoxDecoration(
          color: Colors.white,
          border: Border(
            top: BorderSide(color: Color(0xFFEFEAF6), width: 1.0),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              onPressed: _submitForm,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF5B33A7),
                foregroundColor: Colors.white,
                elevation: 2,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                'Setuju dan Lanjutkan',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: _prevStep,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFEDE7F6),
                foregroundColor: const Color(0xFF5B33A7),
                elevation: 0,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                'Kembali',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF5B33A7),
                ),
              ),
            ),
          ],
        ),
      );
    }
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // Helper Widgets & Modals
  // ═══════════════════════════════════════════════════════════════════════════
  Widget _buildFieldLabel(String label) {
    return Text(
      label,
      style: const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w700,
        color: Color(0xFF341B5C),
      ),
    );
  }

  Widget _buildInputField({
    required TextEditingController controller,
    required String hintText,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      style: const TextStyle(
        fontSize: 12.5,
        color: Color(0xFF261943),
      ),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(
          fontSize: 12,
          color: Color(0xFFACA1BA),
        ),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 14, vertical: 11),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Color(0xFFD6CDDC)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Color(0xFFD6CDDC)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Color(0xFF5B33A7), width: 1.4),
        ),
      ),
    );
  }

  Widget _buildDateField({
    required String value,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 11),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: const Color(0xFFD6CDDC)),
        ),
        child: Row(
          children: [
            const Icon(
              Icons.calendar_today_rounded,
              size: 15,
              color: Color(0xFF5B33A7),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                value,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF261943),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildUploadCard({
    required String text,
    required bool isUploaded,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 22, horizontal: 16),
      decoration: BoxDecoration(
        color: const Color(0xFFF6F2FA),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE4DFEC)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: const Color(0xFFEDE7F6),
              borderRadius: BorderRadius.circular(10),
            ),
            alignment: Alignment.center,
            child: const Icon(
              Icons.photo_camera_back_rounded,
              color: Color(0xFF5B33A7),
              size: 24,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            text,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 11.5,
              color: Color(0xFF887D9C),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWarningBanner({required String text}) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFFDE8E8),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color(0xFFF3C0C0)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 1.0),
            child: Icon(
              Icons.warning_amber_rounded,
              color: Color(0xFFD83B3B),
              size: 18,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 10.5,
                color: Color(0xFF751E28),
                height: 1.35,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildReviewRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 11),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: Color(0xFF756C8A),
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w700,
              color: Color(0xFF261943),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildReviewPayoutRow() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Pencairan',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: Color(0xFF756C8A),
            ),
          ),
          Row(
            children: [
              PayoutMethodLogo(method: _selectedPayoutMethod),
              const SizedBox(width: 8),
              Text(
                _selectedPayoutMethod,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF261943),
                ),
              ),
            ],
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
          Container(
            width: 20,
            height: 20,
            margin: const EdgeInsets.only(top: 2),
            decoration: BoxDecoration(
              color: value ? const Color(0xFF5B33A7) : Colors.white,
              borderRadius: BorderRadius.circular(5),
              border: Border.all(
                color: value
                    ? const Color(0xFF5B33A7)
                    : const Color(0xFFACA1BA),
                width: 1.5,
              ),
            ),
            alignment: Alignment.center,
            child: value
                ? const Icon(
                    Icons.check_rounded,
                    color: Colors.white,
                    size: 15,
                  )
                : null,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 11.5,
                fontWeight: FontWeight.w500,
                color: Color(0xFF341B5C),
                height: 1.35,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showAddExpenseDialog() {
    final titleCtrl = TextEditingController();
    final amountCtrl = TextEditingController();

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text(
          'Tambah Rencana Pengeluaran',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: titleCtrl,
              decoration: const InputDecoration(
                labelText: 'Keperluan',
                hintText: 'Misal: Tenda Darurat',
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: amountCtrl,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Nominal (Rp)',
                hintText: 'Misal: 10.000.000',
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: const Text('Batal'),
          ),
          ElevatedButton(
            onPressed: () {
              if (titleCtrl.text.isNotEmpty && amountCtrl.text.isNotEmpty) {
                setState(() {
                  _expenseList.add({
                    'title': titleCtrl.text,
                    'amount': 'Rp  ${amountCtrl.text}',
                  });
                });
                Navigator.of(ctx).pop();
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF5B33A7),
            ),
            child: const Text(
              'Simpan',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
