import 'package:flutter/material.dart';
import '../../../core/constants/colors.dart';

class SecondaryCampaignCard extends StatelessWidget {
  final String title;
  final String category;
  final String imageUrl;
  final double currentAmount;
  final double targetAmount;
  final String daysLeft;
  final VoidCallback? onTap;

  const SecondaryCampaignCard({
    super.key,
    required this.title,
    required this.category,
    required this.imageUrl,
    required this.currentAmount,
    required this.targetAmount,
    required this.daysLeft,
    this.onTap,
  });

  String _formatCurrency(double amount) {
    final int val = amount.toInt();
    final parts = val.toString().replaceAllMapped(
          RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
          (Match m) => '${m[1]}.',
        );
    return 'RP $parts';
  }

  @override
  Widget build(BuildContext context) {
    final double progress = (currentAmount / targetAmount).clamp(0.0, 1.0);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 170,
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
            // Image with Tag
            ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
              child: Stack(
                children: [
                  Image.network(
                    imageUrl,
                    height: 105,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Container(
                      height: 105,
                      color: const Color(0xFFDDD7EC),
                      child: const Center(
                        child: Icon(
                          Icons.image_outlined,
                          color: AppColors.primaryLight,
                          size: 32,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 6,
                    left: 6,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFDE87B),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        category,
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
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title
                  Text(
                    title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 11.5,
                      fontWeight: FontWeight.w700,
                      color: AppColors.textPrimary,
                      height: 1.25,
                    ),
                  ),
                  const SizedBox(height: 8),

                  // Progress Bar
                  ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: LinearProgressIndicator(
                      value: progress,
                      minHeight: 5,
                      backgroundColor: const Color(0xFFEDE9F5),
                      valueColor: const AlwaysStoppedAnimation<Color>(
                        AppColors.primary,
                      ),
                    ),
                  ),
                  const SizedBox(height: 6),

                  // Progress & Target Info
                  Text(
                    'Terkumpul',
                    style: TextStyle(
                      fontSize: 9.5,
                      color: AppColors.textSecondary.withValues(alpha: 0.8),
                    ),
                  ),
                  Text(
                    '${_formatCurrency(currentAmount)} / ${_formatCurrency(targetAmount).replaceAll('RP ', '')}',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 9.5,
                      fontWeight: FontWeight.w700,
                      color: AppColors.primary,
                    ),
                  ),
                  const SizedBox(height: 4),

                  // Days Left
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      daysLeft,
                      style: const TextStyle(
                        fontSize: 9,
                        fontWeight: FontWeight.w500,
                        color: AppColors.textSecondary,
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
