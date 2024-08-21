import 'package:cost_calculator/pages/item_screen/inner_door_items_screen.dart';
import 'package:cost_calculator/pages/item_sections/inner_door_sections.dart';
import 'package:cost_calculator/pages/lit_item_screen/lit_inner_door_items_screen.dart';
import 'package:cost_calculator/pages/norw_item_screen/norw_inner_door_items_screen.dart';
import 'package:cost_calculator/pages/pol_item_screen/pol_inner_door_items_screen.dart';

import 'package:flutter/material.dart';
import '../constants/language.dart';

class InnerDoorItem extends StatelessWidget {
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
  final constructionType;

  InnerDoorItem(
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
  );

  void selectCategory(BuildContext ctx) {
    Navigator.of(ctx).push(
      MaterialPageRoute(
        builder: (_) {
          return languageEnglish
              ? InnerDoorItemScreen(
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
                )
              : languageNorwegian
                  ? NorwInnerDoorItemScreenScreen(
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
                  : languagePolish
                      ? PolInnerDoorItemScreenScreen(
                          name,
                          description,
                          unit,
                          quantity,
                          laborHours1,
                          laborHours2,
                          laborCost,
                          material1,
                          material2,
                          totalPrice)
                      : LitInnerDoorItemScreenScreen(
                          name,
                          description,
                          unit,
                          quantity,
                          laborHours1,
                          laborHours2,
                          laborCost,
                          material1,
                          material2,
                          totalPrice);
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
            return InnerDoorSections();
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
