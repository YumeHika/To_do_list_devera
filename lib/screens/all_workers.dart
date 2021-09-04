import 'package:flutter/material.dart';
<<<<<<< Updated upstream
import 'package:aking/constants/constants.dart';
import 'package:aking/widgets/all_workers_widget.dart';
import 'package:aking/widgets/drawer_widget.dart';
import 'package:aking/widgets/task_widget.dart';
=======
import 'package:aking/widgets/all_workers_widget.dart';
import 'package:aking/widgets/drawer_widget.dart';

>>>>>>> Stashed changes

class AllWorkersScreen extends StatefulWidget {
  @override
  _AllWorkersScreenState createState() => _AllWorkersScreenState();
}

class _AllWorkersScreenState extends State<AllWorkersScreen> {
  

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      drawer: DrawerWidget(),
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
       
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Text(
          'All workers',
          style: TextStyle(color: Colors.pink),
        ),
       
      ),
      body: ListView.builder(itemBuilder: (BuildContext context, int index) {
        return AllWorkersWidget();
      }),
    );
  }

}
