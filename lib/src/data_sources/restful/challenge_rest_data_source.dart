import 'package:rehabox/src/data_sources/restful/rest_data_source.dart';
import 'package:rehabox/src/models/models.dart' show Challenge;

class ChallengeRESTDataSource extends RESTDataSource<Challenge> {
  ChallengeRESTDataSource({this.url = 'http://localhost:3000'});

  final String url;

  @override
  String get baseUrl => url;

  @override
  Future<Challenge> create(Challenge model) async {
    throw UnimplementedError();
  }

  @override
  Future<Challenge?> read(String id) {
    // TODO: implement read
    throw UnimplementedError();
  }

  @override
  Future<List<Challenge>> readAll() {
    // TODO: implement readAll
    throw UnimplementedError();
  }

  @override
  Future<Challenge> remove(String id) {
    // TODO: implement remove
    throw UnimplementedError();
  }

  @override
  Future<Challenge> update(Challenge model) {
    // TODO: implement update
    throw UnimplementedError();
  }
}
