import 'package:entradex/follow/component/news_info.dart';
import 'package:entradex/follow/component/news_select.dart';
import 'package:entradex/theme/app_textstyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../bloc/follow_bloc.dart';

class NewsList extends StatefulWidget {
  NewsList({super.key});

  @override
  State<NewsList> createState() => _NewsListState();
}

class _NewsListState extends State<NewsList> {
  final FollowBloc followBloc = FollowBloc();
  bool isSelect = true;
  bool newsInfoHide = false;

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
            color: Theme.of(context).colorScheme.background.withOpacity(0.9),
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      "Tin danh mục",
                      style: AppTextStyle.labelLarge_18.copyWith(
                        fontWeight: FontWeight.w500,
                        color: Theme.of(context).textTheme.labelLarge!.color,
                      ),
                    ),
                    SizedBox(
                      width: 4.w,
                    ),
                    Tooltip(
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.onBackground,
                        borderRadius: BorderRadius.circular(4),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 1,
                            blurRadius: 1,
                            offset: Offset(0, 1), // changes position of shadow
                          ),
                        ],
                      ),
                      preferBelow: false,
                      showDuration: Duration(seconds: 8),
                      triggerMode: TooltipTriggerMode.tap,
                      message:
                          "% tăng/giảm giá được chốt tại thời điểm kết phiên giao dịch gần nhất sau thời điểm diễn ra tin",
                      textStyle: AppTextStyle.titleMedium_16.copyWith(
                        fontWeight: FontWeight.w400,
                        color: Theme.of(context).textTheme.titleMedium!.color,
                      ),
                      child: Icon(
                        Icons.info_outline,
                        color: Colors.grey,
                        size: 20,
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        followBloc.add(NewsSelectedEvent(value: "Theo mã"));
                        setState(() {
                          isSelect = !isSelect;
                          newsInfoHide = false;
                        });
                      },
                      child: NewsSelect(
                        title: "Theo mã",
                        isSelected: isSelect,
                      ),
                    ),
                    SizedBox(
                      width: 8.w,
                    ),
                    GestureDetector(
                        onTap: () {
                          followBloc.add(NewsSelectedEvent(value: "Vĩ mô"));
                          setState(() {
                            isSelect = !isSelect;
                            newsInfoHide = !newsInfoHide;
                          });
                        },
                        child: NewsSelect(
                          title: "Vĩ mô",
                          isSelected: !isSelect,
                        )),
                  ],
                ),
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
                                  newsInfoHide
                                      ? SizedBox()
                                      : Row(
                                          children: [
                                            NewsInfo(
                                                name: "VCB",
                                                changePercent: -0.23),
                                            NewsInfo(
                                                name: "CTG",
                                                changePercent: 0.47),
                                            NewsInfo(
                                                name: "BID",
                                                changePercent: 0.00),
                                          ],
                                        ),
                                  SizedBox(
                                    height: 2.h,
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
        return Center(child: Text("Error"));
      },
    );
  }
}
