import 'package:isi_tsp/domain/entities/puntajes.dart';
import 'package:isi_tsp/domain/entities/puntajes_examen.dart';
import 'package:isi_tsp/domain/repositories/puntaje_repositorio.dart';

// Repositorio de puntajes falso para las pruebas.
// No usa la base de datos: devuelve las listas que se le den.
// Los metodos que guardan no hacen nada.
class PuntajeRepositorioFalso implements PuntajeRepositorio {
  final List<Puntajes> cuestionarios;
  final List<PuntajesExamen> examenes;

  PuntajeRepositorioFalso({
    this.cuestionarios = const [],
    this.examenes = const [],
  });

  @override
  Future<List<Puntajes>> obtenerPuntajes() async => cuestionarios;

  @override
  Future<List<PuntajesExamen>> obtenerPuntajesExamen() async => examenes;

  @override
  Future<int?> obtenerPuntajeExamen(int moduloId) async {
    for (final e in examenes) {
      if (e.moduloId == moduloId) return e.puntaje;
    }
    return null;
  }

  @override
  Future<void> actualizarPuntaje(int moduloId, int pasoId, int puntaje) async {}

  @override
  Future<void> actualizarPuntajeExamen(int moduloId, int puntaje) async {}
}

// ayudantes para crear puntajes rapido en las pruebas
Puntajes cuestionario(int moduloId, int puntaje) {
  return Puntajes(
    puntajeId: moduloId,
    moduloId: moduloId,
    pasoId: moduloId,
    nombreLeccion: 'leccion $moduloId',
    puntaje: puntaje,
  );
}

PuntajesExamen examen(int moduloId, int puntaje) {
  return PuntajesExamen(
    puntajeExamenId: moduloId,
    moduloId: moduloId,
    nombreModulo: 'modulo $moduloId',
    puntaje: puntaje,
  );
}
