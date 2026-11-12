// Una pregunta con su respuesta correcta y 3 incorrectas.
class PreguntaSemilla {
  final String titulo;
  final String correcta;
  final List<String> incorrectas;

  const PreguntaSemilla(this.titulo, this.correcta, this.incorrectas);
}

// Preguntas por [numero de modulo][numero de paso].
// Solo los pasos de tipo cuestionario (2, 4 y 6) tienen preguntas.
const Map<int, Map<int, List<PreguntaSemilla>>> preguntasIniciales = {
  // ===================== MODULO 1: FUNDAMENTOS =====================
  1: {
    2: [
      PreguntaSemilla(
        '¿Qué es la ingeniería de software?',
        'La aplicación de un enfoque sistemático y disciplinado al desarrollo y mantenimiento de software',
        [
          'Escribir código lo más rápido posible',
          'Reparar el hardware de las computadoras',
          'Diseñar únicamente páginas web',
        ],
      ),
      PreguntaSemilla(
        '¿En qué año se popularizó el término ingeniería de software en una conferencia de la OTAN?',
        '1968',
        ['1950', '1985', '2001'],
      ),
      PreguntaSemilla(
        '¿Qué fue la crisis del software?',
        'Proyectos con retrasos, sobrecostos y baja calidad de forma generalizada',
        [
          'La falta de computadoras en las empresas',
          'Un virus informático mundial',
          'La caída del precio del hardware',
        ],
      ),
      PreguntaSemilla(
        '¿Qué diferencia al software de un producto físico?',
        'Es intangible y no se desgasta por el uso',
        [
          'Se desgasta con el tiempo como una máquina',
          'Siempre es más barato de producir',
          'No necesita mantenimiento',
        ],
      ),
      PreguntaSemilla(
        '¿Qué es el mantenimiento de software?',
        'Modificar el software después de su entrega para corregirlo, adaptarlo o mejorarlo',
        [
          'Limpiar físicamente el equipo',
          'Escribir la documentación inicial',
          'Comprar nuevas licencias',
        ],
      ),
    ],
    4: [
      PreguntaSemilla(
        '¿Quién es un stakeholder en un proyecto de software?',
        'Cualquier persona u organización interesada o afectada por el proyecto',
        [
          'Solo el programador principal',
          'Únicamente el cliente que paga',
          'El sistema operativo',
        ],
      ),
      PreguntaSemilla(
        '¿Cuál de estos es un ejemplo de software de sistema?',
        'Un sistema operativo',
        ['Un videojuego', 'Una hoja de cálculo', 'Un editor de fotos'],
      ),
      PreguntaSemilla(
        '¿Cuál de estos es un atributo de calidad del software?',
        'Mantenibilidad',
        [
          'Color de la interfaz',
          'Cantidad de líneas de código',
          'Marca del equipo',
        ],
      ),
      PreguntaSemilla(
        '¿Qué hace un ingeniero de software?',
        'Aplica principios de ingeniería para especificar, diseñar, construir y mantener software',
        ['Solo instala programas', 'Solo repara redes', 'Solo prueba hardware'],
      ),
      PreguntaSemilla(
        '¿Cuál de estos es un principio ético de la profesión?',
        'Respetar la confidencialidad de la información del cliente',
        [
          'Copiar código sin respetar su licencia',
          'Ocultar errores conocidos al cliente',
          'Entregar el producto sin probarlo',
        ],
      ),
    ],
    6: [
      PreguntaSemilla(
        '¿Qué tipo de mantenimiento corrige errores encontrados en el software?',
        'Correctivo',
        ['Perfectivo', 'Adaptativo', 'Preventivo'],
      ),
      PreguntaSemilla(
        '¿Qué es la deuda técnica?',
        'El costo futuro de elegir soluciones rápidas en lugar de soluciones bien hechas',
        [
          'El dinero que se debe al proveedor de hardware',
          'El presupuesto total del proyecto',
          'El pago de licencias atrasadas',
        ],
      ),
      PreguntaSemilla(
        '¿Qué norma define un modelo de calidad del producto de software?',
        'ISO/IEC 25010',
        ['ISO 9660', 'IEEE 802.11', 'ISO 3166'],
      ),
      PreguntaSemilla(
        '¿Qué es la usabilidad?',
        'La facilidad con la que los usuarios aprenden y usan el software',
        [
          'La velocidad del procesador',
          'El tamaño del archivo instalado',
          'El número de líneas de código',
        ],
      ),
      PreguntaSemilla(
        '¿Qué es un sistema embebido?',
        'Software integrado en un dispositivo para cumplir una función específica',
        [
          'Un programa que solo funciona en internet',
          'Un sistema operativo de escritorio',
          'Una base de datos en la nube',
        ],
      ),
    ],
  },

  // ===================== MODULO 2: PROCESOS Y METODOLOGIAS =====================
  2: {
    2: [
      PreguntaSemilla(
        '¿Qué es el ciclo de vida del software?',
        'Las etapas por las que pasa un software desde su concepción hasta su retiro',
        [
          'El tiempo que dura la batería del equipo',
          'La vida laboral de un programador',
          'El número de usuarios activos',
        ],
      ),
      PreguntaSemilla(
        '¿Cómo se caracteriza el modelo en cascada?',
        'Etapas secuenciales donde cada una inicia al terminar la anterior',
        [
          'Entregas pequeñas y continuas cada semana',
          'No tiene fases definidas',
          'Se programa antes de analizar',
        ],
      ),
      PreguntaSemilla(
        '¿Qué es el modelo incremental?',
        'Entregar el software en partes funcionales sucesivas',
        [
          'Entregar todo el software al final sin avances',
          'Repetir el mismo código varias veces',
          'Hacer solo pruebas',
        ],
      ),
      PreguntaSemilla(
        '¿Qué caracteriza al modelo en espiral?',
        'Incorpora el análisis de riesgos en cada vuelta',
        [
          'No considera los riesgos',
          'Tiene una única fase',
          'Elimina la planificación',
        ],
      ),
      PreguntaSemilla(
        '¿Para qué sirve un prototipo?',
        'Para validar ideas o requisitos con una versión preliminar',
        [
          'Es el producto final ya entregado',
          'Es el manual de usuario',
          'Es un tipo de base de datos',
        ],
      ),
    ],
    4: [
      PreguntaSemilla(
        '¿Qué es una metodología ágil?',
        'Un enfoque iterativo que valora la adaptación al cambio',
        [
          'Un modelo sin comunicación con el cliente',
          'Un método que exige documentación extensa antes de programar',
          'Un lenguaje de programación',
        ],
      ),
      PreguntaSemilla(
        'Según el Manifiesto Ágil, ¿qué se valora más?',
        'Los individuos e interacciones sobre los procesos y herramientas',
        [
          'La documentación extensa sobre el software funcionando',
          'Seguir un plan sobre responder al cambio',
          'La negociación del contrato sobre la colaboración con el cliente',
        ],
      ),
      PreguntaSemilla(
        'En Scrum, ¿cómo se llama cada iteración de trabajo?',
        'Sprint',
        ['Release', 'Backlog', 'Commit'],
      ),
      PreguntaSemilla(
        'En Scrum, ¿quién prioriza el Product Backlog?',
        'El Product Owner',
        ['El Scrum Master', 'El tester', 'El equipo de soporte'],
      ),
      PreguntaSemilla(
        '¿Cuál es la función principal del Scrum Master?',
        'Facilitar el proceso y ayudar a eliminar impedimentos del equipo',
        [
          'Asignar tareas y dar órdenes al equipo',
          'Escribir todo el código',
          'Decidir el presupuesto del cliente',
        ],
      ),
    ],
    6: [
      PreguntaSemilla(
        '¿Cuánto dura como máximo el Daily Scrum?',
        '15 minutos',
        ['1 hora', '4 horas', 'Un día completo'],
      ),
      PreguntaSemilla(
        '¿Qué es Kanban?',
        'Un método visual para gestionar el flujo de trabajo con un tablero',
        [
          'Un lenguaje de modelado',
          'Una herramienta de compilación',
          'Un tipo de prueba de software',
        ],
      ),
      PreguntaSemilla(
        'En Kanban, ¿qué se busca limitar?',
        'El trabajo en progreso (WIP)',
        [
          'El número de clientes',
          'La cantidad de reuniones',
          'El tamaño del código',
        ],
      ),
      PreguntaSemilla(
        '¿Para qué sirve un sistema de control de versiones como Git?',
        'Para registrar y gestionar los cambios del código a lo largo del tiempo',
        [
          'Para diseñar la interfaz gráfica',
          'Para compilar a código máquina',
          'Para acelerar el internet',
        ],
      ),
      PreguntaSemilla(
        '¿Qué es la integración continua?',
        'Integrar y probar automáticamente los cambios del código con frecuencia',
        [
          'Programar sin descansos',
          'Unir todo el código solo al final del proyecto',
          'Instalar el software en cada computadora a mano',
        ],
      ),
    ],
  },

  // ===================== MODULO 3: REQUISITOS, DISENO Y PRUEBAS =====================
  3: {
    2: [
      PreguntaSemilla(
        '¿Qué es un requisito funcional?',
        'Describe lo que el sistema debe hacer',
        [
          'Describe el color de la pantalla',
          'Indica el costo del hardware',
          'Define el horario del equipo',
        ],
      ),
      PreguntaSemilla(
        '¿Cuál es un ejemplo de requisito no funcional?',
        'El sistema debe responder en menos de 2 segundos',
        [
          'El usuario puede registrarse',
          'El sistema permite iniciar sesión',
          'El usuario puede editar su perfil',
        ],
      ),
      PreguntaSemilla(
        '¿Qué es una historia de usuario?',
        'Una descripción breve de una funcionalidad desde la perspectiva del usuario',
        [
          'Un diagrama de base de datos',
          'Un informe de errores',
          'Un contrato legal',
        ],
      ),
      PreguntaSemilla(
        '¿Cuál es el formato común de una historia de usuario?',
        'Como [rol], quiero [funcionalidad], para [beneficio]',
        [
          'Si [error], entonces [reiniciar]',
          'Inicio, proceso, fin',
          'Entrada, salida, almacenamiento',
        ],
      ),
      PreguntaSemilla(
        '¿Qué son los criterios de aceptación?',
        'Las condiciones que debe cumplir una funcionalidad para considerarse terminada',
        [
          'Los requisitos para contratar al equipo',
          'Las reglas de estilo del código',
          'La lista de errores conocidos',
        ],
      ),
    ],
    4: [
      PreguntaSemilla(
        '¿Qué representa un diagrama de casos de uso en UML?',
        'La interacción entre los actores y el sistema',
        [
          'La estructura interna de la memoria',
          'El flujo de la red',
          'El código fuente completo',
        ],
      ),
      PreguntaSemilla(
        '¿Qué muestra un diagrama de clases?',
        'Las clases, sus atributos, métodos y relaciones',
        [
          'Los tiempos de entrega',
          'El presupuesto del proyecto',
          'Los usuarios conectados',
        ],
      ),
      PreguntaSemilla(
        '¿Qué busca el principio de bajo acoplamiento y alta cohesión?',
        'Módulos independientes entre sí y con una responsabilidad bien definida',
        [
          'Módulos que dependen totalmente unos de otros',
          'Un solo módulo que haga todo',
          'Eliminar la modularidad',
        ],
      ),
      PreguntaSemilla(
        '¿Qué es un patrón de diseño?',
        'Una solución reutilizable a un problema común de diseño',
        [
          'Un error frecuente en el código',
          'Una plantilla de colores',
          'Un tipo de licencia',
        ],
      ),
      PreguntaSemilla(
        '¿Qué garantiza el patrón Singleton?',
        'Que una clase tenga una sola instancia en toda la aplicación',
        [
          'Que una clase no tenga métodos',
          'Que una clase se copie en cada pantalla',
          'Que una clase no se pueda heredar',
        ],
      ),
    ],
    6: [
      PreguntaSemilla(
        '¿Qué son las pruebas unitarias?',
        'Pruebas de las partes más pequeñas del código, como funciones o métodos',
        [
          'Pruebas del sistema completo en producción',
          'Pruebas de la red del cliente',
          'Encuestas de satisfacción',
        ],
      ),
      PreguntaSemilla(
        '¿Cuál es el objetivo de las pruebas de integración?',
        'Verificar que los módulos funcionen correctamente en conjunto',
        [
          'Revisar la ortografía del código',
          'Medir el tamaño del archivo final',
          'Probar solo una variable',
        ],
      ),
      PreguntaSemilla(
        '¿Qué son las pruebas de caja negra?',
        'Pruebas que revisan entradas y salidas sin conocer el código interno',
        [
          'Pruebas que leen el código línea por línea',
          'Pruebas que se hacen con la pantalla apagada',
          'Pruebas del hardware del servidor',
        ],
      ),
      PreguntaSemilla(
        '¿Qué es una prueba de regresión?',
        'Verificar que los cambios nuevos no rompieron lo que ya funcionaba',
        [
          'Regresar a una versión anterior del código',
          'Probar solo las funciones nuevas',
          'Medir la velocidad de la app',
        ],
      ),
      PreguntaSemilla(
        '¿Qué es la refactorización?',
        'Mejorar la estructura interna del código sin cambiar su comportamiento',
        [
          'Agregar nuevas funcionalidades al sistema',
          'Borrar todo el código y empezar de nuevo',
          'Cambiar el lenguaje de programación',
        ],
      ),
    ],
  },
};

