import 'package:cost_calculator/pages/item_screen/waste_item_screen.dart';
import 'package:cost_calculator/pages/item_sections/waste_sections.dart';
import 'package:cost_calculator/pages/lit_item_screen/lit_waste_item_screen.dart';
import 'package:cost_calculator/pages/norw_item_screen/norw_waste_item_screen.dart';
import 'package:cost_calculator/pages/pol_item_screen/pol_waste_item_screen.dart';
import 'package:flutter/material.dart';
import '../constants/language.dart';

class WasteItem extends StatelessWidget {
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
  final String constructionType;
  final double calculationQuantity;

  WasteItem(
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
    this.constructionType,
    this.calculationQuantity,
  );

  void selectCategory(BuildContext ctx) {
    Navigator.of(ctx).push(
      MaterialPageRoute(
        builder: (_) {
          return languageEnglish
              ? WasteItemScreen(
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
                  constructionType,
                  calculationQuantity,
                )
              : languageNorwegian
                  ? NorwWasteItemScreen(
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
                      constructionType,
                      calculationQuantity,
                    )
                  : languagePolish
                      ? PolWasteItemScreen(
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
                          constructionType,
                          calculationQuantity,
                        )
                      : LitWasteItemScreen(
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
                          constructionType,
                          calculationQuantity,
                        );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (bool didPop, Object? result) async {
        if (didPop) {
          return;
        }
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) {
            return WasteSections();
          }),
        );
      },
      child: InkWell(
        borderRadius: BorderRadius.circular(15),
        splashColor: Theme.of(context).primaryColor,
        onTap: () => selectCategory(context),
        child: Container(
          padding: const EdgeInsets.all(5),
          child: Center(
            child: Text(
              name,
            ),
          ),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                color.withValues(alpha: 0.7),
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
