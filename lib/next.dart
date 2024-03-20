import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:notesapp/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class next extends StatefulWidget {
  const next({super.key});

  @override
  State<next> createState() => _nextState();
}

class _nextState extends State<next> {
  TextEditingController nameController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  List<String>? names = [];
  List<String>? numbers = [];
  List<String>? emails = [];
  @override
  void initState() {
    super.initState();
    _loadPreferences();
  }
  void _loadPreferences() async {
   
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      names = prefs.getStringList('names')??[];
      numbers = prefs.getStringList('numbers')??[];
      emails = prefs.getStringList('emails')??[];
    });}

  void save() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList("names", names!);
    prefs.setStringList("numbers", numbers!);
    prefs.setStringList('emails', emails!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Center(
          child: ListView(
            children: [
              TextField(
                controller: nameController,
                decoration: InputDecoration(
                    hintText: "Name",
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
              SizedBox(
                height: 30,
              ),
              TextField(
                controller: numberController,
                decoration: InputDecoration(
                    hintText: "Number",
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
              SizedBox(height: 20,),
              TextField(
                controller: emailController,
                decoration:  InputDecoration(
                    hintText: "Email",
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)))
              ),
              SizedBox(
                height: 50,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(90))),
                onPressed: ()  {
                  names!.add(nameController.text);
                  numbers!.add(numberController.text);
                  emails!.add(emailController.text);
              //  print(emails);
                  save();
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return HomePage();
                  },));
                },
                child: Text("add"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
