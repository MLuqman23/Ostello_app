import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ostello/assets_image/image.dart';
import 'package:ostello/common/plaintext.dart';
import 'package:ostello/provider/video_provider.dart';
import 'package:ostello/services/video_services.dart';
import 'package:share_plus/share_plus.dart';

class AmenitiesPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final videoList = ref.watch(videoListProvider);
    return Scaffold(
      body: PageView.builder(
        scrollDirection: Axis.vertical,
        itemCount: videoList.length,
        itemBuilder: (context, index) {
          final video = videoList[index];
          return Stack(
            children: [
              SizedBox(
                  height: double.infinity,
                  width: double.infinity,
                  child: VideoPlayerWidget(videoUrl: video.url)),
              Positioned(
                bottom: 60.h,
                right: 20.w,
                child: Column(
                  children: [
                    IconButton(
                      icon: Icon(
                        video.isLiked ? Icons.favorite : Icons.favorite_border,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        ref.read(videoListProvider.notifier).toggleLike(index);
                      },
                    ),
                    PlainText(
                      name: '100K',
                      fontsize: 12.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                    SizedBox(
                      height: 32.h,
                    ),
                    Image.asset(AssetsImages.comment),
                    PlainText(
                      name: '10K',
                      fontsize: 12.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                    SizedBox(
                      height: 32.h,
                    ),
                    GestureDetector(
                        onTap: () {
                          Share.share('Check out this video: ${video.url}');
                        },
                        child: Image.asset(AssetsImages.share)),
                    PlainText(
                      name: '10K',
                      fontsize: 12.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ],
                ),
              ),
              Positioned(
                  bottom: 100.h,
                  left: 20.w,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 30.h,
                            width: 30.w,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle, color: Colors.white),
                          ),
                          SizedBox(
                            width: 15.w,
                          ),
                          PlainText(
                            name: 'Manoj Classes',
                            fontsize: 18.sp,
                            color: Colors.white,
                            fontWeight: FontWeight.w800,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      PlainText(
                        name: 'Do you want to Start your journey at ₹99 ',
                        fontsize: 14.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      PlainText(
                        name: 'This offer valid only 4classes per user',
                        fontsize: 12.sp,
                        color: Color(0xffB2B2B2),
                        fontWeight: FontWeight.w500,
                      ),
                    ],
                  )),
            ],
          );
        },
      ),
    );
  }
}
