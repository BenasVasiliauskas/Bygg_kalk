import 'package:cost_calculator/data/data.dart';
import 'package:cost_calculator/pages/item_screen/support_system_screen.dart';
import 'package:cost_calculator/pages/item_sections/support_system_sections.dart';
import 'package:cost_calculator/pages/lit_item_screen/lit_support_system_item_screen.dart';
import 'package:cost_calculator/pages/norw_item_screen/norw_support_system_item_screen.dart';
import 'package:cost_calculator/pages/pol_item_screen/pol_support_system_item_screen.dart';

import 'package:flutter/material.dart';
import '../constants/language.dart';

// ignore: must_be_immutable
class SupportSystemItem extends StatelessWidget {
  String name;
  List<String> description;
  List<String> unit;
  List<double> quantity;
  List<double> laborHours1;
  List<double> laborHours2;
  List<double> laborCost;
  List<double> material1;
  List<double> material2;
  List<double> totalPrice;
  Color color;
  String constructionType;
  double calculationQuantity;

  SupportSystemItem(
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
              ? SupportSystemItemScreen(
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
                  ? NorwSupportSystemItemScreen(
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
                      ? PolSupportSystemItemScreen(
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
                      : LitSupportSystemItemScreen(
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
    ).then((shouldSave) {
      print("shouldSave: $shouldSave");

      calculationQuantity = supportSystem[0].calculationQuantity;
    });
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
            return SupportSystemSections();
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
