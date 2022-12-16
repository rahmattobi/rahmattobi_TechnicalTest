import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(title: 'Technical Test Tobi'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController input = TextEditingController();
  TextEditingController input2 = TextEditingController();
  TextEditingController input3 = TextEditingController();
  List? konsonan = [];
  List? vocal = [];
  List<int> data = [];
  int sum2 = 0;
  String str2 = '';
  int numb = 0;
  String str3 = '';

  @override
  Widget build(BuildContext context) {
    Widget jawaban1() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 10,
          ),
          const Text(
            'Jawaban No.1',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextField(
            controller: input,
            decoration:
                const InputDecoration(hintText: 'Input one line of words (S)'),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            color: Colors.green,
            child: TextButton(
              onPressed: () {
                setState(() {
                  String str = input.text.split(" ").join("");
                  if (konsonan!.isEmpty) {
                    for (var i = 0; i < str.length; i++) {
                      if (str[i] != 'a' &&
                          str[i] != 'i' &&
                          str[i] != 'u' &&
                          str[i] != 'e' &&
                          str[i] != 'o') {
                        konsonan!.add(str[i.toInt()]);
                      }
                    }
                  } else {
                    konsonan!.clear();
                    for (var i = 0; i < str.length; i++) {
                      if (str[i] != 'a' &&
                          str[i] != 'i' &&
                          str[i] != 'u' &&
                          str[i] != 'e' &&
                          str[i] != 'o') {
                        konsonan!.add(str[i.toInt()]);
                      }
                    }
                  }
                  if (vocal!.isEmpty) {
                    for (var dt = 0; dt < str.length; dt++) {
                      if (str[dt] == 'a' ||
                          str[dt] == 'i' ||
                          str[dt] == 'u' ||
                          str[dt] == 'e' ||
                          str[dt] == 'o') {
                        vocal!.add(str[dt.toInt()]);
                      }
                    }
                  } else {
                    vocal!.clear();
                    for (var dt = 0; dt < str.length; dt++) {
                      if (str[dt] == 'a' ||
                          str[dt] == 'i' ||
                          str[dt] == 'u' ||
                          str[dt] == 'e' ||
                          str[dt] == 'o') {
                        vocal!.add(str[dt.toInt()]);
                      }
                    }
                  }
                });
              },
              child: const Center(
                child: Text(
                  'Submit',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            'Konsonan : ${konsonan.toString().replaceAll('[', '').replaceAll(']', '')}',
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
          Text(
            'Vocal : ${vocal.toString().replaceAll('[', '').replaceAll(']', '')}',
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
        ],
      );
    }

    Widget jawaban2() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 10,
          ),
          const Text(
            'Jawaban No.2',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextField(
            controller: input2,
            decoration:
                const InputDecoration(hintText: 'Input the number of families'),
          ),
          TextField(
            controller: input3,
            decoration: const InputDecoration(
                hintText: 'Input the number of members in the family'),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            color: Colors.green,
            child: TextButton(
              onPressed: () {
                setState(() {
                  str2 = input2.text.split(" ").join("");
                  numb = int.parse(str2);
                  str3 = input3.text.split(" ").join("");

                  if (data.isEmpty) {
                    for (var i = 0; i < str3.length; i++) {
                      data.add(int.parse(str3[i]));
                    }
                  } else {
                    data.clear();
                    for (var i = 0; i < str3.length; i++) {
                      data.add(int.parse(str3[i]));
                    }
                  }

                  int sum = 0;
                  int sum1 = 0;

                  for (int e in data) {
                    sum += e;
                    sum1 = ((sum ~/ 4));
                  }
                  if (sum % 4 > 0) {
                    sum2 = sum1 + 1;
                  } else {
                    sum2 = sum1;
                  }
                });
              },
              child: const Center(
                child: Text(
                  'Submit',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            'Minimum bus required is : ${numb == str3.length ? sum2.toString() : 'Input must be equal with count of family'}',
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
        ],
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Technical Test Rahmat Tobi'),
        centerTitle: true,
      ),
      body: Container(  
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            jawaban1(),
            const SizedBox(
              height: 20,
            ),
            jawaban2(),
          ],
        ),
      ),
    );
  }
}
