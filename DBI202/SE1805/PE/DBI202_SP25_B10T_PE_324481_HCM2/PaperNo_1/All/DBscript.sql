USE [master]
GO

/*******************************************************************************
   Drop database if it exists
********************************************************************************/
IF EXISTS (SELECT name FROM master.dbo.sysdatabases WHERE name = N'PE_DBI202_SP25')
BEGIN
	ALTER DATABASE [PE_DBI202_SP25] SET OFFLINE WITH ROLLBACK IMMEDIATE;
	ALTER DATABASE [PE_DBI202_SP25] SET ONLINE;
	DROP DATABASE [PE_DBI202_SP25];
END

GO

CREATE DATABASE [PE_DBI202_SP25]
GO

USE [PE_DBI202_SP25]
GO
GO
CREATE TABLE [dbo].[categories](
	[category_id] [int] IDENTITY(1,1) NOT NULL,
	[category_name] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[category_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[customers]    Script Date: 2/22/2025 12:57:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[customers](
	[customer_id] [int] IDENTITY(1,1) NOT NULL,
	[first_name] [varchar](255) NOT NULL,
	[last_name] [varchar](255) NOT NULL,
	[phone] [varchar](25) NULL,
	[email] [varchar](255) NOT NULL,
	[street] [varchar](255) NULL,
	[city] [varchar](50) NULL,
	[state] [varchar](25) NULL,
	[zip_code] [varchar](5) NULL,
PRIMARY KEY CLUSTERED 
(
	[customer_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[order_items]    Script Date: 2/22/2025 12:57:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[order_items](
	[order_id] [int] NOT NULL,
	[item_id] [int] NOT NULL,
	[product_id] [int] NOT NULL,
	[quantity] [int] NOT NULL,
	[list_price] [decimal](10, 2) NOT NULL,
	[discount] [decimal](4, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[order_id] ASC,
	[item_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[orders]    Script Date: 2/22/2025 12:57:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orders](
	[order_id] [int] IDENTITY(1,1) NOT NULL,
	[customer_id] [int] NULL,
	[order_status] [tinyint] NOT NULL,
	[order_date] [date] NOT NULL,
	[required_date] [date] NOT NULL,
	[shipped_date] [date] NULL,
	[store_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[products]    Script Date: 2/22/2025 12:57:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[products](
	[product_id] [int] IDENTITY(1,1) NOT NULL,
	[product_name] [varchar](255) NOT NULL,
	[category_id] [int] NOT NULL,
	[model_year] [smallint] NOT NULL,
	[list_price] [decimal](10, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[stocks]    Script Date: 2/22/2025 12:57:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[stocks](
	[store_id] [int] NOT NULL,
	[product_id] [int] NOT NULL,
	[quantity] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[store_id] ASC,
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[stores]    Script Date: 2/22/2025 12:57:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[stores](
	[store_id] [int] IDENTITY(1,1) NOT NULL,
	[store_name] [varchar](255) NOT NULL,
	[phone] [varchar](25) NULL,
	[email] [varchar](255) NULL,
	[street] [varchar](255) NULL,
	[city] [varchar](255) NULL,
	[state] [varchar](10) NULL,
	[zip_code] [varchar](5) NULL,
PRIMARY KEY CLUSTERED 
(
	[store_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[categories] ON 
GO
INSERT [dbo].[categories] ([category_id], [category_name]) VALUES (1, N'Children Bicycles')
GO
INSERT [dbo].[categories] ([category_id], [category_name]) VALUES (2, N'Comfort Bicycles')
GO
INSERT [dbo].[categories] ([category_id], [category_name]) VALUES (3, N'Cruisers Bicycles')
GO
INSERT [dbo].[categories] ([category_id], [category_name]) VALUES (4, N'Cyclocross Bicycles')
GO
INSERT [dbo].[categories] ([category_id], [category_name]) VALUES (5, N'Electric Bikes')
GO
INSERT [dbo].[categories] ([category_id], [category_name]) VALUES (6, N'Mountain Bikes')
GO
SET IDENTITY_INSERT [dbo].[categories] OFF
GO
SET IDENTITY_INSERT [dbo].[customers] ON 
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1, N'Debra', N'Burks', NULL, N'debra.burks@yahoo.com', N'9273 Thorne Ave. ', N'Orchard Park', N'NY', N'14127')
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (2, N'Kasha', N'Todd', NULL, N'kasha.todd@yahoo.com', N'910 Vine Street ', N'Campbell', N'CA', N'95008')
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (3, N'Tameka', N'Fisher', NULL, N'tameka.fisher@aol.com', N'769C Honey Creek St. ', N'Redondo Beach', N'CA', N'90278')
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (4, N'Daryl', N'Spence', NULL, N'daryl.spence@aol.com', N'988 Pearl Lane ', N'Uniondale', N'NY', N'11553')
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (5, N'Charolette', N'Rice', N'(916) 381-6003', N'charolette.rice@msn.com', N'107 River Dr. ', N'Sacramento', N'CA', N'95820')
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (6, N'Lyndsey', N'Bean', NULL, N'lyndsey.bean@hotmail.com', N'769 West Road ', N'Fairport', N'NY', N'14450')
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (7, N'Latasha', N'Hays', N'(716) 986-3359', N'latasha.hays@hotmail.com', N'7014 Manor Station Rd. ', N'Buffalo', N'NY', N'14215')
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (8, N'Jacquline', N'Duncan', NULL, N'jacquline.duncan@yahoo.com', N'15 Brown St. ', N'Jackson Heights', N'NY', N'11372')
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (9, N'Genoveva', N'Baldwin', NULL, N'genoveva.baldwin@msn.com', N'8550 Spruce Drive ', N'Port Washington', N'NY', N'11050')
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (10, N'Pamelia', N'Newman', NULL, N'pamelia.newman@gmail.com', N'476 Chestnut Ave. ', N'Monroe', N'NY', N'10950')
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (11, N'Deshawn', N'Mendoza', NULL, N'deshawn.mendoza@yahoo.com', N'8790 Cobblestone Street ', N'Monsey', N'NY', N'10952')
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (12, N'Robby', N'Sykes', N'(516) 583-7761', N'robby.sykes@hotmail.com', N'486 Rock Maple Street ', N'Hempstead', N'NY', N'11550')
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (13, N'Lashawn', N'Ortiz', NULL, N'lashawn.ortiz@msn.com', N'27 Washington Rd. ', N'Longview', N'TX', N'75604')
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (14, N'Garry', N'Espinoza', NULL, N'garry.espinoza@hotmail.com', N'7858 Rockaway Court ', N'Forney', N'TX', N'75126')
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (15, N'Linnie', N'Branch', NULL, N'linnie.branch@gmail.com', N'314 South Columbia Ave. ', N'Plattsburgh', N'NY', N'12901')
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (16, N'Emmitt', N'Sanchez', N'(212) 945-8823', N'emmitt.sanchez@hotmail.com', N'461 Squaw Creek Road ', N'New York', N'NY', N'10002')
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (17, N'Caren', N'Stephens', NULL, N'caren.stephens@msn.com', N'914 Brook St. ', N'Scarsdale', N'NY', N'10583')
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (18, N'Georgetta', N'Hardin', NULL, N'georgetta.hardin@aol.com', N'474 Chapel Dr. ', N'Canandaigua', N'NY', N'14424')
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (19, N'Lizzette', N'Stein', NULL, N'lizzette.stein@yahoo.com', N'19 Green Hill Lane ', N'Orchard Park', N'NY', N'14127')
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (20, N'Aleta', N'Shepard', NULL, N'aleta.shepard@aol.com', N'684 Howard St. ', N'Sugar Land', N'TX', N'77478')
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (21, N'Tobie', N'Little', NULL, N'tobie.little@gmail.com', N'10 Silver Spear Dr. ', N'Victoria', N'TX', N'77904')
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (22, N'Adelle', N'Larsen', NULL, N'adelle.larsen@gmail.com', N'683 West Kirkland Dr. ', N'East Northport', N'NY', N'11731')
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (23, N'Kaylee', N'English', NULL, N'kaylee.english@msn.com', N'8786 Fulton Rd. ', N'Hollis', N'NY', N'11423')
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (24, N'Corene', N'Wall', NULL, N'corene.wall@msn.com', N'9601 Ocean Rd. ', N'Atwater', N'CA', N'95301')
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (25, N'Regenia', N'Vaughan', NULL, N'regenia.vaughan@gmail.com', N'44 Stonybrook Street ', N'Mahopac', N'NY', N'10541')
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (26, N'Theo', N'Reese', N'(562) 215-2907', N'theo.reese@gmail.com', N'8755 W. Wild Horse St. ', N'Long Beach', N'NY', N'11561')
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (27, N'Santos', N'Valencia', NULL, N'santos.valencia@yahoo.com', N'7479 Carpenter Street ', N'Sunnyside', N'NY', N'11104')
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (28, N'Jeanice', N'Frost', NULL, N'jeanice.frost@hotmail.com', N'76 Devon Lane ', N'Ossining', N'NY', N'10562')
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (29, N'Syreeta', N'Hendricks', NULL, N'syreeta.hendricks@msn.com', N'193 Spruce Road ', N'Mahopac', N'NY', N'10541')
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (30, N'Jamaal', N'Albert', NULL, N'jamaal.albert@gmail.com', N'853 Stonybrook Street ', N'Torrance', N'CA', N'90505')
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (31, N'Williemae', N'Holloway', N'(510) 246-8375', N'williemae.holloway@msn.com', N'69 Cypress St. ', N'Oakland', N'CA', N'94603')
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (32, N'Araceli', N'Golden', NULL, N'araceli.golden@msn.com', N'12 Ridgeview Ave. ', N'Fullerton', N'CA', N'92831')
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (33, N'Deloris', N'Burke', NULL, N'deloris.burke@hotmail.com', N'895 Edgemont Drive ', N'Palos Verdes Peninsula', N'CA', N'90274')
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (34, N'Brittney', N'Woodward', NULL, N'brittney.woodward@aol.com', N'960 River St. ', N'East Northport', N'NY', N'11731')
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (35, N'Guillermina', N'Noble', NULL, N'guillermina.noble@msn.com', N'6 Del Monte Lane ', N'Baldwinsville', N'NY', N'13027')
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (36, N'Bernita', N'Mcdaniel', NULL, N'bernita.mcdaniel@hotmail.com', N'2 Peg Shop Ave. ', N'Liverpool', N'NY', N'13090')
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (37, N'Melia', N'Brady', NULL, N'melia.brady@gmail.com', N'907 Shirley Rd. ', N'Maspeth', N'NY', N'11378')
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (38, N'Zelma', N'Browning', NULL, N'zelma.browning@aol.com', N'296 Second Street ', N'Astoria', N'NY', N'11102')
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (39, N'Janetta', N'Aguirre', N'(717) 670-2634', N'janetta.aguirre@aol.com', N'214 Second Court ', N'Lancaster', N'NY', N'14086')
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (40, N'Ronna', N'Butler', NULL, N'ronna.butler@gmail.com', N'9438 Plymouth Court ', N'Encino', N'CA', N'91316')
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (41, N'Kathie', N'Freeman', NULL, N'kathie.freeman@msn.com', N'667 Temple Dr. ', N'Queensbury', N'NY', N'12804')
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (42, N'Tangela', N'Quinn', NULL, N'tangela.quinn@aol.com', N'4 S. Purple Finch Road ', N'Richmond Hill', N'NY', N'11418')
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (43, N'Mozelle', N'Carter', N'(281) 489-9656', N'mozelle.carter@aol.com', N'895 Chestnut Ave. ', N'Houston', N'TX', N'77016')
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (44, N'Onita', N'Johns', NULL, N'onita.johns@msn.com', N'32 Glen Creek Lane ', N'Elmont', N'NY', N'11003')
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (45, N'Bennett', N'Armstrong', NULL, N'bennett.armstrong@aol.com', N'688 Walnut Street ', N'Bethpage', N'NY', N'11714')
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (46, N'Monika', N'Berg', NULL, N'monika.berg@gmail.com', N'369 Vernon Dr. ', N'Encino', N'CA', N'91316')
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (47, N'Bridgette', N'Guerra', NULL, N'bridgette.guerra@hotmail.com', N'9982 Manor Drive ', N'San Lorenzo', N'CA', N'94580')
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (48, N'Cesar', N'Jackson', NULL, N'cesar.jackson@gmail.com', N'8068 N. Griffin Ave. ', N'Liverpool', N'NY', N'13090')
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (49, N'Caroll', N'Hays', NULL, N'caroll.hays@yahoo.com', N'9381 Wrangler St. ', N'Fairport', N'NY', N'14450')
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (50, N'Cleotilde', N'Booth', NULL, N'cleotilde.booth@gmail.com', N'17 Corona St. ', N'Sugar Land', N'TX', N'77478')
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (51, N'Gertrud', N'Rhodes', NULL, N'gertrud.rhodes@aol.com', N'9961 Meadowbrook Street ', N'Merrick', N'NY', N'11566')
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (52, N'Tu', N'Ramirez', NULL, N'tu.ramirez@hotmail.com', N'24 W. Courtland Street ', N'East Elmhurst', N'NY', N'11369')
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (53, N'Saturnina', N'Garner', NULL, N'saturnina.garner@gmail.com', N'8538 Fairground St. ', N'Glendora', N'CA', N'91740')
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (54, N'Fran', N'Yang', NULL, N'fran.yang@hotmail.com', N'440 Pearl St. ', N'Utica', N'NY', N'13501')
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (55, N'Diana', N'Guerra', NULL, N'diana.guerra@hotmail.com', N'45 Chapel Ave. ', N'Merrick', N'NY', N'11566')
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (56, N'Lolita', N'Mosley', N'(281) 363-3309', N'lolita.mosley@hotmail.com', N'376 S. High Ridge St. ', N'Houston', N'TX', N'77016')
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (57, N'Pamala', N'Henry', NULL, N'pamala.henry@aol.com', N'197 Bridgeton Ave. ', N'Bronx', N'NY', N'10451')
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (58, N'Damien', N'Dorsey', NULL, N'damien.dorsey@yahoo.com', N'161 Old York Street ', N'Central Islip', N'NY', N'11722')
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (59, N'Latasha', N'Stanley', NULL, N'latasha.stanley@gmail.com', N'8068 Fordham Drive ', N'Rockville Centre', N'NY', N'11570')
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (60, N'Neil', N'Mccall', NULL, N'neil.mccall@gmail.com', N'7476 Oakland Dr. ', N'San Carlos', N'CA', N'94070')
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (61, N'Elinore', N'Aguilar', NULL, N'elinore.aguilar@msn.com', N'9766 Rockcrest Ave. ', N'San Angelo', N'TX', N'76901')
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (62, N'Alica', N'Hunter', NULL, N'alica.hunter@hotmail.com', N'8 San Juan Drive ', N'East Elmhurst', N'NY', N'11369')
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (63, N'Tenisha', N'Lyons', NULL, N'tenisha.lyons@aol.com', N'78 E. Rock Creek Street ', N'Amityville', N'NY', N'11701')
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (64, N'Bobbie', N'Foster', NULL, N'bobbie.foster@yahoo.com', N'988 Pineknoll Ave. ', N'Desoto', N'TX', N'75115')
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (65, N'Kanesha', N'Vega', NULL, N'kanesha.vega@gmail.com', N'771 E. Oxford Drive ', N'Rome', N'NY', N'13440')
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (66, N'Lorrie', N'Becker', NULL, N'lorrie.becker@yahoo.com', N'19 North Court ', N'Garland', N'TX', N'75043')
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (67, N'Tommie', N'Melton', N'(916) 802-2952', N'tommie.melton@gmail.com', N'8 West Old York St. ', N'Sacramento', N'CA', N'95820')
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (68, N'Jayne', N'Kirkland', NULL, N'jayne.kirkland@hotmail.com', N'7800 Second Lane ', N'Rowlett', N'TX', N'75088')
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (69, N'Katelin', N'Kennedy', NULL, N'katelin.kennedy@gmail.com', N'286 Myrtle Lane ', N'Rocklin', N'CA', N'95677')
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (70, N'Tomasa', N'Carson', NULL, N'tomasa.carson@aol.com', N'10 Clark Avenue ', N'East Elmhurst', N'NY', N'11369')
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (71, N'Takako', N'Casey', NULL, N'takako.casey@aol.com', N'7548 Court Lane ', N'Bronx', N'NY', N'10451')
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (72, N'Petronila', N'Norris', NULL, N'petronila.norris@aol.com', N'72 South Marshall Lane ', N'South El Monte', N'CA', N'91733')
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (73, N'Melanie', N'Hayes', NULL, N'melanie.hayes@msn.com', N'5 N. Hall Dr. ', N'Liverpool', N'NY', N'13090')
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (74, N'Georgeann', N'Waller', NULL, N'georgeann.waller@yahoo.com', N'9797 Bald Hill Ave. ', N'North Tonawanda', N'NY', N'14120')
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (75, N'Abby', N'Gamble', NULL, N'abby.gamble@aol.com', N'60 Myers Dr. ', N'Amityville', N'NY', N'11701')
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (76, N'Parker', N'Prince', NULL, N'parker.prince@hotmail.com', N'21 Sulphur Springs Drive ', N'Port Jefferson Station', N'NY', N'11776')
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (77, N'Keri', N'Bridges', NULL, N'keri.bridges@gmail.com', N'8504 Brickell Ave. ', N'Richardson', N'TX', N'75080')
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (78, N'Chi', N'Goff', NULL, N'chi.goff@aol.com', N'3 W. Glen Ridge Avenue ', N'Palos Verdes Peninsula', N'CA', N'90274')
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (79, N'Ashanti', N'Parks', NULL, N'ashanti.parks@hotmail.com', N'846 N. Helen St. ', N'Baldwin', N'NY', N'11510')
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (80, N'Sarai', N'Mckee', N'(716) 912-8110', N'sarai.mckee@msn.com', N'641 Glenwood Avenue ', N'Buffalo', N'NY', N'14215')
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (81, N'Zina', N'Bonner', NULL, N'zina.bonner@hotmail.com', N'9312 8th Street ', N'San Lorenzo', N'CA', N'94580')
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (82, N'Lizzie', N'Joyner', NULL, N'lizzie.joyner@msn.com', N'8541 Roberts St. ', N'Coachella', N'CA', N'92236')
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (83, N'Tiesha', N'Daniel', NULL, N'tiesha.daniel@yahoo.com', N'6 West Bohemia Lane ', N'Scarsdale', N'NY', N'10583')
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (84, N'Armand', N'Whitehead', NULL, N'armand.whitehead@hotmail.com', N'639 Harvey St. ', N'Lindenhurst', N'NY', N'11757')
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (85, N'Teofila', N'Fischer', NULL, N'teofila.fischer@aol.com', N'1 West Brickyard St. ', N'Huntington Station', N'NY', N'11746')
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (86, N'Lissa', N'Vargas', NULL, N'lissa.vargas@yahoo.com', N'517 Victoria Ave. ', N'Oswego', N'NY', N'13126')
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (87, N'Yan', N'Mcgowan', NULL, N'yan.mcgowan@msn.com', N'8960 Newport Ave. ', N'Duarte', N'CA', N'91010')
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (88, N'Titus', N'Bullock', NULL, N'titus.bullock@gmail.com', N'29 Oxford Avenue ', N'Hollis', N'NY', N'11423')
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (89, N'Arvilla', N'Osborn', NULL, N'arvilla.osborn@gmail.com', N'60 Acacia Lane ', N'Upland', N'CA', N'91784')
GO
INSERT [dbo].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (90, N'Marjorie', N'Logan', NULL, N'marjorie.logan@msn.com', N'95 Grandrose St. ', N'Franklin Square', N'NY', N'11010')
GO
SET IDENTITY_INSERT [dbo].[customers] OFF
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (9, 1, 7, 2, CAST(3999.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (27, 1, 5, 1, CAST(1320.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (27, 2, 19, 1, CAST(449.00 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (27, 3, 26, 2, CAST(599.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (27, 4, 8, 1, CAST(1799.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (34, 1, 8, 2, CAST(1799.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (34, 2, 10, 2, CAST(1549.00 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (34, 3, 17, 2, CAST(429.00 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (70, 1, 3, 2, CAST(999.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (70, 2, 18, 1, CAST(449.00 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (70, 3, 20, 1, CAST(599.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (76, 1, 12, 1, CAST(549.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (76, 2, 11, 2, CAST(1680.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (76, 3, 5, 1, CAST(1320.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (104, 1, 19, 2, CAST(449.00 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (104, 2, 26, 1, CAST(599.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (108, 1, 11, 1, CAST(1680.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (108, 2, 22, 2, CAST(269.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (108, 3, 16, 2, CAST(599.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (128, 1, 24, 2, CAST(549.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (128, 2, 16, 2, CAST(599.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (128, 3, 4, 2, CAST(2899.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (128, 4, 3, 2, CAST(999.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (129, 1, 18, 1, CAST(449.00 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (129, 2, 9, 1, CAST(2999.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (132, 1, 2, 2, CAST(749.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (132, 2, 20, 1, CAST(599.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (132, 3, 9, 1, CAST(2999.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (147, 1, 26, 2, CAST(599.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (152, 1, 6, 2, CAST(469.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (152, 2, 22, 2, CAST(269.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (152, 3, 16, 2, CAST(599.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (157, 1, 4, 1, CAST(2899.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (157, 2, 7, 2, CAST(3999.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (159, 1, 13, 1, CAST(269.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (162, 1, 18, 1, CAST(449.00 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (162, 2, 21, 2, CAST(269.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (162, 3, 3, 2, CAST(999.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (183, 1, 11, 2, CAST(1680.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (183, 2, 12, 2, CAST(549.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (183, 3, 19, 1, CAST(449.00 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (183, 4, 17, 1, CAST(429.00 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (185, 1, 20, 1, CAST(599.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (185, 2, 8, 1, CAST(1799.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (222, 1, 10, 1, CAST(1549.00 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (222, 2, 2, 2, CAST(749.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (239, 1, 16, 2, CAST(599.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (239, 2, 21, 2, CAST(269.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (239, 3, 18, 1, CAST(449.00 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (239, 4, 4, 2, CAST(2899.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (240, 1, 9, 1, CAST(2999.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (240, 2, 8, 1, CAST(1799.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (240, 3, 5, 1, CAST(1320.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (240, 4, 18, 2, CAST(449.00 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (246, 1, 17, 2, CAST(429.00 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (252, 1, 11, 2, CAST(1680.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (252, 2, 4, 1, CAST(2899.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (252, 3, 19, 1, CAST(449.00 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (256, 1, 11, 1, CAST(1680.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (256, 2, 21, 1, CAST(269.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (264, 1, 10, 1, CAST(1549.00 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (264, 2, 24, 2, CAST(549.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (264, 3, 15, 2, CAST(529.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (264, 4, 3, 2, CAST(999.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (286, 1, 26, 2, CAST(599.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (286, 2, 21, 2, CAST(269.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (286, 3, 16, 2, CAST(599.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (286, 4, 7, 1, CAST(3999.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (301, 1, 6, 1, CAST(469.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (301, 2, 22, 1, CAST(269.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (303, 1, 8, 2, CAST(1799.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (303, 2, 24, 2, CAST(549.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (327, 1, 12, 2, CAST(549.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (327, 2, 13, 1, CAST(269.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (327, 3, 4, 1, CAST(2899.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (349, 1, 20, 2, CAST(599.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (350, 1, 6, 2, CAST(469.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (350, 2, 20, 1, CAST(599.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (350, 3, 3, 1, CAST(999.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (352, 1, 11, 1, CAST(1680.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (352, 2, 14, 1, CAST(269.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (357, 1, 17, 2, CAST(429.00 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (357, 2, 21, 2, CAST(269.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (357, 3, 24, 1, CAST(549.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (357, 4, 9, 1, CAST(2999.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (389, 1, 2, 1, CAST(749.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (389, 2, 15, 2, CAST(529.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (389, 3, 10, 2, CAST(1549.00 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (389, 4, 5, 1, CAST(1320.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (389, 5, 9, 1, CAST(2999.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (391, 1, 8, 1, CAST(1799.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (391, 2, 5, 2, CAST(1320.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (391, 3, 24, 2, CAST(549.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (407, 1, 20, 1, CAST(599.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (407, 2, 5, 1, CAST(1320.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (418, 1, 12, 1, CAST(549.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (418, 2, 20, 1, CAST(599.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (419, 1, 9, 1, CAST(2999.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (420, 1, 17, 2, CAST(429.00 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (420, 2, 15, 2, CAST(529.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (420, 3, 3, 2, CAST(999.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (424, 1, 22, 1, CAST(269.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (424, 2, 6, 1, CAST(469.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (435, 1, 22, 1, CAST(269.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (435, 2, 9, 1, CAST(2999.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (435, 3, 18, 1, CAST(449.00 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (444, 1, 22, 1, CAST(269.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (444, 2, 15, 2, CAST(529.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (444, 3, 20, 2, CAST(599.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (444, 4, 16, 1, CAST(599.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (444, 5, 10, 2, CAST(1549.00 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (464, 1, 7, 1, CAST(3999.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (512, 1, 21, 1, CAST(269.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (519, 1, 6, 1, CAST(469.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (519, 2, 16, 1, CAST(599.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (519, 3, 23, 2, CAST(299.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (519, 4, 18, 2, CAST(449.00 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (519, 5, 7, 1, CAST(3999.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (543, 1, 25, 1, CAST(499.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (543, 2, 18, 1, CAST(449.00 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (543, 3, 26, 2, CAST(599.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (547, 1, 11, 2, CAST(1680.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (547, 2, 9, 1, CAST(2999.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (547, 3, 5, 1, CAST(1320.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (549, 1, 15, 1, CAST(529.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (549, 2, 16, 1, CAST(599.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (549, 3, 3, 1, CAST(999.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (549, 4, 7, 1, CAST(3999.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (549, 5, 13, 2, CAST(269.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (556, 1, 16, 1, CAST(599.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (556, 2, 4, 2, CAST(2899.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (561, 1, 15, 2, CAST(529.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (561, 2, 18, 1, CAST(449.00 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (561, 3, 5, 1, CAST(1320.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (561, 4, 17, 2, CAST(429.00 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (571, 1, 4, 1, CAST(2899.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (571, 2, 9, 1, CAST(2999.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (575, 1, 4, 2, CAST(2899.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (575, 2, 12, 1, CAST(549.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (582, 1, 10, 2, CAST(1549.00 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (582, 2, 17, 2, CAST(429.00 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (593, 1, 3, 2, CAST(999.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (593, 2, 25, 1, CAST(499.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (598, 1, 4, 2, CAST(2899.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (598, 2, 16, 2, CAST(599.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (598, 3, 14, 1, CAST(269.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (599, 1, 9, 2, CAST(2999.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (599, 2, 22, 2, CAST(269.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (599, 3, 23, 1, CAST(299.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (599, 4, 10, 2, CAST(1549.00 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (606, 1, 6, 2, CAST(469.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (606, 2, 18, 2, CAST(449.00 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (634, 1, 4, 2, CAST(2899.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (634, 2, 12, 1, CAST(549.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (673, 1, 66, 1, CAST(250.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (673, 2, 38, 1, CAST(549.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (673, 3, 5, 1, CAST(1320.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (673, 4, 13, 1, CAST(269.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (679, 1, 15, 2, CAST(529.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (679, 2, 83, 2, CAST(149.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (700, 1, 7, 2, CAST(3999.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (700, 2, 63, 1, CAST(3499.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (707, 1, 106, 2, CAST(449.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (707, 2, 100, 1, CAST(489.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (707, 3, 11, 2, CAST(1680.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (707, 4, 26, 2, CAST(599.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (718, 1, 92, 2, CAST(209.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (718, 2, 40, 2, CAST(4999.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (718, 3, 64, 2, CAST(489.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (735, 1, 71, 2, CAST(416.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (735, 2, 10, 2, CAST(1549.00 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (739, 1, 3, 1, CAST(999.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (747, 1, 110, 1, CAST(470.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (747, 2, 86, 1, CAST(149.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (747, 3, 33, 2, CAST(469.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (747, 4, 81, 1, CAST(1099.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (778, 1, 64, 1, CAST(489.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (778, 2, 85, 1, CAST(329.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (801, 1, 101, 1, CAST(339.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (825, 1, 19, 1, CAST(449.00 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (825, 2, 30, 2, CAST(999.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (826, 1, 45, 2, CAST(869.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (826, 2, 36, 1, CAST(832.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (852, 1, 46, 2, CAST(1409.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (885, 1, 106, 1, CAST(449.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (885, 2, 43, 1, CAST(5299.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (897, 1, 105, 1, CAST(533.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (897, 2, 96, 1, CAST(349.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (924, 1, 97, 2, CAST(349.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (924, 2, 36, 1, CAST(832.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (935, 1, 65, 2, CAST(346.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (935, 2, 76, 2, CAST(299.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (935, 3, 6, 1, CAST(469.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (935, 4, 38, 1, CAST(549.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (961, 1, 105, 1, CAST(533.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (961, 2, 47, 2, CAST(5299.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (961, 3, 65, 2, CAST(346.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1010, 1, 109, 2, CAST(416.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1041, 1, 89, 1, CAST(209.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1041, 2, 61, 2, CAST(4999.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1041, 3, 94, 2, CAST(249.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1059, 1, 46, 2, CAST(1409.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1059, 2, 7, 1, CAST(3999.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1059, 3, 13, 1, CAST(269.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1072, 1, 83, 1, CAST(149.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1072, 2, 89, 2, CAST(209.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1072, 3, 36, 2, CAST(832.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1076, 1, 95, 1, CAST(299.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1076, 2, 102, 1, CAST(489.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1076, 3, 73, 2, CAST(749.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1084, 1, 30, 1, CAST(999.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1084, 2, 70, 1, CAST(659.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1084, 3, 98, 2, CAST(489.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1084, 4, 65, 2, CAST(346.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1084, 5, 60, 1, CAST(1559.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1089, 1, 70, 2, CAST(659.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1089, 2, 30, 2, CAST(999.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1092, 1, 34, 1, CAST(469.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1092, 2, 30, 2, CAST(999.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1092, 3, 2, 2, CAST(749.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1092, 4, 18, 1, CAST(449.00 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1109, 1, 72, 2, CAST(619.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1116, 1, 11, 2, CAST(1680.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1157, 1, 20, 1, CAST(599.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1157, 2, 31, 2, CAST(1632.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1157, 3, 37, 2, CAST(379.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1157, 4, 41, 1, CAST(1469.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1161, 1, 71, 2, CAST(416.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1161, 2, 38, 1, CAST(549.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1161, 3, 22, 1, CAST(269.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1161, 4, 29, 2, CAST(999.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1177, 1, 62, 2, CAST(3499.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1177, 2, 74, 1, CAST(439.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1190, 1, 71, 1, CAST(416.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1200, 1, 42, 2, CAST(2299.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1229, 1, 36, 2, CAST(832.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1229, 2, 61, 2, CAST(4999.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1253, 1, 25, 2, CAST(499.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1253, 2, 21, 1, CAST(269.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1253, 3, 88, 1, CAST(189.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1259, 1, 60, 1, CAST(1559.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1259, 2, 19, 1, CAST(449.00 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1283, 1, 61, 2, CAST(4999.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1283, 2, 81, 1, CAST(1099.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1283, 3, 7, 1, CAST(3999.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1283, 4, 32, 1, CAST(469.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1283, 5, 11, 1, CAST(1680.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1306, 1, 103, 2, CAST(551.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1306, 2, 81, 2, CAST(1099.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1306, 3, 45, 1, CAST(869.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1306, 4, 42, 1, CAST(2299.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1306, 5, 9, 2, CAST(2999.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1318, 1, 82, 2, CAST(659.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1318, 2, 62, 2, CAST(3499.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1318, 3, 111, 1, CAST(470.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1318, 4, 92, 1, CAST(209.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1322, 1, 28, 2, CAST(2499.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1322, 2, 104, 2, CAST(481.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1325, 1, 139, 1, CAST(2999.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1325, 2, 257, 1, CAST(899.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1325, 3, 209, 1, CAST(2999.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1325, 4, 28, 1, CAST(2499.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1360, 1, 31, 1, CAST(1632.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1387, 1, 106, 1, CAST(449.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1401, 1, 112, 1, CAST(379.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1401, 2, 230, 1, CAST(429.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1401, 3, 254, 2, CAST(749.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1407, 1, 300, 1, CAST(799.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1407, 2, 36, 2, CAST(832.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1407, 3, 266, 1, CAST(399.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1407, 4, 35, 1, CAST(832.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1413, 1, 297, 2, CAST(279.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1459, 1, 258, 1, CAST(1259.90 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1476, 1, 142, 2, CAST(3199.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1476, 2, 91, 2, CAST(349.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1476, 3, 43, 1, CAST(5299.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1476, 4, 191, 1, CAST(2799.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1476, 5, 265, 2, CAST(289.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1479, 1, 252, 1, CAST(2999.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1479, 2, 256, 1, CAST(899.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1480, 1, 308, 2, CAST(749.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1480, 2, 82, 2, CAST(659.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1480, 3, 92, 2, CAST(209.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1480, 4, 225, 2, CAST(959.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1483, 1, 280, 1, CAST(489.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1483, 2, 226, 2, CAST(679.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1485, 1, 122, 2, CAST(2499.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1485, 2, 276, 1, CAST(319.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1486, 1, 60, 2, CAST(1559.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1486, 2, 98, 1, CAST(489.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1486, 3, 113, 1, CAST(489.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1486, 4, 269, 1, CAST(199.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1491, 1, 95, 2, CAST(299.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1491, 2, 302, 1, CAST(449.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1491, 3, 60, 2, CAST(1559.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1491, 4, 139, 2, CAST(2999.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1492, 1, 37, 2, CAST(379.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1493, 1, 230, 1, CAST(429.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1495, 1, 292, 2, CAST(369.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1495, 2, 308, 2, CAST(749.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1495, 3, 137, 1, CAST(2599.00 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1496, 1, 248, 1, CAST(599.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1496, 2, 214, 1, CAST(899.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1496, 3, 224, 2, CAST(479.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1496, 4, 302, 1, CAST(449.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1496, 5, 225, 2, CAST(959.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1497, 1, 141, 2, CAST(1599.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1497, 2, 198, 2, CAST(2999.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1497, 3, 204, 2, CAST(3599.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1501, 1, 248, 1, CAST(599.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1501, 2, 219, 1, CAST(639.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1501, 3, 15, 1, CAST(529.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1501, 4, 67, 1, CAST(250.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1501, 5, 210, 1, CAST(1549.00 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1502, 1, 231, 2, CAST(529.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1502, 2, 19, 2, CAST(449.00 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1502, 3, 26, 2, CAST(599.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1502, 4, 268, 1, CAST(159.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1502, 5, 255, 1, CAST(899.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1505, 1, 223, 2, CAST(529.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1505, 2, 24, 2, CAST(549.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1505, 3, 43, 2, CAST(5299.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1507, 1, 39, 2, CAST(1499.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1507, 2, 11, 2, CAST(1680.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1507, 3, 259, 1, CAST(1199.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1507, 4, 281, 1, CAST(319.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1507, 5, 293, 2, CAST(319.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1509, 1, 215, 2, CAST(749.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1510, 1, 142, 2, CAST(3199.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1510, 2, 68, 1, CAST(449.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1510, 3, 251, 2, CAST(2999.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1510, 4, 220, 2, CAST(269.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1510, 5, 137, 1, CAST(2599.00 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1512, 1, 217, 1, CAST(909.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1514, 1, 240, 2, CAST(899.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1514, 2, 203, 2, CAST(4999.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1520, 1, 186, 1, CAST(4499.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1520, 2, 188, 2, CAST(3499.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1520, 3, 310, 2, CAST(899.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1520, 4, 263, 2, CAST(89.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1521, 1, 100, 1, CAST(489.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1521, 2, 314, 2, CAST(679.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1521, 3, 123, 1, CAST(999.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1521, 4, 135, 2, CAST(1499.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1522, 1, 95, 1, CAST(299.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1522, 2, 141, 1, CAST(1599.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1522, 3, 117, 1, CAST(1469.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1523, 1, 311, 2, CAST(749.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1528, 1, 229, 2, CAST(429.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1532, 1, 209, 2, CAST(2999.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1535, 1, 92, 1, CAST(209.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1535, 2, 75, 2, CAST(599.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1537, 1, 237, 2, CAST(849.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1538, 1, 206, 1, CAST(3299.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1538, 2, 46, 2, CAST(1409.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1538, 3, 117, 1, CAST(1469.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1538, 4, 197, 1, CAST(2299.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1538, 5, 306, 2, CAST(899.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1544, 1, 194, 2, CAST(3499.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1544, 2, 107, 2, CAST(416.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1545, 1, 45, 1, CAST(869.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1551, 1, 207, 2, CAST(3999.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1552, 1, 197, 1, CAST(2299.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1552, 2, 41, 2, CAST(1469.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1553, 1, 102, 1, CAST(489.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1553, 2, 12, 1, CAST(549.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1553, 3, 251, 1, CAST(2999.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1553, 4, 89, 1, CAST(209.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1560, 1, 118, 2, CAST(999.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1560, 2, 41, 1, CAST(1469.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1563, 1, 188, 1, CAST(3499.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1564, 1, 309, 1, CAST(899.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1564, 2, 14, 1, CAST(269.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1565, 1, 37, 1, CAST(379.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1565, 2, 92, 1, CAST(209.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1565, 3, 261, 1, CAST(899.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1565, 4, 95, 1, CAST(299.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1565, 5, 226, 2, CAST(679.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1567, 1, 279, 1, CAST(319.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1569, 1, 252, 1, CAST(2999.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1571, 1, 312, 2, CAST(699.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1571, 2, 212, 1, CAST(559.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1571, 3, 20, 2, CAST(599.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1572, 1, 216, 2, CAST(899.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1572, 2, 198, 1, CAST(2999.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1572, 3, 115, 1, CAST(3199.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1572, 4, 304, 2, CAST(679.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1573, 1, 9, 1, CAST(2999.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1573, 2, 129, 1, CAST(919.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1573, 3, 15, 2, CAST(529.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1573, 4, 216, 2, CAST(899.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1573, 5, 263, 2, CAST(89.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1576, 1, 69, 1, CAST(416.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1576, 2, 293, 1, CAST(319.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1576, 3, 202, 2, CAST(3499.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1577, 1, 298, 2, CAST(279.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1577, 2, 111, 2, CAST(470.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1577, 3, 300, 2, CAST(799.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1577, 4, 131, 2, CAST(2599.00 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1577, 5, 282, 2, CAST(279.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1583, 1, 15, 1, CAST(529.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1583, 2, 265, 2, CAST(289.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1588, 1, 93, 2, CAST(209.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1589, 1, 246, 2, CAST(639.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1589, 2, 260, 1, CAST(799.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1589, 3, 28, 2, CAST(2499.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1594, 1, 79, 2, CAST(402.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1594, 2, 105, 1, CAST(533.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1595, 1, 112, 1, CAST(379.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1596, 1, 91, 1, CAST(349.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1596, 2, 18, 1, CAST(449.00 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1599, 1, 104, 2, CAST(481.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1602, 1, 71, 2, CAST(416.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1602, 2, 37, 1, CAST(379.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1602, 3, 275, 2, CAST(229.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1602, 4, 257, 2, CAST(899.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1603, 1, 275, 2, CAST(229.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1604, 1, 271, 1, CAST(209.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1607, 1, 29, 1, CAST(999.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1608, 1, 231, 2, CAST(529.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1609, 1, 96, 1, CAST(349.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1609, 2, 238, 2, CAST(749.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1609, 3, 228, 2, CAST(319.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1609, 4, 105, 1, CAST(533.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1612, 1, 242, 1, CAST(699.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1612, 2, 289, 2, CAST(319.99 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1612, 3, 101, 2, CAST(339.99 AS Decimal(10, 2)), CAST(0.20 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1612, 4, 293, 2, CAST(319.99 AS Decimal(10, 2)), CAST(0.07 AS Decimal(4, 2)))
GO
INSERT [dbo].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1612, 5, 60, 1, CAST(1559.99 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
GO
SET IDENTITY_INSERT [dbo].[orders] ON 
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id]) VALUES (9, 60, 4, CAST(N'2016-01-05' AS Date), CAST(N'2016-01-08' AS Date), CAST(N'2016-01-08' AS Date), 1)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id]) VALUES (27, 57, 4, CAST(N'2016-01-19' AS Date), CAST(N'2016-01-21' AS Date), CAST(N'2016-01-20' AS Date), 2)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id]) VALUES (34, 80, 4, CAST(N'2016-01-22' AS Date), CAST(N'2016-01-25' AS Date), CAST(N'2016-01-23' AS Date), 2)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id]) VALUES (70, 50, 3, CAST(N'2016-02-11' AS Date), CAST(N'2016-02-11' AS Date), NULL, 3)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id]) VALUES (76, 9, 3, CAST(N'2016-02-16' AS Date), CAST(N'2016-02-16' AS Date), NULL, 2)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id]) VALUES (104, 7, 4, CAST(N'2016-03-03' AS Date), CAST(N'2016-03-05' AS Date), CAST(N'2016-03-05' AS Date), 2)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id]) VALUES (108, 12, 4, CAST(N'2016-03-06' AS Date), CAST(N'2016-03-09' AS Date), CAST(N'2016-03-07' AS Date), 2)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id]) VALUES (128, 86, 4, CAST(N'2016-03-18' AS Date), CAST(N'2016-03-20' AS Date), CAST(N'2016-03-21' AS Date), 2)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id]) VALUES (129, 84, 4, CAST(N'2016-03-19' AS Date), CAST(N'2016-03-21' AS Date), CAST(N'2016-03-21' AS Date), 2)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id]) VALUES (132, 46, 4, CAST(N'2016-03-20' AS Date), CAST(N'2016-03-22' AS Date), CAST(N'2016-03-23' AS Date), 1)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id]) VALUES (147, 55, 4, CAST(N'2016-03-28' AS Date), CAST(N'2016-03-31' AS Date), CAST(N'2016-03-31' AS Date), 2)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id]) VALUES (152, 76, 4, CAST(N'2016-03-29' AS Date), CAST(N'2016-03-30' AS Date), CAST(N'2016-03-30' AS Date), 2)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id]) VALUES (157, 43, 4, CAST(N'2016-04-03' AS Date), CAST(N'2016-04-06' AS Date), CAST(N'2016-04-06' AS Date), 3)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id]) VALUES (159, 32, 4, CAST(N'2016-04-04' AS Date), CAST(N'2016-04-06' AS Date), CAST(N'2016-04-06' AS Date), 1)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id]) VALUES (162, 31, 4, CAST(N'2016-04-06' AS Date), CAST(N'2016-04-08' AS Date), CAST(N'2016-04-07' AS Date), 1)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id]) VALUES (183, 22, 4, CAST(N'2016-04-19' AS Date), CAST(N'2016-04-20' AS Date), CAST(N'2016-04-20' AS Date), 2)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id]) VALUES (185, 24, 3, CAST(N'2016-04-20' AS Date), CAST(N'2016-04-20' AS Date), NULL, 1)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id]) VALUES (222, 51, 4, CAST(N'2016-05-13' AS Date), CAST(N'2016-05-16' AS Date), CAST(N'2016-05-14' AS Date), 2)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id]) VALUES (239, 13, 3, CAST(N'2016-05-27' AS Date), CAST(N'2016-05-27' AS Date), NULL, 3)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id]) VALUES (240, 65, 4, CAST(N'2016-05-27' AS Date), CAST(N'2016-05-29' AS Date), CAST(N'2016-05-30' AS Date), 2)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id]) VALUES (246, 17, 3, CAST(N'2016-05-30' AS Date), CAST(N'2016-05-30' AS Date), NULL, 2)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id]) VALUES (252, 66, 4, CAST(N'2016-06-01' AS Date), CAST(N'2016-06-04' AS Date), CAST(N'2016-06-02' AS Date), 3)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id]) VALUES (256, 26, 4, CAST(N'2016-06-04' AS Date), CAST(N'2016-06-05' AS Date), CAST(N'2016-06-07' AS Date), 2)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id]) VALUES (264, 5, 3, CAST(N'2016-06-10' AS Date), CAST(N'2016-06-10' AS Date), NULL, 1)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id]) VALUES (286, 59, 4, CAST(N'2016-06-25' AS Date), CAST(N'2016-06-26' AS Date), CAST(N'2016-06-26' AS Date), 2)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id]) VALUES (301, 17, 4, CAST(N'2016-07-06' AS Date), CAST(N'2016-07-09' AS Date), CAST(N'2016-07-08' AS Date), 2)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id]) VALUES (303, 36, 4, CAST(N'2016-07-07' AS Date), CAST(N'2016-07-08' AS Date), CAST(N'2016-07-09' AS Date), 2)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id]) VALUES (327, 83, 4, CAST(N'2016-07-21' AS Date), CAST(N'2016-07-24' AS Date), CAST(N'2016-07-22' AS Date), 2)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id]) VALUES (349, 30, 3, CAST(N'2016-08-03' AS Date), CAST(N'2016-08-03' AS Date), NULL, 1)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id]) VALUES (350, 31, 3, CAST(N'2016-08-03' AS Date), CAST(N'2016-08-03' AS Date), NULL, 1)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id]) VALUES (352, 16, 4, CAST(N'2016-08-03' AS Date), CAST(N'2016-08-04' AS Date), CAST(N'2016-08-06' AS Date), 2)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id]) VALUES (357, 14, 3, CAST(N'2016-08-05' AS Date), CAST(N'2016-08-05' AS Date), NULL, 3)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id]) VALUES (389, 53, 4, CAST(N'2016-08-22' AS Date), CAST(N'2016-08-24' AS Date), CAST(N'2016-08-25' AS Date), 1)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id]) VALUES (391, 61, 3, CAST(N'2016-08-23' AS Date), CAST(N'2016-08-23' AS Date), NULL, 3)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id]) VALUES (407, 77, 3, CAST(N'2016-09-01' AS Date), CAST(N'2016-09-01' AS Date), NULL, 3)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id]) VALUES (418, 88, 4, CAST(N'2016-09-04' AS Date), CAST(N'2016-09-05' AS Date), CAST(N'2016-09-05' AS Date), 2)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id]) VALUES (419, 14, 4, CAST(N'2016-09-04' AS Date), CAST(N'2016-09-07' AS Date), CAST(N'2016-09-06' AS Date), 3)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id]) VALUES (420, 72, 4, CAST(N'2016-09-05' AS Date), CAST(N'2016-09-06' AS Date), CAST(N'2016-09-07' AS Date), 1)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id]) VALUES (424, 67, 4, CAST(N'2016-09-08' AS Date), CAST(N'2016-09-11' AS Date), CAST(N'2016-09-11' AS Date), 1)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id]) VALUES (435, 77, 4, CAST(N'2016-09-14' AS Date), CAST(N'2016-09-15' AS Date), CAST(N'2016-09-16' AS Date), 3)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id]) VALUES (444, 30, 4, CAST(N'2016-09-19' AS Date), CAST(N'2016-09-20' AS Date), CAST(N'2016-09-21' AS Date), 1)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id]) VALUES (464, 74, 4, CAST(N'2016-09-28' AS Date), CAST(N'2016-09-30' AS Date), CAST(N'2016-09-29' AS Date), 2)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id]) VALUES (512, 8, 4, CAST(N'2016-10-19' AS Date), CAST(N'2016-10-22' AS Date), CAST(N'2016-10-20' AS Date), 2)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id]) VALUES (519, 54, 4, CAST(N'2016-10-22' AS Date), CAST(N'2016-10-23' AS Date), CAST(N'2016-10-24' AS Date), 2)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id]) VALUES (543, 62, 4, CAST(N'2016-11-06' AS Date), CAST(N'2016-11-09' AS Date), CAST(N'2016-11-08' AS Date), 2)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id]) VALUES (547, 20, 4, CAST(N'2016-11-09' AS Date), CAST(N'2016-11-11' AS Date), CAST(N'2016-11-10' AS Date), 3)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id]) VALUES (549, 64, 3, CAST(N'2016-11-12' AS Date), CAST(N'2016-11-12' AS Date), NULL, 3)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id]) VALUES (556, 61, 4, CAST(N'2016-11-13' AS Date), CAST(N'2016-11-14' AS Date), CAST(N'2016-11-15' AS Date), 3)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id]) VALUES (561, 90, 4, CAST(N'2016-11-19' AS Date), CAST(N'2016-11-22' AS Date), CAST(N'2016-11-22' AS Date), 2)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id]) VALUES (571, 5, 4, CAST(N'2016-11-24' AS Date), CAST(N'2016-11-25' AS Date), CAST(N'2016-11-27' AS Date), 1)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id]) VALUES (575, 33, 4, CAST(N'2016-11-27' AS Date), CAST(N'2016-11-28' AS Date), CAST(N'2016-11-30' AS Date), 1)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id]) VALUES (582, 32, 3, CAST(N'2016-12-04' AS Date), CAST(N'2016-12-04' AS Date), NULL, 1)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id]) VALUES (593, 50, 4, CAST(N'2016-12-07' AS Date), CAST(N'2016-12-10' AS Date), CAST(N'2016-12-08' AS Date), 3)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id]) VALUES (598, 40, 3, CAST(N'2016-12-09' AS Date), CAST(N'2016-12-09' AS Date), NULL, 1)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id]) VALUES (599, 1, 4, CAST(N'2016-12-09' AS Date), CAST(N'2016-12-10' AS Date), CAST(N'2016-12-12' AS Date), 2)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id]) VALUES (606, 18, 4, CAST(N'2016-12-11' AS Date), CAST(N'2016-12-12' AS Date), CAST(N'2016-12-13' AS Date), 2)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id]) VALUES (634, 27, 4, CAST(N'2016-12-29' AS Date), CAST(N'2017-01-01' AS Date), CAST(N'2016-12-30' AS Date), 2)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id]) VALUES (673, 64, 4, CAST(N'2017-01-26' AS Date), CAST(N'2017-01-28' AS Date), CAST(N'2017-01-27' AS Date), 3)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id]) VALUES (679, 81, 4, CAST(N'2017-01-29' AS Date), CAST(N'2017-01-30' AS Date), CAST(N'2017-01-30' AS Date), 1)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id]) VALUES (700, 4, 4, CAST(N'2017-02-07' AS Date), CAST(N'2017-02-10' AS Date), CAST(N'2017-02-08' AS Date), 2)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id]) VALUES (707, 79, 4, CAST(N'2017-02-09' AS Date), CAST(N'2017-02-11' AS Date), CAST(N'2017-02-11' AS Date), 2)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id]) VALUES (718, 38, 4, CAST(N'2017-02-16' AS Date), CAST(N'2017-02-17' AS Date), CAST(N'2017-02-17' AS Date), 2)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id]) VALUES (735, 20, 3, CAST(N'2017-02-27' AS Date), CAST(N'2017-02-27' AS Date), NULL, 3)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id]) VALUES (739, 49, 4, CAST(N'2017-02-28' AS Date), CAST(N'2017-03-01' AS Date), CAST(N'2017-03-02' AS Date), 2)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id]) VALUES (747, 87, 4, CAST(N'2017-03-03' AS Date), CAST(N'2017-03-04' AS Date), CAST(N'2017-03-05' AS Date), 1)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id]) VALUES (778, 56, 3, CAST(N'2017-03-15' AS Date), CAST(N'2017-03-15' AS Date), NULL, 3)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id]) VALUES (801, 78, 4, CAST(N'2017-03-28' AS Date), CAST(N'2017-03-29' AS Date), CAST(N'2017-03-30' AS Date), 1)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id]) VALUES (825, 10, 4, CAST(N'2017-04-07' AS Date), CAST(N'2017-04-08' AS Date), CAST(N'2017-04-09' AS Date), 2)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id]) VALUES (826, 45, 4, CAST(N'2017-04-07' AS Date), CAST(N'2017-04-10' AS Date), CAST(N'2017-04-10' AS Date), 2)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id]) VALUES (852, 13, 4, CAST(N'2017-04-21' AS Date), CAST(N'2017-04-23' AS Date), CAST(N'2017-04-22' AS Date), 3)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id]) VALUES (885, 66, 3, CAST(N'2017-05-13' AS Date), CAST(N'2017-05-13' AS Date), NULL, 3)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id]) VALUES (897, 47, 4, CAST(N'2017-05-20' AS Date), CAST(N'2017-05-21' AS Date), CAST(N'2017-05-21' AS Date), 1)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id]) VALUES (924, 68, 3, CAST(N'2017-06-02' AS Date), CAST(N'2017-06-02' AS Date), NULL, 3)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id]) VALUES (935, 43, 3, CAST(N'2017-06-10' AS Date), CAST(N'2017-06-10' AS Date), NULL, 3)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id]) VALUES (961, 82, 4, CAST(N'2017-06-19' AS Date), CAST(N'2017-06-21' AS Date), CAST(N'2017-06-22' AS Date), 1)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id]) VALUES (1010, 8, 3, CAST(N'2017-07-18' AS Date), CAST(N'2017-07-18' AS Date), NULL, 2)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id]) VALUES (1041, 70, 4, CAST(N'2017-08-04' AS Date), CAST(N'2017-08-06' AS Date), CAST(N'2017-08-05' AS Date), 2)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id]) VALUES (1059, 6, 4, CAST(N'2017-08-14' AS Date), CAST(N'2017-08-17' AS Date), CAST(N'2017-08-17' AS Date), 2)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id]) VALUES (1072, 47, 3, CAST(N'2017-08-18' AS Date), CAST(N'2017-08-18' AS Date), NULL, 1)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id]) VALUES (1076, 42, 4, CAST(N'2017-08-19' AS Date), CAST(N'2017-08-22' AS Date), CAST(N'2017-08-22' AS Date), 2)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id]) VALUES (1084, 2, 4, CAST(N'2017-08-21' AS Date), CAST(N'2017-08-24' AS Date), CAST(N'2017-08-23' AS Date), 1)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id]) VALUES (1089, 46, 3, CAST(N'2017-08-23' AS Date), CAST(N'2017-08-23' AS Date), NULL, 1)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id]) VALUES (1092, 40, 4, CAST(N'2017-08-25' AS Date), CAST(N'2017-08-28' AS Date), CAST(N'2017-08-27' AS Date), 1)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id]) VALUES (1109, 23, 4, CAST(N'2017-09-03' AS Date), CAST(N'2017-09-04' AS Date), CAST(N'2017-09-04' AS Date), 2)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id]) VALUES (1116, 52, 4, CAST(N'2017-09-08' AS Date), CAST(N'2017-09-10' AS Date), CAST(N'2017-09-10' AS Date), 2)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id]) VALUES (1157, 24, 4, CAST(N'2017-10-01' AS Date), CAST(N'2017-10-03' AS Date), CAST(N'2017-10-04' AS Date), 1)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id]) VALUES (1161, 41, 4, CAST(N'2017-10-01' AS Date), CAST(N'2017-10-04' AS Date), CAST(N'2017-10-02' AS Date), 2)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id]) VALUES (1177, 21, 3, CAST(N'2017-10-12' AS Date), CAST(N'2017-10-12' AS Date), NULL, 3)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id]) VALUES (1190, 34, 4, CAST(N'2017-10-16' AS Date), CAST(N'2017-10-19' AS Date), CAST(N'2017-10-17' AS Date), 2)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id]) VALUES (1200, 48, 4, CAST(N'2017-10-23' AS Date), CAST(N'2017-10-25' AS Date), CAST(N'2017-10-26' AS Date), 2)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id]) VALUES (1229, 89, 4, CAST(N'2017-11-05' AS Date), CAST(N'2017-11-08' AS Date), CAST(N'2017-11-06' AS Date), 1)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id]) VALUES (1253, 44, 4, CAST(N'2017-11-18' AS Date), CAST(N'2017-11-21' AS Date), CAST(N'2017-11-21' AS Date), 2)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id]) VALUES (1259, 4, 3, CAST(N'2017-11-21' AS Date), CAST(N'2017-11-21' AS Date), NULL, 2)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id]) VALUES (1283, 85, 4, CAST(N'2017-12-04' AS Date), CAST(N'2017-12-07' AS Date), CAST(N'2017-12-07' AS Date), 2)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id]) VALUES (1306, 28, 4, CAST(N'2017-12-20' AS Date), CAST(N'2017-12-21' AS Date), CAST(N'2017-12-22' AS Date), 2)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id]) VALUES (1318, 75, 4, CAST(N'2017-12-27' AS Date), CAST(N'2017-12-30' AS Date), CAST(N'2017-12-29' AS Date), 2)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id]) VALUES (1322, 39, 4, CAST(N'2017-12-31' AS Date), CAST(N'2018-01-03' AS Date), CAST(N'2018-01-02' AS Date), 2)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id]) VALUES (1325, 68, 4, CAST(N'2018-01-01' AS Date), CAST(N'2018-01-02' AS Date), CAST(N'2018-01-03' AS Date), 3)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id]) VALUES (1360, 71, 4, CAST(N'2018-01-22' AS Date), CAST(N'2018-01-25' AS Date), CAST(N'2018-01-24' AS Date), 2)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id]) VALUES (1387, 11, 4, CAST(N'2018-02-09' AS Date), CAST(N'2018-02-11' AS Date), CAST(N'2018-02-11' AS Date), 2)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id]) VALUES (1401, 15, 4, CAST(N'2018-02-18' AS Date), CAST(N'2018-02-19' AS Date), CAST(N'2018-02-20' AS Date), 2)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id]) VALUES (1407, 18, 3, CAST(N'2018-02-26' AS Date), CAST(N'2018-02-26' AS Date), NULL, 2)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id]) VALUES (1413, 56, 4, CAST(N'2018-03-01' AS Date), CAST(N'2018-03-03' AS Date), CAST(N'2018-03-04' AS Date), 3)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id]) VALUES (1459, 9, 4, CAST(N'2018-03-21' AS Date), CAST(N'2018-03-22' AS Date), CAST(N'2018-03-22' AS Date), 2)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id]) VALUES (1476, 35, 4, CAST(N'2018-03-31' AS Date), CAST(N'2018-04-01' AS Date), CAST(N'2018-04-01' AS Date), 2)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id]) VALUES (1479, 23, 2, CAST(N'2018-04-01' AS Date), CAST(N'2018-04-01' AS Date), NULL, 2)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id]) VALUES (1480, 27, 2, CAST(N'2018-04-01' AS Date), CAST(N'2018-04-01' AS Date), NULL, 2)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id]) VALUES (1483, 15, 1, CAST(N'2018-04-02' AS Date), CAST(N'2018-04-02' AS Date), NULL, 2)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id]) VALUES (1485, 51, 2, CAST(N'2018-04-02' AS Date), CAST(N'2018-04-02' AS Date), NULL, 2)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id]) VALUES (1486, 84, 2, CAST(N'2018-04-02' AS Date), CAST(N'2018-04-02' AS Date), NULL, 2)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id]) VALUES (1491, 82, 1, CAST(N'2018-04-04' AS Date), CAST(N'2018-04-04' AS Date), NULL, 1)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id]) VALUES (1492, 41, 1, CAST(N'2018-04-04' AS Date), CAST(N'2018-04-04' AS Date), NULL, 2)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id]) VALUES (1493, 64, 2, CAST(N'2018-04-04' AS Date), CAST(N'2018-04-04' AS Date), NULL, 3)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id]) VALUES (1495, 86, 2, CAST(N'2018-04-05' AS Date), CAST(N'2018-04-05' AS Date), NULL, 2)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id]) VALUES (1496, 3, 1, CAST(N'2018-04-06' AS Date), CAST(N'2018-04-06' AS Date), NULL, 1)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id]) VALUES (1497, 31, 2, CAST(N'2018-04-06' AS Date), CAST(N'2018-04-06' AS Date), NULL, 1)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id]) VALUES (1501, 52, 1, CAST(N'2018-04-06' AS Date), CAST(N'2018-04-06' AS Date), NULL, 2)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id]) VALUES (1502, 83, 2, CAST(N'2018-04-06' AS Date), CAST(N'2018-04-06' AS Date), NULL, 2)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id]) VALUES (1505, 22, 1, CAST(N'2018-04-08' AS Date), CAST(N'2018-04-08' AS Date), NULL, 2)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id]) VALUES (1507, 85, 2, CAST(N'2018-04-08' AS Date), CAST(N'2018-04-08' AS Date), NULL, 2)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id]) VALUES (1509, 2, 1, CAST(N'2018-04-09' AS Date), CAST(N'2018-04-09' AS Date), NULL, 1)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id]) VALUES (1510, 16, 2, CAST(N'2018-04-09' AS Date), CAST(N'2018-04-09' AS Date), NULL, 2)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id]) VALUES (1512, 68, 1, CAST(N'2018-04-09' AS Date), CAST(N'2018-04-09' AS Date), NULL, 3)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id]) VALUES (1514, 87, 2, CAST(N'2018-04-10' AS Date), CAST(N'2018-04-10' AS Date), NULL, 1)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id]) VALUES (1520, 66, 2, CAST(N'2018-04-11' AS Date), CAST(N'2018-04-11' AS Date), NULL, 3)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id]) VALUES (1521, 53, 1, CAST(N'2018-04-12' AS Date), CAST(N'2018-04-12' AS Date), NULL, 1)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id]) VALUES (1522, 78, 1, CAST(N'2018-04-12' AS Date), CAST(N'2018-04-12' AS Date), NULL, 1)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id]) VALUES (1523, 8, 1, CAST(N'2018-04-12' AS Date), CAST(N'2018-04-12' AS Date), NULL, 2)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id]) VALUES (1528, 20, 1, CAST(N'2018-04-12' AS Date), CAST(N'2018-04-12' AS Date), NULL, 3)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id]) VALUES (1532, 7, 2, CAST(N'2018-04-13' AS Date), CAST(N'2018-04-13' AS Date), NULL, 2)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id]) VALUES (1535, 19, 2, CAST(N'2018-04-14' AS Date), CAST(N'2018-04-14' AS Date), NULL, 2)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id]) VALUES (1537, 36, 1, CAST(N'2018-04-15' AS Date), CAST(N'2018-04-15' AS Date), NULL, 2)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id]) VALUES (1538, 79, 2, CAST(N'2018-04-15' AS Date), CAST(N'2018-04-15' AS Date), NULL, 2)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id]) VALUES (1544, 5, 1, CAST(N'2018-04-17' AS Date), CAST(N'2018-04-17' AS Date), NULL, 1)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id]) VALUES (1545, 67, 1, CAST(N'2018-04-17' AS Date), CAST(N'2018-04-17' AS Date), NULL, 1)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id]) VALUES (1551, 70, 1, CAST(N'2018-04-17' AS Date), CAST(N'2018-04-17' AS Date), NULL, 2)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id]) VALUES (1552, 73, 1, CAST(N'2018-04-17' AS Date), CAST(N'2018-04-17' AS Date), NULL, 2)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id]) VALUES (1553, 30, 2, CAST(N'2018-04-18' AS Date), CAST(N'2018-04-18' AS Date), NULL, 1)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id]) VALUES (1560, 57, 1, CAST(N'2018-04-20' AS Date), CAST(N'2018-04-20' AS Date), NULL, 2)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id]) VALUES (1563, 77, 2, CAST(N'2018-04-20' AS Date), CAST(N'2018-04-20' AS Date), NULL, 3)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id]) VALUES (1564, 46, 1, CAST(N'2018-04-21' AS Date), CAST(N'2018-04-21' AS Date), NULL, 1)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id]) VALUES (1565, 60, 2, CAST(N'2018-04-21' AS Date), CAST(N'2018-04-21' AS Date), NULL, 1)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id]) VALUES (1567, 89, 2, CAST(N'2018-04-21' AS Date), CAST(N'2018-04-21' AS Date), NULL, 1)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id]) VALUES (1569, 29, 2, CAST(N'2018-04-22' AS Date), CAST(N'2018-04-22' AS Date), NULL, 2)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id]) VALUES (1571, 80, 1, CAST(N'2018-04-22' AS Date), CAST(N'2018-04-22' AS Date), NULL, 2)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id]) VALUES (1572, 14, 1, CAST(N'2018-04-22' AS Date), CAST(N'2018-04-22' AS Date), NULL, 3)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id]) VALUES (1573, 24, 2, CAST(N'2018-04-23' AS Date), CAST(N'2018-04-23' AS Date), NULL, 1)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id]) VALUES (1576, 12, 2, CAST(N'2018-04-23' AS Date), CAST(N'2018-04-23' AS Date), NULL, 2)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id]) VALUES (1577, 48, 1, CAST(N'2018-04-23' AS Date), CAST(N'2018-04-23' AS Date), NULL, 2)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id]) VALUES (1583, 44, 1, CAST(N'2018-04-25' AS Date), CAST(N'2018-04-25' AS Date), NULL, 2)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id]) VALUES (1588, 11, 1, CAST(N'2018-04-26' AS Date), CAST(N'2018-04-26' AS Date), NULL, 2)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id]) VALUES (1589, 40, 2, CAST(N'2018-04-27' AS Date), CAST(N'2018-04-27' AS Date), NULL, 1)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id]) VALUES (1594, 45, 1, CAST(N'2018-04-28' AS Date), CAST(N'2018-04-28' AS Date), NULL, 2)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id]) VALUES (1595, 71, 2, CAST(N'2018-04-28' AS Date), CAST(N'2018-04-28' AS Date), NULL, 2)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id]) VALUES (1596, 21, 2, CAST(N'2018-04-28' AS Date), CAST(N'2018-04-28' AS Date), NULL, 3)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id]) VALUES (1599, 49, 1, CAST(N'2018-04-29' AS Date), CAST(N'2018-04-29' AS Date), NULL, 2)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id]) VALUES (1602, 55, 1, CAST(N'2018-04-30' AS Date), CAST(N'2018-04-30' AS Date), NULL, 2)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id]) VALUES (1603, 74, 2, CAST(N'2018-04-30' AS Date), CAST(N'2018-04-30' AS Date), NULL, 2)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id]) VALUES (1604, 7, 3, CAST(N'2018-06-17' AS Date), CAST(N'2018-06-17' AS Date), NULL, 2)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id]) VALUES (1607, 33, 3, CAST(N'2018-07-11' AS Date), CAST(N'2018-07-11' AS Date), NULL, 1)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id]) VALUES (1608, 53, 3, CAST(N'2018-07-12' AS Date), CAST(N'2018-07-12' AS Date), NULL, 1)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id]) VALUES (1609, 10, 3, CAST(N'2018-08-23' AS Date), CAST(N'2018-08-23' AS Date), NULL, 2)
GO
INSERT [dbo].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id]) VALUES (1612, 3, 3, CAST(N'2018-10-21' AS Date), CAST(N'2018-10-21' AS Date), NULL, 1)
GO
SET IDENTITY_INSERT [dbo].[orders] OFF
GO
SET IDENTITY_INSERT [dbo].[products] ON 
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (1, N'Trek 820 - 2016', 6, 2016, CAST(379.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (2, N'Ritchey Timberwolf Frameset - 2016', 6, 2016, CAST(749.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (3, N'Surly Wednesday Frameset - 2016', 6, 2016, CAST(999.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (4, N'Trek Fuel EX 8 29 - 2016', 6, 2016, CAST(2899.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (5, N'Heller Shagamaw Frame - 2016', 6, 2016, CAST(1320.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (6, N'Surly Ice Cream Truck Frameset - 2016', 6, 2016, CAST(469.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (7, N'Trek Slash 8 27.5 - 2016', 6, 2016, CAST(3999.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (8, N'Trek Remedy 29 Carbon Frameset - 2016', 6, 2016, CAST(1799.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (9, N'Trek Conduit+ - 2016', 5, 2016, CAST(2999.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (10, N'Surly Straggler - 2016', 4, 2016, CAST(1549.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (11, N'Surly Straggler 650b - 2016', 4, 2016, CAST(1680.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (12, N'Electra Townie Original 21D - 2016', 3, 2016, CAST(549.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (13, N'Electra Cruiser 1 (24-Inch) - 2016', 3, 2016, CAST(269.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (14, N'Electra Girl''s Hawaii 1 (16-inch) - 2015/2016', 3, 2016, CAST(269.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (15, N'Electra Moto 1 - 2016', 3, 2016, CAST(529.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (16, N'Electra Townie Original 7D EQ - 2016', 3, 2016, CAST(599.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (17, N'Pure Cycles Vine 8-Speed - 2016', 3, 2016, CAST(429.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (18, N'Pure Cycles Western 3-Speed - Women''s - 2015/2016', 3, 2016, CAST(449.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (19, N'Pure Cycles William 3-Speed - 2016', 3, 2016, CAST(449.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (20, N'Electra Townie Original 7D EQ - Women''s - 2016', 3, 2016, CAST(599.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (21, N'Electra Cruiser 1 (24-Inch) - 2016', 1, 2016, CAST(269.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (22, N'Electra Girl''s Hawaii 1 (16-inch) - 2015/2016', 1, 2016, CAST(269.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (23, N'Electra Girl''s Hawaii 1 (20-inch) - 2015/2016', 1, 2016, CAST(299.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (24, N'Electra Townie Original 21D - 2016', 2, 2016, CAST(549.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (25, N'Electra Townie Original 7D - 2015/2016', 2, 2016, CAST(499.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (26, N'Electra Townie Original 7D EQ - 2016', 2, 2016, CAST(599.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (27, N'Surly Big Dummy Frameset - 2017', 6, 2017, CAST(999.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (28, N'Surly Karate Monkey 27.5+ Frameset - 2017', 6, 2017, CAST(2499.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (29, N'Trek X-Caliber 8 - 2017', 6, 2017, CAST(999.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (30, N'Surly Ice Cream Truck Frameset - 2017', 6, 2017, CAST(999.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (31, N'Surly Wednesday - 2017', 6, 2017, CAST(1632.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (32, N'Trek Farley Alloy Frameset - 2017', 6, 2017, CAST(469.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (33, N'Surly Wednesday Frameset - 2017', 6, 2017, CAST(469.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (34, N'Trek Session DH 27.5 Carbon Frameset - 2017', 6, 2017, CAST(469.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (35, N'Sun Bicycles Spider 3i - 2017', 6, 2017, CAST(832.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (36, N'Surly Troll Frameset - 2017', 6, 2017, CAST(832.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (37, N'Haro Flightline One ST - 2017', 6, 2017, CAST(379.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (38, N'Haro Flightline Two 26 Plus - 2017', 6, 2017, CAST(549.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (39, N'Trek Stache 5 - 2017', 6, 2017, CAST(1499.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (40, N'Trek Fuel EX 9.8 29 - 2017', 6, 2017, CAST(4999.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (41, N'Haro Shift R3 - 2017', 6, 2017, CAST(1469.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (42, N'Trek Fuel EX 5 27.5 Plus - 2017', 6, 2017, CAST(2299.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (43, N'Trek Fuel EX 9.8 27.5 Plus - 2017', 6, 2017, CAST(5299.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (44, N'Haro SR 1.1 - 2017', 6, 2017, CAST(539.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (45, N'Haro SR 1.2 - 2017', 6, 2017, CAST(869.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (46, N'Haro SR 1.3 - 2017', 6, 2017, CAST(1409.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (47, N'Trek Remedy 9.8 - 2017', 6, 2017, CAST(5299.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (60, N'Sun Bicycles ElectroLite - 2017', 5, 2017, CAST(1559.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (61, N'Trek Powerfly 8 FS Plus - 2017', 5, 2017, CAST(4999.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (62, N'Trek Boone 7 - 2017', 4, 2017, CAST(3499.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (63, N'Trek Boone Race Shop Limited - 2017', 4, 2017, CAST(3499.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (64, N'Electra Townie Original 7D - 2017', 3, 2017, CAST(489.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (65, N'Sun Bicycles Lil Bolt Type-R - 2017', 3, 2017, CAST(346.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (66, N'Sun Bicycles Revolutions 24 - 2017', 3, 2017, CAST(250.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (67, N'Sun Bicycles Revolutions 24 - Girl''s - 2017', 3, 2017, CAST(250.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (68, N'Sun Bicycles Cruz 3 - 2017', 3, 2017, CAST(449.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (69, N'Sun Bicycles Cruz 7 - 2017', 3, 2017, CAST(416.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (70, N'Electra Amsterdam Original 3i - 2015/2017', 3, 2017, CAST(659.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (71, N'Sun Bicycles Atlas X-Type - 2017', 3, 2017, CAST(416.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (72, N'Sun Bicycles Biscayne Tandem 7 - 2017', 3, 2017, CAST(619.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (73, N'Sun Bicycles Brickell Tandem 7 - 2017', 3, 2017, CAST(749.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (74, N'Electra Cruiser Lux 1 - 2017', 3, 2017, CAST(439.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (75, N'Electra Cruiser Lux Fat Tire 1 Ladies - 2017', 3, 2017, CAST(599.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (76, N'Electra Girl''s Hawaii 1 16" - 2017', 3, 2017, CAST(299.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (77, N'Electra Glam Punk 3i Ladies'' - 2017', 3, 2017, CAST(799.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (78, N'Sun Bicycles Biscayne Tandem CB - 2017', 3, 2017, CAST(647.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (79, N'Sun Bicycles Boardwalk (24-inch Wheels) - 2017', 3, 2017, CAST(402.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (80, N'Sun Bicycles Brickell Tandem CB - 2017', 3, 2017, CAST(761.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (81, N'Electra Amsterdam Fashion 7i Ladies'' - 2017', 3, 2017, CAST(1099.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (82, N'Electra Amsterdam Original 3i Ladies'' - 2017', 3, 2017, CAST(659.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (83, N'Trek Boy''s Kickster - 2015/2017', 1, 2017, CAST(149.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (84, N'Sun Bicycles Lil Kitt''n - 2017', 1, 2017, CAST(109.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (85, N'Haro Downtown 16 - 2017', 1, 2017, CAST(329.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (86, N'Trek Girl''s Kickster - 2017', 1, 2017, CAST(149.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (87, N'Trek Precaliber 12 Boys - 2017', 1, 2017, CAST(189.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (88, N'Trek Precaliber 12 Girls - 2017', 1, 2017, CAST(189.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (89, N'Trek Precaliber 16 Boys - 2017', 1, 2017, CAST(209.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (90, N'Trek Precaliber 16 Girls - 2017', 1, 2017, CAST(209.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (91, N'Trek Precaliber 24 (21-Speed) - Girls - 2017', 1, 2017, CAST(349.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (92, N'Haro Shredder 20 - 2017', 1, 2017, CAST(209.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (93, N'Haro Shredder 20 Girls - 2017', 1, 2017, CAST(209.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (94, N'Haro Shredder Pro 20 - 2017', 1, 2017, CAST(249.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (95, N'Electra Girl''s Hawaii 1 16" - 2017', 1, 2017, CAST(299.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (96, N'Electra Moto 3i (20-inch) - Boy''s - 2017', 1, 2017, CAST(349.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (97, N'Electra Savannah 3i (20-inch) - Girl''s - 2017', 1, 2017, CAST(349.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (98, N'Electra Straight 8 3i (20-inch) - Boy''s - 2017', 1, 2017, CAST(489.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (99, N'Electra Sugar Skulls 1 (20-inch) - Girl''s - 2017', 1, 2017, CAST(299.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (100, N'Electra Townie 3i EQ (20-inch) - Boys'' - 2017', 1, 2017, CAST(489.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (101, N'Electra Townie 7D (20-inch) - Boys'' - 2017', 1, 2017, CAST(339.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (102, N'Electra Townie Original 7D - 2017', 2, 2017, CAST(489.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (103, N'Sun Bicycles Streamway 3 - 2017', 2, 2017, CAST(551.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (104, N'Sun Bicycles Streamway - 2017', 2, 2017, CAST(481.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (105, N'Sun Bicycles Streamway 7 - 2017', 2, 2017, CAST(533.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (106, N'Sun Bicycles Cruz 3 - 2017', 2, 2017, CAST(449.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (107, N'Sun Bicycles Cruz 7 - 2017', 2, 2017, CAST(416.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (108, N'Sun Bicycles Cruz 3 - Women''s - 2017', 2, 2017, CAST(449.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (109, N'Sun Bicycles Cruz 7 - Women''s - 2017', 2, 2017, CAST(416.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (110, N'Sun Bicycles Drifter 7 - 2017', 2, 2017, CAST(470.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (111, N'Sun Bicycles Drifter 7 - Women''s - 2017', 2, 2017, CAST(470.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (112, N'Trek 820 - 2018', 6, 2018, CAST(379.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (113, N'Trek Marlin 5 - 2018', 6, 2018, CAST(489.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (114, N'Trek Marlin 6 - 2018', 6, 2018, CAST(579.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (115, N'Trek Fuel EX 8 29 - 2018', 6, 2018, CAST(3199.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (116, N'Trek Marlin 7 - 2017/2018', 6, 2018, CAST(749.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (117, N'Trek Ticket S Frame - 2018', 6, 2018, CAST(1469.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (118, N'Trek X-Caliber 8 - 2018', 6, 2018, CAST(999.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (119, N'Trek Kids'' Neko - 2018', 6, 2018, CAST(469.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (120, N'Trek Fuel EX 7 29 - 2018', 6, 2018, CAST(2499.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (121, N'Surly Krampus Frameset - 2018', 6, 2018, CAST(2499.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (122, N'Surly Troll Frameset - 2018', 6, 2018, CAST(2499.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (123, N'Trek Farley Carbon Frameset - 2018', 6, 2018, CAST(999.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (124, N'Surly Krampus - 2018', 6, 2018, CAST(1499.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (125, N'Trek Kids'' Dual Sport - 2018', 6, 2018, CAST(469.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (126, N'Surly Big Fat Dummy Frameset - 2018', 6, 2018, CAST(469.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (127, N'Surly Pack Rat Frameset - 2018', 6, 2018, CAST(469.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (128, N'Surly ECR 27.5 - 2018', 6, 2018, CAST(1899.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (129, N'Trek X-Caliber 7 - 2018', 6, 2018, CAST(919.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (130, N'Trek Stache Carbon Frameset - 2018', 6, 2018, CAST(919.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (131, N'Heller Bloodhound Trail - 2018', 6, 2018, CAST(2599.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (132, N'Trek Procal AL Frameset - 2018', 6, 2018, CAST(1499.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (133, N'Trek Procaliber Frameset - 2018', 6, 2018, CAST(1499.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (134, N'Trek Remedy 27.5 C Frameset - 2018', 6, 2018, CAST(1499.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (135, N'Trek X-Caliber Frameset - 2018', 6, 2018, CAST(1499.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (136, N'Trek Procaliber 6 - 2018', 6, 2018, CAST(1799.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (137, N'Heller Shagamaw GX1 - 2018', 6, 2018, CAST(2599.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (138, N'Trek Fuel EX 5 Plus - 2018', 6, 2018, CAST(2249.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (139, N'Trek Remedy 7 27.5 - 2018', 6, 2018, CAST(2999.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (140, N'Trek Remedy 9.8 27.5 - 2018', 6, 2018, CAST(4999.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (141, N'Trek Stache 5 - 2018', 6, 2018, CAST(1599.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (142, N'Trek Fuel EX 8 29 XT - 2018', 6, 2018, CAST(3199.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (185, N'Trek Conduit+ - 2018', 5, 2018, CAST(2799.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (186, N'Trek CrossRip+ - 2018', 5, 2018, CAST(4499.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (187, N'Trek Neko+ - 2018', 5, 2018, CAST(2799.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (188, N'Trek XM700+ Lowstep - 2018', 5, 2018, CAST(3499.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (189, N'Trek Lift+ Lowstep - 2018', 5, 2018, CAST(2799.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (190, N'Trek Dual Sport+ - 2018', 5, 2018, CAST(2799.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (191, N'Electra Loft Go! 8i - 2018', 5, 2018, CAST(2799.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (192, N'Electra Townie Go! 8i - 2017/2018', 5, 2018, CAST(2599.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (193, N'Trek Lift+ - 2018', 5, 2018, CAST(2799.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (194, N'Trek XM700+ - 2018', 5, 2018, CAST(3499.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (195, N'Electra Townie Go! 8i Ladies'' - 2018', 5, 2018, CAST(2599.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (196, N'Trek Verve+ - 2018', 5, 2018, CAST(2299.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (197, N'Trek Verve+ Lowstep - 2018', 5, 2018, CAST(2299.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (198, N'Electra Townie Commute Go! - 2018', 5, 2018, CAST(2999.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (199, N'Electra Townie Commute Go! Ladies'' - 2018', 5, 2018, CAST(2999.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (200, N'Trek Powerfly 5 - 2018', 5, 2018, CAST(3499.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (201, N'Trek Powerfly 5 FS - 2018', 5, 2018, CAST(4499.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (202, N'Trek Powerfly 5 Women''s - 2018', 5, 2018, CAST(3499.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (203, N'Trek Powerfly 7 FS - 2018', 5, 2018, CAST(4999.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (204, N'Trek Super Commuter+ 7 - 2018', 5, 2018, CAST(3599.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (205, N'Trek Super Commuter+ 8S - 2018', 5, 2018, CAST(4999.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (206, N'Trek Boone 5 Disc - 2018', 4, 2018, CAST(3299.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (207, N'Trek Boone 7 Disc - 2018', 4, 2018, CAST(3999.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (208, N'Trek Crockett 5 Disc - 2018', 4, 2018, CAST(1799.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (209, N'Trek Crockett 7 Disc - 2018', 4, 2018, CAST(2999.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (210, N'Surly Straggler - 2018', 4, 2018, CAST(1549.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (211, N'Surly Straggler 650b - 2018', 4, 2018, CAST(1549.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (212, N'Electra Townie Original 21D - 2018', 3, 2018, CAST(559.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (213, N'Electra Cruiser 1 - 2016/2017/2018', 3, 2018, CAST(269.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (214, N'Electra Tiger Shark 3i - 2018', 3, 2018, CAST(899.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (215, N'Electra Queen of Hearts 3i - 2018', 3, 2018, CAST(749.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (216, N'Electra Super Moto 8i - 2018', 3, 2018, CAST(899.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (217, N'Electra Straight 8 3i - 2018', 3, 2018, CAST(909.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (218, N'Electra Cruiser 7D - 2016/2017/2018', 3, 2018, CAST(319.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (219, N'Electra Moto 3i - 2018', 3, 2018, CAST(639.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (220, N'Electra Cruiser 1 Ladies'' - 2018', 3, 2018, CAST(269.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (221, N'Electra Cruiser 7D Ladies'' - 2016/2018', 3, 2018, CAST(319.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (222, N'Electra Cruiser 1 Tall - 2016/2018', 3, 2018, CAST(269.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (223, N'Electra Cruiser Lux 3i - 2018', 3, 2018, CAST(529.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (224, N'Electra Cruiser Lux 7D - 2018', 3, 2018, CAST(479.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (225, N'Electra Delivery 3i - 2016/2017/2018', 3, 2018, CAST(959.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (226, N'Electra Townie Original 21D EQ - 2017/2018', 3, 2018, CAST(679.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (227, N'Electra Cruiser 7D (24-Inch) Ladies'' - 2016/2018', 3, 2018, CAST(319.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (228, N'Electra Cruiser 7D Tall - 2016/2018', 3, 2018, CAST(319.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (229, N'Electra Cruiser Lux 1 - 2016/2018', 3, 2018, CAST(429.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (230, N'Electra Cruiser Lux 1 Ladies'' - 2018', 3, 2018, CAST(429.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (231, N'Electra Cruiser Lux 3i Ladies'' - 2018', 3, 2018, CAST(529.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (232, N'Electra Cruiser Lux 7D Ladies'' - 2018', 3, 2018, CAST(479.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (233, N'Electra Cruiser Lux Fat Tire 7D - 2018', 3, 2018, CAST(639.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (234, N'Electra Daydreamer 3i Ladies'' - 2018', 3, 2018, CAST(899.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (235, N'Electra Koa 3i Ladies'' - 2018', 3, 2018, CAST(899.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (236, N'Electra Morningstar 3i Ladies'' - 2018', 3, 2018, CAST(749.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (237, N'Electra Relic 3i - 2018', 3, 2018, CAST(849.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (238, N'Electra Townie Balloon 8D EQ - 2016/2017/2018', 3, 2018, CAST(749.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (239, N'Electra Townie Balloon 8D EQ Ladies'' - 2016/2017/2018', 3, 2018, CAST(749.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (240, N'Electra Townie Commute 27D Ladies - 2018', 3, 2018, CAST(899.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (241, N'Electra Townie Commute 8D - 2018', 3, 2018, CAST(749.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (242, N'Electra Townie Commute 8D Ladies'' - 2018', 3, 2018, CAST(699.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (243, N'Electra Townie Original 21D EQ Ladies'' - 2018', 3, 2018, CAST(679.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (244, N'Electra Townie Original 21D Ladies'' - 2018', 3, 2018, CAST(559.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (245, N'Electra Townie Original 3i EQ - 2017/2018', 3, 2018, CAST(659.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (246, N'Electra Townie Original 3i EQ Ladies'' - 2018', 3, 2018, CAST(639.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (247, N'Electra Townie Original 7D EQ - 2018', 3, 2018, CAST(599.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (248, N'Electra Townie Original 7D EQ Ladies'' - 2017/2018', 3, 2018, CAST(599.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (249, N'Electra White Water 3i - 2018', 3, 2018, CAST(749.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (250, N'Electra Townie Go! 8i - 2017/2018', 3, 2018, CAST(2599.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (251, N'Electra Townie Commute Go! - 2018', 3, 2018, CAST(2999.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (252, N'Electra Townie Commute Go! Ladies'' - 2018', 3, 2018, CAST(2999.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (253, N'Electra Townie Go! 8i Ladies'' - 2018', 3, 2018, CAST(2599.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (254, N'Electra Townie Balloon 3i EQ - 2017/2018', 3, 2018, CAST(749.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (255, N'Electra Townie Balloon 7i EQ Ladies'' - 2017/2018', 3, 2018, CAST(899.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (256, N'Electra Townie Commute 27D - 2018', 3, 2018, CAST(899.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (257, N'Electra Amsterdam Fashion 3i Ladies'' - 2017/2018', 3, 2018, CAST(899.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (258, N'Electra Amsterdam Royal 8i - 2017/2018', 3, 2018, CAST(1259.90 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (259, N'Electra Amsterdam Royal 8i Ladies - 2018', 3, 2018, CAST(1199.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (260, N'Electra Townie Balloon 3i EQ Ladies'' - 2018', 3, 2018, CAST(799.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (261, N'Electra Townie Balloon 7i EQ - 2018', 3, 2018, CAST(899.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (262, N'Trek MT 201 - 2018', 1, 2018, CAST(249.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (263, N'Strider Classic 12 Balance Bike - 2018', 1, 2018, CAST(89.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (264, N'Strider Sport 16 - 2018', 1, 2018, CAST(249.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (265, N'Strider Strider 20 Sport - 2018', 1, 2018, CAST(289.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (266, N'Trek Superfly 20 - 2018', 1, 2018, CAST(399.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (267, N'Trek Precaliber 12 Girl''s - 2018', 1, 2018, CAST(199.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (268, N'Trek Kickster - 2018', 1, 2018, CAST(159.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (269, N'Trek Precaliber 12 Boy''s - 2018', 1, 2018, CAST(199.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (270, N'Trek Precaliber 16 Boy''s - 2018', 1, 2018, CAST(209.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (271, N'Trek Precaliber 16 Girl''s - 2018', 1, 2018, CAST(209.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (272, N'Trek Precaliber 20 6-speed Boy''s - 2018', 1, 2018, CAST(289.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (273, N'Trek Precaliber 20 6-speed Girl''s - 2018', 1, 2018, CAST(289.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (274, N'Trek Precaliber 20 Boy''s - 2018', 1, 2018, CAST(229.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (275, N'Trek Precaliber 20 Girl''s - 2018', 1, 2018, CAST(229.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (276, N'Trek Precaliber 24 (7-Speed) - Boys - 2018', 1, 2018, CAST(319.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (277, N'Trek Precaliber 24 21-speed Boy''s - 2018', 1, 2018, CAST(369.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (278, N'Trek Precaliber 24 21-speed Girl''s - 2018', 1, 2018, CAST(369.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (279, N'Trek Precaliber 24 7-speed Girl''s - 2018', 1, 2018, CAST(319.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (280, N'Trek Superfly 24 - 2017/2018', 1, 2018, CAST(489.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (281, N'Electra Cruiser 7D (24-Inch) Ladies'' - 2016/2018', 1, 2018, CAST(319.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (282, N'Electra Cyclosaurus 1 (16-inch) - Boy''s - 2018', 1, 2018, CAST(279.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (283, N'Electra Heartchya 1 (20-inch) - Girl''s - 2018', 1, 2018, CAST(319.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (284, N'Electra Savannah 1 (20-inch) - Girl''s - 2018', 1, 2018, CAST(319.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (285, N'Electra Soft Serve 1 (16-inch) - Girl''s - 2018', 1, 2018, CAST(279.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (286, N'Electra Starship 1 16" - 2018', 1, 2018, CAST(279.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (287, N'Electra Straight 8 1 (16-inch) - Boy''s - 2018', 1, 2018, CAST(279.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (288, N'Electra Straight 8 1 (20-inch) - Boy''s - 2018', 1, 2018, CAST(389.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (289, N'Electra Superbolt 1 20" - 2018', 1, 2018, CAST(319.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (290, N'Electra Superbolt 3i 20" - 2018', 1, 2018, CAST(369.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (291, N'Electra Sweet Ride 1 (20-inch) - Girl''s - 2018', 1, 2018, CAST(319.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (292, N'Electra Sweet Ride 3i (20-inch) - Girls'' - 2018', 1, 2018, CAST(369.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (293, N'Electra Tiger Shark 1 (20-inch) - Boys'' - 2018', 1, 2018, CAST(319.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (294, N'Electra Tiger Shark 3i (20-inch) - Boys'' - 2018', 1, 2018, CAST(369.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (295, N'Electra Treasure 1 20" - 2018', 1, 2018, CAST(319.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (296, N'Electra Treasure 3i 20" - 2018', 1, 2018, CAST(369.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (297, N'Electra Under-The-Sea 1 16" - 2018', 1, 2018, CAST(279.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (298, N'Electra Water Lily 1 (16-inch) - Girl''s - 2018', 1, 2018, CAST(279.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (299, N'Electra Townie Original 21D - 2018', 2, 2018, CAST(559.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (300, N'Electra Townie Balloon 3i EQ Ladies'' - 2018', 2, 2018, CAST(799.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (301, N'Electra Townie Balloon 7i EQ - 2018', 2, 2018, CAST(899.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (302, N'Electra Townie Original 1 - 2018', 2, 2018, CAST(449.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (303, N'Electra Townie Go! 8i - 2017/2018', 2, 2018, CAST(2599.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (304, N'Electra Townie Original 21D EQ - 2017/2018', 2, 2018, CAST(679.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (305, N'Electra Townie Balloon 3i EQ - 2017/2018', 2, 2018, CAST(749.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (306, N'Electra Townie Balloon 7i EQ Ladies'' - 2017/2018', 2, 2018, CAST(899.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (307, N'Electra Townie Balloon 8D EQ - 2016/2017/2018', 2, 2018, CAST(749.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (308, N'Electra Townie Balloon 8D EQ Ladies'' - 2016/2017/2018', 2, 2018, CAST(749.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (309, N'Electra Townie Commute 27D - 2018', 2, 2018, CAST(899.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (310, N'Electra Townie Commute 27D Ladies - 2018', 2, 2018, CAST(899.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (311, N'Electra Townie Commute 8D - 2018', 2, 2018, CAST(749.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (312, N'Electra Townie Commute 8D Ladies'' - 2018', 2, 2018, CAST(699.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (313, N'Electra Townie Original 1 Ladies'' - 2018', 2, 2018, CAST(449.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (314, N'Electra Townie Original 21D EQ Ladies'' - 2018', 2, 2018, CAST(679.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[products] ([product_id], [product_name], [category_id], [model_year], [list_price]) VALUES (315, N'Electra Townie Original 21D Ladies'' - 2018', 2, 2018, CAST(559.99 AS Decimal(10, 2)))
GO
SET IDENTITY_INSERT [dbo].[products] OFF
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 1, 27)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 2, 5)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 3, 6)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 4, 23)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 5, 22)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 6, 0)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 7, 8)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 8, 0)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 9, 11)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 10, 15)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 11, 8)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 12, 16)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 13, 13)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 14, 8)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 15, 3)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 16, 4)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 17, 2)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 18, 16)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 19, 4)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 20, 26)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 21, 24)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 22, 29)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 23, 9)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 24, 10)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 25, 10)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 26, 16)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 27, 21)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 28, 20)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 29, 13)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 30, 30)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 31, 2)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 32, 0)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 33, 10)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 34, 2)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 35, 18)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 36, 26)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 37, 12)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 38, 13)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 39, 2)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 40, 24)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 41, 10)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 42, 0)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 43, 2)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 44, 1)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 45, 15)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 46, 19)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 47, 21)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 60, 19)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 61, 30)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 62, 21)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 63, 4)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 64, 30)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 65, 10)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 66, 12)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 67, 19)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 68, 30)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 69, 4)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 70, 3)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 71, 25)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 72, 9)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 73, 7)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 74, 9)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 75, 23)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 76, 15)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 77, 16)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 78, 13)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 79, 13)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 80, 11)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 81, 25)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 82, 1)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 83, 13)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 84, 11)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 85, 23)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 86, 19)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 87, 27)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 88, 7)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 89, 9)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 90, 4)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 91, 8)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 92, 0)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 93, 22)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 94, 6)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 95, 25)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 96, 20)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 97, 20)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 98, 28)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 99, 28)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 100, 15)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 101, 17)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 102, 9)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 103, 13)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 104, 25)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 105, 7)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 106, 30)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 107, 20)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 108, 15)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 109, 30)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 110, 1)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 111, 11)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 112, 17)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 113, 24)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 114, 3)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 115, 10)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 116, 24)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 117, 15)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 118, 12)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 119, 17)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 120, 23)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 121, 19)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 122, 22)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 123, 8)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 124, 23)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 125, 22)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 126, 28)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 127, 12)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 128, 11)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 129, 21)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 130, 22)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 131, 20)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 132, 1)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 133, 9)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 134, 26)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 135, 15)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 136, 12)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 137, 12)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 138, 6)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 139, 17)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 140, 3)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 141, 21)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 142, 22)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 185, 3)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 186, 1)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 187, 16)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 188, 30)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 189, 6)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 190, 21)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 191, 21)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 192, 20)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 193, 30)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 194, 24)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 195, 1)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 196, 26)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 197, 22)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 198, 1)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 199, 2)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 200, 27)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 201, 16)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 202, 5)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 203, 4)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 204, 23)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 205, 9)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 206, 10)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 207, 27)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 208, 13)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 209, 22)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 210, 25)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 211, 13)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 212, 17)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 213, 14)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 214, 4)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 215, 1)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 216, 11)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 217, 11)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 218, 27)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 219, 30)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 220, 4)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 221, 7)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 222, 12)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 223, 3)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 224, 16)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 225, 24)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 226, 18)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 227, 19)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 228, 22)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 229, 27)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 230, 7)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 231, 25)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 232, 5)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 233, 5)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 234, 13)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 235, 7)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 236, 18)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 237, 26)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 238, 20)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 239, 28)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 240, 17)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 241, 17)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 242, 10)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 243, 11)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 244, 10)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 245, 3)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 246, 0)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 247, 15)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 248, 14)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 249, 27)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 250, 3)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 251, 2)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 252, 28)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 253, 16)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 254, 24)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 255, 13)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 256, 20)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 257, 17)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 258, 25)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 259, 10)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 260, 20)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 261, 3)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 262, 6)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 263, 21)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 264, 16)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 265, 28)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 266, 1)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 267, 27)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 268, 23)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 269, 22)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 270, 16)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 271, 6)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 272, 14)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 273, 20)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 274, 19)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 275, 28)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 276, 7)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 277, 13)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 278, 17)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 279, 17)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 280, 23)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 281, 11)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 282, 6)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 283, 10)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 284, 27)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 285, 20)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 286, 28)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 287, 2)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 288, 9)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 289, 2)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 290, 8)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 291, 9)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 292, 30)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 293, 18)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 294, 3)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 295, 24)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 296, 9)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 297, 22)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 298, 26)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 299, 18)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 300, 7)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 301, 10)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 302, 0)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 303, 12)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 304, 15)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 305, 23)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 306, 21)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 307, 17)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 308, 23)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 309, 7)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 310, 18)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 311, 20)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 312, 23)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 313, 14)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 1, 14)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 2, 16)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 3, 28)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 4, 2)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 5, 1)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 6, 11)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 7, 8)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 8, 1)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 9, 17)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 10, 13)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 11, 21)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 12, 2)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 13, 1)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 14, 18)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 15, 6)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 16, 20)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 17, 3)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 18, 13)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 19, 15)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 20, 20)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 21, 16)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 22, 0)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 23, 12)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 24, 16)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 25, 18)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 26, 2)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 27, 10)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 28, 25)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 29, 29)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 30, 17)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 31, 10)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 32, 13)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 33, 8)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 34, 24)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 35, 25)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 36, 15)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 37, 5)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 38, 18)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 39, 28)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 40, 15)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 41, 6)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 42, 16)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 43, 2)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 44, 24)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 45, 13)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 46, 18)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 47, 0)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 60, 1)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 61, 20)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 62, 4)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 63, 5)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 64, 30)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 65, 16)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 66, 22)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 67, 8)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 68, 23)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 69, 22)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 70, 6)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 71, 30)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 72, 1)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 73, 20)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 74, 23)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 75, 11)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 76, 20)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 77, 25)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 78, 4)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 79, 29)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 80, 27)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 81, 19)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 82, 4)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 83, 21)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 84, 22)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 85, 6)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 86, 24)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 87, 14)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 88, 8)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 89, 8)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 90, 26)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 91, 0)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 92, 22)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 93, 22)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 94, 2)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 95, 10)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 96, 22)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 97, 15)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 98, 14)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 99, 24)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 100, 12)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 101, 4)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 102, 12)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 103, 1)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 104, 26)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 105, 3)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 106, 7)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 107, 29)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 108, 29)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 109, 25)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 110, 7)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 111, 6)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 112, 1)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 113, 7)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 114, 12)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 115, 19)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 116, 17)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 117, 18)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 118, 25)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 119, 23)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 120, 16)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 121, 3)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 122, 11)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 123, 18)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 124, 4)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 125, 10)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 126, 13)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 127, 12)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 128, 28)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 129, 21)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 130, 17)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 131, 9)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 132, 6)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 133, 28)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 134, 13)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 135, 30)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 136, 8)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 137, 1)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 138, 16)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 139, 24)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 140, 13)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 141, 28)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 142, 24)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 185, 4)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 186, 16)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 187, 10)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 188, 27)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 189, 13)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 190, 18)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 191, 15)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 192, 0)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 193, 21)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 194, 15)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 195, 19)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 196, 28)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 197, 10)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 198, 0)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 199, 13)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 200, 11)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 201, 24)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 202, 1)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 203, 7)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 204, 25)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 205, 13)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 206, 9)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 207, 8)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 208, 12)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 209, 11)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 210, 10)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 211, 4)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 212, 22)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 213, 10)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 214, 7)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 215, 11)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 216, 19)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 217, 22)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 218, 26)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 219, 16)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 220, 6)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 221, 12)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 222, 30)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 223, 7)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 224, 4)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 225, 11)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 226, 5)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 227, 12)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 228, 7)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 229, 29)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 230, 25)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 231, 8)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 232, 11)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 233, 25)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 234, 12)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 235, 4)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 236, 7)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 237, 30)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 238, 6)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 239, 17)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 240, 19)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 241, 24)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 242, 2)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 243, 18)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 244, 1)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 245, 18)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 246, 10)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 247, 16)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 248, 26)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 249, 10)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 250, 23)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 251, 0)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 252, 20)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 253, 29)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 254, 7)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 255, 12)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 256, 8)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 257, 5)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 258, 10)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 259, 16)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 260, 20)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 261, 4)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 262, 8)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 263, 4)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 264, 13)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 265, 4)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 266, 18)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 267, 21)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 268, 3)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 269, 4)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 270, 15)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 271, 26)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 272, 1)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 273, 28)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 274, 15)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 275, 3)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 276, 9)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 277, 4)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 278, 8)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 279, 18)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 280, 11)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 281, 3)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 282, 8)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 283, 28)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 284, 6)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 285, 22)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 286, 3)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 287, 15)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 288, 13)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 289, 5)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 290, 29)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 291, 22)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 292, 22)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 293, 12)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 294, 7)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 295, 15)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 296, 8)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 297, 7)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 298, 27)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 299, 0)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 300, 13)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 301, 26)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 302, 6)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 303, 23)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 304, 6)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 305, 21)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 306, 17)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 307, 18)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 308, 15)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 309, 9)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 310, 5)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 311, 27)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 312, 2)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 313, 24)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 1, 14)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 2, 24)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 3, 0)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 4, 11)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 5, 3)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 6, 27)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 7, 12)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 8, 12)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 9, 23)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 10, 21)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 11, 30)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 12, 30)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 13, 19)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 14, 4)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 15, 22)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 16, 19)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 17, 22)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 18, 5)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 19, 24)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 20, 19)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 21, 8)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 22, 20)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 23, 8)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 24, 18)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 25, 15)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 26, 27)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 27, 21)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 28, 20)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 29, 11)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 30, 23)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 31, 10)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 32, 14)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 33, 14)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 34, 6)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 35, 3)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 36, 28)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 37, 30)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 38, 23)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 39, 22)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 40, 2)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 41, 25)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 42, 9)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 43, 26)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 44, 26)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 45, 1)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 46, 16)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 47, 14)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 60, 7)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 61, 28)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 62, 4)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 63, 8)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 64, 22)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 65, 1)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 66, 3)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 67, 6)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 68, 18)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 69, 29)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 70, 2)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 71, 13)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 72, 6)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 73, 3)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 74, 17)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 75, 29)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 76, 23)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 77, 23)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 78, 19)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 79, 29)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 80, 22)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 81, 18)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 82, 7)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 83, 23)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 84, 15)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 85, 15)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 86, 27)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 87, 16)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 88, 28)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 89, 22)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 90, 9)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 91, 8)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 92, 28)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 93, 18)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 94, 15)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 95, 14)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 96, 1)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 97, 28)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 98, 5)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 99, 19)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 100, 28)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 101, 17)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 102, 22)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 103, 10)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 104, 22)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 105, 1)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 106, 1)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 107, 11)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 108, 23)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 109, 24)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 110, 11)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 111, 29)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 112, 24)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 113, 23)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 114, 12)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 115, 25)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 116, 30)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 117, 23)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 118, 9)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 119, 29)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 120, 25)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 121, 4)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 122, 8)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 123, 15)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 124, 11)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 125, 2)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 126, 5)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 127, 4)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 128, 20)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 129, 10)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 130, 20)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 131, 23)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 132, 16)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 133, 16)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 134, 17)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 135, 15)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 136, 4)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 137, 17)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 138, 17)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 139, 21)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 140, 3)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 141, 4)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 142, 29)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 185, 15)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 186, 30)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 187, 2)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 188, 29)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 189, 20)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 190, 20)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 191, 23)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 192, 10)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 193, 5)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 194, 20)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 195, 20)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 196, 25)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 197, 8)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 198, 27)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 199, 5)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 200, 29)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 201, 30)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 202, 11)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 203, 6)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 204, 16)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 205, 3)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 206, 29)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 207, 29)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 208, 12)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 209, 1)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 210, 22)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 211, 3)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 212, 23)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 213, 10)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 214, 30)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 215, 12)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 216, 5)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 217, 4)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 218, 21)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 219, 29)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 220, 0)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 221, 25)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 222, 12)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 223, 29)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 224, 23)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 225, 12)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 226, 14)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 227, 22)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 228, 29)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 229, 7)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 230, 29)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 231, 6)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 232, 16)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 233, 9)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 234, 24)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 235, 1)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 236, 3)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 237, 16)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 238, 12)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 239, 29)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 240, 26)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 241, 8)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 242, 5)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 243, 7)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 244, 5)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 245, 10)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 246, 7)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 247, 3)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 248, 11)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 249, 6)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 250, 16)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 251, 10)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 252, 27)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 253, 15)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 254, 4)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 255, 17)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 256, 1)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 257, 25)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 258, 10)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 259, 0)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 260, 5)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 261, 24)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 262, 29)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 263, 21)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 264, 7)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 265, 22)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 266, 18)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 267, 12)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 268, 17)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 269, 26)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 270, 6)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 271, 23)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 272, 12)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 273, 19)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 274, 7)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 275, 23)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 276, 14)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 277, 26)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 278, 15)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 279, 15)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 280, 1)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 281, 2)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 282, 18)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 283, 1)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 284, 26)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 285, 2)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 286, 7)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 287, 26)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 288, 2)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 289, 2)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 290, 6)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 291, 10)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 292, 16)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 293, 14)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 294, 13)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 295, 9)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 296, 12)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 297, 22)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 298, 14)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 299, 29)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 300, 3)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 301, 29)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 302, 6)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 303, 13)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 304, 23)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 305, 11)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 306, 7)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 307, 17)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 308, 9)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 309, 30)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 310, 8)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 311, 23)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 312, 18)
GO
INSERT [dbo].[stocks] ([store_id], [product_id], [quantity]) VALUES (3, 313, 0)
GO
SET IDENTITY_INSERT [dbo].[stores] ON 
GO
INSERT [dbo].[stores] ([store_id], [store_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1, N'Santa Cruz Bikes', N'(831) 476-4321', N'santacruz@bikes.shop', N'3700 Portola Drive', N'Santa Cruz', N'CA', N'95060')
GO
INSERT [dbo].[stores] ([store_id], [store_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (2, N'Baldwin Bikes', N'(516) 379-8888', N'baldwin@bikes.shop', N'4200 Chestnut Lane', N'Baldwin', N'NY', N'11432')
GO
INSERT [dbo].[stores] ([store_id], [store_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (3, N'Rowlett Bikes', N'(972) 530-5555', N'rowlett@bikes.shop', N'8000 Fairway Avenue', N'Rowlett', N'TX', N'75088')
GO
SET IDENTITY_INSERT [dbo].[stores] OFF
GO
ALTER TABLE [dbo].[order_items] ADD  DEFAULT ((0)) FOR [discount]
GO
ALTER TABLE [dbo].[order_items]  WITH CHECK ADD FOREIGN KEY([order_id])
REFERENCES [dbo].[orders] ([order_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[order_items]  WITH CHECK ADD FOREIGN KEY([product_id])
REFERENCES [dbo].[products] ([product_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD FOREIGN KEY([customer_id])
REFERENCES [dbo].[customers] ([customer_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD FOREIGN KEY([store_id])
REFERENCES [dbo].[stores] ([store_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[products]  WITH CHECK ADD FOREIGN KEY([category_id])
REFERENCES [dbo].[categories] ([category_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[stocks]  WITH CHECK ADD FOREIGN KEY([product_id])
REFERENCES [dbo].[products] ([product_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[stocks]  WITH CHECK ADD FOREIGN KEY([store_id])
REFERENCES [dbo].[stores] ([store_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
