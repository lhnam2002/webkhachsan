USE [DacsA]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 19/06/2024 9:41:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Amenities]    Script Date: 19/06/2024 9:41:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Amenities](
	[AmId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](500) NOT NULL,
 CONSTRAINT [PK_Amenities] PRIMARY KEY CLUSTERED 
(
	[AmId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoleClaims]    Script Date: 19/06/2024 9:41:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoleClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoleClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 19/06/2024 9:41:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](256) NULL,
	[NormalizedName] [nvarchar](256) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 19/06/2024 9:41:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 19/06/2024 9:41:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](450) NOT NULL,
	[ProviderKey] [nvarchar](450) NOT NULL,
	[ProviderDisplayName] [nvarchar](max) NULL,
	[UserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 19/06/2024 9:41:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](450) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 19/06/2024 9:41:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](450) NOT NULL,
	[UserName] [nvarchar](256) NULL,
	[NormalizedUserName] [nvarchar](256) NULL,
	[Email] [nvarchar](256) NULL,
	[NormalizedEmail] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEnd] [datetimeoffset](7) NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[Address] [nvarchar](max) NULL,
	[Age] [nvarchar](max) NULL,
	[FullName] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserTokens]    Script Date: 19/06/2024 9:41:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserTokens](
	[UserId] [nvarchar](450) NOT NULL,
	[LoginProvider] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](450) NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserTokens] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[LoginProvider] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BookingCarts]    Script Date: 19/06/2024 9:41:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BookingCarts](
	[BkId] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_BookingCarts] PRIMARY KEY CLUSTERED 
