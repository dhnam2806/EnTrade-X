import 'package:entradex/Menu/components/menu_title.dart';
import 'package:entradex/Menu/components/profile.dart';
import 'package:entradex/Menu/screen/setting_screen.dart';
import 'package:entradex/widgets/menu_select.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(children: [
        SingleChildScrollView(
          child: Column(children: [
            SizedBox(
              height: size.height * 0.24,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  MenuSelect(icon: Icons.lock, text: "Smart OTP"),
                  MenuSelect(icon: Icons.person, text: "Cá nhân"),
                  MenuSelect(icon: Icons.wallet_giftcard, text: "Hướng dẫn"),
                  MenuSelect(icon: Icons.wallet_travel_sharp, text: "Sản phẩm"),
                  GestureDetector(
                      onTap: () {
                        PersistentNavBarNavigator.pushNewScreen(
                          context,
                          screen: SettingScreen(),
                          withNavBar: true, // OPTIONAL VALUE. True by default.
                          pageTransitionAnimation:
                              PageTransitionAnimation.cupertino,
                        );
                      },
                      child: MenuSelect(icon: Icons.settings, text: "Cài đặt")),
                ],
              ),
            ),
            Column(
              children: [
                MenuTitle(icon: Icons.monetization_on, text: "None"),
                MenuTitle(
                    icon: Icons.monetization_on,
                    text: "Tài khoản",
                    selected: false),
                SizedBox(height: 4),
                MenuTitle(icon: Icons.monetization_on, text: "Chuyển tiền"),
                MenuTitle(icon: Icons.monetization_on, text: "Nộp tiền"),
                SizedBox(height: 4),
                MenuTitle(icon: Icons.monetization_on, text: "Tra cứu lịch sử"),
                MenuTitle(icon: Icons.monetization_on, text: "Xác nhận lệnh"),
                SizedBox(height: 4),
                MenuTitle(
                    icon: Icons.monetization_on, text: "Quà tặng - Gift X"),
                MenuTitle(
                    icon: Icons.monetization_on, text: "Giới thiệu bạn bè"),
                SizedBox(height: 4),
                MenuTitle(
                    icon: Icons.monetization_on, text: "Hỗ trợ trực tuyến"),
                MenuTitle(
                    icon: Icons.monetization_on, text: "Gửi ý kiến phản hồi"),
              ],
            ),
            Container(
              width: size.width,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.grey[800],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Center(
                    child: Text("Đăng xuất", style: TextStyle(fontSize: 16))),
              ),
            ),
            SizedBox(height: 20),
          ]),
        ),
        Profile(),
      ]),
    );
  }
}
