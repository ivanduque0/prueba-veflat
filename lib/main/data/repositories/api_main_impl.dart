import 'package:prueba_veflat/main/domain/repositories/api_main_repository.dart';
import 'package:prueba_veflat/utils/constants.dart';
import 'package:prueba_veflat/utils/restRequests.dart';



class ApiMainImplementation extends ApiMainInterface {

  @override
  Future<List> retrieveAllCharacters({String? gender="male", int? page=1}) async {
    RestResponse response = await Constants().restRequest.get(
      "character", 
      params: gender!="all"?{"gender":gender, "page":page.toString()}: {"page":page.toString()});
    if (response.body.isNotEmpty && response.code==200) {
      List characters = response.body["results"];
      return characters;
    }
    return [];
  }

  @override
  Future<Map> retrieveOneCharacter(String character_id) async {
    RestResponse response = await Constants().restRequest.get("character/$character_id");
    if (response.code==200) {
      Map character = response.body;
      return character;
    }
    return {};
  }
}
