CREATE TABLE IF NOT EXISTS transfer_routes (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  source_location TEXT NOT NULL,
  destination_location TEXT NOT NULL DEFAULT 'Умань',
  zone TEXT NOT NULL DEFAULT 'nearby' CHECK (zone IN ('nearby', 'europe', 'airport')),
  currency TEXT NOT NULL DEFAULT 'USD' CHECK (currency IN ('USD', 'EUR', 'UAH')),
  price_sprinter_18 REAL,
  price_sprinter_22 REAL,
  price_bus_28 REAL,
  price_regular_35 REAL,
  notes TEXT,
  sort_order INTEGER NOT NULL DEFAULT 0,
  is_active INTEGER NOT NULL DEFAULT 1,
  created_at TEXT NOT NULL DEFAULT (datetime('now')),
  updated_at TEXT NOT NULL DEFAULT (datetime('now'))
);

ALTER TABLE orders ADD COLUMN route_id INTEGER REFERENCES transfer_routes(id) ON DELETE SET NULL;
ALTER TABLE orders ADD COLUMN route_price_type TEXT;

CREATE INDEX IF NOT EXISTS idx_transfer_routes_active ON transfer_routes(is_active, sort_order);
CREATE INDEX IF NOT EXISTS idx_orders_route_id ON orders(route_id);

INSERT INTO transfer_routes (
  source_location, destination_location, zone, currency, price_sprinter_18, sort_order
) VALUES
  ('Киев', 'Умань', 'nearby', 'USD', 600, 10),
  ('Хмельницкий', 'Умань', 'nearby', 'USD', 750, 20),
  ('Белая Церковь', 'Умань', 'nearby', 'USD', 300, 30),
  ('Винница / Вапнярка', 'Умань', 'nearby', 'USD', 400, 40),
  ('Лужанка / Берегово / Чоп', 'Умань', 'nearby', 'USD', 2000, 50),
  ('Шегини', 'Умань', 'nearby', 'USD', 1500, 60),
  ('Сирет', 'Умань', 'nearby', 'USD', 1200, 70),
  ('Паланка', 'Умань', 'nearby', 'USD', 750, 80),
  ('Могилёв-Подольский', 'Умань', 'nearby', 'USD', 600, 90),
  ('Вена', 'Умань', 'europe', 'USD', 3000, 100),
  ('София / Братислава', 'Умань', 'europe', 'USD', 3000, 110),
  ('Варна / Бургас', 'Умань', 'europe', 'USD', 2400, 120),
  ('Дебрецен / Керестир', 'Умань', 'europe', 'USD', 2000, 130),
  ('Будапешт', 'Умань', 'europe', 'USD', 2800, 140),
  ('Катовице', 'Умань', 'europe', 'USD', 2400, 150),
  ('Варшава', 'Умань', 'europe', 'USD', 2400, 160),
  ('Краков (+Лежайск)', 'Умань', 'europe', 'USD', 2200, 170),
  ('Жешув (входит Лежайск)', 'Умань', 'europe', 'USD', 1800, 180),
  ('Клуж-Напока', 'Умань', 'europe', 'USD', 2400, 190),
  ('Бухарест (+паром)', 'Умань', 'europe', 'USD', 2100, 200),
  ('Тульча (+паром)', 'Умань', 'europe', 'USD', 1700, 210),
  ('Бакэу', 'Умань', 'europe', 'USD', 1700, 220),
  ('Сучава', 'Умань', 'europe', 'USD', 1400, 230),
  ('+Медж', 'Умань', 'airport', 'USD', 240, 240),
  ('Яссы', 'Умань', 'airport', 'USD', 1300, 250),
  ('Кишинёв', 'Умань', 'airport', 'USD', 1100, 260);
