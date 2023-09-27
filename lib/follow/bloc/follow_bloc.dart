import 'dart:async';
import 'dart:math';

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
    on<StockSortEvent>(stockSortEvent);
    on<SearchStockNavigateEvent>(searchStockNavigateEvent);
    on<AddMoreEvent>(addMoreEvent);
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

  FutureOr<void> newsSelectedEvent(
      NewsSelectedEvent event, Emitter<FollowState> emit) {
    List<News> newsData0 = NewsData.newsData0;
    List<News> newsData1 = NewsData.newsData1;

    if (event.value == "Theo mã") {
      emit(NewsLoadedState(news: newsData0));
    } else if (event.value == "Vĩ mô") {
      emit(NewsLoadedState(news: newsData1));
    }
  }

  FutureOr<void> searchStockNavigateEvent(
      SearchStockNavigateEvent event, Emitter<FollowState> emit) {
    emit(SearchStockNavigateState());
  }

  FutureOr<void> stockSortEvent(
      StockSortEvent event, Emitter<FollowState> emit) {
    List<Stock> stocks = event.stocks;
    if (event.sortColumnIndex == 0) {
      stocks.sort((a, b) => event.isAscending
          ? a.name.compareTo(b.name)
          : b.name.compareTo(a.name));
    } else if (event.sortColumnIndex == 1) {
      stocks.sort((a, b) => event.isAscending
          ? a.price.compareTo(b.price)
          : b.price.compareTo(a.price));
    } else if (event.sortColumnIndex == 2) {
      stocks.sort((a, b) => event.isAscending
          ? a.changePercent.compareTo(b.changePercent)
          : b.changePercent.compareTo(a.changePercent));
    } else if (event.sortColumnIndex == 3) {
      stocks.sort((a, b) => event.isAscending
          ? a.total.compareTo(b.total)
          : b.total.compareTo(a.total));
    }

    emit(StockLoadedState(stocks: stocks));
  }

  FutureOr<void> addMoreEvent(AddMoreEvent event, Emitter<FollowState> emit) {
    emit(AddMoreState());
  }
}
