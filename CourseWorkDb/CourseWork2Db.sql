CREATE TABLE Fragrances (
    id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    stock INT DEFAULT 0 NOT NULL,
    fragranceDescription NVARCHAR(750),
    smell NVARCHAR(250),
    notes NVARCHAR(350),
    rating FLOAT(2,1) NOT NULL DEFAULT 0.0 CHECK (rating BETWEEN 0.0 AND 5.0),
    discountPercentage FLOAT(4,2) DEFAULT 0.0 CHECK (discountPercentage BETWEEN 0 AND 100),
    price FLOAT(8, 2) NOT NULL,
    fragranceName NVARCHAR(75) NOT NULL,
    brand_id INT NOT NULL,
    CONSTRAINT FK_fragrance_brand_id FOREIGN KEY (brand_id) REFERENCES Brands(id) ON DELETE CASCADE
);
ALTER TABLE Fragrances AUTO_INCREMENT = 1000;
SELECT * FROM Cart;
SELECT * FROM Customers;
SELECT * FROM Fragrances;
SELECT * FROM Brands;
SELECT * FROM Reviews;
SELECT * FROM OrdersDetails;


UPDATE fragrances SET
    fragranceDescription = CASE id
        WHEN 1000 THEN 'Цей аромат натхненний свіжими, легкими нотами троянд, які переплітаються з мускусом, створюючи витончену, жіночну ауру. Ідеально підходить для весняних днів.'
        WHEN 1001 THEN 'Чарівний аромат, що передає атмосферу мрії. Сандал надає тепла, а пряні ноти додають загадковості, створюючи глибокий, заспокійливий ефект.'
        WHEN 1002 THEN 'Інтенсивний і чуттєвий аромат, що втілює таємничість. Поєднання пачулі та шкіри створює розкішне відчуття, яке захоплює і залишає слід.'
        WHEN 1003 THEN 'Цей аромат вражає своїм багатством і глибиною. Ноти уда переплітаються зі специями, створюючи теплу і загадкову ауру, яка ідеально підходить для вечірніх виходів.'
        WHEN 1004 THEN 'Яскравий, енергійний аромат, який дарує відчуття свіжості і бадьорості. Цитрусові ноти створюють піднесений настрій, ідеальний для активного дня.'
        WHEN 1005 THEN 'Традиційний аромат із ванільним відтінком. Елегантний і чуттєвий аромат, що втілює розкіш і жіночність. Поєднання квіткових нот з пачулі створює яскравий і запам\'ятовуючий слід.'
        WHEN 1006 THEN 'Класичний іконічний аромат, що став символом елегантності. Ноти альдегідів створюють повітряну легкість, а квіткові акценти надають жіночності.'
        WHEN 1007 THEN 'Це витончений і чуттєвий аромат, що втілює жіночність. Його квіткові ноти створюють радісний настрій, ідеально підходить для будь-якої пори року.'
        WHEN 1008 THEN 'Інтенсивний і мужній аромат, що випромінює силу та енергію. Цитрусові та пряні ноти створюють динамічний характер, що підходить для активних чоловіків.'
        WHEN 1009 THEN 'Це свіжий і легкий аромат, що викликає відчуття радості і молодості. Квіткові ноти переплітаються з фруктовими, створюючи яскравий, привабливий слід.'
        WHEN 1010 THEN 'Цей аромат втілює сміливість і елегантність. Ноти лаванди та шкіри створюють характерний, запам\'ятовуваний слід.'
        WHEN 1011 THEN 'Сексуальний і чуттєвий аромат, що втілює свободу. Поєднання лаванди та ванілі створює неповторну ауру, що залишає слід.'
        WHEN 1012 THEN 'Яскравий і чуттєвий аромат, натхненний любов\'ю. Солодкі ноти суниць переплітаються з квітами, створюючи запам\'ятовуваний слід.'
        WHEN 1013 THEN 'Розкішний і глибокий аромат, що випромінює таємничість. Ноти уда поєднуються зі спеціями, створюючи чуттєву ауру.'
        WHEN 1014 THEN 'Теплий і насичений аромат, що втілює розкіш. Поєднання ванілі та тютюну створює ідеальний баланс між солодкістю і глибиною.'
        WHEN 1015 THEN 'Яскравий і свіжий аромат, що викликає відчуття радості. Цитрусові ноти переплітаються з базиліком, створюючи енергійний слід.'
        WHEN 1016 THEN 'Ніжний і романтичний аромат, що втілює жіночність. Ноти півонії переплітаються з яблуком, створюючи свіжий і привабливий слід.'
        WHEN 1017 THEN 'Це аромат радості і свободи. Солодкі ноти чорної смородини в поєднанні з квітами створюють вражаючий слід.'
        WHEN 1018 THEN 'Сучасний і легкий аромат, що втілює жіночність. Ноти троянди і персика створюють свіжий, витончений слід.'
        WHEN 1019 THEN 'Цей аромат відображає свіжість океану. Цитрусові нотки в поєднанні з морськими акцентами створюють легкий і бадьорий слід.'
        WHEN 1020 THEN 'Сексуальний і елегантний аромат, що символізує жіночність. Ноти чорної смородини та амбри створюють глибокий, чуттєвий слід.'
        WHEN 1021 THEN 'Свіжий і сильний початковий акорд із есенції зеленого мандарина розкриває серце, утворене сінно-фруктовою пряністю лаванди.'
        WHEN 1022 THEN 'Сучасний і чуттєвий аромат, що втілює жіночність і відкритість. Поєднання цитрусових і квіткових нот створює свіжий, енергійний слід.'
        WHEN 1023 THEN 'Чуттєвий і насичений аромат, що символізує силу та пристрасть. Теплі ноти ванілі та кориці створюють глибокий, пам\'ятний слід.'
        WHEN 1024 THEN 'Легкий і свіжий аромат, що відображає ніжність і жіночність. Ноти лотосу та граната створюють яскравий, романтичний слід.'
        WHEN 1025 THEN 'Сексуальний і чуттєвий аромат, що символізує пристрасть і енергію. Свіжі ноти м\'яти та цитрусів поєднуються з теплими акцентами, створюючи незабутній слід.'
        WHEN 1026 THEN 'Сексуальний і чуттєвий аромат, що втілює сучасну жінку. Ноти чорної смородини і жасмину створюють привабливий і глибокий слід.'
        WHEN 1027 THEN 'Чоловічий аромат, що втілює елегантність і стиль. Свіжі цитрусові ноти поєднуються з деревними акцентами, створюючи насичений слід.'
        WHEN 1028 THEN 'Це глибокий і чуттєвий аромат, що викликає відчуття ейфорії. Ноти граната і ванілі створюють теплу, запам\'ятовувану ауру.'
        WHEN 1029 THEN 'Легкий і універсальний аромат, що підходить для обох статей. Цитрусові ноти створюють свіжість, а квіткові акценти додають легкості.'
        WHEN 1030 THEN 'Яскравий і провокаційний аромат, що символізує розкіш і успіх. Ноти грейпфрута та коринки створюють динамічний і запам\'ятовуваний слід.'
        WHEN 1031 THEN 'Це елегантний і чуттєвий аромат, що втілює жіночність. Поєднання цитрусових і квіткових нот створює розкішний, теплий слід.'
        WHEN 1032 THEN 'Чоловічий аромат, що символізує силу і впевненість. Свіжі цитрусові ноти поєднуються з деревними акцентами, створюючи енергійний слід.'
        WHEN 1033 THEN 'Чуттєвий і елегантний аромат, що втілює силу і жіночність. Ноти солі і ванілі створюють незабутній, пам\'ятний слід.'
        WHEN 1034 THEN 'Сучасний аромат з містичною аурою. Поєднання свіжих і солодких нот створює інтригуючий слід.'
        WHEN 1035 THEN 'Чоловічий аромат, що відображає природу та землю. Ноти деревини та цитрусів створюють глибокий, земний слід.'
        WHEN 1036 THEN 'Чарівний і загадковий аромат, що втілює магію. Ноти лимона і дерева створюють свіжий, але теплий слід.'
        WHEN 1037 THEN 'Сильний і елегантний аромат, що символізує впевненість. Ноти бергамоту і лаванди створюють енергійний слід.'
        WHEN 1038 THEN 'Розкішний аромат, що символізує успіх і благополуччя. Ноти ванілі і деревини створюють теплу ауру.'
        WHEN 1039 THEN 'Легкий і вільний аромат, натхненний духом цыган. Ноти цитрусів і сосни створюють свіжий, природний слід.'
        WHEN 1040 THEN 'Чарівний аромат, що втілює елегантність і таємницю. Ноти фруктів і деревини створюють яскравий, загадковий слід.'
        WHEN 1041 THEN 'Інтенсивний і чуттєвий аромат, що втілює силу природи. Ноти сандалу та деревини створюють глибокий, теплий слід.'
        WHEN 1042 THEN 'Ніжний і елегантний аромат з глибокими деревними нотами. Роза поєднується з пряностями, створюючи запам\'ятовуваний слід.'
        WHEN 1043 THEN 'Чоловічий аромат, що символізує силу та успіх. Свіжі фрукти в поєднанні з деревними нотами створюють яскравий, вражаючий слід.'
        WHEN 1044 THEN 'Свіжий і зелений аромат, що втілює дух ірландських пейзажів. Ноти лаванди та деревини створюють легкий, але запам\'ятовуваний слід.'
        WHEN 1045 THEN 'Витончений аромат, що відображає дух середземноморських островів. Свіжі цитрусові та фруктові ноти створюють легкий, яскравий слід.'
        WHEN 1046 THEN 'Чуттєвий і елегантний аромат, що поєднує в собі яскраві цитрусові ноти та глибокі деревні акорди, залишаючи вражаючий слід.'
        WHEN 1047 THEN 'Інтенсивний і мужній аромат, що втілює силу та таємницю. Ноти рому і спецій надають йому тепла і чуттєвості.'
        WHEN 1048 THEN 'Легкий і свіжий аромат, що викликає відчуття радості. Поєднання фруктових і квіткових нот створює ніжний, романтичний слід.'
        WHEN 1049 THEN 'Аромат, що втілює мужність і вишуканість. Свіжі фруктові ноти в поєднанні з деревними акцентами створюють запам\'ятовуваний образ.'
        WHEN 1050 THEN 'Чоловічий аромат, що закликає до пригод. Свіжі цитрусові нотки в поєднанні з глибокими деревними акцентами дарують відчуття свободи.'
        WHEN 1051 THEN 'Легкий і свіжий аромат, що символізує мрії та досягнення. Яскраві цитрусові нотки створюють невимушений, але стильний слід.'
        WHEN 1052 THEN 'Чуттєвий аромат, що втілює елегантність і жіночність. Поєднання квіткових нот з теплом деревини створює незабутнє враження.'
        WHEN 1053 THEN 'Інтенсивний і вражаючий аромат, що підкреслює особистість. Теплі східні акценти надають йому чуттєвості і глибини.'
        WHEN 1054 THEN 'Ніжний і чуттєвий аромат, що викликає відчуття романтики. Солодкі квіткові нотки створюють вражаючий, привабливий слід.'
        WHEN 1055 THEN 'Свіжий і жвавий аромат, що наповнений енергією. Солодкі фрукти створюють радісний і легкий настрій.'
        WHEN 1056 THEN 'Ігристий і чуттєвий аромат, що втілює молодість і грайливість. Солодкі нотки заповнюють простір радістю.'
        WHEN 1057 THEN 'Ніжний і спокусливий аромат, що притягує увагу. Поєднання фруктових і квіткових нот створює романтичну атмосферу.'
        WHEN 1058 THEN 'Легкий і свіжий аромат, що дарує відчуття чистоти і свіжості. Нотки авокадо і кокоса надають йому натуральності.'
        WHEN 1059 THEN 'Унікальний аромат, що дарує відчуття спокою і рівноваги. Поєднання квіткових і деревних нот створює гармонійний образ.'
        ELSE fragranceDescription
    END,
    notes = CASE id
        WHEN 1000 THEN 'Роза, мускус, бамбук'
        WHEN 1001 THEN 'Папороть, сандал, ваніль'
        WHEN 1002 THEN 'Пачулі, смола, шкіра'
        WHEN 1003 THEN 'Уд, спеції, амбра'
        WHEN 1004 THEN 'Мандарин, бергамот, кардамон'
        WHEN 1005 THEN 'Роза, жасмин, пачулі'
        WHEN 1006 THEN 'Альдегіди, жасмин, ваніль'
        WHEN 1007 THEN 'Жасмин, троянда, грушу'
        WHEN 1008 THEN 'Бергамот, перець, амбра'
        WHEN 1009 THEN 'Півонія, троянда, цитруси'
        WHEN 1010 THEN 'Лаванда, лимон, шкіра'
        WHEN 1011 THEN 'Лаванда, апельсиновий цвіт, ваніль'
        WHEN 1012 THEN 'Суничний, жасмин, пачулі'
        WHEN 1013 THEN 'Уд, ваніль, спеції'
        WHEN 1014 THEN 'Ваніль, тютюн, спеції'
        WHEN 1015 THEN 'Лайм, базилік, мандарин'
        WHEN 1016 THEN 'Півонія, яблуко, замша'
        WHEN 1017 THEN 'Чорна смородина, жасмин, ваніль'
        WHEN 1018 THEN 'Роза, персик, ваніль'
        WHEN 1019 THEN 'Бергамот, лимон, морські ноти'
        WHEN 1020 THEN 'Чорна смородина, ваніль, амбра'
        WHEN 1021 THEN 'Бергамот, жожоба, шкіра'
        WHEN 1022 THEN 'Апельсин, жасмин, ваніль'
        WHEN 1023 THEN 'Лаванда, ваніль, кориця'
        WHEN 1024 THEN 'Лотос, гранат, жасмин'
        WHEN 1025 THEN 'М\'ята, лимон, амбра'
        WHEN 1026 THEN 'Чорна смородина, жасмин, ваніль'
        WHEN 1027 THEN 'Грейпфрут, деревина, шкіра'
        WHEN 1028 THEN 'Гранат, орхідея, ваніль'
        WHEN 1029 THEN 'Ананас, бергамот, жасмин'
        WHEN 1030 THEN 'Грейпфрут, кориця, шкіра'
        WHEN 1031 THEN 'Апельсин, жасмин, мед'
        WHEN 1032 THEN 'Грейпфрут, лаванда, амбра'
        WHEN 1033 THEN 'Сіль, ваніль, жасмин'
        WHEN 1034 THEN 'Лаванда, лимон, ваніль'
        WHEN 1035 THEN 'Грейпфрут, сандал, бурштин'
        WHEN 1036 THEN 'Лимон, янтар, дерево'
        WHEN 1037 THEN 'Бергамот, лаванда, кедр'
        WHEN 1038 THEN 'Лимон, ваніль, деревина'
        WHEN 1039 THEN 'Бергамот, лимон, сосна'
        WHEN 1040 THEN 'Манго, фрезія, сандал'
        WHEN 1041 THEN 'Сандал, кипарис, шкіра'
        WHEN 1042 THEN 'Роза, спеції, кедр'
        WHEN 1043 THEN 'Ананас, бергамот, мускус'
        WHEN 1044 THEN 'Лаванда, бергамот, деревина'
        WHEN 1045 THEN 'Сицилійський лимон, яблуко, дерево кедра'
        WHEN 1046 THEN 'Грейпфрут, лілія, пачулі'
        WHEN 1047 THEN 'Ром, спеції, шкіра'
        WHEN 1048 THEN 'Мандарин, персик, жасмин'
        WHEN 1049 THEN 'Яблуко, кедр, мускус'
        WHEN 1050 THEN 'Бергамот, мандарин, пачулі'
        WHEN 1051 THEN 'Лимон, мандарин, деревина'
        WHEN 1052 THEN 'Роза, сандал, мускус'
        WHEN 1053 THEN 'Ваніль, спеції, сандал'
        WHEN 1054 THEN 'Тубероза, жасмин, амбра'
        WHEN 1055 THEN 'Яблуко, груша, чорниця'
        WHEN 1056 THEN 'Ваніль, полуниця, жасмин'
        WHEN 1057 THEN 'Червона слива, півонія, ваніль'
        WHEN 1058 THEN 'Авокадо, кокос, мандарин'
        WHEN 1059 THEN 'Лаванда, сандал, мандарин'
        ELSE notes
    END,
    smell = CASE id
        WHEN 1000 THEN 'Квітковий'
        WHEN 1001 THEN 'Деревний, пряний'
        WHEN 1002 THEN 'Деревний, східний'
        WHEN 1003 THEN 'Деревний, пряний'
        WHEN 1004 THEN 'Цитрусовий, свіжий'
        WHEN 1005 THEN 'Східний, квітковий'
        WHEN 1006 THEN 'Квітковий, альдегідний'
        WHEN 1007 THEN 'Квітковий, фруктовий'
        WHEN 1008 THEN 'Деревний, пряний'
        WHEN 1009 THEN 'Квітковий, фруктовий'
        WHEN 1010 THEN 'Деревний, пряний'
        WHEN 1011 THEN 'Квітковий, східний'
        WHEN 1012 THEN 'Східний, фруктовий'
        WHEN 1013 THEN 'Деревний, пряний'
        WHEN 1014 THEN 'Східний, пряний'
        WHEN 1015 THEN 'Цитрусовий, пряний'
        WHEN 1016 THEN 'Квітковий'
        WHEN 1017 THEN 'Східний, фруктовий'
        WHEN 1018 THEN 'Квітковий, фруктовий'
        WHEN 1019 THEN 'Цитрусовий, морський'
        WHEN 1020 THEN 'Східний, квітковий'
        WHEN 1021 THEN 'Деревний, пряний'
        WHEN 1022 THEN 'Квітковий, фруктовий'
        WHEN 1023 THEN 'Деревний, східний'
        WHEN 1024 THEN 'Квітковий, фруктовий'
        WHEN 1025 THEN 'Деревний, східний'
        WHEN 1026 THEN 'Східний, фруктовий'
        WHEN 1027 THEN 'Деревний, пряний'
        WHEN 1028 THEN 'Східний, фруктовий'
        WHEN 1029 THEN 'Цитрусовий, свіжий'
        WHEN 1030 THEN 'Східний, деревний'
        WHEN 1031 THEN 'Квітковий, фруктовий'
        WHEN 1032 THEN 'Деревний, свіжий'
        WHEN 1033 THEN 'Східний, квітковий'
        WHEN 1034 THEN 'Деревний, пряний'
        WHEN 1035 THEN 'Деревний, земний'
        WHEN 1036 THEN 'Деревний, цитрусовий'
        WHEN 1037 THEN 'Деревний, пряний'
        WHEN 1038 THEN 'Цитрусовий, східний'
        WHEN 1039 THEN 'Деревний, свіжий'
        WHEN 1040 THEN 'Деревний, квітковий'
        WHEN 1041 THEN 'Деревний, східний'
        WHEN 1042 THEN 'Деревний, пряний'
        WHEN 1043 THEN 'Фруктовий, деревний'
        WHEN 1044 THEN 'Деревний, свіжий'
        WHEN 1045 THEN 'Свіжий'
        WHEN 1046 THEN 'Квітковий, деревний'
        WHEN 1047 THEN 'Деревний, східний'
        WHEN 1048 THEN 'Квітковий, фруктовий'
        WHEN 1049 THEN 'Деревний, свіжий'
        WHEN 1050 THEN 'Деревний, пряний'
        WHEN 1051 THEN 'Світлий, свіжий'
        WHEN 1052 THEN 'Квітковий, деревний'
        WHEN 1053 THEN 'Східний, деревний'
        WHEN 1054 THEN 'Квітковий'
        WHEN 1055 THEN 'Фруктовий'
        WHEN 1056 THEN 'Квітковий, фруктовий'
        WHEN 1057 THEN 'Фруктовий, квітковий'
        WHEN 1058 THEN 'Зелений, свіжий'
        WHEN 1059 THEN 'Східний, цитрусовий'
        ELSE smell
    END;


