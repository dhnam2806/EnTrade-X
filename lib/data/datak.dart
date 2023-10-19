class DataKa {
  final double price;
  final double number;

  DataKa(this.price, this.number);
} // Danh sách dữ liệu từ lớp DataKa

final List<DataKa> dataList1 = [
  DataKa(82.00, 70.90),
  DataKa(80.40, 61.90),
  DataKa(90.00, 23.90),
];
final List<DataKa> dataList2 = [
  DataKa(80.00, 50.90),
  DataKa(92.00, 27.90),
  DataKa(82.00, 22.90),
];
List<double> calculatePercentages(List<DataKa> dataList) {
  List<double> percentages = [];

  for (var data in dataList) {
    if (data.number != 0) {
      double percentage = data.number / data.price;
      percentages.add(percentage);
    } else {
      percentages.add(0.0);
    }
  }

  return percentages;
}

List<double> calculatePercentages2(List<DataKa> dataList2) {
  List<double> percentages = [];

  for (var data in dataList2) {
    if (data.number != 0) {
      double percentage = data.number / data.price;
      percentages.add(percentage);
    } else {
      percentages.add(0.0);
    }
  }
  return percentages;
}

final List<double> percentages = calculatePercentages(dataList1);
final List<double> percentages2 = calculatePercentages(dataList2);
