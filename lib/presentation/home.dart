// ignore_for_file: camel_case_types, unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ostello/assets_image/image.dart';
import 'package:ostello/common/custom_container.dart';
import 'package:ostello/common/plaintext.dart';
import 'package:ostello/common/textformfield.dart';
import 'package:ostello/const/const_service.dart';
import 'package:ostello/provider/navigation_provide.dart';
import 'package:ostello/provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class homePage extends ConsumerWidget {
  const homePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextEditingController searchContoller = TextEditingController();
    final selectedFilter = ref.watch(selectedFilterProvider);
    final PageController pageController = PageController();

    pageController.addListener(() {
      ref.read(currentPageProvider.notifier).state =
          pageController.page?.round() ?? 0;
    });
    final focusNode = ref.watch(focusNodeProvider);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () {
            FocusScope.of(context).unfocus();
          },
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
                              child: ReusableTextFormField(
                                  focusNode: focusNode,
                                  controller: searchContoller,
                                  hintText: 'Search here...',
                                  // obscureText: true,
                                  suffix: Image.asset(AssetsImages.search))),
                          const Spacer(),
                          CustomContainer(
                            height: 48.h,
                            width: 115.w,
                            decoration: BoxDecoration(
                                color: const Color(0xff7D23E0),
                                borderRadius: BorderRadius.circular(15.sp)),
                            child: Center(
                              child: PlainText(
                                name: 'Study',
                                fontsize: 16.sp,
                                fontWeight: FontWeight.w800,
                                color: Colors.white,
                              ),
                            ),
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
                                      borderRadius:
                                          BorderRadius.circular(20.sp),
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
                                      PlainText(
                                        name: '${item["text"]}',
                                        fontsize: 14.sp,
                                        fontWeight: FontWeight.w800,
                                        color: const Color(0xff4C4452),
                                      )
                                    ],
                                  ),
                                );
                              }),
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      SizedBox(
                        height: 130.h,
                        child: PageView.builder(
                          controller: pageController,
                          itemCount: 5,
                          // shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Stack(
                              children: [
                                SizedBox(
                                    width: 375.w,
                                    height: 140.h,
                                    child: Image.asset(AssetsImages.card)),
                                Positioned(
                                  right: 15.w,
                                  top: 20.h,
                                  child: SizedBox(
                                    height: 85.h,
                                    width: 85.w,
                                    child: Image.asset(
                                      AssetsImages.cardImage,
                                    ),
                                  ),
                                ),
                                Positioned(
                                    top: 25.h,
                                    left: 25.w,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        PlainText(
                                          name: 'Study with',
                                          fontsize: 16.sp,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xff2A2E3B),
                                        ),
                                        SizedBox(
                                          height: 2.h,
                                        ),
                                        PlainText(
                                          name: 'India’s best Coaching Centres',
                                          fontsize: 18.sp,
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xff2A2E3B),
                                        ),
                                        SizedBox(
                                          height: 2.h,
                                        ),
                                        PlainText(
                                          name: 'Anytime, Anywhere!',
                                          fontsize: 16.sp,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xff2A2E3B),
                                        ),
                                      ],
                                    ))
                              ],
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        height: 8.h,
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
                      PlainText(
                        name: 'Recommended for you',
                        fontsize: 16.sp,
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
                                                PlainText(
                                                  name: '2.5M',
                                                  fontsize: 8.sp,
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.white,
                                                ),
                                              ],
                                            )),
                                        Positioned(
                                            bottom: 6.h.w,
                                            left: 5.w,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                PlainText(
                                                  name: 'Manoj Classes',
                                                  fontsize: 11.sp,
                                                  fontWeight: FontWeight.w700,
                                                  color: Colors.white,
                                                ),
                                                PlainText(
                                                  name: 'Maths - 10th',
                                                  fontsize: 9.sp,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.white,
                                                ),
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
                      PlainText(
                        name:
                            'Find the best Coach to help you\nwith your 10th Class',
                        fontsize: 23.sp,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff696969),
                      ),
                      SizedBox(
                        height: 21.h,
                      ),
                      SizedBox(
                        height: 37.h,
                        // width: 500,
                        child: ListView.builder(
                            itemCount: constList.list3.length,
                            shrinkWrap: true,
                            padding: const EdgeInsets.all(0),
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              var item = constList.list3[index];
                              return Row(
                                children: [
                                  if (index == 0) ...[
                                    Container(
                                      width: 129.w,
                                      height: 36.h,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8.sp),
                                          border: Border.all(
                                              color: const Color(0xffD8D8D8))),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          SizedBox(
                                              height: 20.h,
                                              width: 20.w,
                                              child: Image.asset(
                                                  AssetsImages.filter)),
                                          PlainText(
                                            name: 'Filters',
                                            fontsize: 14.sp,
                                            fontWeight: FontWeight.w600,
                                          ),
                                          const Icon(
                                            Icons.arrow_drop_down,
                                            color: Color(0xff7D23E0),
                                          ),
                                          // DropdownButton<String>(
                                          //   alignment: Alignment.centerRight,
                                          //   underline: Container(),
                                          //   value: selectedFilter,
                                          //   isDense: false,
                                          //   iconSize: 20,
                                          //   // dropdownColor: color,
                                          //   items: filterOptions.map((String filter) {
                                          //     return DropdownMenuItem<String>(
                                          //       value: filter,
                                          //       child: Text(
                                          //         filter,
                                          //         style: const TextStyle(
                                          //             fontSize: 14, fontWeight: FontWeight.w600),
                                          //       ),
                                          //     );
                                          //   }).toList(),
                                          //   onChanged: (newValue) {
                                          //     ref.read(selectedFilterProvider.notifier).state =
                                          //         newValue!;
                                          //   },
                                          // ),
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
                                  Container(
                                    width: 91.w,
                                    margin: EdgeInsets.only(left: 5.w),
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10.sp),
                                        border: Border.all(
                                            color: const Color(0xffD8D8D8))),
                                    child: Center(
                                      child: PlainText(
                                        name: '${item["text"]}',
                                        fontsize: 14.sp,
                                        fontWeight: FontWeight.w600,
                                        color: const Color(0xff484848),
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            }),
                      ),
                      SizedBox(
                        height: 13.h,
                      ),
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
                        padding: EdgeInsets.only(right: 30.w),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30.sp),
                            color: const Color(0xffF3F4F8)),
                        child: Stack(
                          children: [
                            Align(
                              alignment: Alignment.centerRight,
                              child: PlainText(
                                name: 'Paid Courses',
                                fontsize: 16.sp,
                                fontWeight: FontWeight.w700,
                                color: Color(0xff737A87),
                              ),
                            ),
                            Positioned(
                                top: 3.h,
                                left: 6.w,
                                child: Container(
                                  height: 45.h,
                                  width: 170.w,
                                  decoration: BoxDecoration(
                                      color: const Color(0xff1C1C1C),
                                      borderRadius:
                                          BorderRadius.circular(30.sp)),
                                  child: Center(
                                    child: PlainText(
                                      name: 'Free Course',
                                      fontsize: 16.sp,
                                      fontWeight: FontWeight.w800,
                                      color: Colors.white,
                                    ),
                                  ),
                                ))
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 23.h,
                      ),
                      PlainText(
                        name: 'Ongoing Classes',
                        fontsize: 16.sp,
                        fontWeight: FontWeight.w800,
                        color: Color(0xff737A87),
                      ),
                      SizedBox(
                        height: 13.h,
                      ),
                      Container(
                        height: 295,
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
                                          PlainText(
                                            name: 'LIVE',
                                            fontsize: 14.sp,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.white,
                                          )
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
                                      child: Center(
                                        child: PlainText(
                                          name: '47:08',
                                          fontsize: 14.sp,
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
                                      PlainText(
                                        name: 'Physics - 10th Class',
                                        fontsize: 18.sp,
                                        fontWeight: FontWeight.w800,
                                        color: Color(0xff2E2E2E),
                                      ),
                                      SizedBox(
                                        height: 3.h,
                                      ),
                                      Row(
                                        children: [
                                          PlainText(
                                            name: 'Faculty Name',
                                            fontsize: 14.sp,
                                            fontWeight: FontWeight.w800,
                                            color: Color(0xff4F4F4F),
                                          ),
                                          SizedBox(
                                            width: 5.w,
                                          ),
                                          Icon(
                                            Icons.check_circle,
                                            color: Color(0xff878487),
                                            size: 15.h,
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height: 3.h,
                                      ),
                                      Row(
                                        children: [
                                          PlainText(
                                            name: '476K views',
                                            fontsize: 12.sp,
                                            fontWeight: FontWeight.w800,
                                            color: Color(0xff7C7C7C),
                                          ),
                                          SizedBox(
                                            width: 5.w,
                                          ),
                                          Icon(
                                            Icons.circle,
                                            color: Color(0xff878487),
                                            size: 7.h,
                                          ),
                                          SizedBox(
                                            width: 5.w,
                                          ),
                                          PlainText(
                                            name: '3 days ago',
                                            fontsize: 12.sp,
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
                          children: [
                            SizedBox(
                                height: 90.h,
                                // width: 115,
                                child: Image.asset(AssetsImages.classes)),
                            Padding(
                              padding: EdgeInsets.only(left: 15.w, top: 12.h),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      PlainText(
                                        name: 'Physics - 10th\nClass',
                                        fontsize: 16.sp,
                                        fontWeight: FontWeight.w800,
                                        color: Color(0xff2E2E2E),
                                      ),
                                      // Spacer(),
                                      SizedBox(
                                        width: 10.w,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(bottom: 25.h),
                                        child: Image.asset(AssetsImages.more),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 2,
                                  ),
                                  Row(
                                    children: [
                                      PlainText(
                                        name: '476K views',
                                        fontsize: 11.sp,
                                        fontWeight: FontWeight.w800,
                                        color: Color(0xff7C7C7C),
                                      ),
                                      SizedBox(
                                        width: 10.w,
                                      ),
                                      Icon(
                                        Icons.circle,
                                        color: Color(0xff878487),
                                        size: 5.h,
                                      ),
                                      SizedBox(
                                        width: 4.w,
                                      ),
                                      PlainText(
                                        name: '3 days ago',
                                        fontsize: 11.sp,
                                        fontWeight: FontWeight.w800,
                                        color: Color(0xff7C7C7C),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 4.h,
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
                                      PlainText(
                                        name: 'Institute Name',
                                        fontsize: 13.sp,
                                        fontWeight: FontWeight.w800,
                                        color: Color(0xff4F4F4F),
                                      ),
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
                        child: Center(
                          child: PlainText(
                            name: 'View More Classes',
                            fontsize: 16.sp,
                            fontWeight: FontWeight.w700,
                            color: Color(0xff737A87),
                          ),
                        ),
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
