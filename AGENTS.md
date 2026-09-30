# Pitlane Automotores — instrucciones del proyecto

## Alcance y arquitectura
- Este repositorio contiene una web comercial estática: HTML, CSS y JavaScript en `index.html`; recursos en `public/`.
- No hay framework, backend, base de datos, autenticación ni CRM implementados aquí. Los formularios abren WhatsApp con un mensaje; no persisten leads.
- Mantener la arquitectura existente salvo que la tarea justifique un cambio. No introducir Next.js, dependencias o servicios por defecto.
- `npm run build` copia la web a `dist/`. Vercel publica ese directorio según `vercel.json`.

## Identidad y datos
- Marca comercial: Pitlane Automotores. Ubicación general: Yerba Buena, Tucumán. Concepto: «Calidad antes que cantidad».
- Preservar el wordmark SVG existente hasta recibir un recurso o cambio autorizado. No asumir que representa una fuente tipográfica disponible.
- Mantener una estética sobria, editorial y cuidada; comprobar usabilidad móvil.
- No inventar stock, precios, kilometrajes, testimonios, dirección de oficina, financiación ni condiciones comerciales.
- Las seis unidades PL-0001 a PL-0006 presentes al crear este archivo no están verificadas como stock real; sus imágenes son genéricas de Unsplash. No reutilizarlas como información comercial confirmada.
- Los códigos PL-XXXX identifican operaciones reales: no asignar códigos definitivos a ejemplos ni reciclar códigos existentes sin confirmar.
- NODO está descartada. No publicarla como oficina. No asumir que existe una oficina nueva confirmada.
- Conservar el contacto existente salvo cambio solicitado; su presencia en el código no demuestra que se haya verificado la titularidad.

## Trabajo y verificación
- Revisar el estado de Git y las instrucciones aplicables antes de editar. No sobrescribir cambios ajenos.
- Trabajar en una rama para que los cambios sean revisables. Revisar `vercel.json` antes de tocar dominios o despliegue.
- Los nombres técnicos `touring-automotores` siguen identificando el repositorio y proyecto de Vercel; no renombrarlos por una sustitución global de marca.
- Ejecutar `npm run build` después de cambios y comprobar `git diff --check`.
- Para cambios funcionales o visuales, verificar los flujos afectados, móvil y escritorio. Probar la generación de enlaces de WhatsApp sin enviar mensajes.
- No afirmar que el build verifica diseño, stock, seguridad o funcionamiento integral. Indicar qué se probó y qué quedó sin verificar.
- No incorporar credenciales al repositorio ni exponer datos privados de titulares o interesados en el sitio público.
