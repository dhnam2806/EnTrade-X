import 'package:entradex/follow/component/news_info.dart';
import 'package:flutter/material.dart';

class NewsList extends StatelessWidget {
  List news = [
    "Giá vàng vượt mốc 69 triệu đồng/lượng, USD tiếp tục tăng bla bla bla",
    "Vì sao giá vàng tăng mạnh trong phiên giao dịch hôm nay?",
    "VNPAY hợp tác với Xanh SM mang đến trải nghiệm gọi taxi tiện lợi",
    "Những lý do GenZ quyết định mở thẻ tín dụng",
    "Giá vàng vượt mốc 69 triệu đồng/lượng, USD tiếp tục tăng bla bla bla",
    "Vì sao giá vàng tăng mạnh trong phiên giao dịch hôm nay?",
    "VNPAY hợp tác với Xanh SM mang đến trải nghiệm gọi taxi tiện lợi",
    "Giá vàng vượt mốc 69 triệu đồng/lượng, USD tiếp tục tăng bla bla bla",
    "Vì sao giá vàng tăng mạnh trong phiên giao dịch hôm nay?",
  ];
  NewsList({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      child: ListView.builder(
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
                          news[index],
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        Row(
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
                            Text("39 phút trước",
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
    );
  }
}
