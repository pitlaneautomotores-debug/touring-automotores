# PITLANE Admin — infraestructura gratuita

Esta rama contiene el primer módulo del administrador propio. No usa Sanity.

## Arquitectura inicial sin costo
- Interfaz y lógica del panel: código de PITLANE.
- PostgreSQL + autenticación + almacenamiento de fotos: proyecto Supabase Free.
- Web pública: Vercel actual.
- Código y despliegues: GitHub/Vercel actuales.

Supabase es infraestructura gestionada externa, no Sanity. El esquema y la aplicación son de PITLANE y se pueden migrar/exportar. El plan gratuito tiene límites y puede pausar proyectos inactivos; no se habilita ningún plan pago.

## Configuración pendiente
1. Crear un proyecto en Supabase usando el plan Free.
2. Ejecutar `supabase/schema.sql` en SQL Editor.
3. Crear el usuario administrador desde Authentication > Users.
4. Copiar Project URL y anon/public key en `public/supabase-config.js`.
5. Conectar el catálogo público a la tabla `vehicles` y desplegar.

No colocar nunca la service_role key en archivos públicos ni en el navegador.
