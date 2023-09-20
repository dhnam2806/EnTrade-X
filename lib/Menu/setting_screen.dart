import 'package:entradex/widgets/switch_button.dart';
import 'package:flutter/material.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Cài đặt'),
        ),
        body: Column(
          children: [
            ListTile(
              title: Text('Đổi mật khẩu'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {},
            ),
            ListTile(
              title: Text('Cài đặt thông báo'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {},
            ),
            ListTile(
              title: Text('Đăng nhập sinh trắc học'),
              trailing: SwitchButton(),
              onTap: () {},
            ),
            ListTile(
              title: Text('Chế độ tối'),
              trailing: SwitchButton(),
              onTap: () {},
            ),
          ],
        ));
  }
}
