import 'package:flutter/material.dart';
import 'recipe.dart';

class RecipeDetails extends StatefulWidget {
  static const routeName = '/Details';
  final Recipe recipe;
  RecipeDetails({required this.recipe});
  @override

  RecipeDetailsState createState() => RecipeDetailsState();
}

class RecipeDetailsState extends State<RecipeDetails> {
  double sliderValue = 0.0;
  @override
  void initState() {
    super.initState();
    sliderValue = widget.recipe.servings.toDouble();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar:  AppBar(

    title: Center(
    child:
    Text(
        'Recipe Calculator')
    ),
    backgroundColor: Colors.grey,
    ),
      body: Column(
        children: [
          Image.network(widget.recipe.imageUrl,  width: 500,
            height: 250,),
          Text(widget.recipe.label),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              '      Ingredients:',
              textAlign: TextAlign.left,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: 'Times New Roman',
                fontSize: 16,
                color: Colors.black,
              ),
            ),
          ),
          ListView.builder(

            shrinkWrap: true,
            itemCount: widget.recipe.ingredients.length,
            itemBuilder: (BuildContext context, int index) {
              double updatedQuantity =
                  widget.recipe.ingredients[index].quantity *
                      (sliderValue / widget.recipe.servings.toDouble());
              return ListTile(
                title: Text(updatedQuantity.toString()+'  '+ widget.recipe.ingredients[index].name),
              );
            },
          ),

          SliderTheme(
            data: SliderTheme.of(context).copyWith(
              thumbShape: RoundSliderThumbShape(
                enabledThumbRadius: 15.0,
              ),
              overlayShape: RoundSliderOverlayShape(
                overlayRadius: 30.0,
              ),
              overlayColor: Color(0x29EB1555),
              thumbColor: Color(0xFFEB1555),
              activeTrackColor: Color(0xFFEB1555),
              inactiveTrackColor: Color(0x29EB1555),
            ),
            child: Tooltip(
              message: sliderValue.toString(),
              child: Slider(
                value: sliderValue,
                min: widget.recipe.servings.toDouble(),
                max: widget.recipe.servings.toDouble() * 10,
                onChanged: (newValue) {
                  setState(() {
                    sliderValue =
                        (newValue / widget.recipe.servings).roundToDouble() *
                            widget.recipe.servings.toDouble();
                  });
                },
              ),
            ),
          )
        ],

      ),
    );
  }
}
