import 'package:cost_calculator/pages/item_screen/hull_roofing_item_screen.dart';
import 'package:cost_calculator/pages/item_sections/hull_roofing_sections.dart';
import 'package:cost_calculator/pages/lit_item_screen/lit_hull_roofing_item_screen.dart';
import 'package:cost_calculator/pages/norw_item_screen/norw_hull_roofing_item_screen.dart';
import 'package:cost_calculator/pages/pol_item_screen/pol_hull_roofing_item_screen.dart';
import 'package:flutter/material.dart';
import '../constants/language.dart';

class HullRoofingItem extends StatelessWidget {
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

  HullRoofingItem(
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
              ? HullRoofingItemScreen(
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
                  ? NorwHullRoofingItemScreen(
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
                      ? PolHullRoofingItemScreen(
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
                      : LitHullRoofingItemScreen(
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
            return HullRoofingSections();
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
