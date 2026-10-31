<p align="right">Idioma:&emsp;<a href="index.md" style="vertical-align:middle"><img alt="English" src="https://raw.githubusercontent.com/ADRenaline-Suite/.github/main/profile/lang-en-off.svg" align="middle" style="vertical-align:middle"></a> <img alt="Español" src="https://raw.githubusercontent.com/ADRenaline-Suite/.github/main/profile/lang-es-on.svg" align="middle" style="vertical-align:middle"></p>

[🏠 Contexto del proyecto](../../../README.es.md) / [Mantener el contexto](../SKILL.es.md)

# Índice del proyecto

Fuente: ISO/IEC/IEEE 42010:2022, entidad de interés. El índice es la entrada corta que una tarea posterior abre primero. No es la descripción de arquitectura.

El agente lee `index.md`, no este archivo.

## Qué fija

El nombre de la entidad de interés, el propósito cuando una fuente lo dice, qué archivo abrir después y qué carpetas son salida de la suite. Es la primera foto cuando la forma del proyecto todavía no se conoce.

## Cómo hacerlo

1. Entidad de interés: el nombre que dice una fuente (un encabezado del README, el nombre de un manifiesto). Si ninguna fuente lo nombra, usa el nombre de la carpeta del repositorio y cita esa carpeta como fuente.
2. Propósito: una frase copiada de una fuente. Si ninguna fuente lo dice, escribe «no observado». No lo infieras del nombre de la carpeta.
3. Dónde mirar después: una fila por archivo que ya esté en esta carpeta (`boundary`, `slice`, `map`, `recommendation`), con su `N` y su estado. Si no hay ninguno, escribe «no observado».
4. El apuntador es una frase. No crees un archivo de rule. Traduce la frase con el artefacto: «Lee el índice aceptado en project-context/ antes de cambiar este proyecto.» Si la carpeta de salida no es `project-context/`, nombra esa carpeta. `/context-start` escribe esa misma frase en `AGENTS.md`.
5. No enumeres capas, contenedores ni un stack.
6. Salida de la suite. Mira solo cada hijo directo de la raíz del proyecto y cada ruta de `outputDirs` en `.cursor/adrenaline.json`. Si esa carpeta contiene `ORIGIN.json`, léelo. Conserva una fila cuando `suite` es `ADRenaline-Suite` y están `plugin`, `repository` y `convention`. La fuente es ese `ORIGIN.json`. Esas rutas van en `sources:` de esta fila en `STATUS.md`. No copies los artefactos a este índice. No trates la carpeta como el producto. No instales el plugin porque la carpeta exista. Una carpeta sin `ORIGIN.json`, o con otros campos, no es una fila: no la infieras por el nombre. Si no se leyó un marcador, una fila dice «no observado».

## Plantilla

```markdown
# <NNN> — Índice

- Estado: accepted | proposed
- Entidad de interés: <nombre>
- Propósito: <frase, o no observado>
- Leído: <yyyy-MM-ddTHH:mm:ssZ>

## Dónde mirar después

| Asunto | Archivo | Estado |
| --- | --- | --- |
| <asunto o no observado> | <archivo o no observado> | <estado o no observado> |

## Apuntador

<una frase>

## Salida de la suite

| Carpeta | Plugin | Fuente |
| --- | --- | --- |
| <ruta relativa, o no observado> | <nombre del plugin, o no observado> | <ruta de ORIGIN.json, o no observado> |

## No observado

- <qué se buscó y no se encontró>
```

## Ejemplo

Estado: `accepted`. Entidad de interés: Billing API, fuente `README.md`. Propósito: la frase bajo ese encabezado. Dónde mirar después: no observado. Salida de la suite: no observado. No observado: módulos, sistemas externos, cómo se arranca.

## Prerrequisitos

Ninguno. Un proyecto cuya forma no se conoce también recibe este archivo.

## Prompts

No hay command anterior. El único prompt es el camino.

En un mensaje:

```text
/context-index
The README heading is the name. Leave the purpose as not observed if the README does not state it.
```

## Terminado

- Están la entidad de interés, el propósito, dónde mirar después, el apuntador, la salida de la suite y lo no observado. El propósito es «no observado» cuando ninguna fuente lo dice. El nombre de la carpeta no se convirtió en un propósito.
- No hay capa, contenedor ni stack. No se escribió un archivo de rule.
- El estado es `accepted` cuando cada afirmación cita una fuente o dice «no observado».
- La salida de la suite lista solo carpetas cuyo `ORIGIN.json` se leyó y nombra `suite` `ADRenaline-Suite`, o una fila de «no observado». Ninguna carpeta se infirió por su nombre. Ningún artefacto de esas carpetas se copió al índice.