(
	[BkId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BookingDetails]    Script Date: 19/06/2024 9:41:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BookingDetails](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[BookingId] [int] NOT NULL,
	[RoomId] [int] NOT NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[NgayCheckin] [datetime2](7) NOT NULL,
	[NgayCheckout] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_BookingDetails] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BookingItems]    Script Date: 19/06/2024 9:41:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BookingItems](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[ImageUrl] [nvarchar](max) NULL,
	[CheckOut] [datetime2](7) NOT NULL,
	[CheckIn] [datetime2](7) NOT NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[BookingCartBkId] [int] NULL,
 CONSTRAINT [PK_BookingItems] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Bookings]    Script Date: 19/06/2024 9:41:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bookings](
	[BkId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[NgayDatPhong] [datetime2](7) NOT NULL,
	[TotalPrice] [decimal](18, 2) NOT NULL,
	[Content] [nvarchar](max) NULL,
	[Notes] [nvarchar](max) NULL,
 CONSTRAINT [PK_Bookings] PRIMARY KEY CLUSTERED 
(
	[BkId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 19/06/2024 9:41:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[CateId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](500) NOT NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[CateId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Favorite]    Script Date: 19/06/2024 9:41:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Favorite](
	[FavoriteId] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_Favorite] PRIMARY KEY CLUSTERED 
(
	[FavoriteId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FavoriteItems]    Script Date: 19/06/2024 9:41:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FavoriteItems](
	[RoomId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[ImageUrl] [nvarchar](max) NULL,
	[CategoryId] [int] NOT NULL,
	[FavoriteId] [int] NULL,
 CONSTRAINT [PK_FavoriteItems] PRIMARY KEY CLUSTERED 
(
	[RoomId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RoomImages]    Script Date: 19/06/2024 9:41:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoomImages](
	[ImageId] [int] IDENTITY(1,1) NOT NULL,
	[Url] [nvarchar](max) NOT NULL,
	[ProductId] [int] NOT NULL,
	[RoomId] [int] NULL,
 CONSTRAINT [PK_RoomImages] PRIMARY KEY CLUSTERED 
(
	[ImageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rooms]    Script Date: 19/06/2024 9:41:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rooms](
	[RoomId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[ImageUrl] [nvarchar](max) NULL,
	[Image1] [nvarchar](max) NULL,
	[Image2] [nvarchar](max) NULL,
	[CategoryId] [int] NOT NULL,
	[AmenityAmId] [int] NULL,
 CONSTRAINT [PK_Rooms] PRIMARY KEY CLUSTERED 
(
	[RoomId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240424093231_Initial', N'8.0.4')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240425111835_AddIdentity', N'8.0.4')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240425132735_ExtendIdentityUser', N'8.0.4')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240504103556_favoriteItem', N'8.0.4')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240504103904_favoriteItemNew', N'8.0.4')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240504143014_favoriteUpdate', N'8.0.4')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240518103436_A', N'8.0.4')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240518104026_ABC', N'8.0.4')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240518111152_AB', N'8.0.4')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240524131709_BookingAndBookingOrder', N'8.0.4')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240525041555_AddContenBk', N'8.0.4')
GO
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'279d60e7-c313-4c8f-b32d-36f9855663fe', N'Employee', N'EMPLOYEE', NULL)
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'6420ceb1-42e1-4aab-a07f-2270b22b6c76', N'Customer', N'CUSTOMER', NULL)
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'c88df323-db3b-4249-b20c-f9f8ba261486', N'Admin', N'ADMIN', NULL)
GO
INSERT [dbo].[AspNetUserLogins] ([LoginProvider], [ProviderKey], [ProviderDisplayName], [UserId]) VALUES (N'Facebook', N'1019183839828453', N'Facebook', N'83f99b36-490b-4b74-a879-784dd006aefd')
INSERT [dbo].[AspNetUserLogins] ([LoginProvider], [ProviderKey], [ProviderDisplayName], [UserId]) VALUES (N'Google', N'108726275680270890840', N'Google', N'2c29753b-dca3-4398-b6bd-87f04a88db9a')
INSERT [dbo].[AspNetUserLogins] ([LoginProvider], [ProviderKey], [ProviderDisplayName], [UserId]) VALUES (N'Google', N'109104939894164118829', N'Google', N'cc5d093d-d300-4a42-b8bf-32d831164918')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'756f4e6b-2c68-42a5-8bf6-4ffea2a55942', N'6420ceb1-42e1-4aab-a07f-2270b22b6c76')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'27f6a9e8-f0c7-4c17-8293-694a33599e38', N'c88df323-db3b-4249-b20c-f9f8ba261486')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'814c11e4-3998-4f44-9990-49d4bb0e70c3', N'c88df323-db3b-4249-b20c-f9f8ba261486')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'a13d30ec-76ff-4472-bde8-3a10b1f2f3ed', N'c88df323-db3b-4249-b20c-f9f8ba261486')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'fde7857c-cad5-48f0-9a98-792d8480f7b9', N'c88df323-db3b-4249-b20c-f9f8ba261486')
GO
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [Address], [Age], [FullName]) VALUES (N'27f6a9e8-f0c7-4c17-8293-694a33599e38', N'admin2@gmail.com', N'ADMIN2@GMAIL.COM', N'admin2@gmail.com', N'ADMIN2@GMAIL.COM', 0, N'AQAAAAIAAYagAAAAEBZZpHFFjXJESQFh06CGsliJtdEw02SXjIiXE2u6AlFirH79BDkGrzM9YrhHYy/NXQ==', N'ITAIEKWM64MLP4SAM4SPOSNWZ5MVI5DK', N'e4a0af95-9799-4ef1-b1c2-77fdd0eb8f4e', NULL, 0, 0, NULL, 1, 0, NULL, NULL, N'Admin2')
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [Address], [Age], [FullName]) VALUES (N'2c29753b-dca3-4398-b6bd-87f04a88db9a', N'luuhoangnam26122002@gmail.com', N'LUUHOANGNAM26122002@GMAIL.COM', N'luuhoangnam26122002@gmail.com', N'LUUHOANGNAM26122002@GMAIL.COM', 0, NULL, N'CPZO6ZRYU64NW2CWYXAPWXEOTIXA7QQV', N'550f0d06-2367-4647-b413-43df51a6e8c5', NULL, 0, 0, NULL, 1, 0, NULL, NULL, NULL)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [Address], [Age], [FullName]) VALUES (N'756f4e6b-2c68-42a5-8bf6-4ffea2a55942', N'test123@gmail.com', N'TEST123@GMAIL.COM', N'test123@gmail.com', N'TEST123@GMAIL.COM', 0, N'AQAAAAIAAYagAAAAEKuPwRe/s7N8ZHapAwaDuA22fZ390A2JOk5AOEk56iQcegCh5FuYU8rdi313kTXyRg==', N'HWQQH5FBRM6KJ3VDIFDFTG2DKRJOCYL2', N'7fcd9bd6-4549-40a2-ad37-3e174728d4cb', NULL, 0, 0, NULL, 1, 0, NULL, NULL, N'UserTest')
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [Address], [Age], [FullName]) VALUES (N'814c11e4-3998-4f44-9990-49d4bb0e70c3', N'nguyenthiminhthu92003@gmail.com', N'NGUYENTHIMINHTHU92003@GMAIL.COM', N'nguyenthiminhthu92003@gmail.com', N'NGUYENTHIMINHTHU92003@GMAIL.COM', 0, N'AQAAAAIAAYagAAAAEGB5gcsZ8wGc4dIDRd2Lk+AgBZyblrCT3m6OJ+4bG+dHxf27vuWcEkpd02hk+HJPZQ==', N'5SR6NHG323QNAT2Y7BANJ4K2NLIJPLMN', N'15f688d2-e767-435b-a15d-0b90d10a8bd0', NULL, 0, 0, NULL, 1, 0, NULL, NULL, N'Minh Thư')
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [Address], [Age], [FullName]) VALUES (N'83f99b36-490b-4b74-a879-784dd006aefd', N'luuhoangnamm@gmail.com', N'LUUHOANGNAMM@GMAIL.COM', N'luuhoangnamm@gmail.com', N'LUUHOANGNAMM@GMAIL.COM', 0, NULL, N'NONBM2DEAZ3PZEKXYYPOMIZP67GHT2TL', N'b7208386-521c-4232-9692-0a2e65f7834d', NULL, 0, 0, NULL, 1, 0, NULL, NULL, NULL)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [Address], [Age], [FullName]) VALUES (N'a13d30ec-76ff-4472-bde8-3a10b1f2f3ed', N'admintest@gmail.com', N'ADMINTEST@GMAIL.COM', N'admintest@gmail.com', N'ADMINTEST@GMAIL.COM', 0, N'AQAAAAIAAYagAAAAEEshnV4fCiJ50ExAnBDYSnJHKKj2g3AOGcNth8Th7Z8dRn+Hqye8X+vpmKcaO9F+7A==', N'53WCZGB57D4OTREYNSUWGOYYLCPRJLKU', N'adb5976c-52fa-4b7d-9829-b65fcfce7927', NULL, 0, 0, NULL, 1, 0, NULL, NULL, N'AdminTest')
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [Address], [Age], [FullName]) VALUES (N'cc5d093d-d300-4a42-b8bf-32d831164918', N'luuhoangnam261202@gmail.com', N'LUUHOANGNAM261202@GMAIL.COM', N'luuhoangnam261202@gmail.com', N'LUUHOANGNAM261202@GMAIL.COM', 0, NULL, N'MUWTZLQDV6FWRBVJHMZDJNROZL5HGOCI', N'0d0532c0-7ee4-4815-b489-e3a14ad8a386', NULL, 0, 0, NULL, 1, 0, NULL, NULL, N'AA')
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [Address], [Age], [FullName]) VALUES (N'fde7857c-cad5-48f0-9a98-792d8480f7b9', N'admin@gmail.com', N'ADMIN@GMAIL.COM', N'admin@gmail.com', N'ADMIN@GMAIL.COM', 0, N'AQAAAAIAAYagAAAAEGDfawPTeINIiwO9xWfmsVNJB+g01mlEDmXUuMVbrVDMvL4JUFxXORpT6kLE2hXT3g==', N'TSZ2CIX6XIZ3FBXHFZSUBWYZSJ4N4PCK', N'eb6ef6cf-321a-476c-aee2-a7ec0789fb91', NULL, 0, 0, NULL, 1, 0, NULL, NULL, N'Admin')
GO
INSERT [dbo].[AspNetUserTokens] ([UserId], [LoginProvider], [Name], [Value]) VALUES (N'814c11e4-3998-4f44-9990-49d4bb0e70c3', N'[AspNetUserStore]', N'AuthenticatorKey', N'JCD6FFPD3HS6TX3ALCWNTUEU674RTARD')
GO
SET IDENTITY_INSERT [dbo].[BookingDetails] ON 

