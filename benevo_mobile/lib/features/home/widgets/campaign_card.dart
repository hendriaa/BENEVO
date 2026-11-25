import 'package:flutter/material.dart';
import '../../../core/constants/colors.dart';

class SecondaryCampaignCard extends StatelessWidget {
  final String title;
  final String? category;
  final String? tag;
  final String? imageUrl;
  final String? imageAsset;
  final double currentAmount;
  final double targetAmount;
  final String? statusLabel;
  final String? rightLabel;
  final String? rightValue;
  final String daysLeft;
  final VoidCallback? onTap;

  const SecondaryCampaignCard({
    super.key,
    required this.title,
    this.category,
    this.tag,
    this.imageUrl,
    this.imageAsset,
    required this.currentAmount,
    required this.targetAmount,
    this.statusLabel,
    this.rightLabel,
    this.rightValue,
    this.daysLeft = '',
    this.onTap,
  });

  String _formatNumber(double amount) {
    final int val = amount.toInt();
    return val.toString().replaceAllMapped(
          RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
          (Match m) => '${m[1]}.',
        );
  }

  Widget _buildImage() {
    const double imgHeight = 98.0;

    if (imageAsset != null && imageAsset!.isNotEmpty) {
      return Image.asset(
        imageAsset!,
        height: imgHeight,
        width: double.infinity,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) => _buildPlaceholder(imgHeight),
      );
    }

    if (imageUrl != null && imageUrl!.startsWith('assets/')) {
      return Image.asset(
        imageUrl!,
        height: imgHeight,
        width: double.infinity,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) => _buildPlaceholder(imgHeight),
      );
    }

    if (imageUrl != null && imageUrl!.isNotEmpty) {
      return Image.network(
        imageUrl!,
        height: imgHeight,
        width: double.infinity,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) => _buildPlaceholder(imgHeight),
      );
    }

    return _buildPlaceholder(imgHeight);
  }

  Widget _buildPlaceholder(double height) {
    return Container(
      height: height,
      color: const Color(0xFFDDD7EC),
      child: const Center(
        child: Icon(
          Icons.image_outlined,
          color: AppColors.primaryLight,
          size: 32,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final double progress = targetAmount > 0
        ? (currentAmount / targetAmount).clamp(0.0, 1.0)
        : 0.0;
    final displayTag = tag ?? category ?? 'Darurat';

    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: AppColors.primary.withValues(alpha: 0.08),
              blurRadius: 14,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image with Tag Overlay
            ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
              child: Stack(
                children: [
                  _buildImage(),
                  Positioned(
                    bottom: 6,
                    left: 6,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2.5),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFDE87B),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        displayTag,
                        style: const TextStyle(
                          fontSize: 8.5,
                          fontWeight: FontWeight.w800,
                          color: Color(0xFF4A3B05),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(10, 8, 10, 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title
                  Text(
                    title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 10.8,
                      fontWeight: FontWeight.w800,
                      color: Color(0xFF221A33),
                      height: 1.22,
                    ),
                  ),
                  const SizedBox(height: 7),

                  // Label Row: Left (Terkumpul / Tersedia) & Right (Sisa Hari)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        statusLabel ?? 'Terkumpul',
                        style: const TextStyle(
                          fontSize: 8.5,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF867D97),
                        ),
                      ),
                      if (rightLabel != null)
                        Text(
                          rightLabel!,
                          style: const TextStyle(
                            fontSize: 8.5,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF867D97),
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(height: 2),

                  // Value Row: Left (121.000.000 / 150.000.000) & Right (8)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          '${_formatNumber(currentAmount)} / ${_formatNumber(targetAmount)}',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 9.3,
                            fontWeight: FontWeight.w800,
                            color: Color(0xFF381F66),
                          ),
                        ),
                      ),
                      if (rightValue != null || daysLeft.isNotEmpty)
                        Padding(
                          padding: const EdgeInsets.only(left: 4),
                          child: Text(
                            rightValue ?? daysLeft,
                            style: const TextStyle(
                              fontSize: 9.3,
                              fontWeight: FontWeight.w800,
                              color: Color(0xFF381F66),
                            ),
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(height: 6),

                  // Progress Bar (placed at bottom)
                  ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: LinearProgressIndicator(
                      value: progress,
                      minHeight: 4.5,
                      backgroundColor: const Color(0xFFEDE8F6),
                      valueColor: const AlwaysStoppedAnimation<Color>(
                        Color(0xFF502E88),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
