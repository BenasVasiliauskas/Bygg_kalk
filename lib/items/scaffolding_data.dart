import 'package:cost_calculator/pages/item_screen/scaffolding_item_screen.dart';
import 'package:cost_calculator/pages/item_sections/scaffolding_sections.dart';
import 'package:cost_calculator/pages/norw_item_screen/norw_scaffolding_item_screen.dart';
import 'package:flutter/material.dart';
import '../constants/language.dart';

class ScaffoldingItem extends StatelessWidget {
  final String name;
  final List<String> description;
  final List<String> unit;
  final List<double> quantity;
  final List<double> laborHours1;
  final List<double> laborHours2;
  final List<double> laborCost;
  final List<double> material1;
  final List<double> material2;
  final List<double> totalPrice;
  final Color color;

  ScaffoldingItem(
    this.name,
    this.description,
    this.unit,
    this.quantity,
    this.laborHours1,
    this.laborHours2,
    this.laborCost,
    this.material1,
    this.material2,
    this.totalPrice,
    this.color,
  );

  void selectCategory(BuildContext ctx) {
    Navigator.of(ctx).push(
      MaterialPageRoute(
        builder: (_) {
          return languageEnglish == true
              ? ScaffoldingItemScreen(
                  name,
                  description,
                  unit,
                  quantity,
                  laborHours1,
                  laborHours2,
                  laborCost,
                  material1,
                  material2,
                  totalPrice,
                )
              : NorwScaffoldingItemScreen(
                  name,
                  description,
                  unit,
                  quantity,
                  laborHours1,
                  laborHours2,
                  laborCost,
                  material1,
                  material2,
                  totalPrice,
                );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (bool didPop) async {
        if (didPop) {
          return;
        }
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) {
            return ScaffoldingSections();
          }),
        );
      },
      child: InkWell(
        borderRadius: BorderRadius.circular(15),
        splashColor: Theme.of(context).primaryColor,
        onTap: () => selectCategory(context),
        child: Container(
          padding: const EdgeInsets.all(15),
          child: Center(
            child: Text(
              name,
            ),
          ),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                color.withOpacity(0.7),
                color,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),
    );
  }
}
