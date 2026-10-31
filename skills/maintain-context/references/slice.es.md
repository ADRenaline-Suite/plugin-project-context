<p align="right">Idioma:&emsp;<a href="slice.md" style="vertical-align:middle"><img alt="English" src="https://raw.githubusercontent.com/ADRenaline-Suite/.github/main/profile/lang-en-off.svg" align="middle" style="vertical-align:middle"></a> <img alt="Español" src="https://raw.githubusercontent.com/ADRenaline-Suite/.github/main/profile/lang-es-on.svg" align="middle" style="vertical-align:middle"></p>

[🏠 Contexto del proyecto](../../../README.es.md) / [Mantener el contexto](../SKILL.es.md)

# Corte de contexto

Fuente: Martraire, *Living Documentation* (2019). Un hecho que ya vive en un archivo se copia de ese archivo, con la ruta y el momento en que se leyó.

El agente lee `slice.md`, no este archivo.

## Qué fija

Un asunto: cómo se arranca, convenciones, módulos o huecos. Cada hecho cita su fuente. Una tarea posterior abre este archivo solo cuando el índice nombra ese asunto.

## Cómo hacerlo

1. Elige un asunto. El tema del nombre de archivo es ese asunto (`run`, `conventions`, `modules`, `gaps`, o el nombre que usó la persona).
2. Lee los archivos que contienen el asunto. Una fila por hecho: el hecho, la ruta relativa y el momento de lectura.
3. Un enunciado sin fuente va bajo Hipótesis y el estado es `proposed`. No lo pases a Hechos.
4. `notas` de esta fila en `STATUS.md`: `sources: <ruta>, <ruta>; read: <yyyy-MM-ddTHH:mm:ssZ>`. Sin `|` dentro de `notas`.
5. No copies un archivo entero en el corte. Una frase por hecho.
6. No escribas el modelo de dominio. Eso es `plugin-backend`.

## Plantilla

```markdown
# <NNN> — <asunto>

- Estado: accepted | proposed
- Asunto: <run | conventions | modules | gaps | nombre>
- Leído: <yyyy-MM-ddTHH:mm:ssZ>

## Hechos

| Hecho | Fuente | Leído |
| --- | --- | --- |
| <una frase> | <ruta relativa> | <yyyy-MM-ddTHH:mm:ssZ> |

## Hipótesis

- <enunciado sin fuente, o no observado>

## No observado

- <qué se buscó y no se encontró>
```

## Ejemplo

Estado: `accepted`. Asunto: `run`. Hecho: el script de prueba es `vitest`, fuente `package.json`, clave `scripts.test`. Hipótesis: no observado. `notas`: `sources: package.json; read: 2026-10-30T22:30:00Z`.

## Prerrequisitos

- **Fuente.** Un archivo que se leyó y dice el hecho. Si el asunto no tiene ese archivo, no escribas nada de esta pieza.

## Prompts

En un mensaje:

```text
/context-slice run
Source: package.json scripts. Leave a concern with no file as not written.
```

No hay command anterior.

## Terminado

- El asunto es uno, y cada fila de Hechos tiene una ruta y un momento de lectura. Un enunciado sin fuente está bajo Hipótesis y el estado es `proposed`.
- `notas` lista `sources:` y `read:` de las rutas de Hechos. El corte no pega el archivo fuente.
- No se escribió un modelo de dominio. Sin fuente, no se escribió archivo.
