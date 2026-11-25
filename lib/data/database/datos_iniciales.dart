// Una pregunta con su respuesta correcta y 3 incorrectas.
class PreguntaSemilla {
  final String titulo;
  final String correcta;
  final List<String> incorrectas;

  const PreguntaSemilla(this.titulo, this.correcta, this.incorrectas);
}

// Preguntas por [numero de modulo][numero de paso].
// Solo los pasos de tipo cuestionario (2, 4 y 6) tienen preguntas.
// Cada cuestionario pregunta solo lo que explica la teoria del paso
// anterior (paso 2 <- teoria del paso 1, 4 <- 3, 6 <- 5).
const Map<int, Map<int, List<PreguntaSemilla>>> preguntasIniciales = {
  // ============== MODULO 1: SISTEMAS Y CICLO DE VIDA DEL SOFTWARE ==============
  1: {
    // teoria del paso 1: que es un sistema, sus elementos y su clasificacion
    2: [
      PreguntaSemilla(
        '¿Qué es un sistema?',
        'Un conjunto de elementos relacionados que interactúan para lograr un objetivo común',
        [
          'Un programa de computadora que se instala en un equipo',
          'Cualquier objeto que funcione con electricidad',
          'Un grupo de elementos aislados que no se relacionan entre sí',
        ],
      ),
      PreguntaSemilla(
        '¿Qué es la frontera o límite de un sistema?',
        'Lo que separa al sistema de su entorno',
        [
          'El objetivo que persigue el sistema',
          'El resultado que entrega el sistema',
          'La parte más importante del sistema',
        ],
      ),
      PreguntaSemilla(
        'En un sistema, ¿qué es la retroalimentación?',
        'La parte de la salida que regresa como entrada para controlar el sistema',
        [
          'Los datos que el sistema recibe por primera vez',
          'La parte del sistema que se desecha',
          'El límite que separa al sistema del entorno',
        ],
      ),
      PreguntaSemilla(
        'Según la Teoría General de Sistemas, ¿qué significa sinergia?',
        'Que el todo es más que la suma de sus partes',
        [
          'Que cada parte funciona sin depender de las demás',
          'Que el sistema no tiene entorno',
          'Que el sistema pierde orden con el tiempo',
        ],
      ),
      PreguntaSemilla(
        '¿Qué es un sistema abierto?',
        'Un sistema que intercambia información, energía o materia con su entorno',
        [
          'Un sistema que no tiene componentes',
          'Un sistema que no tiene objetivo',
          'Un sistema que no tiene ningún intercambio con el exterior',
        ],
      ),
    ],
    // teoria del paso 3: sistemas basados en computadora
    4: [
      PreguntaSemilla(
        'Según Pressman, ¿qué elementos forman un sistema basado en computadora?',
        'Software, hardware, personas, bases de datos, documentación y procedimientos',
        [
          'Solo el software',
          'Solo el hardware y la red',
          'Solo los programadores y sus computadoras',
        ],
      ),
      PreguntaSemilla(
        'En un sistema de información, ¿qué función guarda los datos para usarlos después?',
        'Almacenamiento',
        ['Entrada', 'Salida', 'Procesamiento'],
      ),
      PreguntaSemilla(
        '¿Qué es un sistema sociotécnico?',
        'Un sistema que incluye hardware, software, personas, procesos y reglas de una organización',
        [
          'Un sistema formado solo por software',
          'Una red social en internet',
          'Un sistema natural sin intervención humana',
        ],
      ),
      PreguntaSemilla(
        '¿Qué es una propiedad emergente?',
        'Una característica del sistema completo que no tiene ninguna de sus partes por separado',
        [
          'Un error que aparece de repente',
          'Una función nueva que se agrega al software',
          'Una pieza del hardware que se puede reemplazar',
        ],
      ),
      PreguntaSemilla(
        '¿Cuál es la relación entre la ingeniería de sistemas y la ingeniería de software?',
        'La ingeniería de software es una parte de la ingeniería de sistemas',
        [
          'Son exactamente lo mismo',
          'La ingeniería de sistemas es una parte de la de software',
          'No tienen ninguna relación',
        ],
      ),
    ],
    // teoria del paso 5: ciclo de vida del software
    6: [
      PreguntaSemilla(
        '¿Qué es el ciclo de vida del software?',
        'Las etapas por las que pasa un sistema desde que surge la idea hasta que se deja de usar',
        [
          'El tiempo que dura la batería del teléfono',
          'La vida laboral de un programador',
          'El número de usuarios que tiene una app',
        ],
      ),
      PreguntaSemilla(
        '¿En qué etapa se decide cómo se construirá el software: arquitectura, datos e interfaces?',
        'Diseño',
        ['Implementación', 'Retiro', 'Despliegue'],
      ),
      PreguntaSemilla(
        '¿Qué se hace en el despliegue o implantación?',
        'Instalar el software, ponerlo en uso y capacitar a los usuarios',
        [
          'Escribir el código por primera vez',
          'Entender qué necesita el cliente',
          'Dejar de usar el software',
        ],
      ),
      PreguntaSemilla(
        '¿Qué tipo de mantenimiento ajusta el software a un nuevo sistema operativo?',
        'Adaptativo',
        ['Correctivo', 'Perfectivo', 'Preventivo'],
      ),
      PreguntaSemilla(
        '¿Por qué conviene encontrar los errores en las primeras etapas?',
        'Porque mientras más tarde se encuentra un error, más caro es corregirlo',
        [
          'Porque al final ya no se pueden corregir',
          'Porque las pruebas nunca encuentran errores',
          'Porque el cliente no usa el software',
        ],
      ),
    ],
  },

  // ============== MODULO 2: DEFINICION DE INGENIERIA DE SOFTWARE ==============
  2: {
    // teoria del paso 1: que es el software y que es la ingenieria de software
    2: [
      PreguntaSemilla(
        'Según Sommerville, ¿qué forma el software?',
        'Los programas, su documentación y los datos de configuración',
        [
          'Solo el código fuente',
          'Solo el archivo que se instala',
          'El hardware y los programas',
        ],
      ),
      PreguntaSemilla(
        '¿Cómo define la IEEE a la ingeniería de software?',
        'La aplicación de un enfoque sistemático, disciplinado y cuantificable al desarrollo, operación y mantenimiento del software',
        [
          'El arte de escribir código sin planear',
          'El estudio de los circuitos electrónicos de una computadora',
          'La reparación de equipos de cómputo',
        ],
      ),
      PreguntaSemilla(
        'Según Fritz Bauer, ¿qué busca la ingeniería de software?',
        'Obtener de manera económica software confiable que funcione eficientemente en máquinas reales',
        [
          'Crear el software más grande posible',
          'Programar sin usar principios de ingeniería',
          'Fabricar computadoras más rápidas',
        ],
      ),
      PreguntaSemilla(
        '¿De qué se ocupan las ciencias de la computación?',
        'De la teoría y los fundamentos de la computación',
        [
          'Solo de vender software',
          'De entregar software a tiempo y dentro del presupuesto',
          'De administrar el presupuesto de los proyectos',
        ],
      ),
      PreguntaSemilla(
        '¿De qué se ocupa la ingeniería de software?',
        'De los aspectos prácticos de producir software útil, a tiempo y dentro del presupuesto',
        [
          'Solo de la teoría matemática de la computación',
          'Del diseño de circuitos electrónicos',
          'De la instalación de redes',
        ],
      ),
    ],
    // teoria del paso 3: origen, crisis del software y caracteristicas
    4: [
      PreguntaSemilla(
        '¿Cuándo y dónde se popularizó el término ingeniería de software?',
        'En 1968, en una conferencia de la OTAN',
        [
          'En 1990, con la llegada de internet',
          'En 2001, con el Manifiesto Ágil',
          'En 1945, al crearse la primera computadora',
        ],
      ),
      PreguntaSemilla(
        '¿Qué fue la crisis del software?',
        'Proyectos que se entregaban tarde, costaban más de lo planeado y tenían baja calidad',
        [
          'La falta de computadoras en el mundo',
          'Un virus que borró muchos programas',
          'La caída del precio del hardware',
        ],
      ),
      PreguntaSemilla(
        '¿Cuál es una característica del software?',
        'No se desgasta con el uso, pero se deteriora por los cambios',
        [
          'Se desgasta con el uso igual que una máquina',
          'Nunca necesita cambios',
          'Su mayor costo es producir copias',
        ],
      ),
      PreguntaSemilla(
        'El software, ¿se fabrica o se desarrolla?',
        'Se desarrolla; su costo está en el trabajo de ingeniería',
        [
          'Se fabrica en una línea de producción',
          'Se fabrica igual que el hardware',
          'No se fabrica ni se desarrolla, solo se compra',
        ],
      ),
      PreguntaSemilla(
        '¿Qué dice la Ley de Brooks?',
        'Agregar personas a un proyecto atrasado lo atrasa más',
        [
          'Agregar personas a un proyecto atrasado siempre lo adelanta',
          'El software se desgasta cada año',
          'La calidad no depende del proceso',
        ],
      ),
    ],
    // teoria del paso 5: capas, actividades, atributos, SWEBOK y etica
    6: [
      PreguntaSemilla(
        'En la tecnología en capas de Pressman, ¿cuál es la base?',
        'El compromiso con la calidad',
        ['Las herramientas', 'El código fuente', 'Los métodos'],
      ),
      PreguntaSemilla(
        '¿Qué actividad del proceso comprueba que el software hace lo que el cliente quiere?',
        'Validación',
        ['Especificación', 'Evolución', 'Desarrollo'],
      ),
      PreguntaSemilla(
        '¿Qué atributo de un buen software indica que no desperdicia recursos como memoria o batería?',
        'Eficiencia',
        ['Aceptabilidad', 'Mantenibilidad', 'Evolución'],
      ),
      PreguntaSemilla(
        '¿Qué es el SWEBOK?',
        'Una guía de la IEEE Computer Society que organiza el conocimiento de la ingeniería de software',
        [
          'Un lenguaje de programación',
          'Un sistema operativo',
          'Una norma para fabricar hardware',
        ],
      ),
      PreguntaSemilla(
        '¿Cuál es el primer principio del código de ética de la ACM y la IEEE?',
        'Actuar en favor del interés público',
        [
          'Terminar el proyecto lo más rápido posible',
          'Obedecer siempre al empleador',
          'Ganar la mayor cantidad de dinero',
        ],
      ),
    ],
  },

  // ===================== MODULO 3: DOMINIOS DE APLICACION =====================
  3: {
    // teoria del paso 1: que es un dominio y categorias de software
    2: [
      PreguntaSemilla(
        '¿Qué es un dominio de aplicación?',
        'El área del mundo real donde se usará el software, con su vocabulario, reglas y necesidades',
        [
          'El nombre de una página web',
          'El lenguaje de programación del proyecto',
          'La computadora donde se instala el software',
        ],
      ),
      PreguntaSemilla(
        '¿Quién es un experto del dominio?',
        'Una persona que conoce a fondo el área donde se usará el software',
        [
          'El programador con más experiencia',
          'El dueño del servidor',
          'La persona que instala el software',
        ],
      ),
      PreguntaSemilla(
        '¿Cuál de estos es un ejemplo de software de sistemas?',
        'Un compilador',
        [
          'Un juego móvil',
          'El programa de nómina de una empresa',
          'Una aplicación de recetas',
        ],
      ),
      PreguntaSemilla(
        '¿Cuál de estos es un ejemplo de software incrustado?',
        'El programa que controla los frenos de un auto',
        ['Un procesador de textos', 'Un navegador web', 'Una hoja de cálculo'],
      ),
      PreguntaSemilla(
        '¿Qué hace el software de inteligencia artificial?',
        'Resuelve problemas complejos con técnicas como redes neuronales o reconocimiento de patrones',
        [
          'Solo guarda archivos en el disco',
          'Controla únicamente el hardware de la computadora',
          'Muestra páginas web que nunca cambian',
        ],
      ),
    ],
    // teoria del paso 3: tipos de aplicacion segun Sommerville
    4: [
      PreguntaSemilla(
        '¿Qué tipo de aplicación es una tienda en línea?',
        'Una aplicación interactiva basada en transacciones',
        [
          'Un sistema de control embebido',
          'Un sistema de adquisición de datos',
          'Un sistema de modelado y simulación',
        ],
      ),
      PreguntaSemilla(
        '¿Qué tipo de sistema calcula la nómina de todos los empleados de una sola vez?',
        'Un sistema de procesamiento en lotes',
        [
          'Un sistema de entretenimiento',
          'Una aplicación independiente',
          'Un sistema de control embebido',
        ],
      ),
      PreguntaSemilla(
        '¿Qué caracteriza a una aplicación independiente?',
        'Se ejecuta en un solo dispositivo y no necesita una red',
        [
          'Siempre necesita internet para funcionar',
          'Controla un dispositivo de hardware',
          'Está formada por varios sistemas',
        ],
      ),
      PreguntaSemilla(
        '¿Qué hace un sistema de adquisición de datos?',
        'Recoge información del entorno con sensores y la envía a otros sistemas',
        [
          'Procesa la nómina mensual',
          'Vende productos por internet',
          'Entretiene a los usuarios con juegos',
        ],
      ),
      PreguntaSemilla(
        '¿Qué es un sistema de sistemas?',
        'Un sistema formado por varios sistemas independientes que trabajan juntos',
        [
          'Un sistema que no tiene subsistemas',
          'Un sistema operativo instalado dos veces',
          'Un programa que solo corre en una computadora',
        ],
      ),
    ],
    // teoria del paso 5: exigencias de cada dominio y sistemas criticos
    6: [
      PreguntaSemilla(
        '¿Qué es lo más importante en un sistema bancario?',
        'La seguridad y la exactitud de los datos',
        [
          'Los gráficos llamativos',
          'La música de fondo',
          'Que tenga muchos colores',
        ],
      ),
      PreguntaSemilla(
        '¿Qué es un sistema crítico?',
        'Un sistema cuya falla puede causar daño a personas, grandes pérdidas económicas o daños al ambiente',
        [
          'Un sistema que siempre falla',
          'Un sistema que nadie usa',
          'Un sistema muy barato',
        ],
      ),
      PreguntaSemilla(
        '¿Cuál es un ejemplo de sistema crítico de seguridad?',
        'Una bomba de insulina',
        ['Un juego de cartas', 'Una app de notas', 'Un reproductor de música'],
      ),
      PreguntaSemilla(
        '¿Qué norma debe cumplir el software de los dispositivos médicos?',
        'IEC 62304',
        ['DO-178C', 'ISO 9660', 'IEEE 802.11'],
      ),
      PreguntaSemilla(
        '¿Qué es el software heredado (legacy)?',
        'Un sistema antiguo que sigue siendo importante para el negocio',
        [
          'Un programa recién creado',
          'Un software que se recibe como herencia familiar',
          'Una app que ya nadie usa',
        ],
      ),
    ],
  },
};