CREATE TABLE Brands (
    id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    brandName NVARCHAR(125) NOT NULL,
    brandFounder NVARCHAR(150) NOT NULL,
    brandCreationDate DATE NOT NULL,
    brandCountry NVARCHAR(75) NULL,
    brandMainOfficeAdress NVARCHAR(300),
    brandLogo NVARCHAR(1500),
    brandSite NVARCHAR(250)
);
ALTER TABLE Brands AUTO_INCREMENT = 1000;
ALTER TABLE Brands
ADD CONSTRAINT unique_brandName UNIQUE (brandName);


ALTER TABLE Orders AUTO_INCREMENT = 10000;

CREATE TABLE OrdersDetails (
    id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    fragrance_id INT NOT NULL,
	customer_id INT NOT NULL,
    price FLOAT(8, 2) NOT NULL,
    totalPrice FLOAT(8, 2) NOT NULL,
    CONSTRAINT FK_ordersdetails_fragrance_id FOREIGN KEY (fragrance_id) REFERENCES Fragrances(id) ON DELETE CASCADE,
    CONSTRAINT FK_ordersdetails_customer_id FOREIGN KEY (customer_id) REFERENCES Customers(id) ON DELETE CASCADE
);
ALTER TABLE OrdersDetails AUTO_INCREMENT = 0;

