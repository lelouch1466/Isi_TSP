import 'package:isi_tsp/domain/entities/teorias.dart';

// Contrato: dice QUE datos necesita la app, no COMO se obtienen.
// La implementacion con Drift esta en data/repositories.
abstract class TeoriaRepositorio {
  // lee las paginas de teoria de un modulo y paso, ordenadas por pagina
  Future<List<Teorias>> obtenerTeoriasPorModuloYPaso(int moduloId, int pasoId);

  // igual que la anterior, pero devuelve solo los textos en orden de pagina
  // (listo para usarse en el PageView de TeoriaScreen)
  Future<List<String>> obtenerTextosPorModuloYPaso(int moduloId, int pasoId);
}