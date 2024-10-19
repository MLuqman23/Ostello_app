import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ostello/assets_image/image.dart';
import 'package:ostello/const/screen_size.dart';
import 'package:ostello/provider/navigation_provide.dart';

class CustomAppBar extends ConsumerWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppBar(
      backgroundColor: Colors.white,
      leading: IconButton(
          onPressed: () {
            ref.read(navigationProvider.notifier).goBack();
          },
          icon: const Icon(Icons.arrow_back, color: Colors.black)),
      title: Row(
        children: [
          SizedBox(
            width: ResponsiveHelper.width(55),
          ),
          Image.asset(
            AssetsImages.appbar,
            height: ResponsiveHelper.height(28),
            fit: BoxFit.cover,
          ),
          SizedBox(
            width: ResponsiveHelper.width(10),
          ),
          Text('OSTELLO',
              style: TextStyle(
                  fontSize: ResponsiveHelper.fontSize(24),
                  fontWeight: FontWeight.w700,
                  color: const Color(0xff7D23E0),
                  overflow: TextOverflow.ellipsis))
        ],
      ),
    );
  }
}
