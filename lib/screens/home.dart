import 'package:flutter/material.dart';
import 'package:itpair20231/models.dart';
import 'package:itpair20231/widgets/card.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Person> persons = [];

  Future<void> loadData() async {
    var response = await http
        .get(Uri.parse("https://jsonplaceholder.typicode.com/photos"));

    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body) as List<dynamic>;

      List<Person> fromJson = [];

      for (var i = 0; i < jsonResponse.length; i++) {
        // Person tao = Person(i,jsonResponse['meals'][i]['strMeal'], jsonResponse['meals'][i]['strMealThumb'], jsonResponse['meals'][i]['strCategory'], jsonResponse['meals'][i]['strInstructions']);
        Person tao = Person(
            i,
            jsonResponse[i]['albumId'],
            jsonResponse[i]['title'],
            jsonResponse[i]['url'],
            jsonResponse[i]['thumbnailUrl']);
        fromJson.add(tao);
      }
      print(fromJson);

      setState(() {
        persons = fromJson;
      });
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }

  @override
  void initState() {
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.white, //change your color here
          ),
          backgroundColor: Color.fromARGB(255, 48, 50, 154),
        ),
        body: ListView.separated(
          separatorBuilder: (context, index) => SizedBox(
            height: 10,
          ),
          padding: const EdgeInsets.all(8),
          itemCount: persons.length,
          itemBuilder: (BuildContext context, int index) {
            return ProfileCard(person: persons[index]);
          },
        )

        // Expanded(
        //       child: GridView.builder(
        //         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        //          crossAxisCount: 3, // Number of items per row
        //           mainAxisSpacing: 10,
        //          childAspectRatio: .6
        //         ),
        //         itemCount: persons.length,
        //         itemBuilder: (BuildContext context, int index) {
        //           return ProfileCard(person: persons[index]);
        //         },
        //       ),
        //     ),

        );
  }
}
