import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sampleapp/models/catalog.dart';
import 'package:sampleapp/widgets/drawer.dart';
import 'package:sampleapp/widgets/item_widget.dart';
import 'dart:convert';
import 'package:flutter/widgets.dart' show WidgetsFlutterBinding;

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String name = 'Rohit';
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Future.delayed(Duration(seconds: 2));
    final catalogJSON =
        await rootBundle.loadString("assets/files/catalog.json");
    var decodeddata = jsonDecode(catalogJSON);
    CatalogModels.items = List.from(decodeddata["products"])
        .map((item) => Item.fromJSON(item))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Center(
        child: Text("Catalog"),
      )),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: (CatalogModels.items != null && CatalogModels.items.isNotEmpty)
            //? ListView.builder(
            //     itemCount: CatalogModels.items.length,
            //     itemBuilder: (context, index) {
            //       return ItemWidget(item: CatalogModels.items[index]);
            //     },
            //   )
            ? GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 15,
                  crossAxisSpacing: 15,
                ),
                itemBuilder: (context, index) {
                  return ItemWidget(item: CatalogModels.items[index]);
                },
                itemCount: CatalogModels.items.length,
              )
            : Center(
                child: CircularProgressIndicator(),
              ),
      ),
      drawer: MyDrawer(),
    );
  }
}
