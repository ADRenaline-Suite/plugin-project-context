---
name: maintain-context
description: Deja la foto vigente de un proyecto. El primer escaneo escribe el índice, el límite, cada corte que tenga fuente, el mapa y la recomendación cuando se leyó una señal. Un cambio posterior publica una instantánea nueva. Úsalo cuando el agente necesita esa foto, también si la forma del proyecto aún no se conoce o si varios proyectos comparten un workspace.
---

<p align="right">Idioma:&emsp;<a href="SKILL.md" style="vertical-align:middle"><img alt="English" src="https://raw.githubusercontent.com/ADRenaline-Suite/.github/main/profile/lang-en-off.svg" align="middle" style="vertical-align:middle"></a> <img alt="Español" src="https://raw.githubusercontent.com/ADRenaline-Suite/.github/main/profile/lang-es-on.svg" align="middle" style="vertical-align:middle"></p>

[🏠 Contexto del proyecto](../../README.es.md)

# Mantener el contexto

Deja una foto del proyecto que una tarea posterior pueda abrir sin cargar el repositorio entero. La foto es un índice, un límite y cortes cortos. Cada hecho aceptado cita el archivo del que se leyó.

Fuente: ISO/IEC/IEEE 42010:2022 (entidad de interés y entorno); Rozanski y Woods, *Software Systems Architecture*, 2.ª ed. (2011), vista de contexto; C4 nivel 1 y el paisaje de sistemas (https://c4model.com/diagrams/system-context); Evans, *Domain-Driven Design* (2003), bounded context y context map; Martraire, *Living Documentation* (2019), una sola fuente de verdad y una instantánea nueva. Los nombres de plugins de la suite salen de `doc/arch/adr-003-profesiones-areas-catalogo.md` cuando ese archivo está en el workspace. No son una práctica externa.

El agente lee `SKILL.md`, no este archivo.

## Antes de escribir

1. Lee solo la referencia de esta situación: [empezar](references/start.es.md), [índice](references/index.es.md), [límite](references/boundary.es.md), [corte](references/slice.es.md), [mapa](references/map.es.md), [recomendación](references/recommendation.es.md) o [refresco](references/refresh.es.md).
2. Un command nombra una referencia. Escribe solo esa situación. `/context-start` es la primera foto: el índice, el límite, cada corte que tenga fuente, el mapa y la recomendación cuando se leyó una señal. No refresca.
3. Un pedido que pide la foto del proyecto y no nombra un command hace lo mismo que `/context-start`. Cada archivo tiene su `<NNN>`. Un asunto sin fuente, y una recomendación sin señal, no son archivos.
4. No dibujes un diagrama, ni un ADR, ni un modelo de dominio, ni un documento para un lector, ni copies el skill de otro plugin. Pide ese plugin cuando el pedido es su artefacto.
5. No instales un plugin. No escribas `.cursor/rules`, una carpeta de agents, commands ni skills. El índice lleva una frase de apuntador. `/context-start` escribe esa misma frase una vez en `AGENTS.md` en la raíz del proyecto y no reescribe el resto de ese archivo.
6. Una carpeta es salida de la suite solo cuando se leyó su `ORIGIN.json` y `suite` es `ADRenaline-Suite`. El índice registra la carpeta, el plugin y ese archivo. Los pasos están en [índice](references/index.es.md). No la infieras por el nombre de la carpeta. No copies los archivos de dentro al índice. No instales el plugin porque la carpeta exista. Un archivo de dentro puede citarse cuando se leyó para otro asunto.

## Idioma

Las instrucciones siguen en inglés. Escribe el artefacto en el idioma del pedido. Si el pedido nombra un idioma, usa ese. Si no, usa el idioma en el que está escrito el pedido. Conserva los nombres que la persona ya usó. Traduce los encabezados de la plantilla y mantén los mismos campos. El tipo del nombre sigue en inglés (`index`, `boundary`, `slice`, `map`, `recommendation`). Las columnas de `STATUS.md` siguen `N`, `archivo`, `estado`, `sustituye`, `notas`. La respuesta usa ese mismo idioma. Los prompts de la referencia están en inglés: muéstralos en el idioma del pedido y conserva el nombre del command.

## Si falta un prerrequisito

Tres comprobaciones detienen la entrega. No escribas archivos de esa pieza. Responde solo con esto, en el idioma del pedido:

1. «Falta:» y los nombres que faltan.
2. «En un mensaje:» y el único prompt de la referencia. Rellénalo con lo que la persona ya dijo. Donde falte un valor, deja el hueco (`#…`).
3. «O, en este orden:» y los commands anteriores que siguen faltando, en el orden de la referencia, cada uno con su prompt. Omite este bloque si no hay command anterior.

Esas tres son: un corte cuyo asunto no tiene una fuente leída; una recomendación sin señal de [references/recommendation.es.md](references/recommendation.es.md); un refresco cuando la carpeta de salida no tiene `STATUS.md`.

El índice, el límite y el mapa no se detienen. Lo que no se leyó son las palabras «no observado». Una hipótesis sin fuente se queda en `proposed`.

## Entrega

La carpeta es `adrenaline/project-context/` en la raíz del proyecto. Si `.cursor/adrenaline.json` tiene `outputDirs["plugin-project-context"]` con una ruta relativa, sin `..` y no absoluta, usa esa ruta. Si falta el archivo, la clave o una ruta válida, usa `adrenaline/project-context/` y, en el último caso, dilo. Si `adrenaline/project-context/` aún no existe y `project-context/` en la raíz ya tiene el `ORIGIN.json` o el `STATUS.md` de este plugin, sigue escribiendo ahí y dilo. Crea la carpeta si no existe. No escribas fuera de ella, salvo la frase de apuntador que `/context-start` deja en `AGENTS.md`.

El archivo es `<NNN>-<tipo>-<tema>.md`. `<NNN>` es el siguiente entero libre, de tres dígitos, y no se reutiliza. `<tipo>` es el id inglés de la pieza.

Mantén `<carpeta>/STATUS.md` con columnas `N`, `archivo`, `estado`, `sustituye` y `notas`.

Mantén `<carpeta>/ORIGIN.json` junto a `STATUS.md`. No es un archivo `<NNN>` y no tiene fila en `STATUS.md`. Escríbelo cuando se crea la carpeta. En una entrega posterior, vuelve a escribirlo solo si falta o si un campo difiere. Los campos son `suite` `ADRenaline-Suite`, `plugin` `plugin-project-context`, `repository` `https://github.com/ADRenaline-Suite/plugin-project-context` y `convention` `adr-001`. El marcador nombra la carpeta. No dice que cada archivo de dentro siga sin cambios.

`notas` de un corte o de una recomendación lista `sources: <ruta relativa>, <ruta relativa>; read: <marca UTC>` con `yyyy-MM-ddTHH:mm:ssZ`. No pongas `|` dentro de `notas`: rompe la tabla de `STATUS.md`. Las rutas son relativas a la raíz del proyecto, sin `..`. Una fila de juicio (propósito del índice, límite, recomendación) usa los mismos `sources:` y `read:` cuando se leyó un archivo. El hook de sesión lee esas notas y puede añadir `drift:`. No cambia `estado` y no escribe un archivo nuevo.

Si el tema ya tiene un archivo:

- La persona pide enmendar ese mismo archivo: edítalo, conserva el `<NNN>` y conserva `accepted` si ya lo era.
- Una fuente citada cambió y esta situación republica el hecho: el siguiente `<NNN>`, la fila anterior pasa a `superseded` (`sustituye` apunta al `N` nuevo).
- Tema nuevo: el siguiente `<NNN>`.

`proposed` para una hipótesis y para toda recomendación hasta que la persona diga que esa lista es la que hay que seguir. `accepted` para un hecho que cita una fuente, incluido un «no observado» explícito. `deprecated` si sigue legible y ya no es el preferido, sin un archivo que lo reemplace. `superseded` cuando otro archivo lo reemplaza. Al cerrar, di la carpeta, el archivo, el `N` y el estado.

## Terminado

Antes de cerrar, evalúa esta lista y la lista `## Done` de la referencia de esta situación. Un command fija la situación: usa la referencia que ese command nombra. Cada ítem es cierto, o corriges la entrega en este turno. No dejes un archivo que falle un ítem. No lo marques `accepted` mientras un ítem falle. Una plantilla que la referencia nombra se aplica y se anota bajo Assumed; la entrega usa el estado que esa referencia nombra. Un prerrequisito que aún detiene la entrega no es una lista fallida: sigue «Si falta un prerrequisito» y no escribas archivos de esa pieza.

- Un command distinto de `/context-start` escribe solo la situación que nombra. `/context-start` escribe la primera foto, y cada archivo tiene su `<NNN>`. No refresca.
- Los archivos están solo en la carpeta de salida, con el nombre que dice Entrega. `<NNN>` no se reutiliza. `STATUS.md` coincide con los archivos y con el estado que esta situación permite. Un hueco que la referencia deja en `proposed` sigue en `proposed`.
- `ORIGIN.json` está en la carpeta de salida. Sus cuatro campos coinciden con este plugin. No tiene fila en `STATUS.md`.
- El idioma del artefacto coincide con el pedido. Las columnas de `STATUS.md` siguen `N`, `archivo`, `estado`, `sustituye`, `notas`.
- Cada campo que la plantilla exige está lleno. No queda un hueco (`#…`, `<task>`, `TBD`, lorem ipsum). Un campo que la referencia manda dejar en blanco hasta que llegue el dato está en blanco a propósito, y el estado es el que nombra la referencia.
- No se añadió nada que este skill prohíbe. La referencia nombra qué queda fuera.
- La respuesta nombra la carpeta, los archivos, el `N` y el estado. Si se aplicó una plantilla, la respuesta cierra con el bloque Assumed, una línea por plantilla, con el command que la cambia y el command que regenera esta pieza. Un blanco dejado a propósito nombra el command que lo llena.

## Ejemplo

Entrada: una carpeta `billing/` cuyo encabezado de `README.md` es «Billing API», sin más archivos fuente. El pedido es «¿qué es este proyecto?», en español, y no nombra un command.

Salida `accepted`: `001-index-billing.md` (entidad de interés Billing API, fuente `README.md`; dónde mirar después nombra `002` y `003`), `002-boundary-billing.md` (dentro: este repositorio; fuera y entidades externas: «no observado») y `003-map-billing.md` (una fila, relación «no observado»). Sin corte: ninguno de los cuatro asuntos tiene fuente. Sin recomendación: no se leyó una señal. La respuesta nombra `adrenaline/project-context/`, los tres archivos, `001`, `002` y `003`, y `accepted`.
