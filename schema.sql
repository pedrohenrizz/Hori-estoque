-- Execute no Supabase: SQL Editor > New query > Run

create table if not exists ti_filiais (id text primary key, data jsonb not null, updated_at timestamptz not null default now());
alter table ti_filiais enable row level security;
create policy "ti_filiais_select" on ti_filiais for select to authenticated using (true);
create policy "ti_filiais_insert" on ti_filiais for insert to authenticated with check (true);
create policy "ti_filiais_update" on ti_filiais for update to authenticated using (true) with check (true);
alter publication supabase_realtime add table ti_filiais;

create table if not exists ti_ativos (id text primary key, data jsonb not null, updated_at timestamptz not null default now());
alter table ti_ativos enable row level security;
create policy "ti_ativos_select" on ti_ativos for select to authenticated using (true);
create policy "ti_ativos_insert" on ti_ativos for insert to authenticated with check (true);
create policy "ti_ativos_update" on ti_ativos for update to authenticated using (true) with check (true);
alter publication supabase_realtime add table ti_ativos;

create table if not exists ti_movs (id text primary key, data jsonb not null, updated_at timestamptz not null default now());
alter table ti_movs enable row level security;
create policy "ti_movs_select" on ti_movs for select to authenticated using (true);
create policy "ti_movs_insert" on ti_movs for insert to authenticated with check (true);
alter publication supabase_realtime add table ti_movs;

create table if not exists ti_supr (id text primary key, data jsonb not null, updated_at timestamptz not null default now());
alter table ti_supr enable row level security;
create policy "ti_supr_select" on ti_supr for select to authenticated using (true);
create policy "ti_supr_insert" on ti_supr for insert to authenticated with check (true);
create policy "ti_supr_update" on ti_supr for update to authenticated using (true) with check (true);
alter publication supabase_realtime add table ti_supr;

-- ti_movs (historico) nao tem policy de update/delete: ninguem altera movimentacoes ja gravadas.
