import 'package:get_it/get_it.dart';
import 'package:isi_tsp/data/database/app_database.dart';
import 'package:isi_tsp/data/repositories/modulos_repositorio_impl.dart';
import 'package:isi_tsp/data/repositories/pasos_repositorio_impl.dart';
import 'package:isi_tsp/data/repositories/pregunta_opcion_repositorio_impl.dart';
import 'package:isi_tsp/data/repositories/pregunta_repositorio_impl.dart';
import 'package:isi_tsp/data/repositories/puntaje_repositorio_impl.dart';
import 'package:isi_tsp/data/repositories/teoria_repositorio_impl.dart';
import 'package:isi_tsp/domain/repositories/modulos_repositorio.dart';
import 'package:isi_tsp/domain/repositories/pasos_repositorio.dart';
import 'package:isi_tsp/domain/usecases/desbloquear_siguiente.dart';
import 'package:isi_tsp/domain/repositories/pregunta_opcion_repositorio.dart';
import 'package:isi_tsp/domain/repositories/pregunta_repositorio.dart';
import 'package:isi_tsp/domain/repositories/puntaje_repositorio.dart';
import 'package:isi_tsp/domain/repositories/teoria_repositorio.dart';

// Registro global de dependencias.
// Es el UNICO lugar que conoce las implementaciones de data.
// Las pantallas solo piden el contrato: GetIt.instance<ModulosRepositorio>()
final GetIt getIt = GetIt.instance;

void configurarDependencias() {
  // Base de datos: una sola instancia para toda la app
  getIt.registerSingleton<AppDatabase>(baseDatos);

  // Repositorios: se registra el CONTRATO (domain) con su implementacion (data).
  // "Lazy" = se crea la primera vez que alguien lo pide.
  getIt.registerLazySingleton<ModulosRepositorio>(
    () => ModulosRepositorioImpl(getIt<AppDatabase>()),
  );

  getIt.registerLazySingleton<PasosRepositorio>(
    () => PasosRepositorioImpl(getIt<AppDatabase>()),
  );

  getIt.registerLazySingleton<PreguntaRepositorio>(
    () => PreguntaRepositorioImpl(getIt<AppDatabase>()),
  );

  getIt.registerLazySingleton<PreguntaOpcionRepositorio>(
    () => PreguntaOpcionRepositorioImpl(getIt<AppDatabase>()),
  );

  getIt.registerLazySingleton<TeoriaRepositorio>(
    () => TeoriaRepositorioImpl(getIt<AppDatabase>()),
  );

  getIt.registerLazySingleton<PuntajeRepositorio>(
    () => PuntajeRepositorioImpl(getIt<AppDatabase>()),
  );

  // Casos de uso: reglas de negocio que usan los repositorios
  getIt.registerLazySingleton<DesbloquearSiguiente>(
    () => DesbloquearSiguiente(
      getIt<PasosRepositorio>(),
      getIt<ModulosRepositorio>(),
    ),
  );

  // Cuando agregues mas repositorios, se registran aqui igual:
  // getIt.registerLazySingleton<CuestionarioRepositorio>(
  //   () => CuestionarioRepositorioImpl(getIt<AppDatabase>()),
  // );
}
