import 'package:asincronia/services/mockapi.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  @override
  Widget build(BuildContext context) {
    int counter =0 ;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Asynchronous calls"),
        centerTitle: true,
        titleTextStyle: const TextStyle(
            color: Colors.white
        ),
        backgroundColor: Colors.blueAccent,
      ),
      body: AnimatedContainer(
        duration: const Duration(seconds: 2),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ////////////////////////////////////////////////////////
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                ),
                onPressed: ()async{
                  var result = await MockApi().getFerrariInteger();
                  setState(() {
                    counter = result;
                    print('Ferrari: $result');
                  }); 
                }, 
                child: const Icon(
                  Icons.speed_sharp,
                  size: 80,
                  color: Colors.white,
                )
                ),
                ///////////////
              FutureBuilder<int>(
                future: MockApi().getFerrariInteger(),
                builder: (context,snapshot){
                  if (snapshot.hasData) {
                    return Text('${snapshot.data}',
                      style: const TextStyle(
                        color: Colors.green,
                        fontSize: 40
                        ) ,
                    );
                  } else if(snapshot.hasError){
                    return Text('${snapshot.error}',
                      style: const TextStyle(fontSize: 10),
                    );
                  }
                  return const RefreshProgressIndicator(
                    backgroundColor: Colors.green,
                    color: Colors.white,
                    );
                }),
                ////////////////////////////////////////////////////////
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 255, 233, 34),
                ),
                onPressed: ()async{
                  var result =await MockApi().getHyundaiInteger();
                  setState(() {
                    counter = result;
                    print('Hyundai: $result');});
                }, 
                child: const Icon(
                  Icons.battery_3_bar,
                  size: 80,
                  color: Colors.white,
                )
                ),
              FutureBuilder<int>(
                future: MockApi().getHyundaiInteger(),
                builder: (context,snapshot){
                  if (snapshot.hasData) {
                    return Text('${snapshot.data}',
                      style: const TextStyle(
                        color: Color.fromARGB(255, 255, 233, 34),
                        fontSize: 40,
                      )
                    );
                  } else if(snapshot.hasError){
                    return Text('${snapshot.error}',
                      style: const TextStyle(fontSize: 10),
                    );
                  }
                  return const RefreshProgressIndicator(
                    backgroundColor: Color.fromARGB(255, 255, 233, 34),
                    color: Colors.white,
                    );
                }),
                ////////////////////////////////////////////////////////
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  // shape: CircularNotchedRectangle()
                ),
                onPressed: ()async{
                  var result = await MockApi().getFisherPriceInteger();
                  setState(() {
                    counter = result;
                    print('Fisher Price: $result');});
                }, 
                child: const Icon(
                  Icons.elderly,
                  size: 80,
                  color: Colors.white,
                )
                ),
              FutureBuilder<int>(
                future: MockApi().getFisherPriceInteger(),
                builder: (context,snapshot){
                  if (snapshot.hasData) {
                    return Text('${snapshot.data}',
                      style: const TextStyle(
                        color: Colors.red,
                        fontSize: 40
                        ),
                    );
                  } else if(snapshot.hasError){
                    return Text('${snapshot.error}',
                      style: const TextStyle(fontSize: 10),
                    );
                  }
                  return const RefreshProgressIndicator(
                    backgroundColor: Colors.red,
                    color: Colors.white,
                    );
                }),
            ],
          ),
        ),
      ),
    );
  }
}