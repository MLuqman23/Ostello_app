// ignore_for_file: camel_case_types

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ostello/common/custom_container.dart';
import 'package:ostello/common/plaintext.dart';
import 'package:ostello/common/textformfield.dart';
import 'package:ostello/const/const_service.dart';
import 'package:ostello/data/navigation_provide.dart';
import 'package:ostello/data/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class homePage extends ConsumerWidget {
  const homePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextEditingController _searchContoller = TextEditingController();
    final selectedFilter = ref.watch(selectedFilterProvider);
    final PageController _pageController = PageController();
    _pageController.addListener(() {
      ref.read(currentPageProvider.notifier).state =
          _pageController.page?.round() ?? 0;
    });

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 18,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                            width: 225,
                            height: 48,
                            child: ReusableTextFormField(
                                controller: _searchContoller,
                                hintText: 'Search here...',
                                // obscureText: true,
                                suffix: Image.asset(
                                    'assets/images/search-normal.png'))),
                        const Spacer(),
                        CustomContainer(
                          height: 48,
                          width: 115,
                          decoration: BoxDecoration(
                              color: const Color(0xff7D23E0),
                              borderRadius: BorderRadius.circular(15)),
                          child: const Center(
                            child: PlainText(
                              name: 'Study',
                              fontsize: 16,
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
                padding: const EdgeInsets.only(left: 10, top: 25),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 12),
                      child: SizedBox(
                        height: 137,
                        child: ListView.builder(
                            itemCount: constList.list1.length,
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              var item = constList.list1[index];
                              return Container(
                                width: 107,
                                height: 135,
                                padding: const EdgeInsets.only(top: 7),
                                margin: const EdgeInsets.only(
                                    left: 7, top: 5, bottom: 0, right: 7),
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
                                        height: 73,
                                        width: 78,
                                        child: Image.asset('${item["image"]}')),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    PlainText(
                                      name: '${item["text"]}',
                                      fontsize: 14,
                                      fontWeight: FontWeight.w800,
                                      color: const Color(0xff4C4452),
                                    )
                                  ],
                                ),
                              );
                            }),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 130,
                      child: ListView.builder(
                        controller: _pageController,
                        itemCount: 5,
                        // shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Stack(
                            children: [
                              Container(
                                  width: 375,
                                  height: 140,
                                  child: Image.asset(
                                      'assets/images/Rectangle 20072.png')),
                              Positioned(
                                right: 15,
                                top: 20,
                                child: SizedBox(
                                  height: 85,
                                  width: 85,
                                  child: Image.asset(
                                    'assets/images/Rectangle 34624635.png',
                                  ),
                                ),
                              ),
                              const Positioned(
                                  top: 25,
                                  left: 25,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      PlainText(
                                        name: 'Study with',
                                        fontsize: 16,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xff2A2E3B),
                                      ),
                                      SizedBox(
                                        height: 2,
                                      ),
                                      PlainText(
                                        name: 'India’s best Coaching Centres',
                                        fontsize: 18,
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xff2A2E3B),
                                      ),
                                      SizedBox(
                                        height: 2,
                                      ),
                                      PlainText(
                                        name: 'Anytime, Anywhere!',
                                        fontsize: 16,
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
                    const SizedBox(
                      height: 8,
                    ),
                    Center(
                        child: SmoothPageIndicator(
                      controller: _pageController,
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
                padding: const EdgeInsets.only(left: 20, top: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const PlainText(
                      name: 'Recommended for you',
                      fontsize: 16,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff272A34),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    SizedBox(
                      height: 157,
                      child: ListView.builder(
                          itemCount: constList.list2.length,
                          shrinkWrap: true,
                          padding: const EdgeInsets.all(0),
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            var item = constList.list2[index];
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
                                          height: 175,
                                          // color: Colors.amber,
                                          margin: const EdgeInsets.only(
                                              left: 0, right: 5),
                                          child:
                                              Image.asset('${item["image"]}')),
                                      const Positioned(
                                          top: 6,
                                          left: 5,
                                          child: Row(
                                            children: [
                                              Icon(
                                                Icons.play_arrow,
                                                size: 12,
                                                color: Colors.white,
                                              ),
                                              PlainText(
                                                name: '2.5M',
                                                fontsize: 8,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.white,
                                              ),
                                            ],
                                          )),
                                      const Positioned(
                                          bottom: 6,
                                          left: 5,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              PlainText(
                                                name: 'Manoj Classes',
                                                fontsize: 11,
                                                fontWeight: FontWeight.w700,
                                                color: Colors.white,
                                              ),
                                              PlainText(
                                                name: 'Maths - 10th',
                                                fontsize: 9,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.white,
                                              ),
                                            ],
                                          )),
                                    ],
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  )
                                ],
                              ),
                            );
                          }),
                    ),
                    const SizedBox(
                      height: 34,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const PlainText(
                      name:
                          'Find the best Coach to help you\nwith your 10th Class',
                      fontsize: 24,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff696969),
                    ),
                    const SizedBox(
                      height: 21,
                    ),
                    SizedBox(
                      height: 37,
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
                                    width: 129,
                                    height: 36,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        border: Border.all(
                                            color: const Color(0xffD8D8D8))),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        SizedBox(
                                            height: 20,
                                            width: 20,
                                            child: Image.asset(
                                                'assets/images/Frame (1).png')),
                                        const PlainText(
                                          name: 'Filters',
                                          fontsize: 14,
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
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Container(
                                    height: 30,
                                    width: 1,
                                    color: const Color(0xff818181),
                                  ),
                                ],
                                Container(
                                  width: 91,
                                  margin: const EdgeInsets.only(left: 5),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                          color: const Color(0xffD8D8D8))),
                                  child: Center(
                                    child: PlainText(
                                      name: '${item["text"]}',
                                      fontsize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: const Color(0xff484848),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          }),
                    ),
                    const SizedBox(
                      height: 13,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 51,
                      width: double.infinity,
                      padding: const EdgeInsets.only(right: 30),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: const Color(0xffF3F4F8)),
                      child: Stack(
                        children: [
                          const Align(
                            alignment: Alignment.centerRight,
                            child: PlainText(
                              name: 'Paid Courses',
                              fontsize: 16,
                              fontWeight: FontWeight.w700,
                              color: Color(0xff737A87),
                            ),
                          ),
                          Positioned(
                              top: 3,
                              left: 6,
                              child: Container(
                                height: 45,
                                width: 170,
                                decoration: BoxDecoration(
                                    color: const Color(0xff1C1C1C),
                                    borderRadius: BorderRadius.circular(30)),
                                child: const Center(
                                  child: PlainText(
                                    name: 'Free Course',
                                    fontsize: 16,
                                    fontWeight: FontWeight.w800,
                                    color: Colors.white,
                                  ),
                                ),
                              ))
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 23,
                    ),
                    const PlainText(
                      name: 'Ongoing Classes',
                      fontsize: 16,
                      fontWeight: FontWeight.w800,
                      color: Color(0xff737A87),
                    ),
                    const SizedBox(
                      height: 13,
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
                              Image.asset('assets/images/image 1376.png'),
                              Positioned(
                                  top: 7,
                                  right: 8,
                                  child: Container(
                                    height: 21,
                                    width: 60,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(44),
                                        color: const Color(0xffFF4D4D)),
                                    child: const Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Icon(
                                          Icons.play_circle,
                                          color: Colors.white,
                                          size: 15,
                                        ),
                                        // Spacer(),
                                        PlainText(
                                          name: 'LIVE',
                                          fontsize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white,
                                        )
                                      ],
                                    ),
                                  )),
                              Positioned(
                                  bottom: 7,
                                  right: 10,
                                  child: Container(
                                    height: 21,
                                    width: 44,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(4),
                                        color: const Color(0xff000000)),
                                    child: const Center(
                                      child: PlainText(
                                        name: '47:08',
                                        fontsize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ))
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              Container(
                                height: 40,
                                width: 40,
                                decoration:
                                    const BoxDecoration(shape: BoxShape.circle),
                                child: Image.asset(
                                    'assets/images/Ellipse 1247.png'),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(left: 15, top: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 10,
                                    ),
                                    PlainText(
                                      name: 'Physics - 10th Class',
                                      fontsize: 18,
                                      fontWeight: FontWeight.w800,
                                      color: Color(0xff2E2E2E),
                                    ),
                                    SizedBox(
                                      height: 3,
                                    ),
                                    Row(
                                      children: [
                                        PlainText(
                                          name: 'Faculty Name',
                                          fontsize: 14,
                                          fontWeight: FontWeight.w800,
                                          color: Color(0xff4F4F4F),
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Icon(
                                          Icons.check_circle,
                                          color: Color(0xff878487),
                                          size: 15,
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 3,
                                    ),
                                    Row(
                                      children: [
                                        PlainText(
                                          name: '476K views',
                                          fontsize: 12,
                                          fontWeight: FontWeight.w800,
                                          color: Color(0xff7C7C7C),
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Icon(
                                          Icons.circle,
                                          color: Color(0xff878487),
                                          size: 7,
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        PlainText(
                                          name: '3 days ago',
                                          fontsize: 12,
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
                                  padding: const EdgeInsets.only(bottom: 20),
                                  child: Image.asset('assets/images/more.png'))
                            ],
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 120,
                      padding: const EdgeInsets.only(left: 7),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.white,
                          border: Border.all(color: const Color(0xffE6E6E6))),
                      child: Row(
                        children: [
                          SizedBox(
                              height: 90,
                              // width: 115,
                              child:
                                  Image.asset('assets/images/image 1376.png')),
                          Padding(
                            padding: const EdgeInsets.only(left: 15, top: 12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    const PlainText(
                                      name: 'Physics - 10th\nClass',
                                      fontsize: 17,
                                      fontWeight: FontWeight.w800,
                                      color: Color(0xff2E2E2E),
                                    ),
                                    // Spacer(),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 25),
                                      child:
                                          Image.asset('assets/images/more.png'),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 2,
                                ),
                                const Row(
                                  children: [
                                    PlainText(
                                      name: '476K views',
                                      fontsize: 11,
                                      fontWeight: FontWeight.w800,
                                      color: Color(0xff7C7C7C),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Icon(
                                      Icons.circle,
                                      color: Color(0xff878487),
                                      size: 5,
                                    ),
                                    SizedBox(
                                      width: 4,
                                    ),
                                    PlainText(
                                      name: '3 days ago',
                                      fontsize: 11,
                                      fontWeight: FontWeight.w800,
                                      color: Color(0xff7C7C7C),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 4,
                                ),
                                Row(
                                  children: [
                                    Container(
                                      height: 20,
                                      width: 20,
                                      decoration: const BoxDecoration(
                                          shape: BoxShape.circle),
                                      child: Image.asset(
                                          'assets/images/Ellipse 1247.png'),
                                    ),
                                    const SizedBox(
                                      width: 7,
                                    ),
                                    const PlainText(
                                      name: 'Institute Name',
                                      fontsize: 13,
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
                    const SizedBox(
                      height: 24,
                    ),
                    Container(
                      height: 51,
                      width: double.infinity,
                      // padding: EdgeInsets.only(right: 30),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: const Color(0xffE7E8EC)),
                      child: const Center(
                        child: PlainText(
                          name: 'View More Classes',
                          fontsize: 16,
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
    );
  }
}
