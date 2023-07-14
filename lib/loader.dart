import 'package:flutter/material.dart';
import 'recipe.dart';
import 'RecipeDetails.dart';
class Loading extends StatefulWidget {
  static const routeName = '/loading';
  @override
  LoadingState createState() => LoadingState();
}

class LoadingState extends State<Loading> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: samples.length,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => RecipeDetails(recipe: samples[index]),
                ),
              );
            },
            child: Container(
            height: 300,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black,
                width: 1.0,
              ),
            ),

            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.network(
                    samples[index].imageUrl,
                    width: 500,
                    height: 250,
                  ),
                ),
                Expanded(
                  child: Center(
                    child: RichText(
                      text: TextSpan(
                        text: samples[index].label,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Times New Roman',
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            ),
          );
        },
      ),
    );
  }
}