INSERT [dbo].[BookingDetails] ([Id], [BookingId], [RoomId], [Price], [NgayCheckin], [NgayCheckout]) VALUES (1, 1, 1, CAST(5000.00 AS Decimal(18, 2)), CAST(N'2024-05-26T00:00:00.0000000' AS DateTime2), CAST(N'2024-05-29T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[BookingDetails] ([Id], [BookingId], [RoomId], [Price], [NgayCheckin], [NgayCheckout]) VALUES (2, 2, 2, CAST(1111.00 AS Decimal(18, 2)), CAST(N'2024-05-26T00:00:00.0000000' AS DateTime2), CAST(N'2024-05-27T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[BookingDetails] ([Id], [BookingId], [RoomId], [Price], [NgayCheckin], [NgayCheckout]) VALUES (3, 3, 1, CAST(5000.00 AS Decimal(18, 2)), CAST(N'2024-06-05T00:00:00.0000000' AS DateTime2), CAST(N'2024-06-07T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[BookingDetails] ([Id], [BookingId], [RoomId], [Price], [NgayCheckin], [NgayCheckout]) VALUES (4, 4, 1, CAST(5000.00 AS Decimal(18, 2)), CAST(N'2024-06-09T00:00:00.0000000' AS DateTime2), CAST(N'2024-06-11T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[BookingDetails] ([Id], [BookingId], [RoomId], [Price], [NgayCheckin], [NgayCheckout]) VALUES (6, 6, 3, CAST(23000.00 AS Decimal(18, 2)), CAST(N'2024-06-03T00:00:00.0000000' AS DateTime2), CAST(N'2024-06-05T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[BookingDetails] ([Id], [BookingId], [RoomId], [Price], [NgayCheckin], [NgayCheckout]) VALUES (7, 7, 2, CAST(1111.00 AS Decimal(18, 2)), CAST(N'2024-06-07T00:00:00.0000000' AS DateTime2), CAST(N'2024-06-11T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[BookingDetails] ([Id], [BookingId], [RoomId], [Price], [NgayCheckin], [NgayCheckout]) VALUES (8, 8, 3, CAST(23000.00 AS Decimal(18, 2)), CAST(N'2024-06-23T00:00:00.0000000' AS DateTime2), CAST(N'2024-06-25T00:00:00.0000000' AS DateTime2))
SET IDENTITY_INSERT [dbo].[BookingDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[Bookings] ON 

INSERT [dbo].[Bookings] ([BkId], [UserId], [NgayDatPhong], [TotalPrice], [Content], [Notes]) VALUES (1, N'fde7857c-cad5-48f0-9a98-792d8480f7b9', CAST(N'2024-05-25T04:59:50.2127392' AS DateTime2), CAST(15000.00 AS Decimal(18, 2)), N'Thanh toán tại khách sạn', N'Nhận phòng lúc 9h sáng')
INSERT [dbo].[Bookings] ([BkId], [UserId], [NgayDatPhong], [TotalPrice], [Content], [Notes]) VALUES (2, N'fde7857c-cad5-48f0-9a98-792d8480f7b9', CAST(N'2024-05-25T08:22:01.1291705' AS DateTime2), CAST(1111.00 AS Decimal(18, 2)), N'AAA', N'alfa')
INSERT [dbo].[Bookings] ([BkId], [UserId], [NgayDatPhong], [TotalPrice], [Content], [Notes]) VALUES (3, N'27f6a9e8-f0c7-4c17-8293-694a33599e38', CAST(N'2024-05-25T16:20:46.3660081' AS DateTime2), CAST(10000.00 AS Decimal(18, 2)), NULL, NULL)
INSERT [dbo].[Bookings] ([BkId], [UserId], [NgayDatPhong], [TotalPrice], [Content], [Notes]) VALUES (4, N'27f6a9e8-f0c7-4c17-8293-694a33599e38', CAST(N'2024-05-25T16:22:16.6256780' AS DateTime2), CAST(10000.00 AS Decimal(18, 2)), NULL, NULL)
INSERT [dbo].[Bookings] ([BkId], [UserId], [NgayDatPhong], [TotalPrice], [Content], [Notes]) VALUES (6, N'27f6a9e8-f0c7-4c17-8293-694a33599e38', CAST(N'2024-06-02T08:31:49.6575401' AS DateTime2), CAST(46000.00 AS Decimal(18, 2)), N'test thanh toán momo: 4052359596', NULL)
INSERT [dbo].[Bookings] ([BkId], [UserId], [NgayDatPhong], [TotalPrice], [Content], [Notes]) VALUES (7, N'27f6a9e8-f0c7-4c17-8293-694a33599e38', CAST(N'2024-06-06T13:14:39.6567736' AS DateTime2), CAST(4444.00 AS Decimal(18, 2)), N'638533009785781233', N'Nhaajj phòng vào sáng')
INSERT [dbo].[Bookings] ([BkId], [UserId], [NgayDatPhong], [TotalPrice], [Content], [Notes]) VALUES (8, N'83f99b36-490b-4b74-a879-784dd006aefd', CAST(N'2024-06-19T10:38:38.7530278' AS DateTime2), CAST(46000.00 AS Decimal(18, 2)), N'Mã giao dịch: 4064741574', NULL)
SET IDENTITY_INSERT [dbo].[Bookings] OFF
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([CateId], [Name]) VALUES (1, N'Hướng biển')
INSERT [dbo].[Categories] ([CateId], [Name]) VALUES (2, N'Hướng thành phố')
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[Rooms] ON 

INSERT [dbo].[Rooms] ([RoomId], [Name], [Price], [Description], [ImageUrl], [Image1], [Image2], [CategoryId], [AmenityAmId]) VALUES (1, N'B345', CAST(1500000.00 AS Decimal(18, 2)), N'2 phòng ngủ - 2 giường -2 phòng tắm', N'/images/Room/A100New.jpg', NULL, NULL, 1, NULL)
INSERT [dbo].[Rooms] ([RoomId], [Name], [Price], [Description], [ImageUrl], [Image1], [Image2], [CategoryId], [AmenityAmId]) VALUES (2, N'A123', CAST(1111.00 AS Decimal(18, 2)), N'2 phòng ngủ - 2 giường -2 phòng tắm', N'/images/Room/B300.jpg', N'/images/Room/A100New.jpg', N'/images/Room/B100.jpg', 1, NULL)
INSERT [dbo].[Rooms] ([RoomId], [Name], [Price], [Description], [ImageUrl], [Image1], [Image2], [CategoryId], [AmenityAmId]) VALUES (3, N'A124', CAST(23000.00 AS Decimal(18, 2)), N'2 phòng ngủ - 2 giường -2 phòng tắm', N'/images/Room/B100.jpg', N'/images/Room/B300.jpg', N'/images/Room/Hb100.jpg', 2, NULL)
INSERT [dbo].[Rooms] ([RoomId], [Name], [Price], [Description], [ImageUrl], [Image1], [Image2], [CategoryId], [AmenityAmId]) VALUES (4, N'A125', CAST(2300000.00 AS Decimal(18, 2)), N'1 phòng ngủ - 1 giường -1 phòng tắm', N'/images/Room/B345jpg.jpg', N'/images/Room/A100New.jpg', N'/images/Room/Hb100.jpg', 2, NULL)
INSERT [dbo].[Rooms] ([RoomId], [Name], [Price], [Description], [ImageUrl], [Image1], [Image2], [CategoryId], [AmenityAmId]) VALUES (5, N'B100', CAST(2500000.00 AS Decimal(18, 2)), N'2 phòng ngủ - 2 giường -2 phòng tắm', N'/images/Room/A222.jpg', N'/images/Room/Hb100.jpg', N'/images/Room/B345jpg.jpg', 1, NULL)
INSERT [dbo].[Rooms] ([RoomId], [Name], [Price], [Description], [ImageUrl], [Image1], [Image2], [CategoryId], [AmenityAmId]) VALUES (6, N'B302', CAST(2300000.00 AS Decimal(18, 2)), N'2 phòng ngủ - 2 giường -2 phòng tắm', N'/images/Room/A202.jpg', N'/images/Room/Hb100.jpg', N'/images/Room/A222.jpg', 1, NULL)
INSERT [dbo].[Rooms] ([RoomId], [Name], [Price], [Description], [ImageUrl], [Image1], [Image2], [CategoryId], [AmenityAmId]) VALUES (7, N'B322', CAST(2000000.00 AS Decimal(18, 2)), N'1 phòng ngủ - 1 giường -1 phòng tắm', N'/images/Room/A222.jpg', N'/images/Room/B345jpg.jpg', N'/images/Room/Hb100.jpg', 1, NULL)
INSERT [dbo].[Rooms] ([RoomId], [Name], [Price], [Description], [ImageUrl], [Image1], [Image2], [CategoryId], [AmenityAmId]) VALUES (8, N'A456', CAST(1800000.00 AS Decimal(18, 2)), N'1 phòng ngủ - 1 giường -1 phòng tắm', N'/images/Room/B345jpg.jpg', N'/images/Room/A100New.jpg', N'/images/Room/A202.jpg', 2, NULL)
INSERT [dbo].[Rooms] ([RoomId], [Name], [Price], [Description], [ImageUrl], [Image1], [Image2], [CategoryId], [AmenityAmId]) VALUES (9, N'B380', CAST(2300000.00 AS Decimal(18, 2)), N'2 phòng ngủ - 2 giường -2 phòng tắm', N'/images/Room/B345jpg.jpg', N'/images/Room/A222.jpg', N'/images/Room/B300.jpg', 2, NULL)
INSERT [dbo].[Rooms] ([RoomId], [Name], [Price], [Description], [ImageUrl], [Image1], [Image2], [CategoryId], [AmenityAmId]) VALUES (10, N'B452', CAST(3000000.00 AS Decimal(18, 2)), N'3 phòng ngủ - 3 giường -2 phòng tắm', N'/images/Room/Hb100.jpg', N'/images/Room/A222.jpg', NULL, 1, NULL)
INSERT [dbo].[Rooms] ([RoomId], [Name], [Price], [Description], [ImageUrl], [Image1], [Image2], [CategoryId], [AmenityAmId]) VALUES (11, N'A763', CAST(1500000.00 AS Decimal(18, 2)), N'1 phòng ngủ - 2 giường -1 phòng tắm', N'/images/Room/B345jpg.jpg', N'/images/Room/B300.jpg', N'/images/Room/A202.jpg', 2, NULL)
INSERT [dbo].[Rooms] ([RoomId], [Name], [Price], [Description], [ImageUrl], [Image1], [Image2], [CategoryId], [AmenityAmId]) VALUES (12, N'A155', CAST(1500000.00 AS Decimal(18, 2)), N'1 phòng ngủ - 2 giường -1 phòng tắm', N'/images/Room/A100New.jpg', N'/images/Room/A202.jpg', N'/images/Room/A222.jpg', 2, NULL)
INSERT [dbo].[Rooms] ([RoomId], [Name], [Price], [Description], [ImageUrl], [Image1], [Image2], [CategoryId], [AmenityAmId]) VALUES (13, N'AAAA', CAST(22222222.00 AS Decimal(18, 2)), N'1 phòng ngủ - 1 giường -1 phòng tắm', N'/images/Room/B100.jpg', NULL, NULL, 2, NULL)
SET IDENTITY_INSERT [dbo].[Rooms] OFF
GO
ALTER TABLE [dbo].[AspNetRoleClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetRoleClaims] CHECK CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserTokens]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserTokens] CHECK CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[BookingDetails]  WITH CHECK ADD  CONSTRAINT [FK_BookingDetails_Bookings_BookingId] FOREIGN KEY([BookingId])
REFERENCES [dbo].[Bookings] ([BkId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[BookingDetails] CHECK CONSTRAINT [FK_BookingDetails_Bookings_BookingId]
GO
ALTER TABLE [dbo].[BookingDetails]  WITH CHECK ADD  CONSTRAINT [FK_BookingDetails_Rooms_RoomId] FOREIGN KEY([RoomId])
REFERENCES [dbo].[Rooms] ([RoomId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[BookingDetails] CHECK CONSTRAINT [FK_BookingDetails_Rooms_RoomId]
GO
ALTER TABLE [dbo].[BookingItems]  WITH CHECK ADD  CONSTRAINT [FK_BookingItems_BookingCarts_BookingCartBkId] FOREIGN KEY([BookingCartBkId])
REFERENCES [dbo].[BookingCarts] ([BkId])
GO
ALTER TABLE [dbo].[BookingItems] CHECK CONSTRAINT [FK_BookingItems_BookingCarts_BookingCartBkId]
GO
ALTER TABLE [dbo].[Bookings]  WITH CHECK ADD  CONSTRAINT [FK_Bookings_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Bookings] CHECK CONSTRAINT [FK_Bookings_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[FavoriteItems]  WITH CHECK ADD  CONSTRAINT [FK_FavoriteItems_Categories_CategoryId] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([CateId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[FavoriteItems] CHECK CONSTRAINT [FK_FavoriteItems_Categories_CategoryId]
GO
ALTER TABLE [dbo].[FavoriteItems]  WITH CHECK ADD  CONSTRAINT [FK_FavoriteItems_Favorite_FavoriteId] FOREIGN KEY([FavoriteId])
REFERENCES [dbo].[Favorite] ([FavoriteId])
GO
ALTER TABLE [dbo].[FavoriteItems] CHECK CONSTRAINT [FK_FavoriteItems_Favorite_FavoriteId]
GO
ALTER TABLE [dbo].[RoomImages]  WITH CHECK ADD  CONSTRAINT [FK_RoomImages_Rooms_RoomId] FOREIGN KEY([RoomId])
REFERENCES [dbo].[Rooms] ([RoomId])
GO
ALTER TABLE [dbo].[RoomImages] CHECK CONSTRAINT [FK_RoomImages_Rooms_RoomId]
GO
ALTER TABLE [dbo].[Rooms]  WITH CHECK ADD  CONSTRAINT [FK_Rooms_Amenities_AmenityAmId] FOREIGN KEY([AmenityAmId])
REFERENCES [dbo].[Amenities] ([AmId])
GO
ALTER TABLE [dbo].[Rooms] CHECK CONSTRAINT [FK_Rooms_Amenities_AmenityAmId]
GO
ALTER TABLE [dbo].[Rooms]  WITH CHECK ADD  CONSTRAINT [FK_Rooms_Categories_CategoryId] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([CateId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Rooms] CHECK CONSTRAINT [FK_Rooms_Categories_CategoryId]
GO
