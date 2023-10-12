import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../bloc/follow_bloc.dart';

class BottomAdd extends StatelessWidget {
  const BottomAdd({super.key});

  @override
  Widget build(BuildContext context) {
    String? nameColection;
    final TextEditingController _controller = TextEditingController();
    return Container(
      color: Theme.of(context).colorScheme.background,
      // height: MediaQuery.of(context).size.height * 0.55,
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Tạo danh mục theo dõi',
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(
            height: 16.h,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: TextField(
              controller: _controller,
              autofocus: true,
              decoration: InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Tên danh mục',
              ),
              onChanged: (value) {
                nameColection = value;
              },
            ),
          ),
          SizedBox(
            height: 12.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.background,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                    side: BorderSide(color: Colors.red),
                  ),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Hủy bỏ', style: TextStyle(color: Colors.red)),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onPressed: () {
                  BlocProvider.of<FollowBloc>(context)
                      .add(AddStockEvent(value: nameColection!.trim()));
                  Navigator.pop(context);
                },
                child:
                    Text('Tạo danh mục', style: TextStyle(color: Colors.white)),
              ),
            ],
          )
        ],
      ),
    );
  }
}
