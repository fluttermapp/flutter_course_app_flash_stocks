import 'package:desk/http_request.dart';
import 'package:desk/models/series_model.dart';
import 'package:flutter/material.dart';
import 'graph_custom.dart';
import 'models/serie_model.dart';

void main() {
  runApp(const MyApp());
}

String imageUrl =
    'https://hotemoji.com/images/dl/1/lightning-emoji-by-twitter.png';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void dispose() {
    tickerController.dispose();
    super.dispose();
  }

  TextEditingController tickerController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text(
          'Flash Stocks',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          Image.network(
            imageUrl,
            height: 40,
          ),
          /*if (series.list.isNotEmpty)
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: LineChartSample(
                series: series,
              ),
            ),*/
          Padding(
            padding: const EdgeInsets.all(
              20.0,
            ),
            child: TextField(
              controller: tickerController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                filled: true,
                hintStyle: TextStyle(color: Colors.grey[800]),
                hintText: "Ticker",
                fillColor: Colors.white70,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (BuildContext context, index) {
                return Container(); /*ExpansionTile(
                  backgroundColor: Colors.amber,
                  title: Align(
                    alignment: Alignment.center,
                    child: Text(series.list[index].date.substring(
                        series.list[index].date.length - 8,
                        series.list[index].date.length - 3)),
                  ),
                  children: [
                    ListTile(
                      title: Text('Open: ${series.list[index].open}'),
                    ),
                    ListTile(
                      title: Text('High: ${series.list[index].high}'),
                    ),
                    ListTile(
                      title: Text('Low: ${series.list[index].low}'),
                    ),
                    ListTile(
                      title: Text('Close: ${series.list[index].close}'),
                    ),
                    ListTile(
                      title: Text('volume: ${series.list[index].volume}'),
                    ),
                  ],
                );*/
              },
              itemCount: 1 //series.list.length,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {},
        backgroundColor: Colors.amber,
        child: const Icon(
          Icons.get_app_rounded,
        ),
      ),
    );
  }
}
