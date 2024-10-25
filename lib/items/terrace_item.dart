import 'package:cost_calculator/pages/item_screen/terrace_item_screen.dart';
import 'package:cost_calculator/pages/item_sections/terrace_sections.dart';
import 'package:cost_calculator/pages/lit_item_screen/lit_terrace_item_screen.dart';
import 'package:cost_calculator/pages/norw_item_screen/norw_terrace_item_screen.dart';
import 'package:cost_calculator/pages/pol_item_screen/pol_terrace_item_screen.dart';
import 'package:flutter/material.dart';
import '../constants/language.dart';

class TerraceItem extends StatelessWidget {
  final String name;
  final List<String> description;
  final List<String> unit;
  final List<double> quantity;
  final List<double> laborHours1;
  final List<double> laborHours2;
  final List<double> laborCost;
  final List<double> material;
  final List<double> materials;
  final List<double> totalPrice;
  final Color color;
  final String constructionType;
  final double calculationQuantity;

  TerraceItem(
    this.name,
    this.description,
    this.unit,
    this.quantity,
    this.laborHours1,
    this.laborHours2,
    this.laborCost,
    this.material,
    this.materials,
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
              ? TerraceItemScreen(
                  name,
                  description,
                  unit,
                  quantity,
                  laborHours1,
                  laborHours2,
                  laborCost,
                  material,
                  materials,
                  totalPrice,
                  constructionType,
                  calculationQuantity,
                )
              : languageNorwegian
                  ? NorwTerraceItemScreen(
                      name,
                      description,
                      unit,
                      quantity,
                      laborHours1,
                      laborHours2,
                      laborCost,
                      material,
                      materials,
                      totalPrice,
                      constructionType,
                      calculationQuantity,
                    )
                  : languagePolish
                      ? PolTerraceItemScreen(
                          name,
                          description,
                          unit,
                          quantity,
                          laborHours1,
                          laborHours2,
                          laborCost,
                          material,
                          materials,
                          totalPrice,
                          constructionType,
                          calculationQuantity,
                        )
                      : LitTerraceItemScreen(
                          name,
                          description,
                          unit,
                          quantity,
                          laborHours1,
                          laborHours2,
                          laborCost,
                          material,
                          materials,
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
            return TerraceSections();
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
