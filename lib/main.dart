import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pokemon/pokemonDetails.dart';
import 'dart:convert';
import 'package:pokemon/pokemons.dart';

void main() => runApp(MaterialApp(
  title: "Pokemon_app",
  home: HomePage(),
  debugShowCheckedModeBanner: false,
));

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  var url =
      "https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json";

  PokeHub pokeHub;

  @override
  void initState(){
    super.initState();
    fetchData();
  }

  fetchData() async{
     var res=await http.get(url);
     var decodeJson=jsonDecode(res.body);
     pokeHub=PokeHub.fromJson(decodeJson);


     setState(() {
     });
  }





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pokedex"),
        backgroundColor: Colors.cyan,
      ),

      body: pokeHub==null?Center(child: CircularProgressIndicator(),)
          : GridView.count(
        crossAxisCount: 2,
        children: pokeHub.pokemon.map((poke)=>Padding(
          padding: EdgeInsets.all(2),
           child:  InkWell(
             onTap: (){
               Navigator.push(context,MaterialPageRoute(builder:(context)=>PokeDetails(
                 pokemon: poke,
               ) ));

             },
             child: Hero(
               tag: poke.img,
               child: Card(
                 elevation: 5,
                 child: Column(
                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                   children: <Widget>[
                   Container(
                     height: 100,
                     width: 100,
                     decoration: BoxDecoration(
                       image: DecorationImage(image: NetworkImage(poke.img))
                     ),
                   ),
                   Text(
                     poke.name,
                     style: TextStyle(
                       fontWeight: FontWeight.bold,
                       fontSize: 20,
                       color: Colors.cyan
                     ),
                   ),
                 ],),
               ),
             ),
           )
        )).toList(),
    ),

      drawer: Drawer(),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        backgroundColor: Colors.cyan,
        child: Icon(Icons.refresh),
      ),
    );
  }
}

