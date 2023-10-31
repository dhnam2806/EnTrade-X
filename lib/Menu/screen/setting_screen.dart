import 'package:entradex/theme/app_textstyle.dart';
import 'package:entradex/widgets/switch_button.dart';
import 'package:flutter/material.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = AppTextStyle.bodyLarge_16.copyWith(
      fontWeight: FontWeight.w400,
      color: Theme.of(context).textTheme.bodyLarge!.color,
    );

    return Scaffold(
        appBar: AppBar(
          title: Text('Cài đặt'),
        ),
        body: Column(
          children: [
            ListTile(
              title: Text(
                'Đổi mật khẩu',
                style: textTheme,
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: Theme.of(context).colorScheme.primary,
                size: 20,
              ),
              onTap: () {},
            ),
            ListTile(
              title: Text(
                'Cài đặt thông báo',
                style: textTheme,
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: Theme.of(context).colorScheme.primary,
                size: 20,
              ),
              onTap: () {},
            ),
            ListTile(
              title: Text(
                'Đăng nhập sinh trắc học',
                style: textTheme,
              ),
              trailing: Switch(
                  onChanged: (value) {
                    print(value);
                  },
                  value: false),
              onTap: () {},
            ),
            ListTile(
              title: Text(
                'Chế độ tối',
                style: textTheme,
              ),
              trailing: SwitchButton(),
              onTap: () {},
            ),
          ],
        ));
  }
}
