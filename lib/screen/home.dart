import 'package:flutter/material.dart';
import 'package:todolistdevera/data.dart';
import 'package:todolistdevera/widget/list_item_widget.dart';

class Home extends StatelessWidget {
  final listKey = GlobalKey<AnimatedListState>();
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
        key: listKey,
        initialItemCount: items.length,
        itemBuilder: (context, index, animation) => ListItemWidget(
          item: items[index],
          animation: animation,
          onClicked: () => removeItem(index),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: insertItem,
      ),
    );
  }

  void removeItem(int index) {
    final removedItem = items[index];
    items.removeAt(index);
    listKey.currentState!.removeItem(
      index,
      (context, animation) => ListItemWidget(
        item: removedItem,
        animation: animation,
        onClicked: () {},
      ),
    );
  }

  void insertItem() {
    final newIndex = 0;
    final newItem = ListItem(
      title: 'NewItem',
      urlImage: 
      'https://images.unsplash.com/photo-1501183007986-d0d080b147f9?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1834&q=80',
      );

    items.insert(newIndex, newItem);
    listKey.currentState!.insertItem(newIndex,
    );
  }
}
