import 'dart:io';

import 'package:cost_calculator/constants/empty_models.dart';
import 'package:cost_calculator/data/data.dart';
import 'package:cost_calculator/functions/load_project_from_json.dart';
import 'package:cost_calculator/functions/save_project_to_json.dart';
import 'package:cost_calculator/functions/save_to_json.dart';
import 'package:cost_calculator/observer/app_life_cycle_observer.dart';
import 'package:cost_calculator/pages/shared/home_page.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:cost_calculator/constants/budget_constants.dart';
import 'package:cost_calculator/widgets/custom_drawer.dart';

class BudgetScreen extends StatefulWidget {
  @override
  State<BudgetScreen> createState() => _BudgetScreenState();
}

class _BudgetScreenState extends State<BudgetScreen> {
  final AppLifecycleObserver _observer = AppLifecycleObserver();
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(_observer);
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(_observer);
    super.dispose();
  }

  double sumWasteRemoval = calculateTotalWaste(wasteData);

  double sumMaterialCosts =
      totalMaterialCosts.reduce((value, element) => value + element);
  double sumLaborCosts =
      totalLaborCosts.reduce((value, element) => value + element);
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
            return homePage();
          }),
        );
      },
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              Text("Budget screen"),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: TextButton(
                      onPressed: () async {
                        DateTime now = DateTime.now();
                        String fileName = "${now.year}-${now.month}-${now.day}";
                        if (File("${fileName}.json").existsSync()) {
                          File("${fileName}.json").deleteSync();
                        }
                        await writeJsonArrayStart(fileName);
                        await saveEngProjectToJSON(fileName);
                        await writeJsonArrayEnd(fileName);
                      },
                      child: Text("Save project"),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: TextButton(
                      onPressed: () async {
                        FilePickerResult? result =
                            await FilePicker.platform.pickFiles(
                          type: FileType.custom,
                          allowedExtensions: ["json"],
                        );
                        if (result != null) {
                          PlatformFile file = result.files.first;
                          final fileName = file.name;
                          var data = await readJsonFileSelected(fileName);

                          await loadProject(fileName, data, emptyDeckModel);
                          await loadProject(
                              fileName, data, emptyOuterWallModel);
                          await loadProject(fileName, data, emptyFlooringModel);
                          await loadProject(
                              fileName, data, emptyHullRoofingModel);
                          await loadProject(
                              fileName, data, emptyInnerDoorModel);
                          await loadProject(
                              fileName, data, emptyInnerStairsModel);
                          await loadProject(
                              fileName, data, emptyInnerWallModel);
                          await loadProject(
                              fileName, data, emptyOuterRoofModel);
                          await loadProject(
                              fileName, data, emptyScaffoldingModel);
                          await loadProject(
                              fileName, data, emptySupportSystemModel);
                          await loadProject(fileName, data, emptyTerraceModel);
                          await loadProject(fileName, data, emptyWasteModel);
                          await loadProject(
                              fileName, data, emptyWindowsExteriorDoorsModel);

                          setState(() {
                            sumWasteRemoval = calculateTotalWaste(wasteData);
                            sumMaterialCosts = totalMaterialCosts
                                .reduce((value, element) => value + element);
                            sumLaborCosts = totalLaborCosts
                                .reduce((value, element) => value + element);

                            // double totalLaborHours2 = 0.0;
                            // double totalLaborCost = 0.0;
                            // double totalMaterial2 = 0.0;

                            // for (int i = 0;
                            //     i < widget.description.length;
                            //     i++) {
                            //   totalLaborHours2 += widget.laborHours2[i];
                            //   totalLaborCost += widget.laborCost[i];
                            //   totalMaterial2 += widget.material2[i];
                            // }

                            // addHours(name, hours);
                            // addLaborCosts(name, laborCosts);
                            // addMaterialCosts(name, materialCosts);
                            // addBudgetSum(name, budgetSum);
                          });
                        } else {
                          // User canceled the picker
                        }
                      },
                      child: Text("Load a project"),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        drawer: CustomDrawer(),
        body: SingleChildScrollView(
          controller: _scrollController,
          scrollDirection: Axis.horizontal,
          child: SingleChildScrollView(
            child: Column(
              children: [
                buildFirstTable(sumLaborCosts, sumMaterialCosts, totalHours),
                buildSecondTable(
                    sumLaborCosts, sumMaterialCosts, sumWasteRemoval),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
