
-- DATABASE - PORTFOLIO MANAGEMENT
CREATE DATABASE IF NOT EXISTS PORTFOLIO_MANAGEMENT;


-- ACTIVATE DATABASE
USE PORTFOLIO_MANAGEMENT;


-- TABLE STRUCTURES
CREATE TABLE IF NOT EXISTS users (
  user_id INT AUTO_INCREMENT PRIMARY KEY, 
  username VARCHAR(50) NOT NULL, 
  email VARCHAR(100) NOT NULL, 
  password_hash VARCHAR(100) NOT NULL, 
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, 
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);


CREATE TABLE IF NOT EXISTS assets (
  asset_id INT AUTO_INCREMENT PRIMARY KEY, 
  user_id INT, 
  asset_name VARCHAR(100) NOT NULL, 
  asset_type VARCHAR(50) NOT NULL, 
  current_price DECIMAL(10, 2) NOT NULL, 
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, 
  foreign key (user_id) references users(user_id), 
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);


CREATE TABLE IF NOT EXISTS portfolio_holdings (
  portfolio_id INT auto_increment primary key, 
  asset_id INT NOT NULL, 
  user_id INT, 
  quantity DECIMAL(10) NOT NULL, 
  acquisition_date DATE NOT NULL, 
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, 
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, 
  foreign key (asset_id) references assets(asset_id), 
  foreign key (user_id) references users(user_id)
);


CREATE TABLE IF NOT EXISTS transactions (
  transaction_id INT AUTO_INCREMENT PRIMARY KEY, 
  portfolio_id INT NOT NULL, 
  asset_id INT NOT NULL, 
  user_id INT, 
  transaction_type VARCHAR(50) NOT NULL, 
  transaction_date DATE NOT NULL, 
  quantity DECIMAL(10, 2) NOT NULL, 
  price_per_unit DECIMAL(10, 2) NOT NULL, 
  total_amount DECIMAL(10, 2) NOT NULL, 
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, 
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, 
  foreign key (portfolio_id) references portfolio_holdings(portfolio_id), 
  foreign key (asset_id) references assets(asset_id), 
  foreign key (user_id) references users(user_id)
);


CREATE TABLE IF NOT EXISTS performance_history (
  performance_id INT AUTO_INCREMENT PRIMARY KEY, 
  portfolio_id INT NOT NULL, 
  asset_id INT NOT NULL, 
  user_id INT, 
  date DATE NOT NULL, 
  value DECIMAL(10, 2) NOT NULL, 
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, 
  foreign key (portfolio_id) references portfolio_holdings(portfolio_id), 
  foreign key (asset_id) references assets(asset_id), 
  foreign key (user_id) references users(user_id)
);

-- ----------------------------------------------------------------------------------------------------------------------------------------------------
-- SHOW TABLE COMMAND
SHOW TABLES;
-- ----------------------------------------------------------------------------------------------------------------------------------------------------

-- DESCRIBE TABLE COMMAND
DESCRIBE users;
DESCRIBE assets;
DESCRIBE portfolio_holdings;
DESCRIBE transactions;
DESCRIBE performance_history;
-- ----------------------------------------------------------------------------------------------------------------------------------------------------


-- SHOW ALL DATA IN ALL TABLE
select * FROM USERS;
  
  
select * FROM assets;
  
select * FROM portfolio_holdings;
  
select * FROM transactions;
  
select * FROM performance_history;
  
  
-- ----------------------------------------------------------------------------------------------------------------------------------------------------
-- ALTER TABLE COMMANDS
ALTER TABLE 
  users 
ADD 
  COLUMN phone_number varchar(20);
  
