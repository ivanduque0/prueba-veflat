abstract class ApiMainInterface {
  Future<List> retrieveAllCharacters({String? gender, int? page});
  Future<Map> retrieveOneCharacter(String character_id);
  // Future<RestResponse> getConfiguration();

}
