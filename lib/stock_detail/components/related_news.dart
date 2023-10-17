import 'package:entradex/const/colors.dart';
import 'package:entradex/follow/component/news_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../follow/bloc/follow_bloc.dart';

class RelatedNews extends StatefulWidget {
  const RelatedNews({super.key});

  @override
  State<RelatedNews> createState() => _RelatedNewsState();
}

class _RelatedNewsState extends State<RelatedNews> {
  final FollowBloc followBloc = FollowBloc();

  @override
  void initState() {
    super.initState();
    followBloc.add(NewsInitialEvent());
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return BlocConsumer<FollowBloc, FollowState>(
      bloc: followBloc,
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        if (state is FollowLoadingState) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is NewsLoadedState) {
          final success = state as NewsLoadedState;
          final news = success.news;
          return Container(
            color: Theme.of(context).colorScheme.background.withOpacity(0.6),
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Senses",
                          style: TextStyle(
                              fontSize: 18.sp, fontWeight: FontWeight.w500),
                        ),
                        Text(
                          "Xem thêm",
                          style: TextStyle(
                              fontSize: 16.sp,
                              color: Theme.of(context).colorScheme.primary),
                        ),
                      ],
                    ),
                    SizedBox(height: 8.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text("5 ngày",
                                style: TextStyle(
                                    fontSize: 16.sp, color: Colors.grey[400])),
                            Text("-2.86%",
                                style: TextStyle(
                                    fontSize: 16.sp, color: AppColors.red)),
                          ],
                        ),
                        Column(
                          children: [
                            Text("1 năm",
                                style: TextStyle(
                                    fontSize: 16.sp, color: Colors.grey[400])),
                            Text("39.10%",
                                style: TextStyle(
                                    fontSize: 16.sp, color: AppColors.green)),
                          ],
                        ),
                        Column(
                          children: [
                            Text("Vốn hóa",
                                style: TextStyle(
                                    fontSize: 16.sp, color: Colors.grey[400])),
                            Text("116,329.15 tỷ",
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  color:
                                      Theme.of(context).colorScheme.onSecondary,
                                )),
                          ],
                        ),
                        Column(
                          children: [
                            Text("P/E",
                                style: TextStyle(
                                    fontSize: 16.sp, color: Colors.grey[400])),
                            Text("20.0x",
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  color:
                                      Theme.of(context).colorScheme.onSecondary,
                                )),
                          ],
                        ),
                        Column(
                          children: [
                            Text("P/S",
                                style: TextStyle(
                                    fontSize: 16.sp, color: Colors.grey[400])),
                            Text("2.41x",
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  color:
                                      Theme.of(context).colorScheme.onSecondary,
                                )),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 12.h),
                Divider(
                  color: Colors.grey,
                ),
                SizedBox(height: 12.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Tin liên quan",
                      style: TextStyle(
                          fontSize: 18.sp, fontWeight: FontWeight.w500),
                    ),
                    Text(
                      "Xem thêm",
                      style: TextStyle(
                          fontSize: 16.sp,
                          color: Theme.of(context).colorScheme.primary),
                    ),
                  ],
                ),
                SizedBox(height: 12.h),
                ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  itemCount: news.length,
                  itemBuilder: (context, index) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                children: [
                                  Text(
                                    news[index].title,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: 16.sp,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      NewsInfo(
                                          name: "VCB", changePercent: -0.23),
                                      NewsInfo(
                                          name: "CTG", changePercent: 0.47),
                                      NewsInfo(
                                          name: "BID", changePercent: 0.00),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.access_time,
                                        color: Colors.grey[400],
                                      ),
                                      SizedBox(
                                        width: 8.w,
                                      ),
                                      Text(news[index].time,
                                          style: TextStyle(
                                              fontSize: 12.sp,
                                              color: Colors.grey[400]))
                                    ],
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 18.h,
                            ),
                            Container(
                                width: size.width * 0.3,
                                padding: EdgeInsets.only(left: 16.w),
                                child: Image.asset('images/john-wick.jpg')),
                          ],
                        ),
                        Divider(
                          color: Colors.grey,
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
          );
        }
        return SizedBox();
      },
    );
  }
}
