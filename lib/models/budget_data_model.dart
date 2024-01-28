//16 fields, 2 %s 14 doubles
class BudgetModel {
  List<String> costName;
  List<double> workHours;
  List<double> workCost;
  List<double> materialCost;
  List<double> totalCost;

  BudgetModel({
    required this.costName,
    required this.workHours,
    required this.workCost,
    required this.materialCost,
    required this.totalCost,
  });
}
