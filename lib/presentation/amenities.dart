import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ostello/assets_image/image.dart';
import 'package:ostello/common/plaintext.dart';
import 'package:ostello/provider/video_provider.dart';
import 'package:ostello/services/video_services.dart';
import 'package:share_plus/share_plus.dart';

class AmenitiesPage extends ConsumerWidget {
  const AmenitiesPage({super.key});

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
                    const CustomText(
                      text: '100K',
                      fontSize: 12,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                    SizedBox(
                      height: 32.h,
                    ),
                    Image.asset(AssetsImages.comment),
                    const CustomText(
                      text: '10K',
                      fontSize: 12,
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
                    const CustomText(
                      text: '10K',
                      fontSize: 12,
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
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle, color: Colors.white),
                          ),
                          SizedBox(
                            width: 15.w,
                          ),
                          const CustomText(
                            text: 'Manoj Classes',
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.w800,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      const CustomText(
                        text: 'Do you want to Start your journey at ₹99 ',
                        fontSize: 14,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      const CustomText(
                        text: 'This offer valid only 4classes per user',
                        fontSize: 12,
                        color: Color(0xffB2B2B2),
                        fontWeight: FontWeight.w500,
                      )
                    ],
                  )),
            ],
          );
        },
      ),
    );
  }
}
