import 'package:entradex/follow/component/bottom_add.dart';
import 'package:entradex/theme/app_textstyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../bloc/follow_bloc.dart';

class Collection extends StatefulWidget {
  const Collection({Key? key}) : super(key: key);

  @override
  State<Collection> createState() => _CollectionState();
}

class _CollectionState extends State<Collection> {
  @override
  void initState() {
    BlocProvider.of<FollowBloc>(context).add(StockCollectionInitialEvent());
    super.initState();
  }

  getName(String name) {
    List<String> words = name.split(" ");

    List<String> firstChars = [];

    for (String word in words) {
      if (word.isNotEmpty) {
        String firstChar = word[0];
        firstChars.add(firstChar);
      }
    }

    String result = firstChars.join("");
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FollowBloc, FollowState>(
      listener: (context, state) {
        if (state is AddMoreState) {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (context) {
              return BottomAdd();
            },
          );
        }
      },
      listenWhen: (previous, current) => current is FollowActionState,
      buildWhen: (previous, current) => current is! FollowActionState,
      builder: (context, state) {
        if (state is AddStockState) {
          final success = state as AddStockState;
          final data = success.value;
          bool isShow = true;
          data.length >= 5 ? isShow = false : isShow = true;

          return Row(
            children: [
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                scrollDirection: Axis.horizontal,
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return Container(
                    width: 32.w,
                    height: 22.h,
                    margin: EdgeInsets.only(right: 4.w),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.onBackground,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Center(
                        child: Text(getName(data[index].name),
                            style: AppTextStyle.bodyMedium_15.copyWith(
                              fontWeight: FontWeight.w400,
                              color:
                                  Theme.of(context).textTheme.bodyMedium!.color,
                            ))),
                  );
                },
              ),
              isShow
                  ? GestureDetector(
                      onTap: () {
                        BlocProvider.of<FollowBloc>(context)
                            .add(AddMoreEvent());
                      },
                      child: Container(
                        width: 32.w,
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.onBackground,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Center(
                          child: Icon(
                            Icons.add,
                            color: Theme.of(context).textTheme.bodySmall!.color,
                          ),
                        ),
                      ),
                    )
                  : Container(),
            ],
          );
        }
        return Container(
          child: Text("Loading"),
        );
      },
    );
  }
}
