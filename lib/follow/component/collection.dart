// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:entradex/follow/component/bottom_add.dart';
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
              return SingleChildScrollView(
                  child: Container(
                      padding: EdgeInsets.only(
                          bottom:
                              MediaQuery.of(context).viewInsets.bottom + 28),
                      child: BottomAdd()));
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
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.background,
                      borderRadius: BorderRadius.circular(4),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 0.4,
                          blurRadius: 1,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Center(child: Text(getName(data[index].name))),
                  );
                },
              ),
              SizedBox(
                width: 8.w,
              ),
              GestureDetector(
                onTap: () {
                  BlocProvider.of<FollowBloc>(context).add(AddMoreEvent());
                },
                child: Container(
                  width: 32.w,
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.background,
                    borderRadius: BorderRadius.circular(4),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 0.4,
                        blurRadius: 1,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Center(child: Text("+")),
                ),
              ),
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
