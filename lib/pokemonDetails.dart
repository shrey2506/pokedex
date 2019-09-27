import 'package:flutter/material.dart';
import 'package:pokemon/pokemons.dart';

class PokeDetails extends StatelessWidget {
  final Pokemon pokemon;
  PokeDetails({this.pokemon});

  bodyWidget(BuildContext context)=>Stack(
    children: <Widget>[
      Positioned(
        left: 10,
        height: MediaQuery.of(context).size.height/1.5,
        width: MediaQuery.of(context).size.width-20,
        top:   MediaQuery.of(context).size.height*0.1,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                SizedBox(height: 150 ,),
                Text(pokemon.name,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
                Text("Height: ${pokemon.height}"),
                Text("Weight: ${pokemon.weight}"),
                Text("Types: ",style: TextStyle(fontWeight: FontWeight.bold),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: pokemon.type.map((t)=>FilterChip(backgroundColor: Colors.amber,
                    label: Text(t,
                    style: TextStyle(color: Colors.white),),onSelected: (b){},)).toList() ,
                ),
                Text("Weakness: ",style: TextStyle(fontWeight: FontWeight.bold)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: pokemon.weaknesses.map((t)=>FilterChip(backgroundColor: Colors.red,
                    label: Text(t,style: TextStyle(color: Colors.white)),onSelected: (b){},)).toList() ,
                ),
               // Text("Next Evolution: ",style: TextStyle(fontWeight: FontWeight.bold)),
               // Row(
                 // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //children: pokemon.nextEvolution.map((n)=>FilterChip(backgroundColor: Colors.green,
                  //label: Text(n.name,style: TextStyle(color: Colors.white)),onSelected: (b){},)).toList() ,
                //),


              ],
            ),
          ),
      ),
      Align(
        alignment: Alignment.topCenter,
        child:  Hero(tag:  pokemon.img,child: Container(
          height: 200,
            width: 200,
          decoration: BoxDecoration(

            image: DecorationImage(fit: BoxFit.cover,
              image: NetworkImage(pokemon.img),)
          ),
        ),),
      )

    ],
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan,
      appBar: AppBar(
         title: Text(pokemon.name),
        backgroundColor: Colors.cyan,
        elevation: 0,
      ),

      body: bodyWidget(context),

    );
  }
}
