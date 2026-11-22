
/*Query för alla suppliers med deras address inkluderade*/
SELECT
    suppliername,
    contactperson,
    phone,
    email,
    addressline,
    postalcode,
    city
FROM suppliers INNER JOIN addresses
    ON suppliers.address_id = addresses.id INNER JOIN postalcodes
    ON addresses.postalcode_id = postalcodes.id INNER JOIN cities
    ON postalcodes.city_id = cities.id;

/*Query för vilka ingredienser som vilka suppliers säljer, och vilket pris de säljer det för*/
SELECT
    suppliername,
    itemnumber,
    ingredientname,
    priceperkg
FROM supplieringredients INNER JOIN suppliers
    ON supplieringredients.supplier_id = suppliers.id INNER JOIN ingredients
    ON supplieringredients.ingredient_id = ingredients.id;

/*query för att kolla vilka ingridienser som alla produkter använder*/
SELECT
    productname,
    ingredientname,
    quantitykg,
    suppliername
FROM products INNER JOIN recipes
    ON products.id = recipes.product_id INNER JOIN ingredients
    ON recipes.ingredient_id = ingredients.id INNER JOIN supplieringredients
    ON ingredients.id = supplieringredients.ingredient_id INNER JOIN suppliers
    ON supplieringredients.supplier_id = suppliers.id;

/*Query för ordrar*/
SELECT
    purchasedate,
    itemnumber,
    ingredientname,
    quantitykg,
    priceperkg,
    quantitykg * priceperkg AS total, /*Summa för raden*/
    suppliername
FROM purchases INNER JOIN supplieringredients
    ON purchases.supplier_id = supplieringredients.supplier_id
    AND purchases.ingredient_id = supplieringredients.ingredient_id INNER JOIN ingredients
    ON purchases.ingredient_id = ingredients.id INNER JOIN suppliers
    ON purchases.supplier_id = suppliers.id;

/*Query för ingridienser som behöver köpas in*/
SELECT
    itemnumber,
    ingredientname,
    stockkg,
    suppliername,
    contactperson,
    phone,
    email
FROM ingredients INNER JOIN supplieringredients
    ON ingredients.id = supplieringredients.ingredient_id INNER JOIN suppliers
    ON supplieringredients.supplier_id = suppliers.id
WHERE stockkg < 5;
