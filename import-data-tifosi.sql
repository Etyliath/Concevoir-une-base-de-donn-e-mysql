INSERT INTO ingredients (name_ingredient) VALUES
    ('Ail'),
    ('Ananas'),
    ('Artichaut'),
    ('Bacon'),
    ('Base Tomate'),
    ('Base crème'),
    ('Champignon'),
    ('Chevre'),
    ('Cresson'),
    ('Emmental'),
    ('Gorgonzola'),
    ('Jambon cuit'),
    ('Jambon fumé'),
    ('Oeuf'),
    ('Oignon'),
    ('Olive noire'),
    ('Olive verte'),
    ('Parmesan'),
    ('Piment'),
    ('Poivre'),
    ('Pomme de terre'),
    ('Raclette'),
    ('Salami'),
    ('Tomate cerise');

INSERT INTO brands (name_brand) VALUES 
    ('Coca-cola'),
    ('Cristalline'),
    ('Monster'),
    ('Pepsico');

INSERT INTO drinks (name_drink,brand_id) VALUES
    ('Coca-cola zéro',1),
    ('Coca-cola original',1),
    ('Fanta citron',1),
    ('Fanta orange',1),
    ('Capri-sun',1),
    ('Pepsi',4),
    ('Pepsi Max Zéro',4),
    ('Lipton zéro citron',4),
    ('Lipton Peach',4),
    ('Monster energy ultra gold',3),
    ('Monster energy ultra blue',3),
    ('Eau de source',2);

INSERT INTO focaccia (name_focaccia,price_focaccia) VALUES
    ('Mozaccia',9.80),
    ('Gorgonzollaccia',10.80),
    ('Raclaccia',8.90),
    ('Emmentalaccia',9.80),
    ('Tradizione',8.90),
    ('Hawaienne',11.20),
    ('Américaine',10.80),
    ('Paysanne',12.80);