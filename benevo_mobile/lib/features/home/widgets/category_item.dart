import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final String title;
  final IconData? icon;
  final Widget? customIcon;
  final Color iconColor;
  final Color backgroundColor;
  final VoidCallback? onTap;

  const CategoryItem({
    super.key,
    required this.title,
    this.icon,
    this.customIcon,
    this.iconColor = const Color(0xFF5B33A7),
    this.backgroundColor = Colors.white,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: 66,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.05),
                    blurRadius: 6,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Center(
                child: customIcon ?? buildIllustratedCategoryIcon(title, fallbackIcon: icon),
              ),
            ),
            const SizedBox(height: 5),
            Text(
              title,
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 9.8,
                fontWeight: FontWeight.w700,
                color: Color(0xFF2C2438),
                height: 1.15,
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Widget buildIllustratedCategoryIcon(String title, {IconData? fallbackIcon}) {
    const purple = Color(0xFF5B33A7);
    const yellow = Color(0xFFF6C744);

    switch (title) {
      case 'Bencana Alam':
        return Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              top: 5,
              right: 5,
              child: Container(
                width: 9,
                height: 9,
                decoration: const BoxDecoration(
                  color: yellow,
                  shape: BoxShape.circle,
                ),
              ),
            ),
            const Icon(Icons.flood_rounded, color: purple, size: 26),
          ],
        );
      case 'Balita & Anak Sakit':
        return Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: 26,
              height: 26,
              decoration: const BoxDecoration(
                color: Color(0xFFFEE685),
                shape: BoxShape.circle,
              ),
            ),
            const Icon(Icons.child_care_rounded, color: purple, size: 24),
            const Positioned(
              top: 5,
              right: 6,
              child: Icon(Icons.healing_rounded, color: yellow, size: 10),
            ),
          ],
        );
      case 'Bantuan & Medis':
        return const Stack(
          alignment: Alignment.center,
          children: [
            Icon(Icons.medical_services_rounded, color: purple, size: 24),
            Positioned(
              top: 4,
              right: 5,
              child: Icon(Icons.favorite_rounded, color: yellow, size: 12),
            ),
          ],
        );
      case 'Bantuan Pendidikan':
        return const Stack(
          alignment: Alignment.center,
          children: [
            Icon(Icons.school_rounded, color: purple, size: 25),
            Positioned(
              bottom: 4,
              right: 5,
              child: Icon(Icons.auto_stories_rounded, color: yellow, size: 12),
            ),
          ],
        );
      case 'Lingkungan':
        return Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              top: 5,
              right: 6,
              child: Container(
                width: 9,
                height: 9,
                decoration: const BoxDecoration(
                  color: yellow,
                  shape: BoxShape.circle,
                ),
              ),
            ),
            const Icon(Icons.eco_rounded, color: purple, size: 25),
          ],
        );
      case 'Kegiatan Sosial':
        return const Stack(
          alignment: Alignment.center,
          children: [
            Icon(Icons.inventory_2_rounded, color: purple, size: 24),
            Positioned(
              top: 4,
              right: 5,
              child: Icon(Icons.favorite_rounded, color: yellow, size: 12),
            ),
          ],
        );
      case 'Infrastruktur Umum':
        return Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              top: 6,
              child: Container(
                width: 22,
                height: 3,
                decoration: BoxDecoration(
                  color: yellow,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
            const Icon(Icons.domain_rounded, color: purple, size: 24),
          ],
        );
      case 'Karya Kreatif & Usaha':
      case 'Karya Kreatif & Modal Usaha':
        return const Stack(
          alignment: Alignment.center,
          children: [
            Icon(Icons.lightbulb_rounded, color: yellow, size: 27),
            Icon(Icons.auto_awesome_rounded, color: purple, size: 13),
          ],
        );
      case 'Panti Asuhan':
        return const Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              top: 3,
              child: Icon(Icons.roofing_rounded, color: yellow, size: 26),
            ),
            Positioned(
              bottom: 4,
              child: Icon(Icons.groups_rounded, color: purple, size: 21),
            ),
          ],
        );
      case 'Tempat Ibadah':
        return const Stack(
          alignment: Alignment.center,
          children: [
            Icon(Icons.mosque_rounded, color: purple, size: 24),
            Positioned(
              top: 4,
              right: 6,
              child: Icon(Icons.star_rounded, color: yellow, size: 11),
            ),
          ],
        );
      case 'Menolong Hewan':
        return const Stack(
          alignment: Alignment.center,
          children: [
            Icon(Icons.pets_rounded, color: purple, size: 24),
            Positioned(
              top: 5,
              right: 5,
              child: Icon(Icons.pets_rounded, color: yellow, size: 12),
            ),
          ],
        );
      case 'Difabel':
        return Stack(
          alignment: Alignment.center,
          children: [
            const Icon(Icons.accessible_forward_rounded, color: purple, size: 25),
            Positioned(
              bottom: 6,
              right: 6,
              child: Container(
                width: 12,
                height: 12,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: yellow, width: 2.2),
                ),
              ),
            ),
          ],
        );
      default:
        return Icon(fallbackIcon ?? Icons.category_rounded, color: purple, size: 24);
    }
  }
}
