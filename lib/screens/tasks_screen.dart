import 'package:aking/inner_screens/profile.dart';
import 'package:aking/inner_screens/upload_task.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:aking/constants/constants.dart';
import 'package:aking/widgets/drawer_widget.dart';
import 'package:aking/widgets/task_widget.dart';

import 'all_workers.dart';

class TasksScreen extends StatefulWidget {
  @override
  _TasksScreenState createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  String? taskCategoryFilter;
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
            'Tasks',
            style: TextStyle(color: Colors.pink),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  _showTaskCategoriesDialog(size: size);
                },
                icon: Icon(Icons.filter_list_outlined, color: Colors.black))
          ],
        ),
        body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection('tasks')
              .where('taskCategory', isEqualTo: taskCategoryFilter)
              .orderBy('createdAt', descending: false)
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.connectionState == ConnectionState.active) {
              if (snapshot.data!.docs.isNotEmpty) {
                return ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (BuildContext context, int index) {
                      return TaskWidget(
                        taskTitle: snapshot.data!.docs[index]['taskTitle'],
                        taskDescription: snapshot.data!.docs[index]
                            ['taskDescription'],
                        taskId: snapshot.data!.docs[index]['taskId'],
                        uploadedBy: snapshot.data!.docs[index]['uploadedBy'],
                        isDone: snapshot.data!.docs[index]['isDone'],
                      );
                    });
              } else {
                return Center(
                  child: Text('There is no tasks'),
                );
              }
            }
            return Center(
                child: Text(
              'Something went wrong',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ));
          },
          ),
        bottomNavigationBar: SizedBox(
                height: 70.0,
                child: BottomAppBar(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(0.0),
                            child: IconButton(
                              icon: Image.asset('assets/images/task.png'),
                              iconSize: 30,
                              onPressed: () {
                                _navigateToAllTasksScreen(context);
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(0.0),
                            child: Text('All Tasks',
                                style: TextStyle(color: Color(0xff8E8E93))),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(0.0),
                            child: IconButton(
                                icon: Image.asset('assets/images/workers.png'),
                                onPressed: () {
                                  _navigateToAllWorkersScreen(context);
                                }),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(0.0),
                            child: Text('Members',
                                style: TextStyle(color: Color(0xff8E8E93))),
                          )
                        ],
                      ),
                      Divider(
                        color: Color(0xff292E4E),
                      ),
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(0.0),
                            child: IconButton(
                                icon: Image.asset('assets/images/categories.png'),
                                onPressed: () {
                                  _showTaskCategoriesDialog(size: size);
                                }),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(0.0),
                            child: Text('Category',
                                style: TextStyle(color: Color(0xff8E8E93))),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(0.0),
                            child: IconButton(
                                icon: Image.asset('assets/images/profile.png'),
                                onPressed: () {                         
                                  _navigateToProfileScreen(context);
                                }),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(0.0),
                            child:
                            Text('Profile', style: TextStyle(color: Colors.white)),
                          )
                        ],
                      ),
                    ],
                  ),
                  color: Color(0xff292E4E),
                ),
              ),
              floatingActionButton: FloatingActionButton(
                  child: Icon(Icons.add),
                  backgroundColor: Color(0xffF96060),
                  onPressed: () {
                    Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => UploadTask(),),);
                  }),
              floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        );
  }

  _showTaskCategoriesDialog({required Size size}) {
    showDialog(
        context: context,
        builder: (ctx) {
          return AlertDialog(
            title: Text(
              'Task Category',
              style: TextStyle(fontSize: 20, color: Colors.pink.shade800),
            ),
            content: Container(
              width: size.width * 0.9,
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: Constants.taskCategoryList.length,
                  itemBuilder: (ctxx, index) {
                    return InkWell(
                      onTap: () {
                        setState(() {
                          taskCategoryFilter =
                              Constants.taskCategoryList[index];
                        });
                        Navigator.canPop(ctx) ? Navigator.pop(ctx) : null;
                        print(
                            'taskCategoryList[index], ${Constants.taskCategoryList[index]}');
                      },
                      child: Row(
                        children: [
                          Icon(
                            Icons.check_circle_rounded,
                            color: Colors.red.shade200,
                          ),
                          // SizedBox(width: 10,),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              Constants.taskCategoryList[index],
                              style: TextStyle(
                                  color: Constants.darkBlue,
                                  fontSize: 18,
                                  fontStyle: FontStyle.italic),
                            ),
                          )
                        ],
                      ),
                    );
                  }),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.canPop(ctx) ? Navigator.pop(ctx) : null;
                },
                child: Text('Close'),
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    taskCategoryFilter = null;
                  });
                  Navigator.canPop(ctx) ? Navigator.pop(ctx) : null;
                },
                child: Text('Cancel filter'),
              ),
            ],
          );
        });
  }
}

void _navigateToAllWorkersScreen(context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => AllWorkersScreen(),
      ),
    );
  }

void _navigateToAllTasksScreen(context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => TasksScreen(),
      ),
    );
  }
    void _navigateToProfileScreen(context) {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    final User? user = _auth.currentUser;
    final String uid = user!.uid;
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => ProfileScreen(
          userID: uid,
        ),
      ),
    );
  }
