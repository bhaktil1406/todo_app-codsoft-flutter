import "package:flutter/material.dart";
import "package:flutter/widgets.dart";
import "package:todo_app/screens/home.dart";

class index extends StatelessWidget {
  const index({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 60,
                      width: 60,
                      child: ClipRRect(
                        child: Image.asset("assets/survey.png"),
                      ),
                    ),
                    Container(
                      child: Text(
                        "Your Daily ToDo",
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 45, 114, 218)),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: Image.asset("assets/1.jpg"),
              ),
              Container(
                child: Text(
                  "Manage your",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
                ),
              ),
              Container(
                child: Text(
                  "Everyday task list",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return home();
                  }));
                },
                child: Container(
                  height: 50,
                  width: 170,
                  decoration: BoxDecoration(
                    color: Colors.amber[700],
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey,
                          offset: Offset(0.0, 0.0),
                          blurRadius: 10.0,
                          spreadRadius: 0.0),
                    ],
                  ),
                  child: Center(
                      child: Text(
                    "Get Started",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 255, 255, 255)),
                  )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
