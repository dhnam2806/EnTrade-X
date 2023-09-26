import 'package:entradex/follow/component/news_info.dart';
import 'package:entradex/follow/component/news_select.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../model/news.dart';
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
                Text(
                  "Tin danh mục",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        followBloc.add(NewsSelectedEvent(value: "Theo mã"));
                        setState(() {
                          isSelect = !isSelect;
                          // news = newsData0;
                          newsInfoHide = false;
                        });
                      },
                      child: NewsSelect(
                        title: "Theo mã",
                        isSelected: isSelect,
                      ),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    GestureDetector(
                        onTap: () {
                          followBloc.add(NewsSelectedEvent(value: "Vĩ mô"));
                          setState(() {
                            isSelect = !isSelect;
                            // news = newsData1;
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
                                      fontSize: 18,
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
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.access_time,
                                        color: Colors.grey[400],
                                      ),
                                      SizedBox(
                                        width: 8,
                                      ),
                                      Text(news[index].time,
                                          style: TextStyle(
                                              color: Colors.grey[400]))
                                    ],
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 18,
                            ),
                            Container(
                                width: size.width * 0.3,
                                padding: EdgeInsets.only(left: 16),
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
