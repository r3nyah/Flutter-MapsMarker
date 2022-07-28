import 'package:flutter/material.dart';
import 'package:map_flutter/Src/Navigate.dart';

void main(){
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  //const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController latitudeController = TextEditingController();
  TextEditingController longitudeController = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Map Demo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Enter Your Location',
              style: TextStyle(
                fontSize: 40
              ),
            ),
            SizedBox(height: 30,),
            TextField(
              controller: latitudeController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Latitude',
              ),
            ),
            SizedBox(height: 20,),
            TextField(
              controller: longitudeController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Longitude',
              ),
            ),
            SizedBox(height: 20,),
            Container(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context){
                      return NavigationScreen(
                        double.parse(latitudeController.text),
                        double.parse(longitudeController.text)
                      );
                    }
                  ));
                },
                child: Text('Get Directions'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
