import 'package:agriculture_app/feature/bar_graph/individual_data.dart';

class BarData {
  final double janAmount;
  final double febAmount;
  final double marchAmount;
  final double AugAmount;
  final double sepAmount;
  BarData(
      {required this.janAmount,
      required this.AugAmount,
      required this.febAmount,
      required this.marchAmount,
      required this.sepAmount});

  List<IndividualBar> barData = [];

  void initializeData() {
    barData = [
      IndividualBar(x: 0, y: janAmount),
      IndividualBar(x: 3, y: febAmount),
      IndividualBar(x: 2, y: marchAmount),
      IndividualBar(x: 3, y: AugAmount),
      IndividualBar(x: 4, y: sepAmount),
    ];
  }
}