-- ----------------------------------------------------------------------------------------------------------------------------------------------------
-- INSERTING DATA COMMAND
INSERT INTO users (
  username, email, password_hash, phone_number
) 
VALUES 
  (
    'RajeshKumar', 'rajeshkumar@example.com', 
    'Password123', '+91 98765 43210'
  ), 
  (
    'PriyaSharma', 'priyasharma@example.com', 
    'SecurePass', '+91 98765 43211'
  ), 
  (
    'AmitPatel', 'amitpatel@example.com', 
    'P@ssw0rd', '+91 98765 43212'
  ), 
  (
    'NehaVerma', 'nehaverma@example.com', 
    'Secret123', '+91 98765 43213'
  ), 
  (
    'ArunSingh', 'arunsingh@example.com', 
    'Pa$$word', '+91 98765 43214'
  ), 
  (
    'PoojaGupta', 'poojagupta@example.com', 
    'S3cur3Pass', '+91 98765 43215'
  ), 
  (
    'RakeshYadav', 'rakeshyadav@example.com', 
    'Passw0rd!', '+91 98765 43216'
  ), 
  (
    'AnitaSrivastava', 'anitasrivastava@example.com', 
    'Olivia123', '+91 98765 43217'
  ), 
  (
    'SanjayTrivedi', 'sanjaytrivedi@example.com', 
    'AndersonPass', '+91 98765 43218'
  ), 
  (
    'SnehaJaiswal', 'snehajaiswal@example.com', 
    'Taylor@123', '+91 98765 43219'
  ), 
  (
    'VikramChoudhury', 'vikramchoudhury@example.com', 
    'MoorePass1', '+91 98765 43220'
  ), 
  (
    'DeepikaShukla', 'deepikashukla@example.com', 
    'EmmaPass456', '+91 98765 43221'
  ), 
  (
    'RajeevSharma', 'rajeevsharma@example.com', 
    'LiamSecure', '+91 98765 43222'
  ), 
  (
    'PallaviNair', 'pallavinair@example.com', 
    'Ava123!', '+91 98765 43223'
  ), 
  (
    'AnilIyer', 'aniliyer@example.com', 
    'W1ll!@mPass', '+91 98765 43224'
  ), 
  (
    'MeeraMenon', 'meeramenon@example.com', 
    'MiaPa$$w0rd', '+91 98765 43225'
  ), 
  (
    'KarthikNarayan', 'karthiknarayan@example.com', 
    'Benjamin789', '+91 98765 43226'
  ), 
  (
    'RashmiJoshi', 'rashmijoshi@example.com', 
    'C@rl0ttePass', '+91 98765 43227'
  ), 
  (
    'GirishMishra', 'girishmishra@example.com', 
    'D@n13lSecure', '+91 98765 43228'
  ), 
  (
    'AnjaliChopra', 'anjalichopra@example.com', 
    'Sca$$lettPass', '+91 98765 43229'
  ), 
  (
    'SureshReddy', 'sureshreddy@example.com', 
    'AlexPa$$w0rd', '+91 98765 43230'
  ), 
  (
    'MalaKrishnan', 'malakrishnan@example.com', 
    'GraceSecure', '+91 98765 43231'
  ), 
  (
    'KrishnaGowda', 'krishnagowda@example.com', 
    'Matt12345', '+91 98765 43232'
  ), 
  (
    'NandiniShetty', 'nandinishetty@example.com', 
    'L!lySmith', '+91 98765 43233'
  ), 
  (
    'RajeshKumar', 'rajeshkumar@example.com', 
    'L@c@sSecure', '+91 98765 43234'
  ), 
  (
    'ArunaRao', 'arunarao@example.com', 
    'AriaPa$$word', '+91 98765 43235'
  ), 
  (
    'KishoreMukherjee', 'kishoremukherjee@example.com', 
    'H3nrySecure', '+91 98765 43236'
  ), 
  (
    'ManishaShah', 'manishashah@example.com', 
    'EllaSecure123', '+91 98765 43237'
  ), 
  (
    'AlokSaxena', 'aloksaxena@example.com', 
    'SamSecure456', '+91 98765 43238'
  ), 
  (
    'PriyankaBose', 'priyankabose@example.com', 
    'AveryPa$$word', '+91 98765 43239'
  ), 
  (
    'AnkurVerma', 'ankurverma@example.com', 
    'Joseph123', '+91 98765 43240'
  ), 
  (
    'SwatiRaj', 'swatiraj@example.com', 
    'S0fiaPass!', '+91 98765 43241'
  ), 
  (
    'RajatKapoor', 'rajatkapoor@example.com', 
    'OwenSecure', '+91 98765 43242'
  ), 
  (
    'NishaChopra', 'nishachopra@example.com', 
    'Abby12345', '+91 98765 43243'
  ), 
  (
    'AmitDube', 'amitdube@example.com', 
    'EthanSecure', '+91 98765 43244'
  ), 
  (
    'AnanyaGupta', 'ananyagupta@example.com', 
    'EvelynPa$$w0rd', '+91 98765 43245'
  ), 
  (
    'VishalRai', 'vishalrai@example.com', 
    'ChrisPass1', '+91 98765 43246'
  ), 
  (
    'RinaSinha', 'rinasinha@example.com', 
    'AmeliaSecure', '+91 98765 43247'
  ), 
  (
    'ArjunPandey', 'arjunpandey@example.com', 
    'Isabella123', '+91 98765 43248'
  ), 
  (
    'SaritaMalik', 'saritamalik@example.com', 
    'Will123!', '+91 98765 43249'
  ), 
  (
    'DeepakSharma', 'deepaksharma@example.com', 
    'VictoriaSecure', '+91 98765 43250'
  ), 
  (
    'KavitaSingh', 'kavitasingh@example.com', 
    'JamesPa$$w0rd', '+91 98765 43251'
  ), 
  (
    'SunilChawla', 'sunilchawla@example.com', 
    'PenelopeSecure', '+91 98765 43252'
  ), 
  (
    'RajeshMehta', 'rajeshmehta@example.com', 
    'Sebastian12345', '+91 98765 43253'
  ), 
  (
    'SarikaSharma', 'sarikasharma@example.com', 
    'ScarlettPa$$word', '+91 98765 43254'
  ), 
  (
    'ManojGupta', 'manojgupta@example.com', 
    'MasonSecure', '+91 98765 43255'
  ), 
  (
    'AnjaliKumar', 'anjalikumar@example.com', 
    'EleanorSecure', '+91 98765 43256'
  ), 
  (
    'AshokShah', 'ashokshah@example.com', 
    'AidenPa$$w0rd', '+91 98765 43257'
  ), 
  (
    'KavitaRai', 'kavitarai@example.com', 
    'Chloe123!', '+91 98765 43258'
  ), 
  (
    'VijayChoudhury', 'vijaychoudhury@example.com', 
    'LucasSecure123', '+91 98765 43259'
  ), 
  (
    'SumanGupta', 'sumangupta@example.com', 
    'ZoePa$$w0rd', '+91 98765 43260'
  ), 
  (
    'RahulSrivastava', 'rahulsrivastava@example.com', 
    'DanielSecure', '+91 98765 43261'
  ), 
  (
    'RadhaSharma', 'radhasharma@example.com', 
    'Grace12345', '+91 98765 43262'
  ), 
  (
    'RohitChopra', 'rohitchopra@example.com', 
    'ElijahPa$$word', '+91 98765 43263'
  ), 
  (
    'AnjuVerma', 'anjuverma@example.com', 
    'LunaSecure', '+91 98765 43264'
  ), 
  (
    'NitinYadav', 'nitinyadav@example.com', 
    'LiamSecure', '+91 98765 43265'
  ), 
  (
    'RaniMishra', 'ranimishra@example.com', 
    'Hannah123', '+91 98765 43266'
  ), 
  (
    'RajatGupta', 'rajatgupta@example.com', 
    'OliverSecure', '+91 98765 43267'
  ), 
  (
    'NehaThakur', 'nehathakur@example.com', 
    'MilaPa$$word', '+91 98765 43268'
  ), 
  (
    'ShashiKapoor', 'shashikapoor@example.com', 
    'JackSecure', '+91 98765 43269'
  ), 
  (
    'PoonamRathore', 'poonamrathore@example.com', 
    'Aurora12345', '+91 98765 43270'
  ), 
  (
    'VarunMishra', 'varunmishra@example.com', 
    'LoganPa$$w0rd', '+91 98765 43271'
  ), 
  (
    'NandiniGupta', 'nandinigupta@example.com', 
    'NovaSecure', '+91 98765 43272'
  ), 
  (
    'AnilRajput', 'anilrajput@example.com', 
    'WilliamSecure', '+91 98765 43273'
  ), 
  (
    'SnehaMehta', 'snehamehta@example.com', 
    'EllaSecure123', '+91 98765 43274'
  ), 
  (
    'DeepakKumar', 'deepakkumar@example.com', 
    'Leo123!', '+91 98765 43275'
  ), 
  (
    'KavitaYadav', 'kavitayadav@example.com', 
    'HazelSecure', '+91 98765 43276'
  ), 
  (
    'AmitDubey', 'amitdubey@example.com', 
    'LiamPa$$word', '+91 98765 43277'
  ), 
  (
    'RashmiSharma', 'rashmisharma@example.com', 
    'PenelopeSecure', '+91 98765 43278'
  ), 
  (
    'VinodKumar', 'vinodkumar@example.com', 
    'Lucas12345', '+91 98765 43279'
  ), 
  (
    'SoniaVerma', 'soniaverma@example.com', 
    'SophiaPa$$word', '+91 98765 43280'
  ), 
  (
    'AnilSaxena', 'anilsaxena@example.com', 
    'OliverSecure', '+91 98765 43281'
  ), 
  (
    'NishaBose', 'nishabose@example.com', 
    'AmeliaSecure123', '+91 98765 43282'
  ), 
  (
    'RajeevPandey', 'rajeevpandey@example.com', 
    'EthanPa$$w0rd', '+91 98765 43283'
  ), 
  (
    'AlokSharma', 'aloksharma@example.com', 
    'AvaSecure', '+91 98765 43284'
  ), 
  (
    'RahulKapoor', 'rahulkapoor@example.com', 
    'Mason123!', '+91 98765 43285'
  ), 
  (
    'MeenakshiNair', 'meenakshinair@example.com', 
    'HarperSecure', '+91 98765 43286'
  ), 
  (
    'VikasJoshi', 'vikasjoshi@example.com', 
    'BenjaminSecure', '+91 98765 43287'
  ), 
  (
    'PreetiNair', 'preetinair@example.com', 
    'LunaPa$$w0rd', '+91 98765 43288'
  ), 
  (
    'AmitKumar', 'amitkumar@example.com', 
    'Elijah12345', '+91 98765 43289'
  ), 
  (
    'RadhikaSrivastava', 'radhikasrivastava@example.com', 
    'ScarlettPa$$word', '+91 98765 43290'
  ), 
  (
    'AlokDubey', 'alokdubey@example.com', 
    'LiamSecure', '+91 98765 43291'
  ), 
  (
    'SaritaMishra', 'saritamishra@example.com', 
    'ZoeSecure', '+91 98765 43292'
  ), 
  (
    'RohitThakur', 'rohitthakur@example.com', 
    'WilliamPa$$word', '+91 98765 43293'
  ), 
  (
    'SavitaRaj', 'savitaraj@example.com', 
    'AriaSecure', '+91 98765 43294'
  ), 
  (
    'VivekDubey', 'vivekdubey@example.com', 
    'Noah123', '+91 98765 43295'
  ), 
  (
    'NandiniVerma', 'nandiniverma@example.com', 
    'MilaSecure', '+91 98765 43296'
  ), 
  (
    'ManojSharma', 'manojsharma@example.com', 
    'James12345', '+91 98765 43297'
  ), 
  (
    'RuchiVerma', 'ruchiverma@example.com', 
    'EmmaPa$$word', '+91 98765 43298'
  ), 
  (
    'KamalSharma', 'kamalsharma@example.com', 
    'EthanSecure123', '+91 98765 43299'
  ), 
  (
    'PriyankaChopra', 'priyankachopra@example.com', 
    'OliviaPa$$w0rd', '+91 98765 43300'
  );
