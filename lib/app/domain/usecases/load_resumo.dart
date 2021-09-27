import '../../domain/entities/entities.dart';

abstract class LoadResumo {
  Future<List<ResumoEntity>> getResumos();
}
