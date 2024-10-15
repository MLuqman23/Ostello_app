import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ostello/assets_image/image.dart';
import 'package:ostello/common/plaintext.dart';
import 'package:ostello/presentation/home.dart';

final currentIndexProvider = StateProvider<int>((ref) => 0);

class AppNavigator extends ConsumerWidget {
  const AppNavigator({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(currentIndexProvider);

    final List<Widget> screens = [
      const HomePage(),
      const HomePage(),
      const HomePage(),
      const HomePage(),
      const HomePage(),
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Image.asset(AssetsImages.drawer),
        title: Container(
            width: 118.w,
            height: 35.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: const Color(0xffE2C7FF), width: 0.5),
              color: const Color(0xffFFFFFF),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomText(
                  text: '12th IIT JEE',
                  fontSize: 11,
                  fontWeight: FontWeight.w800,
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  color: Color(0xff7D23E0),
                  size: 12,
                )
              ],
            )),
        actions: [
          Container(
              width: 85.w,
              height: 35.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: const Color(0xffC7A5EB), width: 1),
                color: const Color(0xffFAF6FF),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset(AssetsImages.coin),
                  const CustomText(
                    text: '300',
                    fontSize: 12,
                    fontWeight: FontWeight.w800,
                  ),
                ],
              )),
          const SizedBox(
            width: 20,
          )
        ],
      ),
      body: screens[currentIndex],
      bottomNavigationBar: SizedBox(
        height: 75,
        child: BottomNavigationBar(
          selectedLabelStyle:
              const TextStyle(fontSize: 9, fontWeight: FontWeight.w700),
          unselectedLabelStyle:
              const TextStyle(fontSize: 9, fontWeight: FontWeight.w800),
          backgroundColor: Colors.white,
          selectedItemColor: const Color(0xff7D23E0),
          unselectedItemColor: const Color(0xff7C7C7C),
          currentIndex: currentIndex,
          onTap: (index) {
            ref.read(currentIndexProvider.notifier).state = index;
          },
          showSelectedLabels: true,
          showUnselectedLabels: true,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon: currentIndex == 0
                  ? Container(
                      height: 35,
                      width: 35,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: Color(0xffF6EDFF)),
                      child: const Icon(Icons.home_filled))
                  : const Icon(
                      Icons.home_filled,
                    ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: currentIndex == 1
                  ? Container(
                      height: 35,
                      width: 35,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: Color(0xffF6EDFF)),
                      child: Image.asset(AssetsImages.schedule))
                  : Image.asset(AssetsImages.schedule),
              label: 'Schedule',
            ),
            BottomNavigationBarItem(
              icon: currentIndex == 2
                  ? Container(
                      height: 35,
                      width: 35,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: Color(0xffF6EDFF)),
                      child: Image.asset(AssetsImages.content))
                  : Image.asset(AssetsImages.content),
              label: 'Content',
            ),
            BottomNavigationBarItem(
              icon: currentIndex == 3
                  ? Container(
                      height: 35,
                      width: 35,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: Color(0xffF6EDFF)),
                      child: Image.asset(AssetsImages.batches))
                  : Image.asset(AssetsImages.batches),
              label: 'Batches',
            ),
            BottomNavigationBarItem(
              icon: currentIndex == 4
                  ? Container(
                      height: 35,
                      width: 35,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: Color(0xffF6EDFF)),
                      child: const Icon(Icons.bubble_chart))
                  : const Icon(
                      Icons.bubble_chart_outlined,
                    ),
              label: 'Ai Tutor',
            ),
          ],
        ),
      ),
    );
  }
}
