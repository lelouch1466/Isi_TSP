import 'package:isi_tsp/domain/entities/glosarios.dart';

// Contrato: dice QUE datos necesita la app, no COMO se obtienen.
// La implementacion con Drift esta en data/repositories.
abstract class GlosarioRepositorio {
  // lee todos los terminos del glosario, en orden alfabetico
  Future<List<Glosarios>> obtenerGlosario();
}