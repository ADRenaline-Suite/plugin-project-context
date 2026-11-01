<p align="right">Idioma:&emsp;<a href="refresh.md" style="vertical-align:middle"><img alt="English" src="https://raw.githubusercontent.com/ADRenaline-Suite/.github/main/profile/lang-en-off.svg" align="middle" style="vertical-align:middle"></a> <img alt="Español" src="https://raw.githubusercontent.com/ADRenaline-Suite/.github/main/profile/lang-es-on.svg" align="middle" style="vertical-align:middle"></p>

[🏠 Contexto del proyecto](../../../README.es.md) / [Mantener el contexto](../SKILL.es.md)

# Refresco del contexto

Fuente: Martraire, *Living Documentation* (2019). El archivo publicado es una instantánea. Un cambio publica la siguiente. La regla de la suite es la misma: el siguiente `<NNN>`, y la fila anterior en `superseded` (`doc/arch/adr-001-estado-numeros-inmutabilidad.md`).

El agente lee `refresh.md`, no este archivo.

## Qué fija

Los cortes cuyas fuentes citadas cambiaron, y una nota de deriva en un juicio que el hook o este command encontró viejo. No acepta por su cuenta un propósito, un límite o una recomendación nuevos.

## Cómo hacerlo

1. Lee `STATUS.md`. Si falta, no escribas nada.
2. Para cada corte `accepted`, lee las rutas de `notas` (`sources:`).
3. Si esos archivos no cambiaron, deja la fila.
4. Si cambió un hecho extraído de un corte, escribe el siguiente `<NNN>` de ese asunto, marca la fila anterior `superseded` y la nueva `accepted`. Actualiza `read:`.
5. Si el índice aceptado nombra un archivo que este turno sustituyó, escribe el siguiente índice para que «Dónde mirar después» apunte al archivo nuevo, y sustituye el índice anterior. Ese apuntador es un hecho, no un propósito nuevo.
6. Lee `ORIGIN.json` en cada hijo directo de la raíz del proyecto, en cada hijo directo de `adrenaline/` en esa raíz, y en cada ruta de `outputDirs` de `.cursor/adrenaline.json`. Una ruta encontrada dos veces es una fila. No recorras ningún otro directorio. `adrenaline/` mismo no es una fila. Si el índice aceptado no tiene la sección de salida de la suite, o sus filas no coinciden con esos archivos, escribe el siguiente índice. Conserva el propósito y el apuntador. Actualiza la salida de la suite y, si este turno también sustituyó un archivo, dónde mirar después. Sustituye el índice anterior. Un marcador que falta o no es válido no es una fila. No infieras una carpeta por su nombre.
7. Si cambió una fuente citada por el propósito del índice, el límite o la recomendación, no reescribas ese juicio. Añade `drift: <ruta>` en `notas` cuando aún no esté. Deja `estado` como está. La respuesta nombra el command que lo republica: `/context-index`, `/context-boundary` o `/context-recommend`.
8. No enmiendes un archivo `accepted` en el mismo sitio salvo que la persona pida enmendar ese archivo.
9. El hook de sesión puede haber escrito ya `drift:`. Este command vuelve a leer la fuente antes de publicar un corte. La nota del hook no es una instantánea nueva.

## Plantilla

Un corte republicado usa la plantilla de [slice.es.md](slice.es.md). Un índice republicado usa la plantilla de [index.es.md](index.es.md). Una nota de deriva no tiene archivo propio.

## Ejemplo

`003-slice-run.md` está `accepted` con `sources: package.json; read: 2026-10-30T22:30:00Z`. `package.json` ahora dice `vitest run`. El refresco escribe `004-slice-run.md` (`accepted`) y deja `003` en `superseded`, `sustituye` `004`. La fila del límite no se toca.

## Prerrequisitos

- **STATUS.md.** Una carpeta de salida que ya tenga `STATUS.md`. Si no lo tiene, no escribas nada.

## Prompts

En un mensaje:

```text
/context-refresh
Republish a slice whose source changed. Leave a judgment as it is and name the drift.
```

O, en este orden:

```text
/context-index
```

## Terminado

- Una fuente sin cambios dejó su fila en su sitio. Un hecho de corte que cambió es un `<NNN>` nuevo, y la fila anterior está `superseded`.
- Un propósito, un límite o una recomendación que cambiaron no se reescribieron. `drift:` nombra la ruta, y la respuesta nombra el command que republica ese juicio.
- No se editó un archivo `accepted` en el mismo sitio. La nota del hook no se trató como una instantánea nueva. Sin `STATUS.md`, no se escribió archivo.
- Un conjunto de salida de la suite distinto del índice aceptado es un índice `<NNN>` nuevo. El propósito no cambió. No se añadió una carpeta sin `ORIGIN.json`.
