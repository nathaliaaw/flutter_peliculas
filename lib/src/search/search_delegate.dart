import 'package:flutter/material.dart';
import 'package:peliculas/src/models/pelicula_modelo.dart';
import 'package:peliculas/src/providers/peliculas_providers.dart';

class DataSearch extends SearchDelegate {
  String seleccion = '';
  final peliculasProvider = new PeliculasProvider();
  final peliculas = [
    'Spiderman',
    'Aquaman',
    'Batman',
    'Shazam!',
    'Ironman',
    'Capitan America',
  ];
  final peliculasREientes = [
    'Spiderman',
    'Capitan America',
  ];
  @override
  List<Widget> buildActions(BuildContext context) {
    //las acciones de appBar
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: Icon(Icons.clear))
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    //Icono a la izquierda de appBar
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow,
          progress: transitionAnimation,
        ));
  }

  @override
  Widget buildResults(BuildContext context) {
    //Crea los resultados que vamos a mostrar
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    //Son las sugerencias que aparecen cuando se escribe
    if (query.isEmpty) {
      return Container();
    }
    return FutureBuilder(
      future: peliculasProvider.buscarPelicula(query),
      builder: (BuildContext context, AsyncSnapshot<List<Pelicula>> snapshot) {
        if (snapshot.hasData) {
          final peliculas = snapshot.data;

          return ListView(
              children: peliculas!.map((pelicula) {
            return ListTile(
              leading: FadeInImage(
                image: NetworkImage(pelicula.getPosterImg()),
                placeholder: AssetImage('assets/img/no-image.jpg'),
                width: 50,
                fit: BoxFit.contain,
              ),
              title: Text(pelicula.title!),
              subtitle: Text(pelicula.originalTitle!),
              onTap: () {
                close(context, null);
                pelicula.uniqueID='';
                Navigator.pushNamed(context, 'detalle', arguments: pelicula);
              },
            );
          }).toList());
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );

    // final listaSugerida = (query.isEmpty)
    //     ? peliculasREientes
    //     : peliculas
    //         .where((element) =>
    //             element.toLowerCase().startsWith(query.toLowerCase()))
    //         .toList();

    // return ListView.builder(
    //     itemCount: listaSugerida.length,
    //     itemBuilder: (context, i) {
    //       return ListTile(
    //         leading: Icon(Icons.movie),
    //         title: Text(listaSugerida[i]),
    //       );
    //     });
  }
}
