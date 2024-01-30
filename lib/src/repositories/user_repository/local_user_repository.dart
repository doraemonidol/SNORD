import 'package:rehabox/src/data_sources/data_sources.dart';
import 'package:rehabox/src/repositories/user_repository/user_repository_interface.dart';

class LocalUserRepository implements UserRepositoryInterface {
  const LocalUserRepository({
    required this.localDataSource,
  });

  final LocalDataSource localDataSource;

}
