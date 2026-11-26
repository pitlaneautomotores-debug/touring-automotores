-- PITLANE: esquema inicial para Supabase (PostgreSQL)
create extension if not exists pgcrypto;

create table if not exists public.vehicles (
  id uuid primary key default gen_random_uuid(),
  code text unique not null,
  brand text not null,
  model text not null,
  version text,
  year integer not null,
  km text,
  category text not null,
  price text,
  status text not null default 'draft' check (status in ('draft','available','reserved','sold')),
  engine text,
  transmission text,
  fuel text,
  description text,
  cover_url text,
  photos jsonb not null default '[]'::jsonb,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

alter table public.vehicles enable row level security;

-- Lectura pública solo de unidades publicadas.
drop policy if exists "Public can read visible vehicles" on public.vehicles;
create policy "Public can read visible vehicles"
on public.vehicles for select
to anon, authenticated
using (status in ('available','reserved','sold'));

-- Escritura exclusiva para el correo administrador de PITLANE.
drop policy if exists "Authenticated admins can manage vehicles" on public.vehicles;
drop policy if exists "PITLANE admin can manage vehicles" on public.vehicles;
create policy "PITLANE admin can manage vehicles"
on public.vehicles for all
to authenticated
using ((auth.jwt() ->> 'email') = 'pitlaneautomotores@gmail.com')
with check ((auth.jwt() ->> 'email') = 'pitlaneautomotores@gmail.com');

insert into storage.buckets (id, name, public, file_size_limit, allowed_mime_types)
values ('pitlane-vehicles','pitlane-vehicles',true,10485760,array['image/jpeg','image/png','image/webp'])
on conflict (id) do update
set public = excluded.public,
    file_size_limit = excluded.file_size_limit,
    allowed_mime_types = excluded.allowed_mime_types;

drop policy if exists "Public can view vehicle photos" on storage.objects;
create policy "Public can view vehicle photos"
on storage.objects for select
using (bucket_id = 'pitlane-vehicles');

drop policy if exists "Authenticated admins can upload vehicle photos" on storage.objects;
drop policy if exists "PITLANE admin can upload vehicle photos" on storage.objects;
create policy "PITLANE admin can upload vehicle photos"
on storage.objects for insert
to authenticated
with check (bucket_id = 'pitlane-vehicles' and (auth.jwt() ->> 'email') = 'pitlaneautomotores@gmail.com');

drop policy if exists "Authenticated admins can update vehicle photos" on storage.objects;
drop policy if exists "PITLANE admin can update vehicle photos" on storage.objects;
create policy "PITLANE admin can update vehicle photos"
on storage.objects for update
to authenticated
using (bucket_id = 'pitlane-vehicles' and (auth.jwt() ->> 'email') = 'pitlaneautomotores@gmail.com')
with check (bucket_id = 'pitlane-vehicles' and (auth.jwt() ->> 'email') = 'pitlaneautomotores@gmail.com');

drop policy if exists "Authenticated admins can delete vehicle photos" on storage.objects;
drop policy if exists "PITLANE admin can delete vehicle photos" on storage.objects;
create policy "PITLANE admin can delete vehicle photos"
on storage.objects for delete
to authenticated
using (bucket_id = 'pitlane-vehicles' and (auth.jwt() ->> 'email') = 'pitlaneautomotores@gmail.com');
