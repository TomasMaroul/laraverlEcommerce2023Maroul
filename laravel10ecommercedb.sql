-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 02, 2024 at 05:51 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `laravel10ecommercedb`
--

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `name`, `slug`, `image`, `created_at`, `updated_at`) VALUES
(1, 'Creality', 'creality', NULL, NULL, NULL),
(2, 'Prusa Research', 'Prusa-research', NULL, NULL, NULL),
(3, 'Bambu Lab', 'Bambu-lab', NULL, NULL, NULL),
(4, '\r\nBCN3D Technologies', '\r\nBCN3D-technologies', NULL, NULL, NULL),
(5, 'Sinterit', 'Sinterit', NULL, NULL, NULL),
(7, 'Formlabs', 'formlabs', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`, `image`, `created_at`, `updated_at`) VALUES
(1, '3D tiskárny', '3d-tiskarny', NULL, NULL, NULL),
(2, '3D skenery', '3d-scan', NULL, NULL, NULL),
(3, 'Sada', 'sada', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(25, '2014_10_12_000000_create_users_table', 1),
(26, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(27, '2014_10_12_100000_create_password_resets_table', 1),
(28, '2019_08_19_000000_create_failed_jobs_table', 1),
(29, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(30, '2023_12_05_204644_create_brands_table', 1),
(31, '2023_12_05_204712_create_categories_table', 1),
(32, '2023_12_05_204730_create_products_table', 1),
(33, '2023_12_07_195429_create_orders_table', 1),
(34, '2023_12_07_195455_create_order_items_table', 1),
(35, '2023_12_07_195526_create_shippings_table', 1),
(36, '2023_12_07_195543_create_transactions_table', 1),
(37, '2024_01_02_054936_create_technologies_table', 2),
(38, '2024_01_02_055510_create_technologies_table', 3);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `total` text NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `address` text NOT NULL,
  `kraj` varchar(255) NOT NULL,
  `zeme` varchar(255) NOT NULL,
  `psc` varchar(255) NOT NULL,
  `paymentMethod` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `total`, `name`, `email`, `address`, `kraj`, `zeme`, `psc`, `paymentMethod`, `created_at`, `updated_at`) VALUES
(1, '24,723.85', 'Jan Dolez', 'dolez@char.ct', 'palackeho', 'Zlínský kraj', 'Česká Republika', '46002', 'Google Pay', '2024-01-02 11:25:30', '2024-01-02 11:25:30'),
(2, '24,723.85', 'Jan Dolez', 'dolez@char.ct', 'palackeho', 'Zlínský kraj', 'Česká Republika', '46002', 'Google Pay', '2024-01-02 11:26:41', '2024-01-02 11:26:41'),
(3, '22,988.50', 'jah das', 'das@fa.cas', 'dsadfa', 'Karlovarský kraj', 'Česká Republika', '45695', 'prevod', '2024-01-02 15:49:49', '2024-01-02 15:49:49'),
(4, '22,988.50', 'jah das', 'das@fa.cas', 'dsadfa', 'Karlovarský kraj', 'Česká Republika', '45695', 'prevod', '2024-01-02 15:50:39', '2024-01-02 15:50:39');

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `quantity` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`id`, `product_id`, `order_id`, `quantity`, `created_at`, `updated_at`) VALUES
(1, 26, 2, 1, '2024-01-02 11:26:41', '2024-01-02 11:26:41'),
(2, 50, 3, 1, '2024-01-02 15:49:49', '2024-01-02 15:49:49'),
(3, 50, 4, 1, '2024-01-02 15:50:39', '2024-01-02 15:50:39');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `short_description` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `regular_price` decimal(8,2) NOT NULL,
  `sale_price` decimal(8,2) DEFAULT NULL,
  `SKU` varchar(255) NOT NULL,
  `stock_status` enum('instock','outofstock') NOT NULL,
  `featured` tinyint(1) NOT NULL DEFAULT 0,
  `quantity` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `image` varchar(255) NOT NULL,
  `images` text NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `brand_id` bigint(20) UNSIGNED NOT NULL,
  `technology_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `slug`, `short_description`, `description`, `regular_price`, `sale_price`, `SKU`, `stock_status`, `featured`, `quantity`, `image`, `images`, `category_id`, `brand_id`, `technology_id`, `created_at`, `updated_at`) VALUES