INSERT INTO assets (
  asset_id, user_id, asset_name, asset_type, 
  current_price
) 
VALUES 
  (
    1001, 1, 'Apple Inc.', 'Stocks', 150.50
  );
INSERT INTO assets (
  user_id, asset_name, asset_type, current_price
) 
VALUES 
  (
    2, 'US Treasury Bond 10Y', 'Bonds', 
    1250.75
  ), 
  (
    3, 'Luxury Condo NYC', 'Real Estate', 
    750000.25
  ), 
  (
    4, 'Vanguard 500 Index Fund', 'Mutual Fund', 
    300.00
  ), 
  (5, 'Bitcoin', 'Crypto', 60000.00), 
  (
    6, 'Microsoft Corporation', 'Stocks', 
    300.25
  ), 
  (
    7, 'US Treasury Bond 30Y', 'Bonds', 
    1600.50
  ), 
  (
    8, 'Beachfront Property Miami', 'Real Estate', 
    1250000.75
  ), 
  (
    9, 'Fidelity Contrafund', 'Mutual Fund', 
    450.25
  ), 
  (10, 'Ethereum', 'Crypto', 4000.00), 
  (
    11, ',Amazon.com Inc.', 'Stocks', 
    3500.25
  ), 
  (
    12, 'Municipal Bond Fund', 'Bonds', 
    800.75
  ), 
  (
    13, 'Suburban Home Chicago', 'Real Estate', 
    400000.00
  ), 
  (
    14, 'T. Rowe Price Equity Income Fund', 
    'Mutual Fund', 150.75
  ), 
  (15, 'Cardano', 'Crypto', 2.25), 
  (
    16, 'Google Alphabet Inc.', 'Stocks', 
    2750.75
  ), 
  (
    17, 'Corporate Bond Fund', 'Bonds', 
    900.00
  ), 
  (
    18, 'Downtown Loft Los Angeles', 
    'Real Estate', 900000.25
  ), 
  (
    20, 'Vanguard Total Stock Market Index Fund', 
    'Mutual Fund', 375.25
  ), 
  (21, 'Solana', 'Crypto', 150.00), 
  (
    22, 'Tesla Inc.', 'Stocks', 700.50
  ), 
  (
    23, 'US Municipal Bond Index Fund', 
    'Bonds', 1100.25
  ), 
  (
    24, 'Countryside Cottage England', 
    'Real Estate', 600000.75
  ), 
  (
    25, 'Fidelity Growth Company Fund', 
    'Mutual Fund', 280.25
  ), 
  (
    26, 'Ripple (XRP)', 'Crypto', 1.50
  ), 
  (
    27, 'Facebook Meta Platforms Inc.', 
    'Stocks', 325.50
  ), 
  (
    28, 'US Corporate Bond Index Fund', 
    'Bonds', 975.25
  ), 
  (
    29, 'Beach House Malibu', 'Real Estate', 
    2500000.00
  ), 
  (
    30, 'Vanguard Total Bond Market Index Fund', 
    'Mutual Fund', 130.50
  ), 
  (
    31, 'Polkadot (DOT)', 'Crypto', 35.00
  ), 
  (
    32, 'NVIDIA Corporation', 'Stocks', 
    225.50
  ), 
  (
    33, 'US Government Bond Index Fund', 
    'Bonds', 850.25
  ), 
  (
    34, 'Penthouse Manhattan NYC', 'Real Estate', 
    1850000.75
  ), 
  (
    35, 'American Funds Growth Fund of America', 
    'Mutual Fund', 250.25
  ), 
  (
    36, 'Litecoin (LTC)', 'Crypto', 150.00
  ), 
  (
    37, 'Walmart Inc.', 'Stocks', 140.75
  ), 
  (
    38, 'High-Yield Bond Fund', 'Bonds', 
    950.00
  ), 
  (
    39, 'Lakefront Property ,Tahoe', 
    'Real Estate', 1800000.25
  ), 
  (
    40, 'T. Rowe Price Blue Chip Growth Fund', 
    'Mutual Fund', 280.00
  ), 
  (
    41, 'Chainlink (LINK)', 'Crypto', 
    30.25
  ), 
  (42, 'Visa Inc.', 'Stocks', 190.25), 
  (
    43, 'International Bond Fund', 'Bonds', 
    1100.50
  ), 
  (
    44, 'City Apartment Paris', 'Real Estate', 
    1200000.25
  ), 
  (
    45, 'Fidelity Contrafund', 'Mutual Fund', 
    450.25
  ), 
  (
    46, 'Stellar (XLM)', 'Crypto', 0.40
  ), 
  (
    47, 'Johnson & Johnson', 'Stocks', 
    175.50
  ), 
  (
    48, 'Municipal Bond Fund', 'Bonds', 
    850.75
  ), 
  (
    49, 'Beachfront Property Hawaii', 
    'Real Estate', 2200000.00
  ), 
  (
    50, 'Vanguard Total Stock Market Index Fund', 
    'Mutual Fund', 375.25
  ), 
  (51, 'Cardano', 'Crypto', 2.25), 
  (
    52, 'Procter & Gamble', 'Stocks', 
    150.75
  ), 
  (
    53, 'US Municipal Bond Index Fund', 
    'Bonds', 900.00
  ), 
  (
    54, 'Mountain Chalet Switzerland', 
    'Real Estate', 1600000.75
  ), 
  (
    55, 'Fidelity Growth Company Fund', 
    'Mutual Fund', 280.25
  ), 
  (
    56, 'Ripple (XRP)', 'Crypto', 1.50
  ), 
  (
    57, 'Alphabet Inc. Class A', 'Stocks', 
    2650.75
  ), 
  (
    58, 'US Corporate Bond Index Fund', 
    'Bonds', 1050.25
  ), 
  (
    59, 'Beach House Malibu', 'Real Estate', 
    2500000.00
  ), 
  (
    60, 'Vanguard Total Bond Market Index Fund', 
    'Mutual Fund', 130.50
  ), 
  (
    61, 'Polkadot (DOT)', 'Crypto', 35.00
  ), 
  (
    62, 'Microsoft Corporation', 'Stocks', 
    300.50
  ), 
  (
    63, 'US Treasury Bond 30Y', 'Bonds', 
    1600.25
  ), 
  (
    64, 'Downtown Loft New York City', 
    'Real Estate', 2000000.75
  ), 
  (
    65, 'Fidelity Contrafund', 'Mutual Fund', 
    450.25
  ), 
  (66, 'Ethereum', 'Crypto', 4000.00), 
  (
    67, 'Amazon.com Inc.', 'Stocks', 3500.25
  ), 
  (
    68, 'Corporate Bond Fund', 'Bonds', 
    800.75
  ), 
  (
    69, 'Vineyard Estate Napa Valley', 
    'Real Estate', 2800000.00
  ), 
  (
    70, 'T. Rowe Price Equity Income Fund', 
    'Mutual Fund', 150.75
  ), 
  (71, 'Bitcoin', 'Crypto', 60000.00), 
  (
    72, 'Apple Inc.', 'Stocks', 150.50
  ), 
  (
    72, 'US Treasury Bond 10Y', 'Bonds', 
    1250.75
  ), 
  (
    73, 'Luxury Condo NYC', 'Real Estate', 
    750000.25
  ), 
  (
    74, 'Vanguard 500 Index Fund', 'Mutual Fund', 
    300.00
  ), 
  (
    75, 'Tesla Inc.', 'Crypto', 700.50
  ), 
  (
    76, 'Google Alphabet Inc.', 'Stocks', 
    2750.75
  ), 
  (
    77, 'US Treasury Bond 30Y', 'Bonds', 
    1600.50
  ), 
  (
    78, 'Beachfront Property Miami', 
    'Real Estate', 1250000.75
  ), 
  (
    79, 'Fidelity Contrafund', 'Mutual Fund', 
    450.25
  ), 
  (
    80, 'Ripple (XRP)', 'Crypto', 1.50
  ), 
  (
    81, 'Facebook Meta Platforms Inc.', 
    'Stocks', 325.50
  ), 
  (
    82, 'US Corporate Bond Index Fund', 
    'Bonds', 975.25
  ), 
  (
    83, 'Countryside Cottage England', 
    'Real Estate', 600000.75
  ), 
  (
    84, 'Fidelity Growth Company Fund', 
    'Mutual Fund', 280.25
  ), 
  (
    85, 'Polkadot (DOT)', 'Crypto', 35.00
  ), 
  (
    86, 'NVIDIA Corporation', 'Stocks', 
    225.50
  ), 
  (
    87, 'US Government Bond Index Fund', 
    'Bonds', 850.25
  ), 
  (
    88, 'Penthouse Manhattan NYC', 'Real Estate', 
    1850000.75
  ), 
  (
    89, 'American Funds Growth Fund of America', 
    'Mutual Fund', 250.25
  ), 
  (
    90, 'Litecoin (LTC)', 'Crypto', 150.00
  ), 
  (
    91, 'Walmart Inc.', 'Stocks', 140.75
  );
  
  
  
