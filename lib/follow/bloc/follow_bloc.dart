import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:entradex/data/stock_data.dart';
import 'package:entradex/model/news.dart';
import 'package:meta/meta.dart';

import '../../data/news_data.dart';
import '../../model/stock.dart';

part 'follow_event.dart';
part 'follow_state.dart';

class FollowBloc extends Bloc<FollowEvent, FollowState> {
  FollowBloc() : super(FollowInitialState()) {
    on<StockInitialEvent>(stockInitialEvent);
    on<NewsInitialEvent>(newsInitialEvent);
    on<StockSelectedEvent>(stockSelectedEvent);
    on<NewsSelectedEvent>(newsSelectedEvent);
  }

  FutureOr<void> stockSelectedEvent(
      StockSelectedEvent event, Emitter<FollowState> emit) {
    emit(FollowLoadingState());
    List<Stock> stocks0 = StockData.data0;
    List<Stock> stocks1 = StockData.data1;
    List<Stock> stocks2 = StockData.data2;

    if (event.value == "VN30") {
      emit(StockLoadedState(stocks: stocks0));
    } else if (event.value == "Phái sinh") {
      emit(StockLoadedState(stocks: stocks1));
    } else if (event.value == "HOSE") {
      emit(StockLoadedState(stocks: stocks2));
    }
  }

  FutureOr<void> stockInitialEvent(
      StockInitialEvent event, Emitter<FollowState> emit) {
    emit(FollowLoadingState());
    List<Stock> stocks = StockData.data0;
    emit(StockLoadedState(stocks: stocks));
  }

  FutureOr<void> newsInitialEvent(
      NewsInitialEvent event, Emitter<FollowState> emit) {
    emit(FollowLoadingState());
    List<News> news = NewsData.newsData0;
    emit(NewsLoadedState(news: news));
  }

  FutureOr<void> newsSelectedEvent(NewsSelectedEvent event, Emitter<FollowState> emit) {
    List<News> newsData0 = NewsData.newsData0;
    List<News> newsData1 = NewsData.newsData1;

    if (event.value == "Theo mã") {
      emit(NewsLoadedState(news: newsData0));
    } else if (event.value == "Vĩ mô") {
      emit(NewsLoadedState(news: newsData1));
    }
  }
}
