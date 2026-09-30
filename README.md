# Pitlane Automotores

Web comercial de Pitlane. Repositorio: `pitlaneautomotores-debug/touring-automotores`.

## Desarrollo

No requiere instalación de dependencias para el build actual.

```sh
npm run build
python3 -m http.server 8000 --directory dist
```

Abrir `http://localhost:8000`. `dist/` es una salida generada, no la fuente.

## Estructura

| Archivo | Función |
| --- | --- |
| `index.html` | Diseño, wordmarks SVG, estilos, catálogo y lógica de WhatsApp |
| `public/` | Recursos existentes, incluidos logos antiguos de Touring |
| `package.json` | Build mediante copia de archivos |
| `vercel.json` | Build, directorio de salida y alias de Pitlane |
| `AGENTS.md` | Reglas para agentes que trabajen en el repositorio |

## Publicación

- Rama principal: `main`.
- Proyecto de Vercel: `touring-automotores`.
- Dominio de Pitlane registrado en Vercel: https://pitlane-automotores.vercel.app
- El dominio anterior `touring-automotores.vercel.app` también sigue registrado.
- Último despliegue observado el 30/09/2026: `READY`, destino `production`. Esto describe el estado de Vercel, no una prueba del sitio en navegador.

## Estado funcional observado

- Búsqueda y filtros ejecutados en el navegador sobre un array estático.
- Venta, permuta y búsqueda personalizada generan mensajes de WhatsApp; no hay persistencia ni conexión con CRM.
- Seis fichas tienen datos no verificados y fotografías genéricas. El texto «1 disponible» no está conectado a un inventario real.
- CSS y JavaScript están dentro de `index.html`; no hay dependencias declaradas ni pruebas automatizadas.
- No hay un archivo de tipografía Pitlane: el nombre de marca se dibuja con SVG.

## Hallazgos de la revisión inicial

1. El stock publicado requiere validación: no se puede considerar real por estar en el código.
2. El panel blanco del hero hereda el color blanco del texto del hero; títulos y enlaces pueden perder contraste. Pendiente de verificación visual y corrección.
3. Varios campos usan solo placeholder y no tienen etiquetas accesibles explícitas.
4. La búsqueda del hero conserva el filtro de categoría previo, lo que puede ocultar resultados esperados.

Esta incorporación documenta el proyecto; no modifica el catálogo, la interfaz ni los contactos.