// Teoria por [numero de modulo][numero de paso].
// Solo los pasos de tipo teoria (1, 3 y 5) tienen teoria.
// El orden de la lista es la pagina: el primer texto es la pagina 1, etc.
const Map<int, Map<int, List<String>>> teoriasIniciales = {
  // ===================== MODULO 1: FUNDAMENTOS =====================
  1: {
    1: [
      'La ingeniería de software es la aplicación de un enfoque sistemático, disciplinado y medible al desarrollo, operación y mantenimiento del software. No se trata solo de programar, sino de planear, diseñar, construir, probar y mantener sistemas de forma ordenada.',
      'El término se popularizó en 1968, en una conferencia de la OTAN, como respuesta a la llamada "crisis del software": muchos proyectos se entregaban tarde, costaban más de lo previsto y tenían errores graves.',
      'Su objetivo es producir software de calidad, a tiempo y dentro del presupuesto. Para lograrlo combina conocimientos técnicos, métodos de trabajo y herramientas, igual que otras ingenierías.',
    ],
    3: [
      'El software es intangible: no se desgasta con el uso como una máquina, pero sí se deteriora cuando se modifica sin cuidado. Por eso el mantenimiento ocupa gran parte de su vida útil.',
      'Existen distintos tipos de software: de sistema (como un sistema operativo), de aplicación (como un editor de texto), embebido (dentro de un dispositivo) y web o móvil, entre otros.',
      'Un stakeholder es cualquier persona u organización interesada o afectada por el proyecto: clientes, usuarios, desarrolladores, directivos e incluso reguladores. Entender sus necesidades es clave para el éxito.',
    ],
    5: [
      'La calidad del software se mide con atributos como funcionalidad, confiabilidad, usabilidad, eficiencia, mantenibilidad y portabilidad. La norma ISO/IEC 25010 define un modelo de calidad con estas características.',
      'El mantenimiento puede ser correctivo (corregir errores), adaptativo (ajustarse a cambios del entorno), perfectivo (mejorar o agregar funciones) y preventivo (evitar problemas futuros).',
      'El ingeniero de software tiene responsabilidades éticas: proteger la información del cliente, ser honesto sobre los riesgos y errores conocidos, y entregar productos probados que no pongan en riesgo a las personas.',
    ],
  },

  // ===================== MODULO 2: PROCESOS Y METODOLOGIAS =====================
  2: {
    1: [
      'El ciclo de vida del software describe las etapas por las que pasa un sistema: análisis de requisitos, diseño, implementación, pruebas, despliegue y mantenimiento, hasta su retiro.',
      'Un proceso de software es el conjunto de actividades que se siguen para construir un sistema. Un modelo de proceso indica en qué orden y de qué forma se realizan esas actividades.',
      'Elegir el modelo adecuado depende del proyecto: qué tan claros son los requisitos, qué tan grande es el equipo, cuánto riesgo existe y qué tan seguido puede participar el cliente.',
    ],
    3: [
      'El modelo en cascada organiza las etapas de forma secuencial: cada una empieza cuando termina la anterior. Es fácil de planear, pero cuesta mucho corregir errores detectados al final.',
      'El modelo incremental entrega el sistema en partes funcionales. Cada incremento agrega funciones nuevas, lo que permite que el cliente use el software antes y dé retroalimentación temprana.',
      'El modelo en espiral repite ciclos de planeación, análisis de riesgos, desarrollo y evaluación. Es útil en proyectos grandes y riesgosos, porque obliga a revisar los riesgos en cada vuelta.',
    ],
    5: [
      'Las metodologías ágiles priorizan a las personas, el software funcionando, la colaboración con el cliente y la respuesta al cambio. Estos valores se publicaron en el Manifiesto Ágil en 2001.',
      'Scrum trabaja en iteraciones cortas llamadas sprints. Sus roles son el Product Owner, que prioriza el backlog; el Scrum Master, que facilita el proceso; y el equipo de desarrollo.',
      'Kanban organiza el trabajo en un tablero visual con columnas como "Por hacer", "En progreso" y "Terminado", y limita la cantidad de tareas en progreso para mantener un flujo constante.',
    ],
  },

  // ===================== MODULO 3: REQUISITOS, DISENO Y PRUEBAS =====================
  3: {
    1: [
      'Un requisito describe algo que el sistema debe hacer o una condición que debe cumplir. Los requisitos funcionales indican qué hace el sistema; los no funcionales, cómo debe hacerlo (rendimiento, seguridad, usabilidad).',
      'La ingeniería de requisitos incluye obtenerlos (entrevistas, encuestas, observación), analizarlos, documentarlos y validarlos con los stakeholders para confirmar que son correctos.',
      'En metodologías ágiles se usan historias de usuario con el formato "Como [rol], quiero [funcionalidad], para [beneficio]", acompañadas de criterios de aceptación que definen cuándo está terminada.',
    ],
    3: [
      'El diseño de software define la estructura del sistema antes de programarlo: sus componentes, cómo se comunican y qué responsabilidad tiene cada uno.',
      'UML es un lenguaje gráfico para modelar sistemas. El diagrama de casos de uso muestra la interacción entre actores y sistema; el diagrama de clases muestra clases, atributos, métodos y relaciones.',
      'Un buen diseño busca bajo acoplamiento (módulos poco dependientes entre sí) y alta cohesión (cada módulo con una responsabilidad clara). Los patrones de diseño ofrecen soluciones probadas a problemas comunes.',
    ],
    5: [
      'Las pruebas de software verifican que el sistema funcione como se espera y ayudan a encontrar errores antes de que lleguen al usuario. No prueban que no haya errores, pero reducen el riesgo.',
      'Hay varios niveles de prueba: unitarias (funciones o clases aisladas), de integración (módulos trabajando juntos), de sistema (el sistema completo) y de aceptación (validación con el cliente).',
      'Las pruebas de caja negra revisan entradas y salidas sin ver el código; las de caja blanca analizan la lógica interna. Las pruebas de regresión confirman que un cambio nuevo no rompió lo que ya funcionaba.',
    ],
  },
};