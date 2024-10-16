// ignore_for_file: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ostello/assets_image/image.dart';
import 'package:ostello/common/custom_container.dart';
import 'package:ostello/common/plaintext.dart';
import 'package:ostello/const/const_service.dart';
import 'package:ostello/provider/navigation_provide.dart';
import 'package:ostello/provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final PageController pageController = PageController();
    final selectedCourse = ref.watch(courseSelectionProvider);
    pageController.addListener(() {
      ref.read(currentPageProvider.notifier).state =
          pageController.page?.round() ?? 0;
    });

    final selectedIndex = ref.watch(selectedIndexProvider);
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 20.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 18.w,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                              width: 225.w,
                              height: 48.h,
                              child: TextField(
                                obscureText: false,
                                decoration: InputDecoration(
                                    filled: true,
                                    fillColor: const Color(0xffFCFCFC),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(15),
                                        borderSide: const BorderSide(
                                            color: Color(0xffF0E3FF))),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(15),
                                        borderSide: const BorderSide(
                                            color: Color(0xffF0E3FF))),
                                    hintText: "Search here...",
                                    hintStyle: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xff878487)),
                                    suffixIcon:
                                        Image.asset(AssetsImages.search)),
                              )),
                          const Spacer(),
                          CustomContainer(
                            height: 48.h,
                            width: 115.w,
                            decoration: BoxDecoration(
                                color: const Color(0xff7D23E0),
                                borderRadius: BorderRadius.circular(15.sp)),
                            child: const Center(
                                child: CustomText(
                              text: 'Study',
                              fontSize: 16,
                              fontWeight: FontWeight.w800,
                              color: Colors.white,
                            )),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10.w, top: 25.h),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 12.w),
                        child: SizedBox(
                          height: 137.h,
                          child: ListView.builder(
                              itemCount: AssetsImages.list1.length,
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                var item = AssetsImages.list1[index];
                                return Container(
                                  width: 107.w,
                                  height: 135.h,
                                  padding: EdgeInsets.only(top: 7.h),
                                  margin: EdgeInsets.only(
                                      left: 7.w,
                                      top: 5.h,
                                      bottom: 0,
                                      right: 7.w),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.grey.withOpacity(.1),
                                            spreadRadius: 3,
                                            blurRadius: 3,
                                            offset: const Offset(0, 3))
                                      ]),
                                  child: Column(
                                    children: [
                                      SizedBox(
                                          height: 73.h,
                                          width: 78.w,
                                          child:
                                              Image.asset('${item["image"]}')),
                                      SizedBox(
                                        height: 5.h,
                                      ),
                                      CustomText(
                                        text: '${item["text"]}',
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: const Color(0xff4C4452),
                                      )
                                    ],
                                  ),
                                );
                              }),
                        ),
                      ),
                      SizedBox(
                        height: 25.h,
                      ),
                      SizedBox(
                        height: 125.h,
                        child: PageView.builder(
                          controller: pageController,
                          itemCount: 5,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: const EdgeInsets.only(right: 19),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                gradient: const LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    Color(0xFFB2FF59),
                                    Color.fromARGB(255, 248, 246, 246),
                                    Color(0xFF00C853),
                                  ],
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsets.only(
                                    top: 15.h, left: 20.w, right: 10.w),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        CustomText(
                                          text: 'Study with',
                                          fontSize: 15,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xff2A2E3B),
                                        ),
                                        SizedBox(
                                          height: 4,
                                        ),
                                        CustomText(
                                          text: 'India’s best Coaching Centres',
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xff2A2E3B),
                                        ),
                                        SizedBox(
                                          height: 4,
                                        ),
                                        CustomText(
                                          text: 'Anytime, Anywhere!',
                                          fontSize: 15,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xff2A2E3B),
                                        )
                                      ],
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 15),
                                      child: Image.asset(
                                        AssetsImages.cardImage,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Center(
                          child: SmoothPageIndicator(
                        controller: pageController,
                        count: 5,
                        effect: ExpandingDotsEffect(
                          dotHeight: 8,
                          dotWidth: 8,
                          expansionFactor: 4,
                          activeDotColor: const Color(0xff272A34),
                          dotColor: Colors.grey.shade400,
                        ),
                      )),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20.w, top: 30.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CustomText(
                        text: 'Recommended for you',
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff272A34),
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      SizedBox(
                        height: 157.h,
                        child: ListView.builder(
                            itemCount: AssetsImages.list2.length,
                            shrinkWrap: true,
                            padding: const EdgeInsets.all(0),
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              var item = AssetsImages.list2[index];
                              return GestureDetector(
                                onTap: () {
                                  ref
                                      .read(navigationProvider.notifier)
                                      .goToAmenitiesPage();
                                },
                                child: Row(
                                  children: [
                                    Stack(
                                      children: [
                                        Container(
                                            // width: 100,
                                            height: 175.h,
                                            // color: Colors.amber,
                                            margin: EdgeInsets.only(
                                                left: 0, right: 5.w),
                                            child: Image.asset(
                                                '${item["image"]}')),
                                        Positioned(
                                            top: 6.h,
                                            left: 5.w,
                                            child: Row(
                                              children: [
                                                Icon(
                                                  Icons.play_arrow,
                                                  size: 12.sp,
                                                  color: Colors.white,
                                                ),
                                                const CustomText(
                                                  text: '2.5M',
                                                  fontSize: 8,
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.white,
                                                )
                                              ],
                                            )),
                                        Positioned(
                                            bottom: 6.h.w,
                                            left: 5.w,
                                            child: const Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                CustomText(
                                                    text: 'Manoj Classes',
                                                    fontSize: 11,
                                                    fontWeight: FontWeight.w700,
                                                    color: Colors.white),
                                                CustomText(
                                                  text: 'Maths - 10th',
                                                  fontSize: 9,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.white,
                                                )
                                              ],
                                            )),
                                      ],
                                    ),
                                    SizedBox(
                                      width: 10.w,
                                    )
                                  ],
                                ),
                              );
                            }),
                      ),
                      SizedBox(
                        height: 34.h,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CustomText(
                        text:
                            'Find the best Coach to help you with your 10th Class ',
                        fontSize: 23,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff696969),
                      ),
                      SizedBox(
                        height: 21.h,
                      ),
                      SizedBox(
                        height: 13.h,
                      ),
                      SizedBox(
                        height: 37.h,
                        child: ListView.builder(
                          itemCount: ConstList.list3.length,
                          shrinkWrap: true,
                          padding: const EdgeInsets.all(0),
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            var item = ConstList.list3[index];

                            return Row(
                              children: [
                                if (index == 0) ...[
                                  Container(
                                    width: 129.w,
                                    height: 36.h,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8.sp),
                                      border: Border.all(
                                          color: const Color(0xffD8D8D8)),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        SizedBox(
                                          height: 20.h,
                                          width: 25.w,
                                          child:
                                              Image.asset(AssetsImages.filter),
                                        ),
                                        const CustomText(
                                          text: 'Filters',
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600,
                                        ),
                                        const Icon(
                                          Icons.arrow_drop_down,
                                          color: Color(0xff7D23E0),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5.w,
                                  ),
                                  Container(
                                    height: 30.h,
                                    width: 1,
                                    color: const Color(0xff818181),
                                  ),
                                ],
                                if (index >= 0) ...[
                                  GestureDetector(
                                    onTap: () {
                                      ref
                                          .read(selectedIndexProvider.notifier)
                                          .state = index;
                                    },
                                    child: Container(
                                      width: 91.w,
                                      margin: EdgeInsets.only(left: 5.w),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                          color: const Color(0xffD8D8D8),
                                        ),
                                        color: selectedIndex == index
                                            ? Colors.black
                                            : Colors.transparent,
                                      ),
                                      child: Center(
                                        child: CustomText(
                                          text: '${item["text"]}',
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          color: selectedIndex == index
                                              ? Colors
                                                  .white // Selected text color
                                              : const Color(
                                                  0xff484848), // Unselected text color
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ],
                            );
                          },
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 51.h,
                        width: double.infinity,
                        padding: const EdgeInsets.only(right: 0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.sp),
                          color: const Color(0xffF3F4F8),
                        ),
                        child: Stack(
                          children: [
                            Positioned(
                              right: 0,
                              top: 3,
                              child: GestureDetector(
                                onTap: () {
                                  ref
                                      .read(courseSelectionProvider.notifier)
                                      .selectCourse(CourseType.paid);
                                },
                                child: Container(
                                  height: 45.h,
                                  width: 160.w,
                                  decoration: BoxDecoration(
                                    color: selectedCourse == CourseType.paid
                                        ? const Color(0xff1C1C1C)
                                        : Colors.transparent,
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 16.w, vertical: 10.h),
                                  child: Center(
                                    child: CustomText(
                                      text: 'Paid Courses',
                                      fontSize: 15,
                                      fontWeight: FontWeight.w700,
                                      color: selectedCourse == CourseType.paid
                                          ? Colors.white
                                          : const Color(0xff737A87),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              top: 3.h,
                              left: 6.w,
                              child: GestureDetector(
                                onTap: () {
                                  ref
                                      .read(courseSelectionProvider.notifier)
                                      .selectCourse(CourseType.free);
                                },
                                child: Container(
                                  height: 45.h,
                                  width: 160.w,
                                  decoration: BoxDecoration(
                                    color: selectedCourse == CourseType.free
                                        ? const Color(0xff1C1C1C)
                                        : const Color(0xffF3F4F8),
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  child: Center(
                                    child: CustomText(
                                      text: 'Free Course',
                                      fontSize: 15,
                                      fontWeight: FontWeight.w800,
                                      color: selectedCourse == CourseType.free
                                          ? Colors.white
                                          : const Color(0xff1C1C1C),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 23.h,
                      ),
                      const CustomText(
                        text: 'Ongoing Classes',
                        fontSize: 16,
                        fontWeight: FontWeight.w800,
                        color: Color(0xff737A87),
                      ),
                      SizedBox(
                        height: 13.h,
                      ),
                      Container(
                        height: 310,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.white),
                        child: Column(
                          children: [
                            Stack(
                              children: [
                                Image.asset(AssetsImages.classes1),
                                Positioned(
                                    top: 7.h,
                                    right: 8.w,
                                    child: Container(
                                      height: 21.h,
                                      width: 60.w,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(44.sp),
                                          color: const Color(0xffFF4D4D)),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Icon(
                                            Icons.play_circle,
                                            color: Colors.white,
                                            size: 15.h,
                                          ),
                                          // Spacer(),
                                          const CustomText(
                                              text: 'LIVE',
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.white)
                                        ],
                                      ),
                                    )),
                                Positioned(
                                    bottom: 7.h,
                                    right: 10.w,
                                    child: Container(
                                      height: 21.h,
                                      width: 44.w,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(4.sp),
                                          color: const Color(0xff000000)),
                                      child: const Center(
                                        child: CustomText(
                                          text: '47:08',
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ))
                              ],
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            Row(
                              children: [
                                Container(
                                  height: 40.h,
                                  width: 40.w,
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle),
                                  child: Image.asset(AssetsImages.ongoing),
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.only(left: 15.w, top: 10.h),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 10.h,
                                      ),
                                      const CustomText(
                                        text: 'Physics - 10th Class',
                                        fontSize: 18,
                                        fontWeight: FontWeight.w800,
                                        color: Color(0xff2E2E2E),
                                      ),
                                      SizedBox(
                                        height: 3.h,
                                      ),
                                      Row(
                                        children: [
                                          CustomText(
                                            text: 'Faculty Name',
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w800,
                                            color: const Color(0xff4F4F4F),
                                          ),
                                          SizedBox(
                                            width: 5.w,
                                          ),
                                          Icon(
                                            Icons.check_circle,
                                            color: const Color(0xff878487),
                                            size: 15.h,
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height: 3.h,
                                      ),
                                      Row(
                                        children: [
                                          const CustomText(
                                            text: '476K views',
                                            fontSize: 12,
                                            fontWeight: FontWeight.w800,
                                            color: Color(0xff7C7C7C),
                                          ),
                                          SizedBox(
                                            width: 5.w,
                                          ),
                                          Icon(
                                            Icons.circle,
                                            color: const Color(0xff878487),
                                            size: 7.h,
                                          ),
                                          SizedBox(
                                            width: 5.w,
                                          ),
                                          const CustomText(
                                            text: '3 days ago',
                                            fontSize: 12,
                                            fontWeight: FontWeight.w800,
                                            color: Color(0xff7C7C7C),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                const Spacer(),
                                Padding(
                                    padding: EdgeInsets.only(bottom: 20.w),
                                    child: Image.asset(AssetsImages.more))
                              ],
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Container(
                        height: 120.h,
                        padding: EdgeInsets.only(left: 7.w),
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.sp),
                            color: Colors.white,
                            border: Border.all(color: const Color(0xffE6E6E6))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                                height: 100.h,
                                // width: 115,
                                child: Image.asset(AssetsImages.classes)),
                            Padding(
                              padding: EdgeInsets.only(left: 15.w, top: 15.h),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 130.w,
                                        // color: Colors.amber,
                                        child: const CustomText(
                                          text: 'Physics - 10th Class',
                                          fontSize: 15,
                                          fontWeight: FontWeight.w800,
                                          color: Color(0xff2E2E2E),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(bottom: 15.h),
                                        child: Image.asset(AssetsImages.more),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      const CustomText(
                                          text: '476K views',
                                          fontSize: 10,
                                          fontWeight: FontWeight.w800,
                                          color: Color(0xff7C7C7C)),
                                      SizedBox(
                                        width: 10.w,
                                      ),
                                      Icon(
                                        Icons.circle,
                                        color: const Color(0xff878487),
                                        size: 5.h,
                                      ),
                                      SizedBox(
                                        width: 4.w,
                                      ),
                                      const CustomText(
                                        text: '3 days ago',
                                        fontSize: 10,
                                        fontWeight: FontWeight.w800,
                                        color: Color(0xff7C7C7C),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 2,
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        height: 20.h,
                                        width: 20.w,
                                        decoration: const BoxDecoration(
                                            shape: BoxShape.circle),
                                        child:
                                            Image.asset(AssetsImages.ongoing),
                                      ),
                                      SizedBox(
                                        width: 7.w,
                                      ),
                                      const CustomText(
                                        text: 'Institute Name',
                                        fontSize: 12,
                                        fontWeight: FontWeight.w800,
                                        color: Color(0xff4F4F4F),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 24.h,
                      ),
                      Container(
                        height: 51.h,
                        width: double.infinity,
                        // padding: EdgeInsets.only(right: 30),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30.sp),
                            color: const Color(0xffE7E8EC)),
                        child: const Center(
                            child: CustomText(
                          text: 'View More Classes',
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Color(0xff737A87),
                        )),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
