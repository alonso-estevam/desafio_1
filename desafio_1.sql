CREATE TABLE "tb_produtos" (
  "codigo" serial PRIMARY KEY,
  "nome" varchar(100) NOT NULL,
  "preco_unitario" numeric(6,2),
  "categoria" int NOT NULL REFERENCES "tb_categorias" ("id")
);

CREATE TABLE "tb_categorias" (
  "id" serial PRIMARY KEY,
  "nome" varchar(80) NOT NULL
);
