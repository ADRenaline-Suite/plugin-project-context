# TODO — plugin-project-context

Área compartida. Implementado: la versión y el changelog mandan (`0.0.1`). Este archivo sigue acotando el alcance.

La piden los oficios cuando el agente tiene que trabajar en un proyecto cuya forma ya existe, o en uno que todavía no la tiene, o en varios a la vez. No es una profesión. No va en todas las filas del ADR 3: se añade cuando hace falta esa foto antes de ejercer el oficio. Ningún rol copia sus skills.

No instala plugins. No copia sus carpetas. Recomendar nombra el plugin de la suite y la señal que lo justifica.

## Resultado

Una carpeta `project-context/` con la foto vigente del proyecto: qué entra, qué queda fuera, los hechos que se pudieron leer y de dónde salió cada uno, y qué plugins de la suite encajan. Varios proyectos producen un mapa que los relaciona, sin fundir sus modelos.

El agente usa después el índice aceptado y el corte que corresponde a la tarea. No carga la carpeta entera.

## Fuentes

No hay una norma única para «la carpeta de contexto de un agente». Cada decisión de abajo cita la fuente que la fija. Lo que ninguna fuente dice (el catálogo de esta suite, los hooks de Cursor) queda dicho como regla de la suite, no como práctica externa.

- ISO/IEC/IEEE 42010:2022. El sujeto es la entidad de interés. El entorno es el contexto de cosas, condiciones e influencias que la rodean. La norma fija el vocabulario de una descripción de arquitectura. No fija el proceso ni el formato.
- Nick Rozanski y Eoin Woods, *Software Systems Architecture*, 2.ª ed. (2011), Context viewpoint. La vista de contexto responde qué hace el sistema y qué no hace, dónde está el límite y con qué personas, sistemas y entidades externas se relaciona. El sistema se trata como caja cerrada. Sirve cuando el interior todavía no se conoce. https://www.viewpoints-and-perspectives.info/home/viewpoints/context/
- C4, nivel 1 (diagrama de contexto de sistema) y el diagrama de paisaje de sistemas. El nivel 1 es una caja, las personas y los sistemas externos, con la relación nombrada. El paisaje es la vista de varios sistemas. El interior (contenedores, componentes, código) no entra en esta foto. https://c4model.com/diagrams/system-context y https://c4model.com/diagrams
- Eric Evans, *Domain-Driven Design* (2003), bounded context y context map. Cada modelo vale dentro de un límite explícito. Varios proyectos no comparten un lenguaje. El mapa anota la relación entre contextos (núcleo compartido, cliente/proveedor, conformista, capa anticorrupción, caminos separados, servicio abierto, lenguaje publicado) solo cuando esa relación se observa.
- Cyrille Martraire, *Living Documentation* (2019). Una sola fuente de verdad. El hecho que ya vive en el código, la configuración o las pruebas se extrae de ahí. La copia publicada es una instantánea de solo lectura: corregirla es publicar otra versión. Un documento sin fuente deja de ser fiable en cuanto el proyecto cambia.
- Catálogo de la suite: `doc/arch/adr-003-profesiones-areas-catalogo.md`. De ahí salen los nombres que se recomiendan. No es una práctica externa.
- Backstage, modelo de sistema (componente, sistema, relaciones `partOf` / `hasPart`). Referencia de catálogo para varios repositorios: el detalle se queda en el repo y el índice solo apunta. No sustituye a Evans ni a C4. https://github.com/backstage/backstage/blob/master/docs/features/software-catalog/system-model.md

## Qué hace la práctica

1. Primero el límite, no el interior. Con un proyecto cuya forma no se conoce se escribe la entidad de interés, el entorno y lo que no se observó. No se inventan capas, stack, contenedores ni un propósito que el repositorio no dice.
2. Cada hecho cita su fuente: ruta, manifiesto, script o salida de un comando, y cuándo se leyó. Sin fuente, el enunciado queda `proposed` y se llama hipótesis.
3. El índice es corto. Los cortes (cómo se arranca, convenciones, módulos, huecos) van en archivos aparte. Una tarea posterior abre el índice y el corte que nombra, no el resto.
4. Varios proyectos: un contexto por proyecto y un mapa de relaciones. No se mezclan los lenguajes. Si la relación no se observa, se anota «no observada». No se elige un patrón de Evans por parecido.
5. Lo que cambia se publica como el siguiente `NNN`. El anterior pasa a `superseded`. Un `accepted` no se reescribe en el mismo archivo salvo que la persona lo pida. Sigue `doc/arch/adr-001-estado-numeros-inmutabilidad.md`.
6. Lo extraíble (manifiestos, scripts, árbol que el corte cita) se puede volver a leer. El juicio (para qué es el proyecto, el límite, la recomendación) no se da por aceptado porque un proceso lo haya reescrito.