CREATE TABLE Customers (
	id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    customerName CHAR(150) NOT NULL,
    customerSurname CHAR(150) NOT NULL,
    phoneNumber VARCHAR(13) UNIQUE,
    customerEmail NVARCHAR(150) NOT NULL UNIQUE,
    numberOfOrders INT NOT NULL DEFAULT 0,
	countryDelivery NVARCHAR(100) NOT NULL,
	stateDelivery NVARCHAR(100) NOT NULL,
    cityDelivery NVARCHAR(100) NOT NULL,
    addressDelivery NVARCHAR(250) NOT NULL,
    CONSTRAINT phoneNumber_format CHECK (phoneNumber REGEXP '^[+]?([0-9]{10,13})$'),
    CONSTRAINT customerEmail_format CHECK (customerEmail REGEXP '^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}$')
);
ALTER TABLE Customers AUTO_INCREMENT = 10000;

CREATE TABLE Reviews (
    id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    customer_id INT NOT NULL,
    fragrance_id INT NOT NULL,
    rating FLOAT(2,1) CHECK (rating BETWEEN 0 AND 5),
    reviewText NVARCHAR(1000),
    reviewDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT FK_reviews_customer_id FOREIGN KEY (customer_id) REFERENCES Customers(id) ON DELETE CASCADE,
    CONSTRAINT FK_reviews_fragrance_id FOREIGN KEY (fragrance_id) REFERENCES Fragrances(id) ON DELETE CASCADE,
    isVisible BOOLEAN DEFAULT TRUE
);
ALTER TABLE Reviews AUTO_INCREMENT = 1;

