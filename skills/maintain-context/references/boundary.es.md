<p align="right">Idioma:&emsp;<a href="boundary.md" style="vertical-align:middle"><img alt="English" src="https://raw.githubusercontent.com/ADRenaline-Suite/.github/main/profile/lang-en-off.svg" align="middle" style="vertical-align:middle"></a> <img alt="Español" src="https://raw.githubusercontent.com/ADRenaline-Suite/.github/main/profile/lang-es-on.svg" align="middle" style="vertical-align:middle"></p>

[🏠 Contexto del proyecto](../../../README.es.md) / [Mantener el contexto](../SKILL.es.md)

# Límite del proyecto

Fuente: Rozanski y Woods, *Software Systems Architecture*, 2.ª ed. (2011), vista de contexto; C4 nivel 1 (https://c4model.com/diagrams/system-context). El sistema se queda en caja cerrada. Este archivo no es un diagrama C4 ni una descripción de arquitectura.

El agente lee `boundary.md`, no este archivo.

## Qué fija

Qué entra en la entidad de interés, qué queda fuera y qué entidades externas nombra una fuente.

## Cómo hacerlo

1. Dentro: el repositorio, o la parte que una fuente marca como este sistema. Cita la fuente.
2. Fuera: lo que una fuente coloca más allá de esa caja. Si ninguna lo hace, escribe «no observado».
3. Entidades externas: personas y sistemas que nombra una fuente, con la relación en las palabras de esa fuente. Una fila por entidad. Ninguna fila cuando no se nombró ninguna; la sección dice «no observado».
4. No abras la caja. No nombres contenedores, bases ni protocolos que una fuente no haya nombrado.
5. No dibujes. Un diagrama se pide a `plugin-uml-diagrams`. Una descripción de arquitectura se pide a `plugin-software-architect`.

## Plantilla

```markdown
# <NNN> — Límite

- Estado: accepted | proposed
- Entidad de interés: <nombre>
- Leído: <yyyy-MM-ddTHH:mm:ssZ>

## Dentro

- <qué entra> — <fuente>

## Fuera

- <qué queda fuera, o no observado> — <fuente o no observado>

## Entidades externas

| Entidad | Relación | Fuente |
| --- | --- | --- |
| <nombre o no observado> | <palabras de la fuente, o no observado> | <ruta o no observado> |

## No observado

- <qué se buscó y no se encontró>
```

## Ejemplo

Estado: `accepted`. Dentro: el repositorio `billing/`, fuente la carpeta. Fuera: no observado. Entidades externas: no observado. No observado: usuarios, sistemas aguas arriba, interfaces.

## Prerrequisitos

Ninguno. El nombre de la entidad puede salir de un índice aceptado. Si no hay índice, usa el nombre de la carpeta del repositorio y cítalo.

## Prompts

No hay command anterior.

En un mensaje:

```text
/context-boundary
Keep the box closed. Write not observed where no file names an external entity.
```

## Terminado

- Están dentro, fuera, las entidades externas y lo no observado. No se añadió una entidad externa que no estuviera en una fuente.
- La caja sigue cerrada: ningún contenedor, base o protocolo que una fuente no haya nombrado.
- No se escribió un diagrama ni un ADR. El estado es `accepted` cuando cada afirmación cita una fuente o dice «no observado».