INSERT INTO portfolio_holdings (
  portfolio_id, asset_id, user_id, quantity, 
  acquisition_date
) 
VALUES 
  (101, 1001, 1, 100, '2023-01-01');
  
  
INSERT INTO portfolio_holdings (
  portfolio_id, asset_id, user_id, quantity, 
  acquisition_date
) 
VALUES 
  (102, 1002, 2, 20, '2023-01-01'), 
  (103, 1003, 3, 45, '2023-01-01'), 
  (104, 1004, 4, 60, '2023-01-01'), 
  (105, 1005, 5, 75, '2023-01-01'), 
  (106, 1006, 6, 80, '2023-01-01'), 
  (107, 1007, 7, 120, '2023-01-01'), 
  (108, 1008, 8, 10, '2023-01-01'), 
  (109, 1009, 9, 2, '2023-01-01'), 
  (110, 1010, 10, 8, '2023-01-01'), 
  (111, 1011, 11, 40, '2023-01-01'), 
  (112, 1012, 12, 85, '2023-01-01'), 
  (113, 1013, 13, 65, '2023-01-01'), 
  (114, 1014, 14, 52, '2023-01-01'), 
  (115, 1015, 15, 14, '2023-01-01'), 
  (116, 1016, 16, 20, '2023-01-01'), 
  (117, 1017, 17, 86, '2023-01-01'), 
  (118, 1018, 18, 92, '2023-01-01'), 
  (119, 1019, 19, 71, '2023-01-01'), 
  (120, 1020, 20, 3, '2023-01-01'), 
  (121, 1021, 21, 47, '2023-01-01'), 
  (122, 1022, 22, 18, '2023-01-01'), 
  (123, 1023, 23, 12, '2023-01-01'), 
  (124, 1024, 24, 55, '2023-01-01'), 
  (125, 1025, 25, 28, '2023-01-01'), 
  (126, 1026, 26, 38, '2023-01-01'), 
  (127, 1027, 27, 61, '2023-01-01'), 
  (128, 1028, 28, 7, '2023-01-01'), 
  (129, 1029, 29, 99, '2023-01-01'), 
  (130, 1030, 30, 42, '2023-01-01'), 
  (131, 1031, 31, 32, '2023-01-01'), 
  (132, 1032, 32, 93, '2023-01-01'), 
  (133, 1033, 33, 69, '2023-01-01'), 
  (134, 1034, 34, 11, '2023-01-01'), 
  (135, 1035, 35, 27, '2023-01-01'), 
  (136, 1036, 36, 78, '2023-01-01'), 
  (137, 1037, 37, 46, '2023-01-01'), 
  (138, 1038, 38, 79, '2023-01-01'), 
  (139, 1039, 39, 65, '2023-01-01'), 
  (140, 1040, 40, 50, '2023-01-01'), 
  (141, 1041, 41, 91, '2023-01-01'), 
  (142, 1042, 42, 88, '2023-01-01'), 
  (143, 1043, 43, 37, '2023-01-01'), 
  (144, 1044, 44, 20, '2023-01-01'), 
  (145, 1045, 45, 29, '2023-01-01'), 
  (146, 1046, 46, 80, '2023-01-01'), 
  (147, 1047, 47, 10, '2023-01-01'), 
  (148, 1048, 48, 15, '2023-01-01'), 
  (149, 1049, 49, 84, '2023-01-01'), 
  (150, 1050, 50, 64, '2023-01-01'), 
  (151, 1051, 51, 1, '2023-01-01'), 
  (152, 1052, 52, 14, '2023-01-01'), 
  (153, 1053, 53, 45, '2023-01-01'), 
  (154, 1054, 54, 6, '2023-01-01'), 
  (155, 1055, 55, 24, '2023-01-01'), 
  (156, 1056, 56, 74, '2023-01-01'), 
  (157, 1057, 57, 68, '2023-01-01'), 
  (158, 1058, 58, 4, '2023-01-01'), 
  (159, 1059, 59, 66, '2023-01-01'), 
  (160, 1060, 60, 59, '2023-01-01'), 
  (161, 1061, 61, 81, '2023-01-01'), 
  (162, 1062, 62, 8, '2023-01-01'), 
  (163, 1063, 63, 51, '2023-01-01'), 
  (164, 1064, 64, 30, '2023-01-01'), 
  (165, 1065, 65, 49, '2023-01-01'), 
  (166, 1066, 66, 73, '2023-01-01'), 
  (167, 1067, 67, 43, '2023-01-01'), 
  (168, 1068, 68, 36, '2023-01-01'), 
  (169, 1069, 69, 16, '2023-01-01'), 
  (170, 1070, 70, 31, '2023-01-01'), 
  (171, 1071, 71, 53, '2023-01-01'), 
  (172, 1072, 72, 19, '2023-01-01'), 
  (173, 1073, 73, 63, '2023-01-01'), 
  (174, 1074, 74, 9, '2023-01-01'), 
  (175, 1075, 75, 72, '2023-01-01'), 
  (176, 1076, 76, 2, '2023-01-01'), 
  (177, 1077, 77, 35, '2023-01-01'), 
  (178, 1078, 78, 70, '2023-01-01'), 
  (179, 1079, 79, 58, '2023-01-01'), 
  (180, 1080, 80, 5, '2023-01-01'), 
  (181, 1081, 81, 40, '2023-01-01'), 
  (182, 1082, 82, 75, '2023-01-01'), 
  (183, 1083, 83, 34, '2023-01-01'), 
  (184, 1084, 84, 77, '2023-01-01'), 
  (185, 1085, 85, 52, '2023-01-01'), 
  (186, 1086, 86, 33, '2023-01-01'), 
  (187, 1087, 87, 67, '2023-01-01'), 
  (188, 1088, 88, 23, '2023-01-01'), 
  (189, 1089, 89, 95, '2023-01-01'), 
  (190, 1090, 90, 85, '2023-01-01'), 
  (191, 1091, 91, 39, '2023-01-01');


