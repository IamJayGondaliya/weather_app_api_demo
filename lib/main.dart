import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/weather_controller.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => WeatherController(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    WeatherController getObject({bool listen = true}) {
      return Provider.of<WeatherController>(context, listen: listen);
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Home Page"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: getObject().isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Column(
                  children: [
                    Text("City: ${getObject().weather.cityName}"),
                    Expanded(
                      child: ListView.builder(
                        itemCount: getObject().weather.data.length,
                        itemBuilder: (ctx, index) => ListTile(
                          title: Text(getObject().weather.data[index].datetime),
                        ),
                      ),
                    ),
                  ],
                ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            getObject(listen: false).loadData(
              lat: 23.0225,
              lon: 72.5714,
            );
          },
        ),
      ),
    );
  }
}
