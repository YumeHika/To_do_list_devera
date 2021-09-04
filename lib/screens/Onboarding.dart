<<<<<<< Updated upstream
import 'package:flutter/material.dart';
import 'package:aking/screens/tasks_screen.dart';
=======
import 'package:aking/screens/auth/login.dart';
import 'package:aking/user_state.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
>>>>>>> Stashed changes
class Onboarding extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'avenir'
      ),
      home: onboarding(),
    );
  }
}
<<<<<<< Updated upstream
=======
// ignore: camel_case_types
>>>>>>> Stashed changes
class onboarding extends StatefulWidget {

  @override
  _onboardingState createState() => _onboardingState();
}

<<<<<<< Updated upstream
=======
// ignore: camel_case_types
>>>>>>> Stashed changes
class _onboardingState extends State<onboarding> {
  int currentPage = 0;
  PageController _pageController = new PageController(
      initialPage: 0,
      keepPage: true
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: MediaQuery.of(context).size.height*0.6,
                child: PageView(
                  controller: _pageController,
                  children: [
                    onBoardPage("onboard1", "Welcome to Aking"),
                    onBoardPage("onboard2", "Work Happens"),
                    onBoardPage("onboard3", "Task and Assignments"),
                  ],
                  onPageChanged: (value)=>{setCurrentPage(value)},
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(3, (index) => getIndicator(index)),
              )
            ],
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              margin: EdgeInsets.only(top: 20),
              height: 300,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                image: DecorationImage(
<<<<<<< Updated upstream
                  image: AssetImage('assets/image/path1.png'),
=======
                  image: AssetImage('assets/images/path1.png'),
>>>>>>> Stashed changes
                  fit: BoxFit.fill
                )
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
<<<<<<< Updated upstream
                  InkWell(
                    onTap: openLoginPage,
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 100),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          offset: Offset(0,9),
                          blurRadius: 20,
                          spreadRadius: 3
                        )]
                      ),
                      child: Text("Get Started", style: TextStyle(
                        fontSize: 16
                      ),),
                    ),
                  ),
=======
                  Container(
                          margin: EdgeInsets.only(bottom: 0, left: 20, right: 20),
                          height: 50,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(                      
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                              elevation: 1,
                            ),
                            onPressed: () {
                              finish(context);
                              UserState().launch(context);
                            },
                            child: Text(
                              "Get Started",
                              textAlign: TextAlign.center,
                              style: boldTextStyle(size: 16, color: Colors.white, letterSpacing: 2),
                            ),
                          ),
                        ),
>>>>>>> Stashed changes
                  SizedBox(height: 30,),
                  Text("Login", style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold
                  ),)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
  AnimatedContainer getIndicator(int pageNo)
  {
    return AnimatedContainer(
      duration: Duration(milliseconds: 100),
      height: 10,
      width: (currentPage == pageNo) ? 20 : 10,
      margin: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(5)),
        color: (currentPage == pageNo) ? Colors.black : Colors.grey
      ),
    );
  }
  Column onBoardPage(String img, String title)
  {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 20,
        ),
        Container(
          height: 200,
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.all(50),
          decoration: BoxDecoration(
            image: DecorationImage(
<<<<<<< Updated upstream
              image: AssetImage('assets/image/$img.png')
=======
              image: AssetImage('assets/images/$img.png')
>>>>>>> Stashed changes
            )
          ),
        ),
        SizedBox(height: 50,),
        Container(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Text(title, style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w500
          ),),
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 40),
          child: Text("Lorem ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text", style: TextStyle(
            fontSize: 16,
            color: Colors.grey
          ),textAlign: TextAlign.center,),
        )
      ],
    );
  }
  setCurrentPage(int value)
  {
    currentPage = value;
    setState(() {
<<<<<<< Updated upstream

    });
  }
  openLoginPage()
  {
    Navigator.push(context, MaterialPageRoute(builder: (context)=>TasksScreen()));
  }
=======
    });
  }
>>>>>>> Stashed changes
}
