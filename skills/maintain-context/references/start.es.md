<p align="right">Idioma:&emsp;<a href="start.md" style="vertical-align:middle"><img alt="English" src="https://raw.githubusercontent.com/ADRenaline-Suite/.github/main/profile/lang-en-off.svg" align="middle" style="vertical-align:middle"></a> <img alt="Español" src="https://raw.githubusercontent.com/ADRenaline-Suite/.github/main/profile/lang-es-on.svg" align="middle" style="vertical-align:middle"></p>

[🏠 Contexto del proyecto](../../../README.es.md) / [Mantener el contexto](../SKILL.es.md)

# Primera foto

Fuente: la misma que [index.es.md](index.es.md), [boundary.es.md](boundary.es.md), [slice.es.md](slice.es.md), [map.es.md](map.es.md) y [recommendation.es.md](recommendation.es.md). Esta situación es el primer escaneo. No es un refresco.

El agente lee `start.md`, no este archivo.

## Qué fija

La primera foto en un paso: el índice, el límite, un corte por cada asunto que tenga fuente, el mapa y la recomendación cuando se leyó una señal. Incluye un proyecto cuya forma todavía no se conoce.

## Cómo hacerlo

1. Lee el proyecto. Decide cuál de `run`, `conventions`, `modules` y `gaps` tiene una fuente leída, y si [recommendation.es.md](recommendation.es.md) tiene una señal.
2. Escribe los archivos en este orden. Cada uno toma el siguiente `<NNN>` libre y sigue esa referencia: el índice ([index.es.md](index.es.md)), el límite ([boundary.es.md](boundary.es.md)), cada corte que tenga fuente ([slice.es.md](slice.es.md), en el orden `run`, `conventions`, `modules`, `gaps`), el mapa ([map.es.md](map.es.md)) y la recomendación ([recommendation.es.md](recommendation.es.md)) cuando se leyó una señal.
3. «Dónde mirar después» del índice nombra cada otro archivo que este turno escribe, con su `N` y su estado. Llena esa tabla en la misma entrega, antes de cerrar.
4. Un asunto sin fuente no escribe archivo y no gasta `<NNN>`. Una recomendación sin señal no escribe archivo. Di cuáles no se escribieron.
5. Escribe la frase de apuntador de [index.es.md](index.es.md) en `AGENTS.md` en la raíz del proyecto, en el idioma del artefacto. Si esa frase ya está en el archivo, déjalo. Si falta `AGENTS.md`, créalo solo con esa frase. Si existe, añade una línea en blanco y la frase al final. No reescribas el resto del archivo. No crees un archivo de rule.
6. Detente. No refresques. El hook de la sesión no hace este paso. Solo marca deriva cuando estos archivos ya existen.

## Plantilla

Usa la plantilla de cada referencia nombrada arriba. No inventes otro tipo de archivo.

## Ejemplo

Un repositorio cuyo encabezado de `README.md` nombra el proyecto y cuyo primer párrafo dice el propósito, sin otra fuente. `/context-start` escribe `001-index-<tema>.md` y `002-boundary-<tema>.md`, los dos `accepted`, y `003-map-<tema>.md` con una fila y relación «no observado». El índice nombra `002` y `003`. Salida de la suite: no observado. Sin corte: ninguno de los cuatro asuntos tiene fuente. Sin recomendación: no se leyó una señal.

## Prerrequisitos

Ninguno. Un proyecto cuya forma no se conoce también recibe el índice, el límite y el mapa.

## Prompts

No hay command anterior. El único prompt es el camino.

En un mensaje:

```text
/context-start
Write the index, the boundary, each slice that has a source, the map, and the recommendation when a signal was read. Leave a concern with no source, and a recommendation with no signal, unwritten. Do not refresh.
```

## Terminado

- Existen el índice, el límite y el mapa de este turno, cada uno con su `<NNN>`. El índice nombra cada otro archivo que este turno escribió.
- Un corte existe solo para un asunto cuya fuente se leyó. Una recomendación existe solo cuando se leyó una señal, y su estado es `proposed`.
- No se escribió un refresco. No se infirió un propósito, una entidad externa ni una relación de Evans.
- `AGENTS.md` en la raíz del proyecto contiene la frase de apuntador una vez. El resto de ese archivo no se reescribió. No se escribió un archivo de rule.
- `accepted` se usa solo cuando cada afirmación cita una fuente o dice «no observado».
- El índice lista la salida de la suite a partir de cada `ORIGIN.json` que se leyó, o una fila de «no observado». Ninguna carpeta se infirió por su nombre.