CREATE TABLE Cart (
    id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    fragrance_id INT NOT NULL,
    quantity INT DEFAULT 1,
    dateAdded TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT FK_cart_fragrance_id FOREIGN KEY (fragrance_id) REFERENCES Fragrances(id) ON DELETE CASCADE
);

ALTER TABLE Cart AUTO_INCREMENT = 1;

CREATE INDEX idx_fragrance_name ON Fragrance(fragranceName);
CREATE INDEX idx_brand_name ON Brands(brandName);
CREATE INDEX idx_customerEmail ON Customer(customerEmail);
CREATE INDEX idx_orders_time ON Orders(orderTime);
CREATE INDEX idx_brands_brandCountry ON Brands(brandCountry);

UPDATE Brands SET brandLogo = 'https://fimgs.net/mdimg/dizajneri/o.2747.jpg' WHERE id = 1000;
UPDATE Brands SET brandLogo = 'https://fimgs.net/mdimg/dizajneri/o.30.jpg' WHERE id = 1001;
UPDATE Brands SET brandLogo = 'https://fimgs.net/mdimg/dizajneri/o.160.jpg' WHERE id = 1002;
UPDATE Brands SET brandLogo = 'https://fimgs.net/mdimg/dizajneri/o.67.jpg' WHERE id = 1003;
UPDATE Brands SET brandLogo = 'https://fimgs.net/mdimg/dizajneri/o.99.jpg' WHERE id = 1004;
UPDATE Brands SET brandLogo = 'https://fimgs.net/mdimg/dizajneri/o.139.jpg' WHERE id = 1005;
UPDATE Brands SET brandLogo = 'https://fimgs.net/mdimg/dizajneri/o.273.jpg' WHERE id = 1006;
UPDATE Brands SET brandLogo = 'https://fimgs.net/mdimg/dizajneri/o.80.jpg' WHERE id = 1007;
UPDATE Brands SET brandLogo = 'https://fimgs.net/mdimg/dizajneri/o.65.jpg' WHERE id = 1008;
UPDATE Brands SET brandLogo = 'https://fimgs.net/mdimg/dizajneri/o.97.jpg' WHERE id = 1009;
UPDATE Brands SET brandLogo = 'https://fimgs.net/mdimg/dizajneri/o.104.jpg' WHERE id = 1010;
UPDATE Brands SET brandLogo = 'https://fimgs.net/mdimg/dizajneri/o.18.jpg' WHERE id = 1011;
UPDATE Brands SET brandLogo = 'https://fimgs.net/mdimg/dizajneri/o.88.jpg' WHERE id = 1012;
UPDATE Brands SET brandLogo = 'https://fimgs.net/mdimg/dizajneri/o.69.jpg' WHERE id = 1013;
UPDATE Brands SET brandLogo = 'https://fimgs.net/mdimg/dizajneri/o.2048.jpg' WHERE id = 1014;
UPDATE Brands SET brandLogo = 'https://fimgs.net/mdimg/dizajneri/o.390.jpg' WHERE id = 1015;
UPDATE Brands SET brandLogo = 'https://fimgs.net/mdimg/dizajneri/o.403.jpg' WHERE id = 1016;
UPDATE Brands SET brandLogo = 'https://fimgs.net/mdimg/dizajneri/o.50.jpg' WHERE id = 1017;
UPDATE Brands SET brandLogo = 'https://fimgs.net/mdimg/dizajneri/o.56.jpg' WHERE id = 1018;
UPDATE Brands SET brandLogo = 'https://fimgs.net/mdimg/dizajneri/o.14.jpg' WHERE id = 1019;
UPDATE Brands SET brandLogo = 'https://fimgs.net/mdimg/dizajneri/o.107.jpg' WHERE id = 1020;
UPDATE Brands SET brandLogo = 'https://fimgs.net/mdimg/dizajneri/o.642.jpg' WHERE id = 1021;
UPDATE Brands SET brandLogo = 'https://fimgs.net/mdimg/dizajneri/o.199.jpg' WHERE id = 1022;
UPDATE Brands SET brandLogo = 'https://fimgs.net/mdimg/dizajneri/o.504.jpg' WHERE id = 1023;
Select * FROM Brands;