select * from transactions;


INSERT INTO transactions (
  transaction_id, user_id, portfolio_id, 
  asset_id, transaction_type, transaction_date, 
  quantity, price_per_unit, total_amount
) 
VALUES 
  (
    2101, 1, 101, 1001, 'BUY', '2023-10-01', 
    10.00, 150.20, 1505.00
  );
  
  
INSERT INTO transactions (
  transaction_id, user_id, portfolio_id, 
  asset_id, transaction_type, transaction_date, 
  quantity, price_per_unit, total_amount
) 
VALUES 
  (
    2102, 2, '102', 1002, 'BUY', '2023-10-02', 
    8.00, 148.50, 1188.00
  ), 
  (
    2103, 3, '103', 1003, 'SELL', '2023-10-03', 
    5.00, 152.75, 763.75
  ), 
  (
    2104, 4, '104', 1004, 'BUY', '2023-10-04', 
    12.00, 155.00, 1860.00
  ), 
  (
    2105, 5, '105', 1005, 'SELL', '2023-10-05', 
    9.00, 149.25, 1343.25
  ), 
  (
    2106, 6, '106', 1006, 'BUY', '2023-10-06', 
    7.00, 153.50, 1074.50
  ), 
  (
    2107, 7, '107', 1007, 'SELL', '2023-10-07', 
    11.00, 157.00, 1727.00
  ), 
  (
    2108, 8, '108', 1008, 'BUY', '2023-10-08', 
    6.00, 151.75, 910.50
  ), 
  (
    2109, 9, '109', 1009, 'SELL', '2023-10-09', 
    10.00, 148.20, 1482.00
  ), 
  (
    2110, 10, '110', 1010, 'BUY', '2023-10-10', 
    8.00, 156.00, 1248.00
  ), 
  (
    2111, 11, '111', 1011, 'SELL', '2023-10-11', 
    4.00, 150.30, 601.20
  ), 
  (
    2112, 12, '112', 1012, 'BUY', '2023-10-12', 
    15.00, 158.50, 2377.50
  ), 
  (
    2113, 13, '113', 1013, 'SELL', '2023-10-13', 
    6.00, 151.60, 909.60
  ), 
  (
    2114, 14, '114', 1014, 'BUY', '2023-10-14', 
    9.00, 154.75, 1392.75
  ), 
  (
    2115, 15, '115', 1015, 'SELL', '2023-10-15', 
    7.00, 150.20, 1051.40
  ), 
  (
    2116, 16, '116', 1016, 'BUY', '2023-10-16', 
    10.00, 156.80, 1568.00
  ), 
  (
    2117, 17, '117', 1017, 'SELL', '2023-10-17', 
    12.00, 149.50, 1794.00
  ), 
  (
    2118, 18, '118', 1018, 'BUY', '2023-10-18', 
    8.00, 153.25, 1226.00
  ), 
  (
    2119, 19, '119', 1019, 'SELL', '2023-10-19', 
    11.00, 157.90, 1736.90
  ), 
  (
    2120, 20, '120', 1020, 'BUY', '2023-10-20', 
    6.00, 150.75, 904.50
  ), 
  (
    2121, 21, '121', 1021, 'SELL', '2023-10-21', 
    13.00, 155.25, 2018.25
  ), 
  (
    2122, 22, '122', 1022, 'BUY', '2023-10-22', 
    7.00, 152.60, 1068.20
  ), 
  (
    2123, 23, '123', 1023, 'SELL', '2023-10-23', 
    10.00, 150.90, 1509.00
  ), 
  (
    2124, 24, '124', 1024, 'BUY', '2023-10-24', 
    9.00, 157.40, 1416.60
  ), 
  (
    2125, 25, '125', 1025, 'SELL', '2023-10-25', 
    5.00, 152.00, 760.00
  ), 
  (
    2126, 26, '126', 1026, 'BUY', '2023-10-26', 
    11.00, 154.60, 1700.60
  ), 
  (
    2127, 27, '127', 1027, 'SELL', '2023-10-27', 
    7.00, 151.30, 1059.10
  ), 
  (
    2128, 28, '128', 1028, 'BUY', '2023-10-28', 
    8.00, 157.20, 1257.60
  ), 
  (
    2129, 29, '129', 1029, 'SELL', '2023-10-29', 
    6.00, 153.00, 918.00
  ), 
  (
    2130, 30, '130', 1030, 'BUY', '2023-10-30', 
    12.00, 149.80, 1797.60
  ), 
  (
    2131, 31, '131', 1031, 'SELL', '2023-10-31', 
    9.00, 152.40, 1371.60
  ), 
  (
    2132, 32, '132', 1032, 'BUY', '2023-11-01', 
    10.00, 157.80, 1578.00
  ), 
  (
    2133, 33, '133', 1033, 'SELL', '2023-11-02', 
    7.00, 150.60, 1054.20
  ), 
  (
    2134, 34, '134', 1034, 'BUY', '2023-11-03', 
    6.00, 152.90, 917.40
  ), 
  (
    2135, 35, '135', 1035, 'SELL', '2023-11-04', 
    11.00, 155.10, 1706.10
  ), 
  (
    2136, 36, '136', 1036, 'BUY', '2023-11-05', 
    8.00, 150.40, 1203.20
  ), 
  (
    2137, 37, '137', 1037, 'SELL', '2023-11-06', 
    12.00, 153.70, 1844.40
  ), 
  (
    2138, 38, '138', 1038, 'BUY', '2023-11-07', 
    9.00, 157.00, 1413.00
  ), 
  (
    2139, 39, '139', 1039, 'SELL', '2023-11-08', 
    7.00, 151.90, 1063.30
  ), 
  (
    2140, 40, '140', 1040, 'BUY', '2023-11-09', 
    10.00, 154.30, 1543.00
  ), 
  (
    2141, 41, '141', 1041, 'SELL', '2023-11-10', 
    6.00, 150.10, 900.60
  ), 
  (
    2142, 42, '142', 1042, 'BUY', '2023-11-11', 
    11.00, 157.60, 1733.60
  ), 
  (
    2143, 43, '143', 1043, 'SELL', '2023-11-12', 
    8.00, 152.80, 1222.40
  ), 
  (
    2144, 44, '144', 1044, 'BUY', '2023-11-13', 
    7.00, 151.40, 1060.80
  ), 
  (
    2145, 45, '145', 1045, 'SELL', '2023-11-14', 
    10.00, 155.80, 1558.00
  ), 
  (
    2146, 46, '146', 1046, 'BUY', '2023-11-15', 
    9.00, 150.70, 1356.30
  ), 
  (
    2147, 47, '147', 1047, 'SELL', '2023-11-16', 
    6.00, 152.20, 913.20
  ), 
  (
    2148, 48, '148', 1048, 'BUY', '2023-11-17', 
    12.00, 157.30, 1887.60
  ), 
  (
    2149, 49, '149', 1049, 'SELL', '2023-11-18', 
    8.00, 151.50, 1212.00
  ), 
  (
    2150, 50, '150', 1050, 'BUY', '2023-11-19', 
    7.00, 150.00, 1050.00
  ), 
  (
    2151, 51, '151', 1051, 'SELL', '2023-11-20', 
    10.00, 155.50, 1555.00
  ), 
  (
    2152, 52, '152', 1052, 'BUY', '2023-11-21', 
    9.00, 151.20, 1360.80
  ), 
  (
    2153, 53, '153', 1053, 'SELL', '2023-11-22', 
    6.00, 152.40, 914.40
  ), 
  (
    2154, 54, '154', 1054, 'BUY', '2023-11-23', 
    11.00, 157.70, 1734.70
  ), 
  (
    2155, 55, '155', 1055, 'SELL', '2023-11-24', 
    8.00, 150.90, 1207.20
  ), 
  (
    2156, 56, '156', 1056, 'BUY', '2023-11-25', 
    7.00, 150.20, 1051.40
  ), 
  (
    2157, 57, '157', 1057, 'SELL', '2023-11-26', 
    12.00, 155.00, 1860.00
  ), 
  (
    2158, 58, '158', 1058, 'BUY', '2023-11-27', 
    9.00, 152.80, 1375.20
  ), 
  (
    2159, 59, '159', 1059, 'SELL', '2023-11-28', 
    6.00, 151.10, 906.60
  ), 
  (
    2160, 60, '160', 1060, 'BUY', '2023-11-29', 
    10.00, 156.20, 1562.00
  ), 
  (
    2161, 61, '161', 1061, 'SELL', '2023-11-30', 
    7.00, 150.70, 1054.90
  ), 
  (
    2162, 62, '162', 1062, 'BUY', '2023-12-01', 
    8.00, 152.60, 1220.80
  ), 
  (
    2163, 63, '163', 1063, 'SELL', '2023-12-02', 
    11.00, 157.90, 1736.90
  ), 
  (
    2164, 64, '164', 1064, 'BUY', '2023-12-03', 
    7.00, 150.50, 1053.50
  ), 
  (
    2165, 65, '165', 1065, 'SELL', '2023-12-04', 
    12.00, 154.80, 1857.60
  ), 
  (
    2166, 66, '166', 1066, 'BUY', '2023-12-05', 
    9.00, 151.00, 1359.00
  ), 
  (
    2167, 67, '167', 1067, 'SELL', '2023-12-06', 
    6.00, 152.10, 912.60
  ), 
  (
    2168, 68, '168', 1068, 'BUY', '2023-12-07', 
    10.00, 157.50, 1575.00
  ), 
  (
    2169, 69, '169', 1069, 'SELL', '2023-12-08', 
    8.00, 151.30, 1210.40
  ), 
  (
    2170, 70, '170', 1070, 'BUY', '2023-12-09', 
    7.00, 150.20, 1051.40
  ), 
  (
    2171, 71, '171', 1071, 'SELL', '2023-12-10', 
    12.00, 155.20, 1862.40
  ), 
  (
    2172, 72, '172', 1072, 'BUY', '2023-12-11', 
    9.00, 152.70, 1374.30
  ), 
  (
    2173, 73, '173', 1073, 'SELL', '2023-12-12', 
    6.00, 150.90, 905.40
  ), 
  (
    2174, 74, '174', 1074, 'BUY', '2023-12-13', 
    10.00, 156.30, 1563.00
  ), 
  (
    2175, 75, '175', 1075, 'SELL', '2023-12-14', 
    7.00, 151.20, 1058.40
  ), 
  (
    2176, 76, '176', 1076, 'BUY', '2023-12-15', 
    8.00, 152.80, 1222.40
  ), 
  (
    2177, 77, '177', 1077, 'SELL', '2023-12-16', 
    11.00, 157.80, 1735.80
  ), 
  (
    2178, 78, '178', 1078, 'BUY', '2023-12-17', 
    7.00, 150.60, 1054.20
  ), 
  (
    2179, 79, '179', 1079, 'SELL', '2023-12-18', 
    12.00, 155.00, 1860.00
  ), 
  (
    2180, 80, '180', 1080, 'BUY', '2023-12-19', 
    9.00, 152.90, 1376.10
  ), 
  (
    2181, 81, '181', 1081, 'SELL', '2023-12-20', 
    6.00, 150.40, 902.40
  ), 
  (
    2182, 82, '182', 1082, 'BUY', '2023-12-21', 
    10.00, 156.60, 1566.00
  ), 
  (
    2183, 83, '183', 1083, 'SELL', '2023-12-22', 
    8.00, 151.10, 1208.80
  ), 
  (
    2184, 84, '184', 1084, 'BUY', '2023-12-23', 
    7.00, 150.30, 1052.10
  ), 
  (
    2185, 85, '185', 1085, 'SELL', '2023-12-24', 
    12.00, 154.70, 1856.40
  ), 
  (
    2186, 86, '186', 1086, 'BUY', '2023-12-25', 
    9.00, 152.70, 1374.30
  ), 
  (
    2187, 87, '187', 1087, 'SELL', '2023-12-26', 
    6.00, 150.90, 905.40
  ), 
  (
    2188, 88, '188', 1088, 'BUY', '2023-12-27', 
    10.00, 156.30, 1563.00
  ), 
  (
    2189, 89, '189', 1089, 'SELL', '2023-12-28', 
    7.00, 151.20, 1058.40
  ), 
  (
    2190, 90, '190', 1090, 'BUY', '2023-12-29', 
    8.00, 152.80, 1222.40
  ), 
  (
    2191, 91, '191', 1091, 'SELL', '2023-12-30', 
    11.00, 157.80, 1735.80
  );
  
  
  
