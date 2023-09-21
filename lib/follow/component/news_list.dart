import 'package:entradex/follow/component/news_info.dart';
import 'package:entradex/follow/component/news_select.dart';
import 'package:flutter/material.dart';

import '../../model/news.dart';

class NewsList extends StatefulWidget {
  NewsList({super.key});

  @override
  State<NewsList> createState() => _NewsListState();
}

class _NewsListState extends State<NewsList> {
  List<News> news = [];
  bool isSelect = true;
  bool newsInfoHide = false;

  @override
  void initState() {
    super.initState();
    news = newsData0;
  }

  List<News> newsData0 = [
    News(
        title:
            "Giá vàng vượt mốc 69 triệu đồng/lượng, USD tiếp tục tăng bla bla bla",
        time: "39 phút trước"),
    News(
        title: "Vì sao giá vàng tăng mạnh trong phiên giao dịch hôm nay?",
        time: "20 phút trước"),
    News(
        title:
            "VNPAY hợp tác với Xanh SM mang đến trải nghiệm gọi taxi tiện lợi",
        time: "15 phút trước"),
    News(
        title: "Những lý do GenZ quyết định mở thẻ tín dụng",
        time: "1 tiếng trước"),
    News(
        title:
            "Giá vàng vượt mốc 69 triệu đồng/lượng, USD tiếp tục tăng bla bla bla",
        time: "2 tiếng trước"),
    News(
        title: "Vì sao giá vàng tăng mạnh trong phiên giao dịch hôm nay?",
        time: "3 tiếng trước"),
    News(
        title:
            "VNPAY hợp tác với Xanh SM mang đến trải nghiệm gọi taxi tiện lợi",
        time: "1 ngày trước"),
  ];

  List<News> newsData1 = [
    News(
        title: "Chờ sự đột phá của dòng vốn đầu tư Nhật Bản",
        time: "23 phút trước"),
    News(
        title: "Thúc đẩy nâng hạng thị trường chứng khoán Việt Nam",
        time: "35 phút trước"),
    News(
        title:
            "Ưu đãi lớn cho khác hàng nhân dịp Vietinbank Securities tròn 23 tuổi",
        time: "50 phút trước"),
    News(
        title: "Thị trường có thể biến động mạnh trong ngày đáo hạn phái sinh",
        time: "1 giờ trước"),
    News(
        title: "Thúc đẩy nâng hạng thị trường chứng khoán Việt Nam",
        time: "2 giờ trước"),
    News(title: "Hàng loạt mã bứt phá bằng lần kể từ đáy", time: "3 giờ trước"),
  ];

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Column(
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
                setState(() {
                  isSelect = !isSelect;
                  news = newsData0;
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
                  setState(() {
                    isSelect = !isSelect;
                    news = newsData1;
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
                                    NewsInfo(name: "VCB", changePercent: -0.23),
                                    NewsInfo(name: "CTG", changePercent: 0.47),
                                    NewsInfo(name: "BID", changePercent: 0.00),
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
                                  style: TextStyle(color: Colors.grey[400]))
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
    );
  }
}
