

import '../model/SummaryModel.dart';
import '../model/foodModel.dart';

List<Summary> summary = [
  Summary(heading: "Average order value", quantity: 150),
  Summary(heading: "Total Orders", quantity: 403),
  Summary(heading: "Dine In", quantity: 230),
  Summary(heading: "Take Away", quantity: 150),
  Summary(heading: "Delivery", quantity: 110),
];

List<Food> getFoodData() {
  return [
    Food(item: "VEG STEAMED MOMOS", icon: "🟩", quantity: "10", price: 120),
    Food(item: "VEG CHOWMIN", icon: "🟩", quantity: "1", price: 120),
    Food(item: "CHICKEN STEAMED MOMOS", icon: "🟥", quantity: "10", price: 120),
    Food(item: "VEG SPRING ROLLS", icon: "🟩", quantity: "2", price: 120),
    Food(item: "PANEER CHILLI", icon: "🟩", quantity: "1", price: 120)
  ];
}