INSERT INTO performance_history (
  performance_id, user_id, portfolio_id, 
  asset_id, date, value
) 
VALUES 
  (
    '701', 1, 101, 1001, '2023-10-01', 10000.00
  );
  
  
INSERT INTO performance_history (
  performance_id, user_id, portfolio_id, 
  asset_id, date, value
) 
VALUES 
  (
    702, 2, 102, 1002, '2023-10-02', 25000.00
  ), 
  (
    703, 3, 103, 1003, '2023-10-02', 31000.00
  ), 
  (
    704, 4, 104, 1004, '2023-10-02', 50000.00
  ), 
  (
    705, 5, 105, 1005, '2023-10-02', 15000.00
  ), 
  (
    706, 6, 106, 1006, '2023-10-02', 20000.00
  ), 
  (
    707, 7, 107, 1007, '2023-10-02', 18000.00
  ), 
  (
    708, 8, 108, 1008, '2023-10-02', 21000.00
  ), 
  (
    709, 9, 109, 1009, '2023-10-02', 24000.00
  ), 
  (
    710, 10, 110, 1010, '2023-10-02', 27000.00
  ), 
  (
    711, 11, 111, 1011, '2023-10-02', 23000.00
  ), 
  (
    712, 12, 112, 1012, '2023-10-02', 26000.00
  ), 
  (
    713, 13, 113, 1013, '2023-10-02', 28000.00
  ), 
  (
    714, 14, 114, 1014, '2023-10-02', 29000.00
  ), 
  (
    715, 15, 115, 1015, '2023-10-02', 30000.00
  ), 
  (
    716, 16, 116, 1016, '2023-10-02', 32000.00
  ), 
  (
    717, 17, 117, 1017, '2023-10-02', 33000.00
  ), 
  (
    718, 18, 118, 1018, '2023-10-02', 31000.00
  ), 
  (
    719, 19, 119, 1019, '2023-10-02', 34000.00
  ), 
  (
    720, 20, 120, 1020, '2023-10-02', 35000.00
  ), 
  (
    721, 21, 121, 1021, '2023-10-02', 36000.00
  ), 
  (
    722, 22, 122, 1022, '2023-10-02', 38000.00
  ), 
  (
    723, 23, 123, 1023, '2023-10-02', 39000.00
  ), 
  (
    724, 24, 124, 1024, '2023-10-02', 40000.00
  ), 
  (
    725, 25, 125, 1025, '2023-10-02', 41000.00
  ), 
  (
    726, 26, 126, 1026, '2023-10-02', 42000.00
  ), 
  (
    727, 27, 127, 1027, '2023-10-02', 43000.00
  ), 
  (
    728, 28, 128, 1028, '2023-10-02', 44000.00
  ), 
  (
    729, 29, 129, 1029, '2023-10-02', 45000.00
  ), 
  (
    730, 30, 130, 1030, '2023-10-02', 46000.00
  ), 
  (
    731, 31, 131, 1031, '2023-10-02', 47000.00
  ), 
  (
    732, 32, 132, 1032, '2023-10-02', 48000.00
  ), 
  (
    733, 33, 133, 1033, '2023-10-02', 49000.00
  ), 
  (
    734, 34, 134, 1034, '2023-10-02', 50000.00
  ), 
  (
    735, 35, 135, 1035, '2023-10-02', 51000.00
  ), 
  (
    736, 36, 136, 1036, '2023-10-02', 52000.00
  ), 
  (
    737, 37, 137, 1037, '2023-10-02', 53000.00
  ), 
  (
    738, 38, 138, 1038, '2023-10-02', 54000.00
  ), 
  (
    739, 39, 139, 1039, '2023-10-02', 55000.00
  ), 
  (
    740, 40, 140, 1040, '2023-10-02', 56000.00
  ), 
  (
    741, 41, 141, 1041, '2023-10-02', 57000.00
  ), 
  (
    742, 42, 142, 1042, '2023-10-02', 58000.00
  ), 
  (
    743, 43, 143, 1043, '2023-10-02', 59000.00
  ), 
  (
    744, 44, 144, 1044, '2023-10-02', 60000.00
  ), 
  (
    745, 45, 145, 1045, '2023-10-02', 61000.00
  ), 
  (
    746, 46, 146, 1046, '2023-10-02', 62000.00
  ), 
  (
    747, 47, 147, 1047, '2023-10-02', 63000.00
  ), 
  (
    748, 48, 148, 1048, '2023-10-02', 64000.00
  ), 
  (
    749, 49, 149, 1049, '2023-10-02', 65000.00
  ), 
  (
    750, 50, 150, 1050, '2023-10-02', 66000.00
  ), 
  (
    751, 51, 151, 1051, '2023-10-02', 67000.00
  ), 
  (
    752, 52, 152, 1052, '2023-10-02', 68000.00
  ), 
  (
    753, 53, 153, 1053, '2023-10-02', 69000.00
  ), 
  (
    754, 54, 154, 1054, '2023-10-02', 70000.00
  ), 
  (
    755, 55, 155, 1055, '2023-10-02', 71000.00
  ), 
  (
    756, 56, 156, 1056, '2023-10-02', 72000.00
  ), 
  (
    757, 57, 157, 1057, '2023-10-02', 73000.00
  ), 
  (
    758, 58, 158, 1058, '2023-10-02', 74000.00
  ), 
  (
    759, 59, 159, 1059, '2023-10-02', 75000.00
  ), 
  (
    760, 60, 160, 1060, '2023-10-02', 76000.00
  ), 
  (
    761, 61, 161, 1061, '2023-10-02', 77000.00
  ), 
  (
    762, 62, 162, 1062, '2023-10-02', 78000.00
  ), 
  (
    763, 63, 163, 1063, '2023-10-02', 79000.00
  ), 
  (
    764, 64, 164, 1064, '2023-10-02', 80000.00
  ), 
  (
    765, 65, 165, 1065, '2023-10-02', 81000.00
  ), 
  (
    766, 66, 166, 1066, '2023-10-02', 82000.00
  ), 
  (
    767, 67, 167, 1067, '2023-10-02', 83000.00
  ), 
  (
    768, 68, 168, 1068, '2023-10-02', 84000.00
  ), 
  (
    769, 69, 169, 1069, '2023-10-02', 85000.00
  ), 
  (
    770, 70, 170, 1070, '2023-10-02', 86000.00
  ), 
  (
    771, 71, 171, 1071, '2023-10-02', 87000.00
  ), 
  (
    772, 72, 172, 1072, '2023-10-02', 88000.00
  ), 
  (
    773, 73, 173, 1073, '2023-10-02', 89000.00
  ), 
  (
    774, 74, 174, 1074, '2023-10-02', 90000.00
  ), 
  (
    775, 75, 175, 1075, '2023-10-02', 91000.00
  ), 
  (
    776, 76, 176, 1076, '2023-10-02', 92000.00
  ), 
  (
    777, 77, 177, 1077, '2023-10-02', 93000.00
  ), 
  (
    778, 78, 178, 1078, '2023-10-02', 94000.00
  ), 
  (
    779, 79, 179, 1079, '2023-10-02', 95000.00
  ), 
  (
    780, 80, 180, 1080, '2023-10-02', 96000.00
  ), 
  (
    781, 81, 181, 1081, '2023-10-02', 97000.00
  ), 
  (
    782, 82, 182, 1082, '2023-10-02', 98000.00
  ), 
  (
    783, 83, 183, 1083, '2023-10-02', 99000.00
  ), 
  (
    784, 84, 184, 1084, '2023-10-02', 100000.00
  ), 
  (
    785, 85, 185, 1085, '2023-10-02', 101000.00
  ), 
  (
    786, 86, 186, 1086, '2023-10-02', 102000.00
  ), 
  (
    787, 87, 187, 1087, '2023-10-02', 103000.00
  ), 
  (
    788, 88, 188, 1088, '2023-10-02', 104000.00
  ), 
  (
    789, 89, 189, 1089, '2023-10-02', 105000.00
  ), 
  (
    790, 90, 190, 1090, '2023-10-02', 106000.00
  ), 
  (
    791, 91, 191, 1091, '2023-10-02', 107000.00
  );
  
  