## Alcance previsto

- Índice de un proyecto: entidad de interés, una frase de propósito si el repo la dice, y dónde mirar después.
- Límite: qué entra, qué queda fuera, entidades externas. Lo no leído queda «no observado».
- Corte: un asunto (arranque, convenciones, módulos, huecos) con la fuente de cada hecho.
- Mapa: varios proyectos del mismo workspace, uno por fila, con la relación observada.
- Recomendación: plugins de ADRenaline-Suite cuya fila del ADR 3 coincide con una señal leída (un `package.json`, un OpenAPI, un pipeline). Cada fila trae la señal. El estado de partida es `proposed`.
- Refresco: compara las fuentes citadas. Si no cambiaron, el archivo sigue. Si cambiaron, el siguiente `NNN` sustituye al corte afectado y el índice, si el índice los nombra.

## Fuera de este plugin

- La descripción de arquitectura, el ADR, las vistas C4 o arc42 como entregable de arquitectura y la evaluación: `plugin-software-architect`. Este plugin usa las preguntas de la vista de contexto. No entrega esa descripción.
- El dibujo UML: `plugin-uml-diagrams`.
- El modelo de dominio y su aplicación: `plugin-backend`. El mapa de este plugin no es ese modelo.
- El documento para un lector (tutorial, how-to, referencia, explicación): `plugin-documentation`.
- El contexto de una aplicación que recupera o llama a un modelo: `plugin-genai`.
- El caso de uso: `plugin-project-manager`.
- Instalar, copiar o empaquetar plugins de la suite.
- Escribir `.cursor/rules`, agents, commands o skills en el proyecto. Eso duplicaría la foto. El único texto que puede proponerse, dentro de `project-context/`, es un apuntador de una línea: leer el índice aceptado. La persona lo aplica si quiere. Los skills del oficio siguen siendo los del plugin de la suite.
- Aceptar en automático un juicio. Un hook, si se añade al implementar, solo puede marcar deriva.

## Plan de componentes

Un prompt: `skills/maintain-context/SKILL.md`. Elige la situación y escribe solo los archivos de esa situación.

```text
skills/maintain-context/
├── SKILL.md
└── references/
    ├── start.md
    ├── index.md
    ├── boundary.md
    ├── slice.md
    ├── map.md
    ├── recommendation.md
    └── refresh.md
```

Commands (oficio `context`). Cada uno remite al skill y nombra la referencia:

- `/context-help` — catálogo.
- `/context-start` — el índice y el límite, en un paso. Es el primer escaneo.
- `/context-index` — la foto mínima, también cuando la forma aún no se conoce.
- `/context-boundary` — el límite y las entidades externas.
- `/context-slice` — un corte con fuente.
- `/context-map` — varios proyectos.
- `/context-recommend` — plugins de la suite, con la señal.
- `/context-refresh` — publica el siguiente `NNN` de lo que cambió.

Rules:

- `rules/output-folder.mdc` — carpeta `project-context/`.
- `rules/context-fidelity.mdc` — sin fuente no hay hecho aceptado; lo no leído queda «no observado»; no se dibuja, no se escribe el ADR, no se copia otro plugin; la recomendación nace `proposed`; un hook no acepta juicios; un `accepted` no se enmienda solo.

Hook, solo al implementar y solo en Cursor: un script que compara las rutas citadas por los cortes aceptados. Si una cambió, anota deriva en `STATUS.md` (`notas`). No escribe el corte nuevo. Claude Code no comparte ese archivo. El refresco portable es `/context-refresh`. El evento concreto se elige al implementar, con el esquema de hooks vigente. `afterFileEdit` sobre la propia carpeta `project-context/` no se usa: se realimentaría.

## Salida

Carpeta por defecto: `project-context/` (o la de `.cursor/adrenaline.json`).

- `<NNN>-index-<tema>.md`
- `<NNN>-boundary-<tema>.md`
- `<NNN>-slice-<tema>.md`
- `<NNN>-map-<tema>.md`
- `<NNN>-recommendation-<tema>.md`
- `STATUS.md`: `N`, `archivo`, `estado`, `sustituye`, `notas`. En `notas`, la deriva y las fuentes.

El texto sigue el idioma del pedido. El tipo del nombre sigue en inglés.

Un proyecto cuya forma no se conoce entrega índice y límite, y se detiene. Los cortes y la recomendación esperan a que haya una fuente.
