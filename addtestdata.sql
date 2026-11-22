PRAGMA foreign_keys = ON;

INSERT INTO cities(
    city
)VALUES(
    'Stenungsund'
),(
    'Göteborg'
),(
    'Uddevalla'
);

INSERT INTO postalcodes(
    postalcode,
    city_id
)VALUES(
    '44430',
    1
),(
    '41101',
    2
),(
    '45130',
    3
);

INSERT INTO addresses(
    addressline,
    postalcode_id
)VALUES(
    'Kvarnvägen 1',
    1
),(
    'Hamngatan 12',
    2
),(
    'Mejerigatan 5',
    3
);

INSERT INTO suppliers(
    suppliername,
    contactperson,
    phone,
    email,
    address_id
)VALUES(
    'Kvarnen AB',
    'Anna Andersson',
    '0303-111111',
    'anna@kvarnen.se',
    1
),(
    'Mejeriet AB',
    'Bertil Berg',
    '031-222222',
    'bertil@mejeriet.se',
    2
),(
    'Sockerbolaget AB',
    'Cecilia Carlsson',
    '0522-333333',
    'cecilia@sockerbolaget.se',
    3
);

INSERT INTO ingredients(
    ingredientname,
    stockkg
)VALUES(
    'Vetemjöl',
    50
),(
    'Rågmjöl',
    8
),(
    'Jäst',
    2
),(
    'Smör',
    10
),(
    'Mjölk',
    20
),(
    'Ägg',
    5
),(
    'Strösocker',
    25
),(
    'Kanel',
    0.5
);

INSERT INTO supplieringredients(
    supplier_id,
    ingredient_id,
    itemnumber,
    priceperkg
)VALUES(
    1,
    1,
    'K100',
    12.50
),(
    1,
    2,
    'K101',
    15.00
),(
    1,
    3,
    'K102',
    60.00
),(
    1,
    7,
    'K103',
    13.50
),(
    2,
    3,
    'M203',
    58.00
),(
    2,
    4,
    'M200',
    95.00
),(
    2,
    5,
    'M201',
    12.00
),(
    2,
    6,
    'M202',
    45.00
),(
    3,
    7,
    'S300',
    14.00
),(
    3,
    8,
    'S301',
    250.00
);

INSERT INTO products(
    productname
)VALUES(
    'Kanelbulle'
),(
    'Rågbröd'
),(
    'Sockerkaka'
);

INSERT INTO recipes(
    product_id,
    ingredient_id,
    quantitykg
)VALUES(
    1,
    1,
    1.0
),(
    1,
    3,
    0.05
),(
    1,
    4,
    0.2
),(
    1,
    5,
    0.5
),(
    1,
    7,
    0.15
),(
    1,
    8,
    0.02
),(
    2,
    2,
    0.6
),(
    2,
    1,
    0.4
),(
    2,
    3,
    0.03
),(
    3,
    1,
    0.3
),(
    3,
    4,
    0.2
),(
    3,
    6,
    0.3
),(
    3,
    7,
    0.3
),(
    3,
    5,
    0.1
);

INSERT INTO purchases(
    purchasedate,
    supplier_id,
    ingredient_id,
    quantitykg
)VALUES(
    '2026-11-02',
    1,
    1,
    50
),(
    '2026-11-02',
    1,
    2,
    10
),(
    '2026-11-09',
    2,
    4,
    10
),(
    '2026-11-09',
    2,
    5,
    20
),(
    '2026-11-16',
    3,
    7,
    25
),(
    '2026-11-20',
    1,
    7,
    10
);