select * from users;

-#Joins "transactions" and "users" tables to fetch transaction IDs and usernames based on the user_id.
SELECT 
  transactions.transaction_id, 
  users.username 
FROM 
  transactions 
  INNER JOIN users ON transactions.user_id = users.user_id;

#Retrieves usernames and their total transaction amounts, filtering for totals exceeding 1000.
SELECT 
  users.username, 
  SUM(transactions.total_amount) AS total_amount 
FROM 
  users 
  JOIN transactions ON users.user_id = transactions.user_id 
GROUP BY 
  users.username 
HAVING 
  total_amount > 1000;
  
#Retrieves all transactions within the date range from January 1, 2023, to March 31, 2023.  
SELECT 
  * 
FROM 
  transactions 
WHERE 
  transaction_date BETWEEN '2023-01-01' 
  AND '2023-03-31';
  
  #Retrieves the first 10 rows from the "transactions" table.
SELECT * FROM transactions LIMIT 10;


select * from portfolio_holdings;

#Retrieves all rows from the "transactions" table and sorts them in descending order based on the "transaction_date."
SELECT * FROM transactions 
ORDER BY transaction_date DESC;

#Retrieves usernames of users who have made transactions with a total amount greater than the average total amount in the "transactions" table.
SELECT 
  username 
