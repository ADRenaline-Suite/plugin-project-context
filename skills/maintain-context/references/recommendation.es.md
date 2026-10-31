<p align="right">Idioma:&emsp;<a href="recommendation.md" style="vertical-align:middle"><img alt="English" src="https://raw.githubusercontent.com/ADRenaline-Suite/.github/main/profile/lang-en-off.svg" align="middle" style="vertical-align:middle"></a> <img alt="Español" src="https://raw.githubusercontent.com/ADRenaline-Suite/.github/main/profile/lang-es-on.svg" align="middle" style="vertical-align:middle"></p>

[🏠 Contexto del proyecto](../../../README.es.md) / [Mantener el contexto](../SKILL.es.md)

# Recomendación de plugins

Fuente: el catálogo de la suite en `doc/arch/adr-003-profesiones-areas-catalogo.md` cuando ese archivo está. Los nombres de abajo son ese catálogo. No hay una norma externa para esta lista. Una fila es una recomendación, no una instalación.

El agente lee `recommendation.md`, no este archivo.

## Qué fija

Qué plugins de ADRenaline coinciden con una señal que se leyó, y la ruta de esa señal. El estado se queda en `proposed` hasta que la persona dice que esta es la lista que hay que seguir.

## Cómo hacerlo

1. Lee archivos. Añade una fila solo cuando la señal de la tabla se leyó en ese archivo.
2. No añadas un plugin que la tabla no liste para esa señal. No recomiendes `plugin-project-context`.
3. El estado del archivo es `proposed`. No lo marques `accepted` salvo que la persona diga que estos plugins son los que hay que seguir. Esa aceptación enmienda el mismo archivo solo cuando la persona pide enmendarlo.
4. No instales, clones ni copies un plugin. No escribas su skill en este proyecto.
5. `notas`: `sources: <ruta>, <ruta>; read: <yyyy-MM-ddTHH:mm:ssZ>`. Sin `|` dentro de `notas`.

## Señales

| Señal que se leyó | Plugin |
| --- | --- |
| `openapi.yaml`, `openapi.json` o `swagger.json` | `plugin-apis` |
| Una dependencia de interfaz en un manifiesto (`react`, `vue`, `angular`, `svelte`) o un `index.html` que carga un script de aplicación | `plugin-frontend` |
| Un archivo de textos de interfaz, voz o un glosario de UI, y no hay pedido de diseñar la pantalla | `plugin-ux-writing` |
| `Dockerfile`, un archivo compose, un chart de Helm o un pipeline que construye o promueve | `plugin-platform` |
| Un archivo que declara un SLO o un presupuesto de error | `plugin-sre` |
| Un modelo de amenazas, una nota ASVS o un archivo de requisitos de seguridad | `plugin-security` |
| Un registro de privacidad o un archivo que lista datos de una persona | `plugin-privacy` |
| `.puml` o una carpeta de fuentes UML | `plugin-uml-diagrams` |
| Una nota WCAG, una config de axe o un requisito de accesibilidad | `plugin-accessibility` |
| Un modelo de dominio que la persona pide dejar escrito, o una entrada de servidor sin señal de interfaz | `plugin-backend` |
| Un esquema o una migración de dato operativo | `plugin-data` |
| Config de OpenTelemetry, o un exportador de métricas, trazas o logs | `plugin-observability` |
| Una llamada a la API de un modelo, un índice de recuperación o una definición de herramienta para un modelo | `plugin-genai` |
| Una ficha de modelo o una nota de riesgo de un modelo | `plugin-ai-governance` |
| Un script de entrenamiento o una config de entrenamiento | `plugin-model-training` |
| Un conjunto de evaluación con una métrica para un modelo | `plugin-ai-evaluation` |
| Una ficha de conjunto para entrenamiento o recuperación | `plugin-ai-data` |
| Una hipótesis de experimento con una unidad y una regla de decisión | `plugin-experimentation` |
| Un registro de modelos, una regla de promoción o una nota de vuelta atrás de un modelo | `plugin-mlops` |
| Eventos de producto que calculan una métrica | `plugin-product-analytics` |
| Un problema, una oportunidad o un resultado de negocio que la persona pide dejar escrito | `plugin-product` |
| Un caso de uso (actor, flujo principal) que la persona pide dejar escrito | `plugin-project-manager` |
| Un escenario de prueba o un archivo de plan de prueba | `plugin-qa-engineer` |
| Una especificación de pantalla o un archivo de diseño | `plugin-ui-ux-design` |
| Un documento Diátaxis que la persona pide escribir para un lector | `plugin-documentation` |
| Un ADR o una evaluación de arquitectura que la persona pide escribir | `plugin-software-architect` |

## Plantilla

```markdown
# <NNN> — Recomendación

- Estado: proposed
- Leído: <yyyy-MM-ddTHH:mm:ssZ>

| Plugin | Señal | Fuente |
| --- | --- | --- |
| <nombre del plugin> | <señal de la tabla> | <ruta relativa> |

## No observado

- <señales que se buscaron y no se encontraron>

## Sigue cuando se acepta

La persona no ha aceptado esta lista. No se instaló nada.
```

## Ejemplo

Estado: `proposed`. Una fila: `plugin-apis`, señal `openapi.yaml`, fuente `openapi.yaml`. No observado: una dependencia de interfaz, un pipeline. No se instaló nada.

## Prerrequisitos

- **Señal.** Al menos una fila de la tabla coincidió con un archivo leído en este turno. Si ninguna coincidió, no escribas nada de esta pieza.

## Prompts

En un mensaje:

```text
/context-recommend
Use only a signal from the table. Leave the file proposed.
```

No hay command anterior.

## Terminado

- Cada fila es una señal de la tabla que se leyó, con la ruta. No se añadió un plugin por parecido. `plugin-project-context` no está.
- El estado es `proposed`, salvo que la persona pidiera enmendar este archivo a `accepted`. No se instaló ni se copió nada.
- Sin señal que coincida, no se escribió archivo.