DROP TRIGGER check_stock_before_insert
DELIMITER //
CREATE TRIGGER check_stock_before_insert
BEFORE INSERT ON OrdersDetails
FOR EACH ROW
BEGIN
    DECLARE total_cart_quantity INT;
    DECLARE available_stock INT;

    SELECT COALESCE(SUM(quantity), 0) INTO total_cart_quantity
    FROM Cart
    WHERE fragrance_id = NEW.fragrance_id;

    SELECT stock INTO available_stock
    FROM Fragrances
    WHERE id = NEW.fragrance_id;
    
    IF total_cart_quantity > available_stock THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Недостатньо товару на складі';
    END IF;
END;
//
DELIMITER ;


DELIMITER //
CREATE TRIGGER after_review_insert
AFTER INSERT ON Reviews
FOR EACH ROW
BEGIN
    DECLARE avg_rating FLOAT(2,1);
    SELECT AVG(rating) INTO avg_rating
    FROM Reviews
    WHERE fragrance_id = NEW.fragrance_id;
    UPDATE Fragrances
    SET rating = IFNULL(avg_rating, 0)
    WHERE id = NEW.fragrance_id;
END;
//
DELIMITER ;

DELIMITER //
CREATE TRIGGER after_review_delete
AFTER DELETE ON Reviews
FOR EACH ROW
BEGIN
    DECLARE avg_rating FLOAT(2,1);
    SELECT AVG(rating) INTO avg_rating
    FROM Reviews
    WHERE fragrance_id = OLD.fragrance_id;
    UPDATE Fragrances
    SET rating = IFNULL(avg_rating, 0)
    WHERE id = OLD.fragrance_id;
