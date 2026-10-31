<p align="right">Idioma:&emsp;<a href="start.md" style="vertical-align:middle"><img alt="English" src="https://raw.githubusercontent.com/ADRenaline-Suite/.github/main/profile/lang-en-off.svg" align="middle" style="vertical-align:middle"></a> <img alt="Español" src="https://raw.githubusercontent.com/ADRenaline-Suite/.github/main/profile/lang-es-on.svg" align="middle" style="vertical-align:middle"></p>

[🏠 Contexto del proyecto](../../../README.es.md) / [Mantener el contexto](../SKILL.es.md)

# Primera foto

Fuente: la misma que [index.es.md](index.es.md) y [boundary.es.md](boundary.es.md). Esta situación es el primer escaneo. No es un corte ni una recomendación.

El agente lee `start.md`, no este archivo.

## Qué fija

El índice y el límite, en un paso, también cuando la forma del proyecto todavía no se conoce.

## Cómo hacerlo

1. Escribe el índice con la plantilla y las reglas de [index.es.md](index.es.md).
2. Escribe el límite con la plantilla y las reglas de [boundary.es.md](boundary.es.md). Cada archivo tiene su `<NNN>`.
3. «Dónde mirar después» del índice nombra el archivo de límite de este turno.
4. Detente. No escribas un corte, un mapa ni una recomendación.
5. El hook de la sesión no hace este paso. Solo marca deriva cuando estos archivos ya existen.

## Plantilla

Usa la plantilla de [index.es.md](index.es.md) y la de [boundary.es.md](boundary.es.md). No inventes un tercer archivo.

## Ejemplo

Un repositorio cuyo encabezado de `README.md` nombra el proyecto y cuyo primer párrafo dice el propósito. `/context-start` escribe `001-index-<tema>.md` y `002-boundary-<tema>.md`, los dos `accepted`. El propósito sale de ese párrafo. Las entidades externas son «no observado» cuando ningún archivo nombra una. Sin corte.

## Prerrequisitos

Ninguno. Un proyecto cuya forma no se conoce también recibe los dos archivos.

## Prompts

No hay command anterior. El único prompt es el camino.

En un mensaje:

```text
/context-start
Write the index and the boundary. Leave not observed where no file states it. Stop there.
```

## Terminado

- Existen el índice y el límite de este turno, cada uno con su `<NNN>`. El índice nombra el límite en dónde mirar después.
- No se escribió un corte, un mapa ni una recomendación. No se infirió un propósito ni una entidad externa.
- Los dos estados son `accepted` solo cuando cada afirmación cita una fuente o dice «no observado».