// Teoria por [numero de modulo][numero de paso].
// Solo los pasos de tipo teoria (1, 3 y 5) tienen teoria.
// El orden de la lista es la pagina: el primer texto es la pagina 1, etc.
// Cada paso puede tener distinto numero de paginas.
const Map<int, Map<int, List<String>>> teoriasIniciales = {
  // ============== MODULO 1: SISTEMAS Y CICLO DE VIDA DEL SOFTWARE ==============
  1: {
    1: [
      'Un sistema es un conjunto de elementos relacionados entre sí que interactúan para lograr un objetivo común. Un reloj, una escuela, el cuerpo humano o una aplicación móvil son ejemplos de sistemas: cada uno tiene partes que trabajan juntas con un propósito.',
      'Todo sistema tiene componentes (las partes que lo forman), relaciones (cómo se conectan esas partes) y un objetivo (para qué existe). También tiene una frontera o límite, que lo separa de lo que no es parte de él, y un entorno: todo lo que está fuera de la frontera y lo afecta.',
      'Un sistema funciona con entradas, procesos y salidas. Las entradas son lo que recibe del entorno (datos, energía o materiales); el proceso las transforma, y las salidas son el resultado que entrega. La retroalimentación es la parte de la salida que regresa como entrada para controlar y corregir el funcionamiento, como un termostato que mide la temperatura y prende o apaga la calefacción.',
      'La Teoría General de Sistemas, propuesta por Ludwig von Bertalanffy, dice que los sistemas deben estudiarse como un todo, porque las relaciones entre sus partes producen comportamientos que las partes no tienen por separado. A esto se le llama sinergia: el todo es más que la suma de sus partes.',
      'Los sistemas se clasifican de varias formas. Son naturales (un ecosistema) o artificiales (una empresa). Son abiertos si intercambian información, energía o materia con su entorno, o cerrados si casi no lo hacen. Son físicos (el hardware) o abstractos (un idioma o el software). Un subsistema es un sistema que forma parte de otro más grande.',
    ],
    3: [
      'Un sistema basado en computadora es un conjunto de elementos organizados para lograr un objetivo procesando información. Según Pressman, sus elementos son: software, hardware, personas, bases de datos, documentación y procedimientos. El software es solo una parte del sistema.',
      'Un sistema de información recolecta, procesa, almacena y distribuye información para apoyar las decisiones de una organización. Sus cuatro funciones básicas son: entrada (capturar datos), procesamiento (transformarlos), almacenamiento (guardarlos para usarlos después) y salida (entregar resultados).',
      'Sommerville llama sistemas sociotécnicos a los que incluyen, además de hardware y software, a las personas, los procesos y las reglas de una organización. El control de vuelos de un aeropuerto o el sistema de inscripciones de una universidad son sistemas sociotécnicos.',
      'Las propiedades emergentes son características del sistema completo que no tiene ninguna de sus partes por separado. La confiabilidad, la seguridad y la usabilidad son propiedades emergentes: dependen de cómo trabajan juntos el hardware, el software y las personas.',
      'La ingeniería de sistemas se ocupa de todo el sistema: hardware, software, personas y procesos. La ingeniería de software es una parte de la ingeniería de sistemas y se enfoca en desarrollar el software. Por eso un ingeniero de software debe entender el sistema donde funcionará su programa.',
    ],
    5: [
      'El ciclo de vida del software es el conjunto de etapas por las que pasa un sistema desde que surge la idea hasta que se deja de usar. Conocerlo ayuda a planear el trabajo y a saber qué se debe entregar en cada momento.',
      'Las primeras etapas son: análisis de requisitos (entender qué necesita el cliente), diseño (decidir cómo se construirá el software: su arquitectura, sus datos y sus interfaces), implementación (programar lo que se diseñó) y pruebas (verificar que el software funcione y encontrar errores).',
      'Después vienen el despliegue o implantación (instalar el software, ponerlo en uso y capacitar a los usuarios), el mantenimiento (corregirlo, adaptarlo y mejorarlo mientras se usa) y el retiro (dejar de usarlo y pasar sus datos a otro sistema).',
      'El mantenimiento suele ser la etapa más larga y costosa. Hay cuatro tipos: correctivo (corregir errores), adaptativo (ajustarse a cambios del entorno, como un nuevo sistema operativo), perfectivo (mejorar o agregar funciones) y preventivo (evitar problemas futuros).',
      'Mientras más tarde se encuentra un error, más caro es corregirlo: un requisito mal entendido que se descubre al final obliga a rehacer el diseño y el código. Por eso la ingeniería de software dedica tiempo al análisis y al diseño antes de programar. La forma de ordenar estas etapas se llama modelo de proceso; por ejemplo, el modelo en cascada las sigue una tras otra.',
    ],
  },

  // ============== MODULO 2: DEFINICION DE INGENIERIA DE SOFTWARE ==============
  2: {
    1: [
      'El software no es solo el código. Según Sommerville, el software está formado por los programas de computadora, su documentación y los datos de configuración que necesitan para funcionar correctamente.',
      'La IEEE define la ingeniería de software como la aplicación de un enfoque sistemático, disciplinado y cuantificable al desarrollo, la operación y el mantenimiento del software; es decir, la aplicación de la ingeniería al software.',
      'Fritz Bauer la definió como el establecimiento y uso de principios de ingeniería robustos para obtener, de manera económica, software confiable que funcione eficientemente en máquinas reales.',
      'La ingeniería de software no es lo mismo que las ciencias de la computación. Las ciencias de la computación estudian la teoría y los fundamentos de la computación. La ingeniería de software se ocupa de los aspectos prácticos de producir software útil, a tiempo y dentro del presupuesto.',
    ],
    3: [
      'El término ingeniería de software se popularizó en 1968, en una conferencia de la OTAN celebrada en Garmisch, Alemania. Se propuso como respuesta a la crisis del software.',
      'La crisis del software fue el nombre que se dio a los problemas de los años 60 y 70: los proyectos se entregaban tarde, costaban más de lo planeado, tenían baja calidad y eran difíciles de mantener. Programar sin método ya no servía para sistemas grandes.',
      'El software es diferente de un producto físico. Se desarrolla, no se fabrica: su costo está en el trabajo de ingeniería, no en producir copias. Además, no se desgasta con el uso como una máquina, pero sí se deteriora por los cambios que se le hacen con el tiempo.',
      'Algunos mitos del software llevan a malas decisiones. Uno es pensar que agregar más programadores a un proyecto atrasado lo pondrá al día. La Ley de Brooks dice lo contrario: agregar personas a un proyecto atrasado lo atrasa más, porque los nuevos deben aprender y aumenta la comunicación necesaria.',
    ],
    5: [
      'Pressman describe la ingeniería de software como una tecnología en capas. La base es el compromiso con la calidad. Encima están el proceso (el marco que organiza las actividades), los métodos (cómo hacer cada tarea técnica) y las herramientas (programas que apoyan el proceso y los métodos).',
      'Según Sommerville, todo proceso de software tiene cuatro actividades fundamentales: especificación (definir qué debe hacer el software), desarrollo (diseñarlo y programarlo), validación (comprobar que hace lo que el cliente quiere) y evolución (modificarlo para adaptarlo a nuevas necesidades).',
      'Un buen software tiene estos atributos: mantenibilidad (se puede cambiar con facilidad), confiabilidad y seguridad (no causa daños ni fallas graves), eficiencia (no desperdicia recursos como memoria o batería) y aceptabilidad (los usuarios lo entienden y quieren usarlo).',
      'El SWEBOK (Software Engineering Body of Knowledge) es una guía de la IEEE Computer Society que organiza el conocimiento de la ingeniería de software en áreas como requisitos, diseño, construcción, pruebas, mantenimiento, gestión de configuración, gestión de proyectos, proceso y calidad.',
      'Los ingenieros de software siguen un código de ética creado por la ACM y la IEEE. Tiene ocho principios. El primero es actuar en favor del interés público; los demás tratan sobre el cliente y el empleador, el producto, el juicio profesional, la gestión, la profesión, los colegas y uno mismo.',
    ],
  },

  // ===================== MODULO 3: DOMINIOS DE APLICACION =====================
  3: {
    1: [
      'Un dominio de aplicación es el área o campo del mundo real donde se usará el software, por ejemplo la salud, la banca, la educación o el transporte. Cada dominio tiene su propio vocabulario, reglas y necesidades.',
      'Conocer el dominio es necesario para obtener requisitos correctos. Por eso el equipo trabaja con expertos del dominio: personas que conocen a fondo el área, como un médico en un sistema de hospital o un contador en un sistema de nómina, aunque no sepan programar.',
      'Pressman agrupa el software en categorías. El software de sistemas sirve a otros programas, como los sistemas operativos y los compiladores. El software de aplicación resuelve una necesidad específica de un negocio o de un usuario. El software de ingeniería y ciencia hace cálculos y simulaciones.',
      'El software incrustado vive dentro de un producto y controla sus funciones, como el de un horno de microondas o el que controla los frenos de un auto. El software de línea de productos ofrece una base común que se adapta a muchos clientes, como un programa de contabilidad.',
      'Las aplicaciones web y móviles se usan desde un navegador o un teléfono. El software de inteligencia artificial resuelve problemas complejos con técnicas como redes neuronales o reconocimiento de patrones, por ejemplo un asistente de voz.',
    ],
    3: [
      'Sommerville clasifica las aplicaciones por la forma en que funcionan. Las aplicaciones independientes se ejecutan en un solo dispositivo y no necesitan una red, como una app de dibujo o Isi!, que guarda sus datos en el mismo teléfono.',
      'Las aplicaciones interactivas basadas en transacciones se ejecutan en una computadora remota, y los usuarios entran a ellas desde su equipo, como una tienda en línea o la banca por internet.',
      'Los sistemas de procesamiento en lotes procesan muchos datos de una sola vez, sin que intervenga el usuario, como el cálculo de la nómina de todos los empleados o los estados de cuenta del mes.',
      'Los sistemas de control embebido controlan dispositivos de hardware, como el sistema de frenos ABS de un auto. Los sistemas de adquisición de datos recogen información del entorno con sensores y la envían a otros sistemas para procesarla, como una estación meteorológica.',
      'También hay sistemas de entretenimiento, como los videojuegos; sistemas de modelado y simulación, que representan procesos como el clima o el tráfico; y sistemas de sistemas, formados por varios sistemas independientes que trabajan juntos, como el control del tráfico aéreo.',
    ],
    5: [
      'Cada dominio le exige cosas distintas al software. En la banca lo más importante es la seguridad y la exactitud de los datos, porque un error puede causar pérdidas de dinero. En la salud se cuida la seguridad del paciente y la privacidad de su información.',
      'En la educación la usabilidad es clave, porque el estudiante debe aprender a usar el sistema rápido para concentrarse en el contenido. En los videojuegos importan el rendimiento y la experiencia del jugador.',
      'Un sistema crítico es aquel cuya falla puede causar daño a personas, grandes pérdidas económicas o daños al ambiente. Hay sistemas críticos de seguridad (como el control de un avión o una bomba de insulina), críticos para la misión (como la navegación de una nave espacial) y críticos para el negocio (como el sistema de cuentas de un banco).',
      'Los dominios regulados tienen normas que el software debe cumplir: por ejemplo, DO-178C para el software de los aviones e IEC 62304 para el software de los dispositivos médicos. Cumplirlas exige más pruebas y más documentación.',
      'Muchas organizaciones usan software heredado (legacy): sistemas antiguos que siguen siendo importantes para el negocio aunque usen tecnología vieja. Reemplazarlos es caro y riesgoso, por eso muchas veces se mantienen y se conectan con sistemas nuevos.',
    ],
  },
};

