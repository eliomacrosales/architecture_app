import 'package:architecture/core/dependency_injection/dio_client_provider/dio_client_provider.dart';
import 'package:architecture/core/networking/dio_client.dart';
import 'package:architecture/data/repository/repository_impl.dart';
import 'package:architecture/domain/repository/repository_interface.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final repositoryProvider = Provider<RepositoryInterface>(
  (ref) {
    final DioClient dioClient = ref.watch(dioClientProvider);
    return RepositoryImpl(dioClient: dioClient);
  },
);