FROM 
  users 
WHERE 
  user_id IN (
    SELECT 
      user_id 
    FROM 
      transactions 
    WHERE 
      total_amount > (
        SELECT 
          AVG(total_amount) 
        FROM 
          transactions
      )
  );
  
  #Retrieves usernames and their total transaction amounts, filtering for totals over 10,000, and ordering the results by total amount in descending order.
SELECT 
  u.username AS "User", 
  SUM(t.total_amount) AS "Total Amount" 
FROM 
  users u 
  JOIN transactions t ON u.user_id = t.user_id 
GROUP BY 
  u.username 
HAVING 
  "Total Amount" > 10000 
ORDER BY 
  "Total Amount" DESC;
  
  
  #Categorizes users as "High Spender" or "Regular" based on their total transaction amounts, grouped by username.
SELECT 
  username, 
  CASE WHEN SUM(total_amount) > 1000 THEN 'High Spender' ELSE 'Regular' END AS "Spending Category" 
FROM 
  users 
  JOIN transactions ON users.user_id = transactions.user_id 
GROUP BY 
  username;
  
 #Retrieves usernames and their highest transaction amounts, ordering them by the highest transaction amount in descending order, limited to the top 100 users. 
SELECT 
  username, 
  MAX(total_amount) AS "Highest Transaction" 
FROM 
  users 
  JOIN transactions ON users.user_id = transactions.user_id 
GROUP BY 
  username 
ORDER BY 
  "Highest Transaction" DESC 
LIMIT 
  100;
  
  #Summarizes the total transaction amounts by month, ordering the results by month.
SELECT 
  DATE_FORMAT(transaction_date, '%Y-%m-01') AS "Month", 
  SUM(total_amount) AS "Total Amount" 
FROM 
  transactions 
GROUP BY 
  DATE_FORMAT(transaction_date, '%Y-%m-01') 
ORDER BY 
  "Month";
  
   #Pivoting data to see assets as columns with their quantities using dynamic SQL
SET SESSION group_concat_max_len = 1000000;

#Pivoting data to see assets as columns with their quantities using dynamic SQL
SET SESSION group_concat_max_len = 1000000;

