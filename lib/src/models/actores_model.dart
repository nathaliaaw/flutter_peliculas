import 'package:peliculas/src/widgets/car_swiper_page.dart';

class Cast {
  List<Actor> actores = [];
  Cast.fromJsonList(List<dynamic> jsonList) {
    if (jsonList == null) return;
    jsonList.forEach((item) {
      final actor = Actor.fromJsonMap(item);
      actores.add(actor);
    });
  }
}

class Actor {
  int? gender;
  int? id;
  String? name;
  String? profilePath;
  int? castId;
  String? character;
  String? creditId;
  int? order;

  Actor({
    this.gender,
    this.name,
    this.id,
    this.profilePath,
    this.castId,
    this.character,
    this.creditId,
    this.order,
  });
  Actor.fromJsonMap(Map<String, dynamic> json) {
    castId = json["cast_id"];
    character = json["character"];
    creditId = json["credit_id"];
    gender = json["gender"];
    id = json["id"];
    name = json["name"];
    order = json["order"];
    profilePath = json["profile_path"];
  }

  getPosterImg() {
    if (profilePath == null) {
      return 'https://image.freepik.com/vector-gratis/revista-vacia-blanco-o-portada-libro_134452-6.jpg';
    } else {
      return 'https://image.tmdb.org/t/p/w500/$profilePath';
    }
  }
}
