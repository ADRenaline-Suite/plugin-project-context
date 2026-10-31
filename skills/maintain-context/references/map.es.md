<p align="right">Idioma:&emsp;<a href="map.md" style="vertical-align:middle"><img alt="English" src="https://raw.githubusercontent.com/ADRenaline-Suite/.github/main/profile/lang-en-off.svg" align="middle" style="vertical-align:middle"></a> <img alt="Español" src="https://raw.githubusercontent.com/ADRenaline-Suite/.github/main/profile/lang-es-on.svg" align="middle" style="vertical-align:middle"></p>

[🏠 Contexto del proyecto](../../../README.es.md) / [Mantener el contexto](../SKILL.es.md)

# Mapa de contexto

Fuente: Evans, *Domain-Driven Design* (2003), bounded context y context map. El modelo de sistema de Backstage (componente `partOf` un sistema) es solo la forma del catálogo: el detalle se queda en cada proyecto. Este archivo no es un modelo de dominio ni un diagrama de paisaje C4.

El agente lee `map.md`, no este archivo.

## Qué fija

Qué proyectos hay en este workspace y la relación que muestra una fuente entre ellos. Los modelos no se mezclan.

## Cómo hacerlo

1. Una fila para este proyecto. Más filas solo para proyectos que nombró la persona, o para un directorio hijo de este workspace que tenga su propio `.git` o su propio manifiesto. No explores fuera del workspace.
2. Relación: una palabra que use la fuente. Las palabras observadas permitidas son `shared-kernel`, `customer-supplier`, `conformist`, `anticorruption-layer`, `separate-ways`, `open-host-service`, `published-language` y `part-of`. Usa una solo cuando una fuente nombra esa relación o la muestra (un submódulo, una dependencia por ruta, un documento que lo dice). Si no, escribe «no observado». No elijas una palabra por parecido.
3. Cada proyecto guarda su propio `project-context/` cuando ese proyecto es un repositorio aparte. Este archivo solo apunta a la ruta.
4. No escribas un lenguaje compartido para todas las filas.

## Plantilla

```markdown
# <NNN> — Mapa

- Estado: accepted | proposed
- Leído: <yyyy-MM-ddTHH:mm:ssZ>

| Proyecto | Ruta | Entidad de interés | Relación | Fuente |
| --- | --- | --- | --- | --- |
| <nombre> | <ruta relativa> | <nombre o no observado> | <palabra permitida o no observado> | <ruta o no observado> |

## No observado

- <relaciones o proyectos que se buscaron y no se encontraron>
```

## Ejemplo

Estado: `accepted`. Una fila: `billing`, ruta `.`, entidad de interés del índice aceptado, relación «no observado», fuente la carpeta del workspace. No observado: un segundo proyecto, cualquier relación de Evans.

## Prerrequisitos

Ninguno. Un solo proyecto es un mapa válido.

## Prompts

No hay command anterior.

En un mensaje:

```text
/context-map
List this project. Add another only if it is in this workspace. Leave the relation as not observed unless a file shows it.
```

## Terminado

- Cada fila es un proyecto que se nombró o se encontró en este workspace. No se añadió un proyecto de fuera.
- Una relación es una palabra permitida con fuente, o «no observado». No se eligió un patrón por parecido.
- Los modelos no se mezclaron. No se escribió un modelo de dominio ni un diagrama.
