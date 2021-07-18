import 'package:flutter/material.dart';
import 'package:todolistdevera/data.dart';
import 'package:todolistdevera/widget/list_item_widget.dart';

class Home extends StatelessWidget {
  final List<ListItem> items = List.from(listItem);
  @override
  Widget build(BuildContext context) {
    var widget;
    return Scaffold(
      appBar: AppBar(
        title: Text('To Do List Devera'),
        centerTitle: true,
      ),
      body: AnimatedList(
        initialItemCount: items.length,
        itemBuilder: (context, index, animation) => ListItemWidget(
          item: items[index],
          animation: animation,
          onClicked: (){},
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){},
      ),
    );
  }
}