END;
//
DELIMITER ;

DROP PROCEDURE ProcessOrder
DELIMITER //
CREATE PROCEDURE ProcessOrder(IN UserId INT)
BEGIN
    DECLARE total_price FLOAT(8, 2);

    SELECT SUM(c.quantity * f.price) INTO total_price
    FROM Cart c
    JOIN Fragrances f ON c.fragrance_id = f.id;

    SELECT total_price AS CalculatedTotalPrice;

    INSERT INTO OrdersDetails (fragrance_id, customer_id, price, totalPrice)
    SELECT 
        c.fragrance_id, 
        UserId, 
        (c.quantity * f.price) AS price, 
        ((c.quantity * f.price) * (1 - (f.discountPercentage / 100))) AS totalPrice
    FROM Cart c
    JOIN Fragrances f ON c.fragrance_id = f.id;

    UPDATE Fragrances f
    JOIN (
        SELECT fragrance_id, SUM(quantity) AS total_quantity
        FROM Cart
        GROUP BY fragrance_id
    ) AS cart_summary ON f.id = cart_summary.fragrance_id
    SET f.stock = f.stock - cart_summary.total_quantity;

    DELETE FROM Cart;

    UPDATE Customers 
    SET numberOfOrders = numberOfOrders + 1 
    WHERE id = UserId;

    SELECT 'Order processed successfully' AS Message;
END;
//
DELIMITER ;
SELECT * FROM Cart;
SELECT * FROM Customers;
SELECT * FROM Fragrances;
SELECT * FROM Brands;
SELECT * FROM Reviews;
SELECT * FROM OrdersDetails;

SELECT * From ordersdetails;








