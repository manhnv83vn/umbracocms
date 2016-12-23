
----------------------------------------------------------------------------------------------------

DROP TABLE [dbo].[umbReviews]
DROP TABLE [dbo].[umbProducts]
DROP TABLE [dbo].[umbCategories]

----------------------------------------------------------------------------------------------------

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[umbCategories](
	[category_id] [INT] IDENTITY(1,1) NOT NULL,
	[category_parent_id] [INT] NULL,
	[category_name] [NVARCHAR](15) NOT NULL,
	[description] [NTEXT] NULL,
	[picture] [IMAGE] NULL,
 CONSTRAINT [PK_umbCategories] PRIMARY KEY CLUSTERED 
(
	[category_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

----------------------------------------------------------------------------------------------------

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[umbProducts](
	[product_id] [INT] IDENTITY(1,1) NOT NULL,
	[category_id] [INT] NOT NULL,
	[published] [SMALLINT] NOT NULL,
	[rating_cache] [FLOAT] NOT NULL,
	[rating_count] [INT] NOT NULL,
	[name] [VARCHAR](255) NOT NULL,
	[pricing] [FLOAT] NOT NULL,
	[short_description] [VARCHAR](255) NOT NULL,
	[long_description] [VARCHAR](MAX) NOT NULL,
	[icon] [VARCHAR](255) NOT NULL,
	[created_at] [DATETIME2](0) NOT NULL,
	[updated_at] [DATETIME2](0) NOT NULL,
 CONSTRAINT [PK_umbProducts] PRIMARY KEY CLUSTERED 
(
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[umbProducts] ADD  DEFAULT ('0') FOR [published]
GO

ALTER TABLE [dbo].[umbProducts] ADD  DEFAULT (CONVERT([FLOAT],'3.0',0)) FOR [rating_cache]
GO

ALTER TABLE [dbo].[umbProducts] ADD  DEFAULT (CONVERT([INT],'0.00',0)) FOR [rating_count]
GO

ALTER TABLE [dbo].[umbProducts] ADD  DEFAULT (CONVERT([FLOAT],'0.00',0)) FOR [pricing]
GO

ALTER TABLE [dbo].[umbProducts]  WITH CHECK ADD  CONSTRAINT [FK_umbProducts_umbCategories] FOREIGN KEY([category_id])
REFERENCES [dbo].[umbCategories] ([category_id])
GO

ALTER TABLE [dbo].[umbProducts] CHECK CONSTRAINT [FK_umbProducts_umbCategories]
GO

--ALTER TABLE [dbo].[umbProducts]  WITH CHECK ADD CHECK  (([pricing]>(0)))
--GO

--ALTER TABLE [dbo].[umbProducts]  WITH CHECK ADD CHECK  (([rating_cache]>(0)))
--GO

--ALTER TABLE [dbo].[umbProducts]  WITH CHECK ADD CHECK  (([rating_count]>(0)))
--GO

----------------------------------------------------------------------------------------------------

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[umbReviews](
	[review_id] [INT] IDENTITY(1,1) NOT NULL,
	[product_id] [INT] NOT NULL,
	[user_id] [INT] NOT NULL,
	[rating] [INT] NOT NULL,
	[comment] [VARCHAR](MAX) NOT NULL,
	[approved] [SMALLINT] NOT NULL,
	[spam] [SMALLINT] NOT NULL,
	[created_at] [DATETIME2](0) NOT NULL,
	[updated_at] [DATETIME2](0) NOT NULL,
 CONSTRAINT [PK_umbReviews] PRIMARY KEY CLUSTERED 
(
	[review_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[umbReviews] ADD  DEFAULT ((1)) FOR [approved]
GO

ALTER TABLE [dbo].[umbReviews] ADD  DEFAULT ((0)) FOR [spam]
GO

ALTER TABLE [dbo].[umbReviews]  WITH CHECK ADD  CONSTRAINT [FK_umbReviews_umbProducts] FOREIGN KEY([product_id])
REFERENCES [dbo].[umbProducts] ([product_id])
GO

ALTER TABLE [dbo].[umbReviews] CHECK CONSTRAINT [FK_umbReviews_umbProducts]
GO

ALTER TABLE [dbo].[umbReviews]  WITH CHECK ADD CHECK  (([approved]>(0)))
GO

ALTER TABLE [dbo].[umbReviews]  WITH CHECK ADD CHECK  (([spam]>(0)))
GO

----------------------------------------------------------------------------------------------------

INSERT INTO [dbo].[umbCategories]([category_parent_id], [category_name], [description]) VALUES 
(0, N'Men', N'For men only'),--1,0
(0, N'Women', N'For women only'),--2,0
(1, N'Quần nam', N'Quần nam'),--3,1
(1, N'Áo nam', N'Áo nam'),--4,1
(2, N'Váy nữ', N'Váy nữ'),--5,2
(2, N'Túi nữ', N'Túi nữ')--6,2

----------------------------------------------------------------------------------------------------

INSERT INTO [dbo].[umbProducts] ([category_id], [published], [rating_cache], [rating_count], [name], [pricing], [short_description], [long_description], [icon], [created_at], [updated_at]) VALUES
(3, 1, 3.0, 0, 'First product', 20.99, 'This is a short description asdf as This is a short description asdf as', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum', '', '2016-11-06 05:11:00', '2016-11-12 05:51:07'),
(3, 1, 3.0, 0, 'Second product', 55.00, 'This is a short description', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum', '', '2016-11-06 05:11:00', '2016-11-11 16:17:23'),
(4, 1, 3.0, 0, 'Third product', 65.00, 'This is a short description', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum', '', '2016-11-06 05:11:00', '2016-11-06 06:08:00'),
(5, 1, 3.0, 0, 'Fourth product', 85.00, 'This is a short description', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum', '', '2016-11-06 05:11:00', '2016-11-06 06:08:00'),
(6, 1, 3.0, 0, 'Fifth product', 95.00, 'This is a short description', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum', '', '2016-11-06 05:11:00', '2016-11-06 06:08:00');