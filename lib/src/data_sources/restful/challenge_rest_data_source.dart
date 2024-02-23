import 'package:rehabox/src/data_sources/restful/rest_data_source.dart';
import 'package:rehabox/src/models/models.dart' show Challenge;

class ChallengeRESTDataSource extends RESTDataSource<Challenge> {
  ChallengeRESTDataSource({
    super.baseUrl = 'http://localhost:3000',
    super.token = '',
  });
}