// Glosario: termino -> definicion. Se inserta en la tabla glosarios
// (al insertarse se ordena alfabeticamente).
const Map<String, String> glosarioInicial = {
  // ---------------- definicion de sistema ----------------
  'Sistema':
      'Conjunto de elementos relacionados entre sí que interactúan para lograr un objetivo común.',
  'Componente':
      'Cada una de las partes que forman un sistema.',
  'Frontera del sistema':
      'Límite que separa al sistema de su entorno; indica qué es parte del sistema y qué no.',
  'Entorno':
      'Todo lo que está fuera de la frontera de un sistema y lo afecta o es afectado por él.',
  'Entrada':
      'Lo que un sistema recibe de su entorno, como datos, energía o materiales.',
  'Salida':
      'El resultado que un sistema entrega a su entorno después de procesar sus entradas.',
  'Retroalimentación':
      'Parte de la salida de un sistema que regresa como entrada para controlar y corregir su funcionamiento.',
  'Teoría General de Sistemas':
      'Teoría propuesta por Ludwig von Bertalanffy que estudia los sistemas como un todo y no solo por sus partes.',
  'Sinergia':
      'Propiedad por la que el todo es más que la suma de sus partes: el sistema logra lo que sus partes no logran por separado.',
  'Sistema abierto':
      'Sistema que intercambia información, energía o materia con su entorno.',
  'Sistema cerrado':
      'Sistema que casi no tiene intercambio con su entorno.',
  'Sistema natural':
      'Sistema que existe sin intervención humana, como un ecosistema o el sistema solar.',
  'Sistema artificial':
      'Sistema creado por las personas, como una computadora o una empresa.',
  'Sistema abstracto':
      'Sistema formado por ideas o conceptos, como un sistema de numeración, un idioma o el software.',
  'Sistema físico':
      'Sistema formado por objetos reales que se pueden tocar, como el hardware de una computadora.',
  'Subsistema':
      'Sistema que forma parte de otro sistema más grande.',
  'Suprasistema':
      'Sistema que contiene a otros sistemas.',
  'Entropía':
      'Tendencia de un sistema a desordenarse y desgastarse con el tiempo.',
  'Homeostasis':
      'Capacidad de un sistema para mantener su equilibrio aunque cambie su entorno.',
  'Sistema basado en computadora':
      'Sistema que procesa información y está formado por software, hardware, personas, bases de datos, documentación y procedimientos.',
  'Sistema de información':
      'Sistema que recolecta, procesa, almacena y distribuye información para apoyar las decisiones de una organización.',
  'Sistema sociotécnico':
      'Sistema que incluye hardware, software, personas, procesos y reglas de una organización.',
  'Propiedad emergente':
      'Característica del sistema completo que no tiene ninguna de sus partes por separado, como la confiabilidad o la seguridad.',
  'Ingeniería de sistemas':
      'Disciplina que se ocupa de todo el sistema: hardware, software, personas y procesos. Incluye a la ingeniería de software.',

  // ---------------- ciclo de vida del software ----------------
  'Análisis de requisitos':
      'Etapa del ciclo de vida en la que se entiende y documenta qué necesita el cliente.',
  'Diseño de software':
      'Etapa del ciclo de vida en la que se decide cómo se construirá el software: su arquitectura, sus datos y sus interfaces.',
  'Implementación':
      'Etapa del ciclo de vida en la que se programa lo que se diseñó.',
  'Pruebas de software':
      'Etapa del ciclo de vida en la que se verifica que el software funcione y se buscan errores.',
  'Despliegue':
      'Etapa en la que el software se instala, se pone en uso y se capacita a los usuarios. También se llama implantación.',
  'Retiro del software':
      'Última etapa del ciclo de vida: el software se deja de usar y sus datos pasan a otro sistema.',
  'Mantenimiento correctivo':
      'Mantenimiento que corrige errores encontrados en el software.',
  'Mantenimiento adaptativo':
      'Mantenimiento que ajusta el software a cambios de su entorno, como un nuevo sistema operativo.',
  'Mantenimiento perfectivo':
      'Mantenimiento que mejora el software o le agrega funciones.',
  'Mantenimiento preventivo':
      'Mantenimiento que modifica el software para evitar problemas futuros.',
  'Modelo de proceso':
      'Forma de ordenar las etapas del ciclo de vida, como el modelo en cascada o el incremental.',

  // ---------------- definicion de ingenieria de software ----------------
  'Software':
      'Programas de computadora junto con su documentación y los datos de configuración que necesitan para funcionar.',
  'Ingeniería de software':
      'Aplicación de un enfoque sistemático, disciplinado y cuantificable al desarrollo, operación y mantenimiento del software (IEEE).',
  'Ciencias de la computación':
      'Disciplina que estudia la teoría y los fundamentos de la computación.',
  'Crisis del software':
      'Problemas de los años 60 y 70: proyectos con retrasos, sobrecostos y baja calidad. Dio origen a la ingeniería de software en 1968.',
  'Mito del software':
      'Creencia falsa sobre el desarrollo de software que lleva a malas decisiones.',
  'Ley de Brooks':
      'Agregar personas a un proyecto de software atrasado lo atrasa más.',
  'Tecnología en capas':
      'Modelo de Pressman: la base es el compromiso con la calidad y encima están el proceso, los métodos y las herramientas.',
  'Especificación':
      'Actividad del proceso de software en la que se define qué debe hacer el software.',
  'Validación':
      'Actividad del proceso de software que comprueba que el software hace lo que el cliente quiere.',
  'Evolución del software':
      'Actividad del proceso en la que el software se modifica para adaptarse a nuevas necesidades.',
  'Confiabilidad':
      'Capacidad del software para funcionar sin fallas graves y sin causar daños.',
  'Eficiencia':
      'Atributo del software que no desperdicia recursos como memoria, procesador o batería.',
  'Aceptabilidad':
      'Atributo del software que los usuarios entienden, encuentran útil y quieren usar.',
  'SWEBOK':
      'Software Engineering Body of Knowledge: guía de la IEEE Computer Society que organiza el conocimiento de la ingeniería de software.',
  'Código de ética':
      'Conjunto de ocho principios de la ACM y la IEEE para los ingenieros de software. El primero es actuar en favor del interés público.',

  // ---------------- dominios de aplicacion ----------------
  'Dominio de aplicación':
      'Área del mundo real donde se usará el software, con su propio vocabulario, reglas y necesidades.',
  'Experto del dominio':
      'Persona que conoce a fondo el área donde se usará el software, aunque no sepa programar.',
  'Software de sistemas':
      'Software que sirve a otros programas, como los sistemas operativos y los compiladores.',
  'Software de aplicación':
      'Software que resuelve una necesidad específica de un negocio o de un usuario.',
  'Software incrustado':
      'Software que vive dentro de un producto y controla sus funciones, como el de un microondas.',
  'Software de línea de productos':
      'Software con una base común que se adapta a muchos clientes.',
  'Inteligencia artificial':
      'Área que resuelve problemas complejos con técnicas como redes neuronales o reconocimiento de patrones.',
  'Aplicación independiente':
      'Aplicación que se ejecuta en un solo dispositivo y no necesita una red.',
  'Aplicación basada en transacciones':
      'Aplicación que se ejecuta en una computadora remota y a la que los usuarios entran desde su equipo, como una tienda en línea.',
  'Procesamiento en lotes':
      'Forma de procesar muchos datos de una sola vez sin intervención del usuario, como el cálculo de una nómina.',
  'Sistema de control embebido':
      'Sistema que controla un dispositivo de hardware, como los frenos ABS de un auto.',
  'Sistema de adquisición de datos':
      'Sistema que recoge información del entorno con sensores y la envía a otros sistemas.',
  'Sistema de sistemas':
      'Sistema formado por varios sistemas independientes que trabajan juntos, como el control del tráfico aéreo.',
  'Sistema crítico':
      'Sistema cuya falla puede causar daño a personas, grandes pérdidas económicas o daños al ambiente.',
  'Software heredado':
      'Sistema antiguo (legacy) que sigue siendo importante para el negocio aunque use tecnología vieja.',

  // ---------------- otros terminos de ingenieria de software ----------------
  'Acoplamiento':
      'Grado de dependencia entre módulos. Un buen diseño busca bajo acoplamiento para que un cambio en un módulo afecte poco a los demás.',
  'Backlog':
      'Lista priorizada de funcionalidades, mejoras y correcciones pendientes de un producto. En Scrum la mantiene el Product Owner.',
  'Calidad del software':
      'Grado en que un sistema cumple sus requisitos y las expectativas del usuario. Se mide con atributos como confiabilidad, usabilidad y mantenibilidad.',
  'Caso de uso':
      'Descripción de cómo un actor interactúa con el sistema para lograr un objetivo concreto.',
  'Ciclo de vida del software':
      'Conjunto de etapas por las que pasa un sistema: requisitos, diseño, implementación, pruebas, despliegue, mantenimiento y retiro.',
  'Cohesión':
      'Grado en que los elementos de un módulo están relacionados con una sola responsabilidad. Se busca alta cohesión.',
  'Control de versiones':
      'Sistema que registra los cambios del código a lo largo del tiempo y permite trabajar en equipo. Git es el más usado.',
  'Criterio de aceptación':
      'Condición que una funcionalidad debe cumplir para considerarse terminada y aceptada por el cliente.',
  'Deuda técnica':
      'Costo futuro de elegir soluciones rápidas o mal hechas en lugar de soluciones correctas.',
  'Diagrama de clases':
      'Diagrama UML que muestra las clases de un sistema con sus atributos, métodos y relaciones.',
  'Historia de usuario':
      'Descripción breve de una funcionalidad desde la perspectiva del usuario: "Como [rol], quiero [funcionalidad], para [beneficio]".',
  'Integración continua':
      'Práctica de integrar y probar automáticamente los cambios del código varias veces al día.',
  'Kanban':
      'Método visual para gestionar el flujo de trabajo con un tablero de columnas que limita el trabajo en progreso.',
  'Mantenibilidad':
      'Facilidad con la que el software puede corregirse, adaptarse o mejorarse después de entregado.',
  'Mantenimiento':
      'Modificación del software después de su entrega. Puede ser correctivo, adaptativo, perfectivo o preventivo.',
  'Metodología ágil':
      'Enfoque de desarrollo iterativo que prioriza a las personas, el software funcionando y la adaptación al cambio.',
  'Modelo en cascada':
      'Modelo de proceso secuencial en el que cada etapa empieza cuando termina la anterior.',
  'Modelo en espiral':
      'Modelo de proceso iterativo que incluye un análisis de riesgos en cada vuelta del ciclo.',
  'Modelo incremental':
      'Modelo de proceso que entrega el sistema en partes funcionales sucesivas.',
  'Patrón de diseño':
      'Solución probada y reutilizable para un problema común de diseño de software.',
  'Product Owner':
      'Rol de Scrum responsable de maximizar el valor del producto y de priorizar el backlog.',
  'Prototipo':
      'Versión preliminar de un sistema que sirve para validar ideas o requisitos con el usuario.',
  'Prueba de integración':
      'Prueba que verifica que varios módulos funcionen correctamente juntos.',
  'Prueba de regresión':
      'Prueba que confirma que un cambio nuevo no rompió funciones que ya funcionaban.',
  'Prueba unitaria':
      'Prueba de la parte más pequeña del código, como una función o un método, de forma aislada.',
  'Refactorización':
      'Mejora de la estructura interna del código sin cambiar su comportamiento externo.',
  'Requisito funcional':
      'Describe lo que el sistema debe hacer, por ejemplo "el usuario puede iniciar sesión".',
  'Requisito no funcional':
      'Describe cómo debe comportarse el sistema: rendimiento, seguridad, usabilidad, disponibilidad, etc.',
  'Scrum':
      'Marco de trabajo ágil que organiza el desarrollo en sprints, con roles, eventos y artefactos definidos.',
  'Scrum Master':
      'Rol de Scrum que facilita el proceso y ayuda al equipo a eliminar impedimentos.',
  'Sprint':
      'Iteración de duración fija (normalmente de 1 a 4 semanas) en la que el equipo de Scrum entrega un incremento del producto.',
  'Stakeholder':
      'Cualquier persona u organización interesada o afectada por el proyecto, como clientes, usuarios o desarrolladores.',
  'UML':
      'Lenguaje Unificado de Modelado: notación gráfica estándar para representar el diseño de un sistema.',
  'Usabilidad':
      'Facilidad con la que los usuarios aprenden a usar un sistema y logran sus objetivos con él.',
};