(25, 'Prusa MK4', 'Prusa-MK4', 'MK4 nabízí vysokorychlostní tisk, jednoduché ovládání a zároveň spolehlivost, na kterou jste u všech Original Prusa 3D tiskáren zvyklí. Ponechává si všechny výhody populární tiskárny MK3: snadnou údržbu, vysokou bezpečnost, open-source principy.', 'MK4 nabízí vysokorychlostní tisk, jednoduché ovládání a zároveň spolehlivost, na kterou jste u všech Original Prusa 3D tiskáren zvyklí. Ponechává si všechny výhody populární tiskárny MK3: snadnou údržbu, vysokou bezpečnost, open-source principy... a přidává ještě mnohem víc!\r\n\r\nMK4 konzistentně nabízí dokonale hladkou první vrstvu díky Load Cell senzoru (není potřeba manuální ladění). Extruder nové generace (Nextruder) a 32-bitová platforma poskytují konkrétní výhody jako je vzdálený tisk, rychlá výměna trysek a přizpůsobitelné ovládání s možností spuštění tisku jedním kliknutím.\r\n\r\nSoučástí balení je tiskový plát s hladkým PEI povrchem.\r\n\r\nNákupem sestavené MK4 se stáváte členy našeho slevového programu; získáváte 10% slevu na vybrané filamenty a na další objednávky sestavených MK4.Original Prusa MK4 je založená na naší nové 32-bitové architektuře a extruderu nové generace (Nextruder). Nabízí vždy dokonalou první vrstvu bez jakéhokoliv dolaďování a podporuje vysokorychlostní tisk s technologiemi Input Shaper a Pressure Advance. Ještě víc jsme vylepšili všechny bezpečnostní funkce. K dispozici je rychlá výměna trysek, vestavěná podpora pro vzdálený tisk a webkamery a spousta dalších vychytávek. Provoz tiskárny je navíc nádherně tichý.\r\nNástupce spolehlivé tiskárny Original Prusa MK3, vítěze mnoha ocenění.\r\nRychlý a zároveň i tichý tisk, s jednoduchým ovládáním. Podívejte se na tisk Benchy pod 20 minut!\r\nPlně automatická kalibrace první vrstvy díky Load Cell senzoru.\r\nTiskněte rovnou po prvním zapnutí - žádné profily tiskových plátů, žádné ladění první vrstvy!\r\nNextruder – náš nový extruder s vestavěnou rozbočovací deskou a chytrými funkcemi.\r\nSpolehlivé pojistky proti selhání tisku: filament senzor, zotavení při ztrátě napájení (power panic).\r\nJednoduchá údržba, rychlá výměna trysek, vyměnitelné tiskové pláty.\r\nPodpora široké škály materiálů, včetně PLA, PETG, Flex, Nylon, ASA, PVA, PC, PP, kompozitních filamentů, atd.\r\nBarevná LCD obrazovka s uživatelsky příjemným rozhraním a rychlým přístupem ke všem důležitým funkcím.\r\nEthernet a Wi-fi připojení.\r\nVyrobeno v EU, uplatnění záruky bez komplikací, nonstop live chat technická podpora.\r\nopen-source', '22000.00', NULL, 'Prusa-MK4', 'instock', 0, 4, '1.jpg', '2.jpg,3.jpg', 1, 2, 2, NULL, NULL),
(26, 'Prusa MK4 + Filamenty', 'Prusa-MK4-fila', 'MK4 nabízí vysokorychlostní tisk, jednoduché ovládání a zároveň spolehlivost, na kterou jste u všech Original Prusa 3D tiskáren zvyklí. Ponechává si všechny výhody populární tiskárny MK3: snadnou údržbu, vysokou bezpečnost, open-source principy.', 'MK4 nabízí vysokorychlostní tisk, jednoduché ovládání a zároveň spolehlivost, na kterou jste u všech Original Prusa 3D tiskáren zvyklí. Ponechává si všechny výhody populární tiskárny MK3: snadnou údržbu, vysokou bezpečnost, open-source principy... a přidává ještě mnohem víc!\r\n\r\nMK4 konzistentně nabízí dokonale hladkou první vrstvu díky Load Cell senzoru (není potřeba manuální ladění). Extruder nové generace (Nextruder) a 32-bitová platforma poskytují konkrétní výhody jako je vzdálený tisk, rychlá výměna trysek a přizpůsobitelné ovládání s možností spuštění tisku jedním kliknutím.\r\n\r\nSoučástí balení je tiskový plát s hladkým PEI povrchem.\r\n\r\nNákupem sestavené MK4 se stáváte členy našeho slevového programu; získáváte 10% slevu na vybrané filamenty a na další objednávky sestavených MK4.Original Prusa MK4 je založená na naší nové 32-bitové architektuře a extruderu nové generace (Nextruder). Nabízí vždy dokonalou první vrstvu bez jakéhokoliv dolaďování a podporuje vysokorychlostní tisk s technologiemi Input Shaper a Pressure Advance. Ještě víc jsme vylepšili všechny bezpečnostní funkce. K dispozici je rychlá výměna trysek, vestavěná podpora pro vzdálený tisk a webkamery a spousta dalších vychytávek. Provoz tiskárny je navíc nádherně tichý.\r\nNástupce spolehlivé tiskárny Original Prusa MK3, vítěze mnoha ocenění.\r\nRychlý a zároveň i tichý tisk, s jednoduchým ovládáním. Podívejte se na tisk Benchy pod 20 minut!\r\nPlně automatická kalibrace první vrstvy díky Load Cell senzoru.\r\nTiskněte rovnou po prvním zapnutí - žádné profily tiskových plátů, žádné ladění první vrstvy!\r\nNextruder – náš nový extruder s vestavěnou rozbočovací deskou a chytrými funkcemi.\r\nSpolehlivé pojistky proti selhání tisku: filament senzor, zotavení při ztrátě napájení (power panic).\r\nJednoduchá údržba, rychlá výměna trysek, vyměnitelné tiskové pláty.\r\nPodpora široké škály materiálů, včetně PLA, PETG, Flex, Nylon, ASA, PVA, PC, PP, kompozitních filamentů, atd.\r\nBarevná LCD obrazovka s uživatelsky příjemným rozhraním a rychlým přístupem ke všem důležitým funkcím.\r\nEthernet a Wi-fi připojení.\r\nVyrobeno v EU, uplatnění záruky bez komplikací, nonstop live chat technická podpora.\r\nopen-source', '21499.00', NULL, 'Prusa-MK4-fila', 'instock', 0, 5, '25.png', '', 3, 2, 2, NULL, NULL),
(27, 'Prusa Enclosure', 'Prusa-enclosure', 'Představujeme Original Prusa Enclosure: Modulární box pro vaši 3D tiskárnu!', 'Original Prusa Enclosure je příslušenství pro 3D tiskárnu Original Prusa i3 MK3S+ a MK4. Jedná se o uzavíratelný box, který vytváří stabilní tiskové prostředí. Dále pomáhá blokovat nepříjemný pach specifických materiálů, snižuje hlasitost běžící tiskárny a lze jej vylepšit pomocí řady doplňků, které ocení nejen kutilové doma, ale i nejrůznější instituce a otevřené dílny. Uzavřená, pasivně vytápěná komora je vhodná pro tisk pokročilých materiálů, protože zabraňuje kroucení tištěných objektů. Box je dimenzován dostatečně na to, aby se nad rám tiskárny vešla i jednotka MMU2S.\r\n\r\nBalení obsahuje vše potřebné pro sestavení boxu - není potřeba nic tisknout. Jedinou výjimkou je držák stříbrného zdroje a volitelná madla viditelná na některých fotografiích. Ty si lze dodatečně vytisknout, protože většina uživatelů nepotřebuje box často přesouvat. Návod k stavbě naleznete na help.prusa3d.com, box je dodáván v rozloženém stavu. 3D tiskárna není součástí balení.', '9990.00', NULL, 'Prusa-enclosure', 'instock', 0, 3, '30.jpg', '31.jpg', 1, 2, 2, NULL, NULL),
(28, 'Prusa i3 MK3S+', 'Prusa-i3', 'Original Prusa i3 MK3S+ je poslední verzí naší oceňované řady 3D tiskáren MK3. Verzi MK3S jsme obohatili o novou sondu SuperPINDA, pomocí které je možné dosáhnout lepší kalibrace první vrstvy.', 'Original Prusa i3 MK3S+ je poslední verzí naší oceňované řady 3D tiskáren MK3. Verzi MK3S jsme obohatili o novou sondu SuperPINDA, pomocí které je možné dosáhnout lepší kalibrace první vrstvy. Dále jsme přidali kvalitní ložiska a tiskárnu jsme na různých místech lehce vylepšili, aby se lépe skládala a servisovala. MK3S+ obsahuje všechny kumulativní vylepšení z celého životního cyklu MK3. Najdete tu proto vyhřívanou podložku s odnímatelnými pružnými tiskovými pláty s PEI povrchem, dále je tu automatický Mesh Bed Leveling pro vyrovnání nerovostí podložky, senzor filamentu, zotavení ze ztráty napájení (tzv. Power Panic) a řada důležitých bezpečnostních prvků. A tiskárna je stále nádherně tichá!\r\n\r\nFunkce naší MK3S+ lze dále rozšířit pomocí unikátního řešení Multi-Material Upgrade 3, s pomocí kterého lze tisknout až 5 filamenty zároveň.', '24990.00', NULL, 'Prusa-i3', 'instock', 0, 15, '40.jpg', '41.jpg,42.jpg', 1, 2, 2, NULL, NULL),
(29, 'Creality Ender-3 Pro + filament', 'Creality-Ender-3-Pro', 'Nejnovější tiskárna od Creality 3D je založena na osvědčeném a populárním modelu Ender 3, který byl nyní kompletně přepracován.', 'Nástupce osvědčené tiskárny Ender 3\r\n\r\nNejnovější tiskárna od Creality 3D je založena na osvědčeném a populárním modelu Ender 3, který byl nyní kompletně přepracován. Nabízí klasický vzhled s celokovovým rámem, který byl ponechán k udržování stability a tuhosti, byly však přidány některé inovace a vylepšení.\r\n\r\nJednoduchá konstrukce\r\n\r\nDíky modulární konstrukci je tiskárna Ender 3 V2  snadno sestavitelná. Pro zvýšení bezpečnosti je nyní v zařízení předinstalován značkový zdroj napájení.  Skleněná karborundová deska\r\n\r\nTato skleněná deska je častým upgradem pro klasickou tiskárnu Ender 3, protože má velmi dobrou přilnavost a vysokou rychlost ohřevu. Hladká první vrstva navíc zvyšuje estetiku hotových modelů. S Ender 3 V2 již nemusíte tuto aktualizaci pořizovat, protože ji tiskárna již obsahuje.\r\n\r\nV-slot\r\n\r\nEnder 3 V2 používá velmi kvalitní V-sloty (hliníkové profily) pro zajištění rovnoměrnějšího pohybu, větší odolnosti proti opotřebení a stabilnější výsledky tisku.\r\n\r\nTichý provoz\r\n\r\nSpeciálně nově vyvinutá základní deska 32 bit - verze 4.2.2 s krokovým ovladačem TMC2208 byla navržena pro maximální snížení hluku. Zajišťuje hladký pohyb a hladinu hluku nižší než 50 dB během tisku.\r\n\r\nInteligentní\r\n\r\nEnder 3 V2 je vybaven funkcí obnovení tisku. Pokud dojde k neočekávanému výpadku el.energie, můžete po obnově snadno a pohodlně pokračovat v tisku. To vám ušetří čas a finance za nový materiál.\r\n\r\nJednoduché napnutí řemenu\r\n\r\nEnder 3 V2 má nyní nové napínáky řemenů v ose X a Y. To vám umožní rychle a pohodlně upravit napětí těchto řemenů.\r\n\r\nSnadné doplnění filamentu\r\n\r\nS novým otočným knoflíkem na extruderu je nyní mnohem snazší doplnit a nebo vyjmout  filament.', '4990.00', NULL, 'Creality-Ender-3-Pro', 'instock', 0, 10, '26.jpg', '', 3, 1, 2, NULL, NULL),
(30, 'Creality ENDER-3', 'Creality-ENDER-3', 'Cenově dostupná 3D tiskárna s překvapivě vysokým výkonem a širokou nabídkou funkcí. Technologie FDM v kombinaci s rozměrnou tiskovou plochou vám umožní vytvářet i velké modely.', 'Kvalitní 3D tiskárnu si nyní může dovolit skoro každý. Modely ze série ENDER-3 jsou ideální pro domácí použití, ale svými vlastnostmi překonávají i mnohem dražší modely. Všestranná 3D tiskárna najde využití u studentů, kutilů i techniků. Ke své funkci využívá populární technologii FDM, která nabízí široké možnosti uplatnění. Díky dostatečně velké ploše tisku si při návrhu svých projektů nemusíte zbytečně omezovat. Tiskárna využívá stabilní konstrukci a další kvalitní komponenty, které zajistí rychlý, ekonomický a precizní tisk. V případě přerušení napájení dokáže tiskárna pokračovat v práci tam, kde přestala. Série ENDER-3 je dodávána jako stavebnice, ale její složení zvládne s trochou zručnosti každý.\r\n\r\nDostupná 3D tiskárna\r\nObjevte svět 3D tisku i bez astronomických pořizovacích nákladů. Populární 3D tiskárny od společnosti Creality jsou ideálním řešením pro vaše domácí experimenty a školní projekty. Svými schopnostmi překonávají i některé dražší stroje.\r\nDostupná 3D tiskárna\r\nNa velikosti záleží\r\nS modely série ENDER-3 můžete tisknout objekty do velikosti až 220 × 220 × 250 mm (nebo 300 × 300 × 340 mm v případě ENDER-3 Max), proto při návrhu svých projektů klidně upusťte uzdu své fantazie.\r\nNa velikosti záleží\r\nKvalitní komponenty\r\nTechnologie tisku FDM je ideální pro většinu aplikací, proto představuje nejoblíbenější volbu na poli 3D tiskáren. Tato série navíc přidává další kvalitní komponenty, jako je podložka s teplotou až 110 °C .\r\nKvalitní komponenty\r\nPokračujte v práci\r\nPokud by vás během tisku překvapil nenadálý výpadek elektrického proudu nebo jiný problém, nemusíte svůj projekt začínat od znovu. Tiskárna si přesně pamatuje svou polohu a umožňuje pokračovat v práci po obnovení napájení.\r\nPokračujte v práci\r\nSestavte si sami\r\nTiskárna je dodávána jako stavebnice, proto si každý kutil užije i samostatné sestavování. Nemusíte mít obavy z ničeho složité, při využití návodu by vám sestavení nemělo zabrat déle než 10 minut.\r\nSestavte si sami\r\nVyberte si svůj model\r\nPři nákupu máte možnost si vybrat z několika variant. Jaký je mezi nimi rozdíl? \r\n\r\nZákladní model ENDER-3 nabídne maximální rychlost tisku 180 mm/s, vysoce přesné importované hliníkové V-slotové ložisko, velmi rychlé nahřátí desky a extrudelu a další.\r\nS modelem ENDER-3 Pro získáte vylepšené komponenty, jako je napájecí zdroj pro ještě stabilnější a bezpečnější tisk.\r\nModel ENDER-3 V2 nabídne aktualizovanou základní desku s tichými drivery (oproti ENDER-3 a ENDER-3 PRO), vylepšenou dotykovou obrazovku se snadno použitelným rozhraním a nový design tiskové hlavy. \r\nModel ENDER-3 Max umožňuje tisk větších objektů a využívá robustnější hliníkový rám či dvojitý ventilátor.', '4990.00', NULL, 'Creality-ENDER-3', 'instock', 0, 10, '28.jpg', '29.jpg', 1, 1, 2, NULL, NULL),
(32, 'Formlabs Form 3+', 'Formlabs-Form-3+', 'Formlabs vyvinula novou verzi technologie SLA pro dosažení ještě lepších výsledků při tisku z fotopolymerních pryskyřic. 3D tiskárny Formlabs Form 3+ využívají technologii LFS, která zajišťuje ještě vyšší přesnost výroby při vyšších rychlostech tisku.', 'Formlabs vyvinula novou verzi technologie SLA pro dosažení ještě lepších výsledků při tisku z fotopolymerních pryskyřic. 3D tiskárny Formlabs Form 3+ využívají technologii LFS (Low Force Stereolithography™), která zajišťuje ještě vyšší přesnost výroby při vyšších rychlostech tisku. Díky laserovému bodu redukovanému na 85 mikronů nabízí bezkonkurenční přesnost při reprodukci každého detailu. Vestavěné senzory monitorují provoz zařízení a udržují konstantní podmínky během tiskového procesu, aby byla zajištěna opakovatelnost výroby. Dosáhněte bezkonkurenční přesnosti 3D tisku za kratší dobu. Nejnovější verze 3D tiskárny Form 3+ má vylepšený optický systém, aktualizovaný software 3D tiskárny a nové komponenty pro další zlepšení spolehlivosti, přesnosti a rychlosti 3D tisku.\r\n\r\nVysoká přesnost pro složité geometrie\r\nNosná konstrukce stává ještě tenčí a povrch modelu stává hladším. Snadnější odstranění podpěr také zkracuje dobu zpracování tisku.\r\n\r\nSnadná výměna pryskyřice\r\nMateriály jsou vyplněny čistě a bezpečně. Zařízení detekuje změny v podkladu a upravuje nastavení tisku. Automatický systém podávání pryskyřice umožňuje práci bez dozoru.\r\n\r\nPodpora Plug&Play\r\nOvládání tiskárny probíhá pomocí dotykového displeje. V tomto obraze je uveden náhled nahraného projektu, čas tisku a aktuální počet překrývajících vrstev. Stačí importovat model a začít tisknout jediným kliknutím.\r\n\r\n3D tiskárna Formlabs Form 3+ Kód výrobce FORM-3-C3DP\r\n3D tiskárna Formlabs Form 3+ EAN (GTIN) 811294030594\r\nKompletní ekosystém\r\n3D tiskárna Form 3BL je kompatibilní softwarem PreForm a pryskyřičnými cartridgemi Formlabs používanými ve Form 2 a Form 3.\r\n\r\nPohodlný přenos souborů\r\nNahrajte svůj projekt přes Wi-Fi, USB nebo Ethernet a vytiskněte. Snadná správa výtisků pomocí 5,5palcového dotykového displeje.', '79000.00', NULL, 'Formlabs-Form-3+', 'instock', 0, 6, '10.png', '11.png', 1, 7, 5, NULL, NULL),
(33, 'Sinterit Lisa Pro', 'Sinterit-Lisa-Pro', 'Tiskárna Lisa je stolní SLS tiskárna, která pracuje s technologií selektivního laserového slinování. Kompaktní, dobře navržená tiskárna, která umožňuje tisknout jinak nemožné objekty bez podpor a využít celý objem pro tisk mnoha modelů stohováním dílů.', 'Sinterit Lisa je první a přední stolní 3D laserová slinovací tiskárna. Za 3 roky na trhu si získala pověst jediného stolního SLS, schopného tisknout složité a přesné tisky ve stejné kvalitě jako velké a drahé 3D tiskárny SLS. Je to nejen snadno použitelná, ale také mimořádně cenově dostupná 3D tiskárna s technologií SLS. Tato spolehlivá stolní 3D tiskárna vám umožní navrhnout a postavit váš 3D objekt za dostupnou cenu.\r\n\r\nSinterit Lisa Pro, bývalý vítěz soutěže Formnext Startup Challenge, má vnitřní rozměry 150 × 200 ×150 mm (x, y, z). U sloučenin TPU se stává použitelným objem 110 × 150 × 150 mm (x, y, z) a pro polyamidy / nylon je 90 × 130 × 130 mm. Systém nevyžaduje přívod inertního plynu a jako takový, je stejně vhodný pro použití jak v kanceláři, tak i v dílně.\r\n\r\nLisa využívá selektivního laserového slinování, technologie 3D tisku, která používá vysoce výkonný laser k slinování práškového materiálu na pevné 3D objekty.\r\n\r\nMaximalizujte svou produktivitu pomocí Sinterit Lisa Pro dávkovým tiskem více komplexních objektů současně, bez tisku podpor.\r\n\r\nVedle svých 3D tiskáren nabízí Sinterit také doplňkové produkty pro SLS. To zahrnuje řadu práškových materiálů Sinterit, jako jsou flexibilní FLEXA Bright, PA12 Smooth a TPE Print Ready Powder. Pro následné zpracování společnost poskytuje Sinterit Sandblaster. Společnost také nabízí sítko na recyklaci použitého prášku pro opětovné použití uvnitř tiskáren Lisa a Lisa Pro 3D.', '454900.00', NULL, 'Sinterit-Lisa-Pro', 'instock', 0, 2, '12.png', '13.png', 1, 5, 4, NULL, NULL),
(34, 'Sinterit Lisa', 'Sinterit-Lisa', 'Tiskárna Lisa je stolní SLS tiskárna, která pracuje s technologií selektivního laserového slinování. Kompaktní, dobře navržená tiskárna, která umožňuje tisknout jinak nemožné objekty bez podpor a využít celý objem pro tisk mnoha modelů stohováním dílů.', 'Sinterit Lisa je první a přední stolní 3D laserová slinovací tiskárna. Za 3 roky na trhu si získala pověst jediného stolního SLS, schopného tisknout složité a přesné tisky ve stejné kvalitě jako velké a drahé 3D tiskárny SLS. Je to nejen snadno použitelná, ale také mimořádně cenově dostupná 3D tiskárna s technologií SLS. Tato spolehlivá stolní 3D tiskárna vám umožní navrhnout a postavit váš 3D objekt za dostupnou cenu.\r\n\r\nSinterit Lisa, bývalý vítěz soutěže Formnext Startup Challenge, má vnitřní rozměry 150 × 200 ×150 mm (x, y, z). U sloučenin TPU se stává použitelným objem 110 × 150 × 150 mm (x, y, z) a pro polyamidy / nylon je 90 × 130 × 130 mm. Systém nevyžaduje přívod inertního plynu a jako takový, je stejně vhodný pro použití jak v kanceláři, tak i v dílně.\r\n\r\nLisa využívá selektivního laserového slinování, technologie 3D tisku, která používá vysoce výkonný laser k slinování práškového materiálu na pevné 3D objekty.\r\n\r\nMaximalizujte svou produktivitu pomocí Sinterit Lisa dávkovým tiskem více komplexních objektů současně, bez tisku podpor.\r\n\r\nVedle svých 3D tiskáren nabízí Sinterit také doplňkové produkty pro SLS. To zahrnuje řadu práškových materiálů Sinterit, jako jsou flexibilní FLEXA Bright, PA12 Smooth a TPE Print Ready Powder. Pro následné zpracování společnost poskytuje Sinterit Sandblaster. Společnost také nabízí sítko na recyklaci použitého prášku pro opětovné použití uvnitř tiskáren Lisa a Lisa Pro 3D.\r\n\r\n ', '299990.00', NULL, 'Sinterit-Lisa', 'instock', 0, 2, '14.png', '16.png,15.png', 1, 5, 4, NULL, NULL),
(35, 'BCN3D Sigma D25', 'BCN3D-Sigma-D25', 'BCN3D Sigma D25 je odolná, pevná a snadno použitelná stolní 3D tiskárna s nezávislým duálním extruderovým systémem (IDEX). Použijte ji k výrobě aditivních přesných a detailních dílů z více materiálů a barev.', 'BCN3D Sigma D25 je odolná, pevná a snadno použitelná stolní 3D tiskárna s nezávislým duálním vytlačovacím systémem (IDEX). Použijte ji k výrobě aditivních přesných a detailních dílů z různých materiálů a barev.\r\n\r\nVlastnosti produktu: - je vyroben z materiálu, který je vhodný pro výrobu 3D modelů:\r\n\r\nTiskový objem: 420 mm x 300 mm x 200 mm.\r\nVysoce výkonný extruder od společnosti Bondtech.\r\nSystém IDEX pro nezávislý 3D tisk se dvěma extrudery.\r\nBCN3D Sigma D25\r\nObjevte novou generaci nejznámější 3D tiskárny BCN3D, která je navržena tak, aby poskytovala maximální produktivitu díky bezproblémovému provozu díky funkcím, jako je obrovský objem tisku a plná konektivita. Díky našemu systému nezávislého duálního extruderu (IDEX) poskytuje tiskárna Sigma D25 rychle funkční prototypy s kvalitou a přesností.\r\n\r\nHlavní vlastnosti produktu:\r\nVyhřívané lůžko až do 120 ºC, které umožňuje tisknout s materiály inženýrské kvality a předcházet problémům s deformacemi.\"\r\nZařízení e3D™Hotends byla pečlivě navržena tak, aby poskytovala co nejhladší a nejspolehlivější vytlačování.\r\nŘada BCN3D Epsilon je vybavena vícejazyčným dotykovým displejem, který vás provede jejími pokročilými funkcemi.\r\nRobustní hliníkový rám pro zaručenou pevnost a odolnost na vaší pracovní ploše.\r\nVytlačovací stroje Bondtech™ jsou vybaveny špičkovými dvojitými převody pohonu, které nabízejí větší kontrolu, ostřejší detaily a vynikající výkon pro jakýkoli typ filamentu.\r\nSenzor vyčerpání filamentu, který zjistí, kdy je filament vyčerpán, a pozastaví proces tisku, dokud není znovu vložen.\r\nVytvářejte velké funkční díly se solidními mechanickými vlastnostmi.\r\nOdemkněte širokou škálu technických aplikací s průmyslovými filamenty BCN3D, které vyvinuly renomované chemické společnosti: BASF a Mitsubishi Chemical, nebo pracujte bez obav s jakýmkoli materiálem třetí strany podle vlastního výběru díky našemu systému otevřených vláken.\r\n\r\nPowered by IDEX Technology\r\nPřevratná technologie Independent Dual Extrusion System, vyvinutá společností BCN3D, představuje rozdíl v 3D tisku.\r\n\r\nZrcadlový režim\r\nRežim, který umožňuje tisknout zrcadlově symetrické návrhy a urychluje iteraci.\"\r\n\r\nDuplikační režim\r\nNastavení, které tiskne identické modely současně a zdvojnásobuje tak výrobní kapacitu.\r\n\r\nRežim rozpustných podpěr\r\nProces, který tiskne rozpustné díly, aby bylo možné vytvářet složité struktury a vyhnout se geometrickým omezením.\r\n\r\nMultimateriálový režim\r\nTechnika, která umožňuje tisknout dva různé materiály a kombinovat jejich vlastnosti.', '112999.00', NULL, 'BCN3D-Sigma-D25', 'instock', 0, 5, '4.png', '5.png', 1, 4, 1, NULL, NULL),
(36, 'BCN3D Epsilon W27', 'BCN3D-Epsilon-W27', 'BCN3D Epsilon W27 je odolná, pevná a snadno použitelná stolní 3D tiskárna s nezávislým duálním vytlačovacím systémem (IDEX). Použijte ji k výrobě aditivních přesných a detailních dílů z různých materiálů a barev.', 'BCN3D Epsilon W27 je odolná, pevná a snadno použitelná stolní 3D tiskárna s nezávislým duálním vytlačovacím systémem (IDEX). Použijte ji k výrobě aditivních přesných a detailních dílů z různých materiálů a barev.\r\n\r\nProduct properties:\r\n\r\nTiskový objem: 420 mm x 300 mm x 220 mm.\r\n\r\nVysoce výkonný extruder od společnosti Bondtech.\r\n\r\nSystém IDEX pro nezávislý 3D tisk se dvěma extrudery.\r\n\r\nBCN3D Epsilon W27\r\n\r\nEpsilon W27 je výkonná profesionální 3D tiskárna, která je navržena tak, aby díky vlastnostem, jako je pasivní vyhřívaná komora a plný kryt, poskytovala pevné díly z materiálů průmyslové kvality. Tiskárna Epsilon W27 je poháněna naším systémem IDEX (Independent Dual Extruder) a poskytuje výjimečně pevné funkční díly s kvalitou a přesností.\r\n\r\nHlavní vlastnosti:\r\n\r\nTechnologie IDEX: Zdvojnásobte svou produktivitu díky nezávislému duálnímu vytlačovacímu systému.\r\nMateriály připravené pro průmysl: Tisk od plastů po kompozity a kovy. Vše pomocí stejné tiskárny.\r\nMasivní objem tisku: Vytvářejte velké robustní díly se solidními mechanickými vlastnostmi.\r\nAutomatická kalibrace XYZ: Snižte prostoje. Soustřeďte se na tisk.\r\nTechnologie Index\r\n\r\nDuplikační režim: Nastavení, které tiskne identické modely současně a zdvojnásobuje výrobní kapacitu.\r\nRežim zrcadlení: Režim, který umožňuje tisknout zrcadlově symetrické návrhy a urychluje iteraci.\r\nRežim rozpustných podpor: Proces, který tiskne rozpustné díly pro vytváření složitých struktur a vyhýbá se geometrickým omezením.\r\nMultimateriálový režim: Technika, která umožňuje tisknout dva různé materiály a kombinovat jejich vlastnosti.\r\nMateriály připravené pro průmysl\r\n\r\nTiskněte od plastů po kompozity a kovy s průmyslovými vlákny BCN3D, která vyvinuly renomované chemické společnosti BASF a Mitsubishi Chemical, a díky našemu systému otevřených vláken pracujte bez obav s jakýmkoli materiálem třetí strany podle vlastního výběru.\r\n\r\nAutomatická kalibrace XYZ\r\n\r\nAutomatický kalibrační systém zabudovaný v tiskárně BCN3D Epsilon zkalibruje celou tiskárnu za méně než 6 minut pomocí měření několika bodů, aby se automaticky nastavila výška tiskové plochy a posun (XY) mezi oběma tryskami. Vždy tak získáte dokonalou první vrstvu, aniž by byl nutný jakýkoli zásah uživatele.\r\n\r\nVylepšená elektronika u verze gen2\r\n\r\nNový ventilační systém: Dříve ventilační systém přiváděl studený vzduch dovnitř ventilátorů s odsáváním směrem k jiné mřížce. Bylo zjištěno, že to potenciálně způsobuje turbulence v interiéru, což vede k občasné neefektivitě. Pro vyřešení tohoto problému je nyní proud teplého vzduchu odváděn z interiéru a snižuje vnitřní tlak, aby interiér mohl absorbovat vzduch zvenčí.\r\nNové ovladače motoru: Motor Trinamic TMC2130 byl nahrazen motorem TMC2226. Tyto nové ovladače jsou nejen velmi tiché, ale mají také vyšší účinnost a lepší točivý moment motoru. Zatímco jejich předchůdci vyžadovali k chlazení chladiče, tyto nové se naopak zahřívají jen velmi málo.\r\nNová základní deska: Odklonili jsme se od komerčních komponent a rozhodli jsme se pro komponenty vyrobené na zakázku speciálně pro naše produkty. Ty byly soustředěny do jediné desky, na rozdíl od toho, aby byly tvořeny několika komerčními kusy implementovanými v různých částech tiskárny. Tato výrazná redukce nabízí jednodušší a následně efektivnější hlavní desku.', '175999.00', NULL, 'BCN3D-Epsilon-W27', 'instock', 0, 4, '6.png', '7.png', 1, 4, 1, NULL, NULL),
(37, 'BCN3D Epsilon W50', 'BCN3D-Epsilon-W50', 'BCN3D Epsilon W50 je odolná, pevná a snadno použitelná stolní 3D tiskárna s nezávislým duálním vytlačovacím systémem (IDEX). Použijte ji k výrobě aditivních přesných a detailních dílů z různých materiálů a barev.', 'BCN3D Epsilon W50 je odolná, pevná a snadno použitelná stolní 3D tiskárna s nezávislým duálním vytlačovacím systémem (IDEX). Použijte ji k výrobě aditivních přesných a detailních dílů z různých materiálů a barev.\r\n\r\nVlastnosti produktu: - je vyroben z vysoce kvalitního materiálu, který je určen pro výrobu plastů:\r\nTiskový objem: 420 mm x 300 mm x 400 mm.\r\nVysoce výkonný extruder od společnosti Bondtech.\r\n\r\nSystém IDEX pro nezávislý 3D tisk se dvěma extrudery.\r\n\r\nBCN3D Epsilon W50\r\n\r\nEpsilon W50 je výkonná profesionální 3D tiskárna, která je díky vlastnostem, jako je pasivní vyhřívaná komora a plný kryt, navržena pro výrobu velkých dílů z materiálů průmyslové kvality. Tiskárna Epsilon W50 je poháněna naším systémem IDEX (Independent Dual Extruder) a poskytuje výjimečně silné funkční díly s kvalitou a přesností.\r\n\r\nHlavní vlastnosti výrobku:\r\n\r\nVyhřívané lůžko až do 120 ºC, které umožňuje tisknout s materiály inženýrské kvality a předcházet problémům s deformacemi.\"\r\n\r\nLůžko e3D™Hotends bylo pečlivě navrženo tak, aby poskytovalo co nejhladší a nejspolehlivější vytlačování.\r\n\r\nŘada BCN3D Epsilon je vybavena vícejazyčným dotykovým displejem, který vás provede jejími pokročilými funkcemi.\r\n\r\nRobustní hliníkový rám pro zaručenou pevnost a odolnost na vaší pracovní ploše.\r\n\r\nExtrudéry Bondtech™ jsou vybaveny špičkovými dvojitými převody pohonu, které nabízejí větší kontrolu, ostřejší detaily a vynikající výkon pro jakýkoli typ filamentu.\r\n\r\nSenzor vyčerpání filamentu, který zjistí, kdy je filament vyčerpán, a pozastaví proces tisku, dokud není znovu vložen.\r\n\r\nVytvářejte velké funkční díly se solidními mechanickými vlastnostmi.\r\n\r\nOdemkněte širokou škálu technických aplikací s průmyslovými filamenty BCN3D, které vyvinuly renomované chemické společnosti: BASF a Mitsubishi Chemical, nebo pracujte bez obav s jakýmkoli materiálem třetí strany podle vlastního výběru díky našemu systému otevřených vláken.\r\n\r\nPowered by IDEX Technology\r\n\r\nPřevratná technologie Independent Dual Extrusion System, vyvinutá společností BCN3D, představuje rozdíl v 3D tisku.\r\n\r\nZrcadlový režim\r\n\r\nRežim, který umožňuje tisknout zrcadlově symetrické návrhy a urychluje iteraci.\"\r\n\r\nRežim rozpustných podpor\r\n\r\nProces, který tiskne rozpustné díly pro vytváření složitých struktur a vyhnutí se geometrickým omezením.\r\n\r\nMultimateriálový režim\r\n\r\nTechnika, která umožňuje tisknout dva různé materiály a kombinovat jejich vlastnosti.', '225690.00', NULL, 'BCN3D-Epsilon-W50', 'instock', 0, 3, '8.png', '9.png', 1, 4, 1, NULL, NULL),
(38, 'Creality Halot One CL-60', 'creality-halot-one-cl-60', 'Creality Halot-One CL-60 je malý a cenově výhodný bratr tiskárny Creality Halot-Sky CL-89 a je ideální pro první kroky v resinovém 3D tisku.', 'Creality Halot-One CL-60 je malý a cenově výhodný bratr tiskárny Creality Halot-Sky CL-89 a je ideální pro první kroky v resinovém 3D tisku.\r\n\r\nObjem tisku: 130 x 82 x 160 mm\r\n\r\nWiFi připojení\r\n\r\nDíky připojení WLAN lze tiskárnu Creality Halot-One pohodlně ovládat, aniž byste se museli přesouvat k tiskárně (za předpokladu, že je nádržka pro pryskyřice již naplněna). Stav tisku v reálném čase je vždy zobrazen prostřednictvím aplikace Creality.\r\n\r\nPokud dáváte přednost tradičnímu způsobu, lze tiskové soubory samozřejmě také přenést na resinovou tiskárnu pomocí USB flash disku. 64-bitový 4-jádrový procesor ARM Cortex-A53\r\n\r\nUvnitř tiskárny je čip Cortex-A53 M4 od britské společnosti ARM, který zaručuje vysoký výkon a hladký provoz.\r\n\r\nIntegrovaný světelný zdroj\r\n\r\nCreality Halot-One obsahuje nejnovější technologii světelných zdrojů, včetně systému založeného na odrazu. Tento inovativní systém nabízí lepší světlo a větší přesnost než kdykoliv předtím.\r\n\r\n120W výkonové bodové světlo (Power Super Spotlight)\r\n4000 uw/m/\r\n> 80% uniformita\r\n5,96\" monochromatický LCD\r\n\r\nSvětlo svítí přes 5,96 \"monochromatický LCD displej s rozlišením 2560 x 1620.\r\n\r\nOTA (Over-the-Air Technology)\r\n\r\nDíky technologii OTA lze firmware aktualizovat na novou verzi jediným kliknutím po připojení k WiFi.\r\n\r\nPrůmyslový design\r\n\r\nVzhled moderní 3D tiskárny s kovovým vzhledem a průhledným krytem zaujme svou elegancí a průmyslovým designem. 5-palcová dotyková obrazovka\r\n\r\nUživatelsky přívětivá 5-palcová dotyková obrazovka ve formátu na výšku je jasná a světlá. Všechna důležitá nastavení tiskárny jsou dostupná prostřednictvím inovativního systému nabídky.\r\n\r\nNekomplikovaný slicing software\r\n\r\nSlicing software vyvinutý vlastními silami s uživatelsky přívětivým rozhraním usnadňuje slicing a zvyšuje tak efektivitu.\r\n\r\nDvojitý chladicí systém pro efektivní chlazení a filtrování\r\n\r\nHalot One má speciálně vyvinutý systém dvojitého chlazení pro rychlé chlazení. Systém vzduchového filtru s aktivním uhlím účinně snižuje emise zápachu.\r\n\r\nStabilní osa Z\r\n\r\nRobustní struktura osy Z se širšími a silnějšími profily minimalizuje tiskové chyby a zvyšuje přesnost tisku.', '5490.00', NULL, 'creality-halot-one-cl-60', 'instock', 0, 15, '24.jpeg', '25.jpeg', 1, 1, 3, NULL, NULL),
(39, 'Creality Halot One Plus, CL-79', 'Creality-Halot-One-Plus', '3D tiskárna Creality Resin, 3D tiskárna HALOT-ONE Plus se 7,9palcovým mono LCD displejem 4K a velmi vysokou přesností tisku,', '3D tiskárna Creality Resin, 3D tiskárna HALOT-ONE Plus se 7,9palcovým mono LCD displejem 4K a velmi vysokou přesností tisku,\r\n\r\n\r\nVelikost tisku - 7,9\" 172*102*160 mm\r\nRozlišení 4320*2560 (4K)\r\nDotykový displej s úhlopříčkou 5 palců\r\nRychlost tisku: 1-4s/vrstva\r\nVelká obrazovka LCD umožňuje tisk živých detailů\r\nMono LCD displej s rozlišením 4K živě vytiskne každý detail, čímž se kreativita stává hmatatelnou.\r\n\r\nVylepšený stavební objem 172*102*160 mm.\r\nVětší displej - kolébka pro představivost\r\nHALOT-ONE PLUS využívá 7,9palcový 4K monochromatický LCD displej se 73% nárůstem objemu ve srovnání s 6palcovým LCD displejem, který živě vytiskne každý detail velkých modelů.\r\n\r\nOsa Z se dvěma lineárními lištami Stabilnější pohyb\r\nOsa Z se dvěma lineárními kolejnicemi spolu se šroubovací tyčí ve tvaru T zajišťuje přesný a stabilní pohyb. Nedochází k odchylkám tištěné vrstvy a účinně snižuje strukturu vrstvy. Dokonce i složité modely budou vytištěny dokonale.\r\n\r\nVysoká kompatibilita s řezacím softwarem Širší výběr softwaru;\r\nKompatibilita s programy HALOT-BOX, Lychee a CHITUBOX, krájení s vysokou účinností.\r\n\r\n', '9950.00', NULL, 'Creality-Halot-One-Plus', 'instock', 0, 4, '23.png', '', 1, 1, 3, NULL, NULL),
(40, 'Creality Halot Lite', 'Creality-Halot-Lite', 'HALOT-LITE je nejnovějším přírůstkem známého výrobce Creality. Tato tiskárna je první z řady tiskáren nové generace. HALO je dokonalou vlajkovou lodí pro začátečníky a dokáže překonat i dražší tiskárny na trhu.', 'HALOT-LITE je nejnovějším přírůstkem známého výrobce Creality. Tato tiskárna je první z řady tiskáren nové generace. HALO je dokonalou vlajkovou lodí pro začátečníky a dokáže překonat i dražší tiskárny na trhu.\r\n\r\nIntegrovaný zdroj světla\r\n\r\nTiskárna HALOT-LITE je vybavena novou technologií světelného zdroje nejnovější generace včetně systému založeného na odrazu světla. Tato funkce poskytuje lepší světlo s větší přesností než kdykoli předtím.\r\n\r\nMonochromatický displej LCD\r\n\r\nNejnovější typy monochromatických LCD´s mají tu výhodu, že vydrží mnohem déle než starší typy LCD. Životnost až 2000 hodin je přibližně 4krát delší než u barevného LCD. Díky monochromatickému LCD displeji také tisknete mnohem rychleji než obvykle, a to až 60 mm/hod.\r\n\r\nVelká stavební plocha tiskárny HALOT má rozměry 192 x 120 x 200 mm, což by mělo vyhovovat většině uživatelů.\r\n\r\nDotykový displej s úhlopříčkou 5\" je umístěn v režimu na výšku a je jasný a přehledný. Z inovativního systému nabídek se dostanete ke všem důležitým nastavením tiskárny.\r\n\r\nDuální lineární vodicí lišty osy Z mají dvojitou konfiguraci a pomáhají zvýšit stabilitu a plynulost tiskového procesu.\r\n\r\nDíky připojení Wi-Fi podporuje tiskárna HALO pohodlnou aktualizaci softwaru vzduchem.\r\n\r\nAktivní uhlíková filtrace odstraňuje většinu zápachu a snižuje množství nebezpečných částic z procesu tisku. To znamená, že tiskárnu můžete používat i v místnosti, ve které trávíte čas, aniž byste byli obtěžováni výpary a částicemi.', '9590.00', NULL, 'Creality-Halot-Lite', 'instock', 0, 3, '24.png', '25.jpg', 1, 1, 3, NULL, NULL),
(41, 'Bambu Lab X1 Carbon Combo', 'Bambu-Lab-X1-Carbon-Combo', 'Zcela nová 3D tiskárna od výrobce Bambu Lab. Díky špičkové technologii a elegantnímu designu poskytuje tato tiskárna bezkonkurenční přesnost, rychlost a všestrannost.', 'Bambu Lab X1 Carbon Combo je skvělá 3D tiskárna s mnoha pokročilými funkcemi. Díky špičkové technologii a elegantnímu designu poskytuje tato tiskárna bezkonkurenční přesnost, rychlost a všestrannost. 3D tiskárna Bambu Lab X1 Carbon je vybavena vysoce kvalitním a pevným rámem a bez námahy zvládne všechny vaše tiskové potřeby. Ať už tisknete složité modely, formy nebo prototypy, tato tiskárna Vám pokaždé zajistí ohromující výsledky.\r\n\r\nTisková plocha je maximálně 256 x 256 x 256 mm, který vám umožní snadno vytvářet větší a složitější objekty. Díky pokročilým funkcím, jako je například umělá inteligence kontrolující první vrstvu, detekce tiskových chyb a plně automatická kalibrace tiskové podložky, posouvá tiskárna Bambu Lab X1 Carbon 3D tisk na vyšší úroveň.\r\n\r\nMožnost nejen vícebarevného tisku\r\nPři zakoupení verze Combo je součástí balení jednotka umožňující automatickou výměnu filamentu (tzv. AMS). Můžete tak zcela jednoduše tisknout až ze 4 barev najednou, či kombinovat různé typy materiálů. Jednotka AMS umožní tisk ze 4 různých špulek filamentu. Je tedy pouze na Vás zdali toto budete využívat pro změnu barvy filamentu, typu filamentu či např. pro rozpustitelné filamenty k snazšímu sundavání podpor z výtisku. \r\n\r\nJednotky se mohou pomocí AMS Hubu propojit (až 4 jednotky), celkově je tak možné tisknout až ze 16 barev/filamentů.', '44990.00', NULL, 'Bambu-Lab-X1-Carbon-Combo', 'instock', 0, 9, '18.png', '19.png', 1, 3, 2, NULL, NULL),
(42, 'Creality K1 + filamenty', 'Creality-K1', 'Kompletně sestavená a připravená k použití 3D tiskárna Creality K1 se dodává sestavená a zkalibrovaná! Předinstalovaný průvodce rychlým startem vás provede nastavením, takže můžete začít tisknout několik minut po vybalení tiskárny.', 'Kompletně sestavená a připravená k použití 3D tiskárna Creality K1 se dodává sestavená a zkalibrovaná! Předinstalovaný průvodce rychlým startem vás provede nastavením, takže můžete začít tisknout několik minut po vybalení tiskárny.\r\n\r\nVysoká rychlost\r\n\r\nJejí vysoká rychlost zkracuje dobu tisku, a šetří energii při stejném výsledku. Se zrychlením 20 000 mm/s je K1 až 12x rychlejší než ostatní FDM tiskárny na trhu. Typická rychlost tiskových pohybů K1 je 300 mm/s, maximální rychlost pohybu je až 800 mm/s!\r\n\r\nHigh Flow Hotend\r\n\r\nHotend ze slitiny titanu je navržen tak, aby odolával vysokým teplotám až 300 °C a novému keramickému topnému tělísku trvá nahřátí na 200 °C pouhých 40 sekund. Tryska o průmeru 0,4 mm ze slitiny mědi odolá všem běžně používaným materiálům. Maximální průtok je 32 mm²/s.\r\n\r\nAutomatická kalibrace první vrstvy\r\n\r\nVyhřívaná podložka modelu K1 je vyrobena z hliníkové slitiny a dosahuje teploty 60 °C za pouhých 180 sekund. Jsou v ní zabudovány tenzometrické snímače, které vytvářejí přesnou nivelační síť. Nivelace probíhá automaticky před zahájením tisku a nevyžaduje žádný zásah uživatele.\r\n\r\nKonektivita\r\n\r\nCreality K1 může tisknout z přibaleného USB disku, nebo prostřednictvím Wi-Fi, kdy lze tiskárnu vzdáleně ovládat z nové aplikace Creality Print nebo Creality Cloud/Web. Pokud je k síti připojeno několik tiskáren, je možné také hromadné ovládání Cluster. Creality Print přichází v nové verzi 4.3 s množstvím předvoleb, které zkracují proces slicingu na 3 jednoduché kroky.   ', '11599.00', NULL, 'Creality-K1', 'instock', 0, 13, '27.jpg', '', 3, 1, 2, NULL, NULL),
(43, 'Bambu Lab P1P', 'Bambu-Lab-P1P', 'Zcela nová 3D tiskárna od výrobce Bambu Lab. Mezi hlavní přednosti patří jednoduché uvedení do provozu během pár minut, CoreXY konstrukce, extrémně rychlý tisk, připojení přes Wi-Fi a další.', 'Zcela nová 3D tiskárna od výrobce Bambu Lab. Mezi hlavní přednosti patří jednoduché uvedení do provozu během pár minut, CoreXY konstrukce, extrémně rychlý tisk, připojení přes Wi-Fi a další.', '17990.00', NULL, 'Bambu-Lab-P1P', 'instock', 0, 2, '20.jpeg', '', 1, 3, 2, NULL, NULL),
(44, 'Bambu Lab A1 Mini + Filamenty', 'Bambu-Lab-A1-Mini', 'Zatímco známé modely X1 a P1 jsou založeny na konstrukci coreXY, A1 mini je takzvaný bedslinger. Je menší, stále ale nabízí všechny výhody a pokročilé technologie, na které jsme u 3D tiskáren Bambu Lab zvyklí.', 'Zatímco známé modely X1 a P1 jsou založeny na konstrukci coreXY, A1 mini je takzvaný bedslinger. Je menší, stále ale nabízí všechny výhody a pokročilé technologie, na které jsme u 3D tiskáren Bambu Lab zvyklí.LED osvětlení\r\n\r\nNe\r\n\r\nPevný rám a lineární vedení\r\n\r\nPřestože design A1 mini vypadá křehce, díky výběru kvalitních komponent nabízí rychlost a přesnost tisku srovnatelnou s tiskárnami založenými na architektuře coreXY.\r\n\r\nPokročilá automatiká kalibrace\r\n\r\nA1 mini si všechny nezbytné kalibrace obstará bez nutnosti zásahu uživatele. Před každým tiskem probíhá kalibrace první vrstvy, kalibrace potlačení vibrací a kalibrace průtoku materiálu tryskou.\r\n\r\nTichý chod\r\n\r\nDíky inovativní technologii aktivního potlačení hluku tiskárna vydává jen 48 db. Za chodu tiskárny uslyšíte jen šumění větráčků.\r\n\r\nMulti-materiálový upgrade\r\n\r\nVícebarvný či vícemateriálový tisk je v případě Bambu Lab A1 na úrovni plug-and-play. Systém zahrnuje opratření proti zamotání filamentu a výměna vlákna během tisku je mnohem rychlejší než v přpíadě klasického AMS.', '14450.00', NULL, 'Bambu-Lab-A1-Mini', 'instock', 0, 3, '17.png', '', 3, 3, 2, NULL, NULL),
(45, 'Bambu Lab A1 Combo + Filamenty', 'Bambu-Lab-A1-Combo', 'Co je to za novou tiskárnu 3D A1? Je to další model od Bambu Labs, s bed slinger, a je větší než A1 mini. Má stejný objem tisku 256x256x256 mm jako tiskárny řady X1/P1. ', 'Co je to za novou tiskárnu 3D A1?\r\n\r\nJe to další model od Bambu Labs, s bed slinger, a je větší než A1 mini. Má stejný objem tisku 256x256x256 mm jako tiskárny řady X1/P1.\r\n\r\nTo má velký smysl z hlediska náhradních dílů a tiskových podložek. Navíc se lépe integruje do knihovny modelů makerworld, což umožňuje snadnou konverzi všech tiskových podložek X1/P1.\r\n\r\nNaštěstí tato nová A1 staví na velmi úspěšných vlastnostech modelu A1 Mini, jako je beznástrojová výměna hotendu, potlačení hluku a tlumení vibrací a velmi pěkné ovládací dotykové rozhraní. Když ji spojíte s AMS Lite (není kompatibilní s \"běžným\" AMS), získáte velmi schopnou tiskárnu 3D!\r\n\r\nV čem je teda nová A1 combo skvělá?\r\n\r\nA1 Mini je určena pro začátečníky a tisk ve více barvách s jednoduchými, cenově dostupnými materiály, jako je PLA. A1 bude dělat přesně totéž, ale s trochu větším objemem. To pro mnoho uživatelů Bambu Lab nemusí být příliš zajímavé, ale pro širší veřejnost to představuje další skvělý způsob, jak se dostat do 3D tisku na začátečnické úrovni, s možností využití AMS Lite.', '18999.00', NULL, 'Bambu-Lab-A1-Combo', 'instock', 0, 6, '21.png', '22.png', 3, 3, 2, NULL, NULL),
(47, 'Bambu Lab A1 Combo', 'Bambu-Lab-A1-Combo-bezF', 'Co je to za novou tiskárnu 3D A1? Je to další model od Bambu Labs, s bed slinger, a je větší než A1 mini. Má stejný objem tisku 256x256x256 mm jako tiskárny řady X1/P1. ', 'Co je to za novou tiskárnu 3D A1?\r\n\r\nJe to další model od Bambu Labs, s bed slinger, a je větší než A1 mini. Má stejný objem tisku 256x256x256 mm jako tiskárny řady X1/P1.\r\n\r\nTo má velký smysl z hlediska náhradních dílů a tiskových podložek. Navíc se lépe integruje do knihovny modelů makerworld, což umožňuje snadnou konverzi všech tiskových podložek X1/P1.\r\n\r\nNaštěstí tato nová A1 staví na velmi úspěšných vlastnostech modelu A1 Mini, jako je beznástrojová výměna hotendu, potlačení hluku a tlumení vibrací a velmi pěkné ovládací dotykové rozhraní. Když ji spojíte s AMS Lite (není kompatibilní s \"běžným\" AMS), získáte velmi schopnou tiskárnu 3D!\r\n\r\nV čem je teda nová A1 combo skvělá?\r\n\r\nA1 Mini je určena pro začátečníky a tisk ve více barvách s jednoduchými, cenově dostupnými materiály, jako je PLA. A1 bude dělat přesně totéž, ale s trochu větším objemem. To pro mnoho uživatelů Bambu Lab nemusí být příliš zajímavé, ale pro širší veřejnost to představuje další skvělý způsob, jak se dostat do 3D tisku na začátečnické úrovni, s možností využití AMS Lite.', '17999.00', NULL, 'Bambu-Lab-A1-Combo-bezF', 'instock', 0, 7, '22.png', '', 1, 3, 2, NULL, NULL),
(48, 'Creality CR-Scan Ferret', 'Creality-CR-Scan-Ferret', 'Vysoká přesnost skenování velkých objektů: RANGE je navržen pro skenování velkých objektů s přesností jednoho snímku až 0,1 mm a s rozsahem jednoho snímání 360 mm x 650 mm.', 'Vysoká přesnost skenování velkých objektů: RANGE je navržen pro skenování velkých objektů s přesností jednoho snímku až 0,1 mm a s rozsahem jednoho snímání 360 mm x 650 mm @ 600 mm. Díky tomu je ideální pro skenování automobilů, nábytku, a dokonce i osob. Díky rychlému a přesnému skenování můžete upravovat auta, navrhovat oblečení a realizovat kreativní nápady. -\r\n\r\nRychlejší a vzdálenější skenování: Vysoce výkonný projektor RANGE snímá data mračna bodů na dvojnásobnou vzdálenost (300 mm ~ 800 mm) než POP 2. Jasné strukturované světelné obrazce projektoru s vysokým rozlišením zlepšují poměr signálu k šumu. Díky rychlosti skenování až 18 snímků za sekundu můžete skenovat plynule a rychle. -\r\n\r\nOstré a barevné 3D modely: RANGE používá vysoce kvalitní asférické čočky, které snižují aberaci obrazu a zajišťují ostřejší a jasnější 3D skenování. Díky kameře RGB modelu RANGE můžete také provádět barevné skeny v plných barvách, které jsou téměř realistické. -\r\n\r\nIntuitivní software: Uživatelsky přívětivá bezplatná aplikace Rev o Scan provede uživatele kompletním skenováním a následným zpracováním. I když jste začátečník, můžete snadno provést skenování. Optimalizované inteligentní algoritmy a vestavěný procesor znamenají, že skener RANGE pracuje s počítači kancelářské úrovně. -\r\n\r\nVynikající kompatibilita: Skenery Revopoint jsou kompatibilní se systémy Windows, macOS, iOS a Android. Podporují ruční skenování a skenování s podporou příslušenství.  ', '8850.00', NULL, 'Creality-CR-Scan-Ferret', 'instock', 0, 4, '33.jpg', '32.jpg', 2, 1, 0, NULL, NULL),
(49, 'Creality CR-Scan 01', 'Creality-CR-Scan-01', 'Váš průvodce do kyberprostoru, se kterým objevíte zcela nový rozměr trojrozměrného skenování. Součástí balení je stativ, otočný stůl a přenosné pouzdro.', 'Hlavní výhody skeneru Creality CR\r\nRychlé skenování objektu.\r\nVysoká přesnost.\r\nPodpora více jazyků.\r\nAutomatické zpracování dat.\r\nVěrné, pestré barvy.\r\nInteligentní přizpůsobení okolnímu světlu.\r\nRežim manuálního skenování – flexibilní a přenosný\r\nManuální skenování umožňuje skenování objektů různých velikostí bez značkovacích bodů. Tento režim je vhodný pro skenování objektů v exteriéru.\r\n\r\n\r\nRežim otočného stolu realizuje skenování otáčející se o 360°\r\nTento režim, s použitím stativu a otočného stolu, umožňuje 360° skenování. Kompletní skenování se spouští jedním kliknutím. Software podporuje automatickou kalibraci a usnadňuje získání kompletního a přesného modelu.\r\n\r\n\r\n\r\nVysoká přesnost skenování i velkých objektů\r\nO kvalitu modelu se nemusíte bát ani u větších objektů, kdy je přesnost skenování stále na 0,1 mm.\r\n\r\n\r\nUltimátní velký formát\r\nSkenovací formát je 1,5krát větší než u tradičních skenerů. Snadno tak lze skenovat středně velké a velké objekty nebo celá těla.\r\n\r\n\r\nAutomatické kalibrování více pozic\r\nVysoce přesný přiřazovací algoritmus založený na barevných a strukturálních rysech dosahuje funkce automatické kompozice vícepozicového skenování.\r\n\r\nAutomatické zarovnání\r\nInteligentní algoritmus širokého rozsahu zarovnání zajišťuje automatické párování a nevyžaduje použití značkovacích bodů.\r\n\r\n\r\nVěrné, pestré barvy\r\n24bitové, pestré barvy jsou věrné skutečným barvám a zaručují vynikající výsledek tisku.\r\n\r\nVýkonná metoda zpracování modelu\r\nMezi další užitečné funkce skeneru patří automatická úprava modelu, oprava výplní, oprava barev, automatická rekognoskace podkladu, nedestruktivní zjednodušení sítě nebo automatická hladká denoizace.\r\n\r\n\r\nGlobální vícejazyčnost\r\nAby si zábavu s 3D skenováním mohlo užít co nejširší spektrum lidí, podporuje skener více typů napájecích zástrček a také několik světových jazyků.\r\n\r\nSkvělé výsledky i ve ztížených světelných podmínkách\r\nCR-Scan 01 dokáže vysoce přesně skenovat objekty i ve špatných světelných podmínkách. Vy tak můžete bez starostí skenovat objekty umístěné v prostoru s nedostatečným osvětlením.', '20490.00', NULL, 'Creality-CR-Scan-01', 'instock', 0, 4, '37.jpg', '38.jpg,39.jpg', 2, 1, 0, NULL, NULL),
(50, 'CR-Scan Lizard Premium', 'CR-Scan-Lizard-Premium', 'Creality CR-Scan Lizard je velmi efektivní nástroj, který umožňuje v reálném čase skenovat menší objekty a vytvářet z nich 3D modely, které lze následně vytisknout a vytvořit.', 'Creality CR-Scan Lizard je velmi efektivní nástroj, který umožňuje v reálném čase skenovat menší objekty a vytvářet z nich 3D modely, které lze následně vytisknout a vytvořit tak kopii skenovaného objektu. Skener využívá kameru k zachycování povrchu modelu a efektivní algoritmus k generování 3D objektu. Proces skenování je podobný natáčení videa. Dalším krokem je postprodukce pomocí nástroje CR Studio, kde jedním kliknutím spustíte optimalizaci 3D objektu, včetně automatického zarovnání, redukce šumu, automatického mapování textury a dalších úprav. Tímto šikovným nástrojem ušetříte spoustu času, který byste jinak strávili ručním modelováním objektů.', '19990.00', NULL, 'CR-Scan-Lizard-Premium', '', 0, 4, '34.jpg', '36.jpg,35.jpg', 2, 1, 0, NULL, NULL),
(51, 'CR-Scan Lizard ', 'CR-Scan-Lizard', 'Creality CR-Scan Lizard je velmi efektivní nástroj, který umožňuje v reálném čase skenovat menší objekty a vytvářet z nich 3D modely, které lze následně vytisknout a vytvořit.', 'Creality CR-Scan Lizard je velmi efektivní nástroj, který umožňuje v reálném čase skenovat menší objekty a vytvářet z nich 3D modely, které lze následně vytisknout a vytvořit tak kopii skenovaného objektu. Skener využívá kameru k zachycování povrchu modelu a efektivní algoritmus k generování 3D objektu. Proces skenování je podobný natáčení videa. Dalším krokem je postprodukce pomocí nástroje CR Studio, kde jedním kliknutím spustíte optimalizaci 3D objektu, včetně automatického zarovnání, redukce šumu, automatického mapování textury a dalších úprav. Tímto šikovným nástrojem ušetříte spoustu času, který byste jinak strávili ručním modelováním objektů.', '17990.00', NULL, 'CR-Scan-Lizard-Premium', '', 0, 4, '34.jpg', '36.jpg,35.jpg', 2, 1, 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `shippings`
--

CREATE TABLE `shippings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `locality` varchar(255) NOT NULL,
  `address` text NOT NULL,
  `city` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL,
  `landmark` varchar(255) DEFAULT NULL,
  `zip` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL DEFAULT 'home',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `technologies`
--

CREATE TABLE `technologies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `technologies`
--

INSERT INTO `technologies` (`id`, `created_at`, `updated_at`, `name`, `slug`) VALUES
(1, NULL, NULL, 'FFF', 'fff'),
(2, NULL, NULL, 'FDM', 'fdm'),
(3, NULL, NULL, 'SLA', 'sla'),
(4, NULL, NULL, 'SLS', 'sls'),
(5, NULL, NULL, 'LFS', 'lfs');

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `mode` enum('cod','card','paypal') NOT NULL,
  `status` enum('pending','approved','declined','refunded') NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `utype` varchar(255) NOT NULL DEFAULT 'USR',
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `brands_name_unique` (`name`),
  ADD UNIQUE KEY `brands_slug_unique` (`slug`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_name_unique` (`name`),
  ADD UNIQUE KEY `categories_slug_unique` (`slug`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_items_product_id_foreign` (`product_id`),
  ADD KEY `order_items_order_id_foreign` (`order_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `products_slug_unique` (`slug`),
  ADD KEY `products_category_id_foreign` (`category_id`),
  ADD KEY `products_brand_id_foreign` (`brand_id`);

--
-- Indexes for table `shippings`
--
ALTER TABLE `shippings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `shippings_order_id_foreign` (`order_id`);

--
-- Indexes for table `technologies`
--
ALTER TABLE `technologies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transactions_user_id_foreign` (`user_id`),
  ADD KEY `transactions_order_id_foreign` (`order_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `shippings`
--
ALTER TABLE `shippings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `technologies`
--
ALTER TABLE `technologies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_brand_id_foreign` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `shippings`
--
ALTER TABLE `shippings`
  ADD CONSTRAINT `shippings_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `transactions_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `transactions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
