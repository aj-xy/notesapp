import 'package:flutter/material.dart';
import 'package:notesapp/next.dart';
import 'package:notesapp/pfp.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomePage());
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadPreferences();
  }

  List<String>? names;
  List<String>? numbers;
  List<String>? emails;
  void _loadPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      names = prefs.getStringList('names') ?? [];
      numbers = prefs.getStringList('numbers') ?? [];
      emails = prefs.getStringList('emails') ?? [];
    });
    print(names);
    print(numbers);
    print(emails);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Center(
              child: Column(
            children: [
              Text(
                "Contacts",
                style: TextStyle(
                    color: Color(0xFF000000),
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 600,
                child: names!.isEmpty
                    ? Center(
                        child: Text('No data'),
                      )
                    : ListView.builder(
                        itemCount: names!.length,
                        itemBuilder: (context, index) {
                          return pfp(
                            img:
                                'https://images.pexels.com/photos/1704488/pexels-photo-1704488.jpeg?auto=compress&cs=tinysrgb&w=600',
                            label: names![index],
                            num: numbers![index],
                            email: emails![index],
                          );
                        },
                      ),
              ),
              Row(crossAxisAlignment: CrossAxisAlignment.center,mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return next();
                          },
                        ));
                      },
                      child: Text("Add")),
                      SizedBox(width: 40,),
                  ElevatedButton(
                      onPressed: () async {
                        final pref = await SharedPreferences.getInstance();
                        await pref.clear();
                        Navigator.pushReplacement(context, MaterialPageRoute(
                          builder: (context) {
                            return HomePage();
                          },
                        ));
                      },
                      child: Text("Clear")),
                ],
              )
            ],
          )),
        ),
      ),
    );
  }
}
