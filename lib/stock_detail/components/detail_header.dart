import 'package:entradex/theme/app_colors.dart';
import 'package:entradex/follow/bloc/follow_bloc.dart';
import 'package:entradex/theme/app_textstyle.dart';
import 'package:entradex/widgets/search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

import '../../menu/screen/search_screen.dart';
import '../bloc/detail_bloc.dart';

class DetailHeader extends StatefulWidget {
  const DetailHeader({super.key});

  @override
  State<DetailHeader> createState() => _DetailHeaderState();
}

class _DetailHeaderState extends State<DetailHeader> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final safePadding = MediaQuery.of(context).padding.top;
    return BlocConsumer<DetailBloc, DetailState>(
      bloc: BlocProvider.of<DetailBloc>(context),
      listener: (context, state) {
        if (state is SearchStockNavigateState) {
          pushNewScreen(
            context,
            screen: SearchScreen(),
            withNavBar: true,
            pageTransitionAnimation: PageTransitionAnimation.cupertino,
          );
        }
      },
      builder: (context, state) {
        if (state is DetailLoadingState) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is DetailLoadedState) {
          final success = state as DetailLoadedState;
          return Container(
            height: size.height * 0.14,
            padding:
                EdgeInsets.only(top: safePadding + 4.h, left: 12, right: 12),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(12),
                    bottomRight: Radius.circular(12)),
                color: Theme.of(context).colorScheme.background),
            child: Column(
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Icon(Icons.arrow_back,
                            color: Theme.of(context).colorScheme.primary),
                      ),
                      SizedBox(width: 4.w),
                      GestureDetector(
                          onTap: () => {
                                BlocProvider.of<FollowBloc>(context)
                                    .add(SearchStockNavigateEvent())
                              },
                          child: SearchWidget()),
                      SizedBox(width: 4.w),
                      Container(
                        padding: EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.onBackground,
                          borderRadius: BorderRadius.circular(50),
                          boxShadow: [
                            BoxShadow(
                              color: Theme.of(context)
                                  .colorScheme
                                  .background
                                  .withOpacity(0.2),
                              spreadRadius: 0.4,
                              blurRadius: 2,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Icon(
                          Icons.lightbulb,
                          color: AppColors.yellow,
                        ),
                      )
                    ]),
                SizedBox(height: 8.h),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              success.stock.name.toString(),
                              style: AppTextStyle.labelLarge_18.copyWith(
                                color: Theme.of(context)
                                    .textTheme
                                    .labelLarge!
                                    .color,
                              ),
                            ),
                            SizedBox(width: 6.w),
                            Text(
                              'HOSE',
                              style: AppTextStyle.bodySmall_14.copyWith(
                                fontWeight: FontWeight.w400,
                                color: Theme.of(context).colorScheme.surface,
                              ),
                            ),
                            SizedBox(width: 8.w),
                            Container(
                              padding: EdgeInsets.all(6),
                              decoration: BoxDecoration(
                                color: Theme.of(context).colorScheme.background,
                                borderRadius: BorderRadius.circular(50),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.2),
                                    spreadRadius: 0.4,
                                    blurRadius: 2,
                                    offset: Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: Icon(Icons.bar_chart_rounded,
                                  color: Theme.of(context).colorScheme.surface,
                                  size: 16.sp),
                            ),
                            SizedBox(width: 8.w),
                            Container(
                              padding: EdgeInsets.all(6),
                              decoration: BoxDecoration(
                                color: Theme.of(context).colorScheme.background,
                                borderRadius: BorderRadius.circular(50),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.2),
                                    spreadRadius: 0.4,
                                    blurRadius: 2,
                                    offset: Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: Icon(Icons.add,
                                  color: Theme.of(context).colorScheme.primary,
                                  size: 16.sp),
                            ),
                          ],
                        ),
                        SizedBox(height: 6.h),
                        Text(
                          'CTCP FPT',
                          style: AppTextStyle.bodySmall_14.copyWith(
                            fontWeight: FontWeight.w400,
                            color: Theme.of(context).colorScheme.surface,
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              state.stock.price.toString(),
                              style: AppTextStyle.labelLarge_18.copyWith(
                                fontWeight: FontWeight.w500,
                                color: state.stock.changePercent == 0
                                    ? AppColors.yellow
                                    : (state.stock.changePercent < 0
                                        ? AppColors.red
                                        : AppColors.green),
                              ),
                            ),
                            SizedBox(width: 4.w),
                            Text(
                              "(${state.stock.priceChange} ${state.stock.changePercent}%)",
                              style: AppTextStyle.bodySmall_14.copyWith(
                                fontWeight: FontWeight.w400,
                                color: state.stock.changePercent == 0
                                    ? AppColors.yellow
                                    : (state.stock.changePercent < 0
                                        ? AppColors.red
                                        : AppColors.green),
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 6.h),
                        Row(
                          children: [
                            RichText(
                                text: TextSpan(children: [
                              TextSpan(
                                text: success.stock.total.toString(),
                                style: AppTextStyle.bodySmall_14.copyWith(
                                  fontWeight: FontWeight.w400,
                                  color: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .color,
                                ),
                              ),
                              TextSpan(
                                text: ' CP',
                                style: AppTextStyle.bodySmall_14.copyWith(
                                  fontWeight: FontWeight.w400,
                                  color: Theme.of(context).colorScheme.surface,
                                ),
                              ),
                            ])),
                            SizedBox(width: 6.w),
                            RichText(
                                text: TextSpan(children: [
                              TextSpan(
                                text: '184,400',
                                style: AppTextStyle.bodySmall_14.copyWith(
                                  fontWeight: FontWeight.w400,
                                  color: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .color,
                                ),
                              ),
                              TextSpan(
                                text: ' Tỷ',
                                style: AppTextStyle.bodySmall_14.copyWith(
                                  fontWeight: FontWeight.w400,
                                  color: Theme.of(context).colorScheme.surface,
                                ),
                              ),
                            ])),
                          ],
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          );
        }
        return Container(
          child: Text("BUG"),
        );
      },
    );
  }
}
