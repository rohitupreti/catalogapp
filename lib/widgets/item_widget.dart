import 'package:hovering/hovering.dart';
import 'package:sampleapp/models/catalog.dart';

import 'package:flutter/material.dart';

class ItemWidget extends StatefulWidget {
  final Item item;

  ItemWidget({Key? key, required this.item})
      : assert(item != null),
        super(key: key);

  @override
  State<ItemWidget> createState() => _ItemWidgetState();
}

class _ItemWidgetState extends State<ItemWidget> {
  bool hovered = false;
  String emp = "";
  @override
  Widget build(BuildContext context) {
    return Card(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        //elevation: 20,
        clipBehavior: Clip.antiAlias,
        child: GestureDetector(
          onTap: () async {
            setState(() {
              hovered = true;
            });
            await Future.delayed(Duration(seconds: 2));
            setState(() {
              hovered = false;
            });
          },
          child: hovered
              ? GridTile(
                  header: Text(widget.item.name),
                  footer: Text(widget.item.price.toString()),
                  child: Center(child: Text(widget.item.desc)),
                )
              : GridTile(
                  header: Text(emp),
                  footer: Text(emp),
                  child: Image.network(widget.item.image),
                ),
        )
        // ListTile(
        //   leading: Image.network(item.image),
        //   title: Text(item.name),
        //   subtitle: Text(item.desc),
        //   trailing: Text("\$${item.price}"),
        // ),
        );
  }
}
