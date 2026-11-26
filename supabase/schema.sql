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

-- Lectura pública únicamente de vehículos publicados.
create policy "Public can read visible vehicles"
on public.vehicles for select
using (status in ('available','reserved','sold'));

-- La escritura requiere una sesión autenticada.
create policy "Authenticated admins can manage vehicles"
on public.vehicles for all
to authenticated
using (true)
with check (true);

insert into storage.buckets (id, name, public, file_size_limit, allowed_mime_types)
values ('pitlane-vehicles','pitlane-vehicles',true,10485760,array['image/jpeg','image/png','image/webp'])
on conflict (id) do nothing;

create policy "Public can view vehicle photos"
on storage.objects for select
using (bucket_id = 'pitlane-vehicles');

create policy "Authenticated admins can upload vehicle photos"
on storage.objects for insert
to authenticated
with check (bucket_id = 'pitlane-vehicles');

create policy "Authenticated admins can update vehicle photos"
on storage.objects for update
to authenticated
using (bucket_id = 'pitlane-vehicles')
with check (bucket_id = 'pitlane-vehicles');

create policy "Authenticated admins can delete vehicle photos"
on storage.objects for delete
to authenticated
using (bucket_id = 'pitlane-vehicles');
