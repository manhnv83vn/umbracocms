USE [master]
GO
/****** Object:  Database [umbracoSample_Db]    Script Date: 12/23/2016 2:55:45 PM ******/
CREATE DATABASE [umbracoSample_Db]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'umbracoSample_Db', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\umbracoSample_Db.mdf' , SIZE = 41984KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'umbracoSample_Db_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\umbracoSample_Db_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [umbracoSample_Db] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [umbracoSample_Db].[dbo].[sp_fulltext_database] @action = 'disable'
end
GO
ALTER DATABASE [umbracoSample_Db] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [umbracoSample_Db] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [umbracoSample_Db] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [umbracoSample_Db] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [umbracoSample_Db] SET ARITHABORT OFF 
GO
ALTER DATABASE [umbracoSample_Db] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [umbracoSample_Db] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [umbracoSample_Db] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [umbracoSample_Db] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [umbracoSample_Db] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [umbracoSample_Db] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [umbracoSample_Db] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [umbracoSample_Db] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [umbracoSample_Db] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [umbracoSample_Db] SET  DISABLE_BROKER 
GO
ALTER DATABASE [umbracoSample_Db] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [umbracoSample_Db] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [umbracoSample_Db] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [umbracoSample_Db] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [umbracoSample_Db] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [umbracoSample_Db] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [umbracoSample_Db] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [umbracoSample_Db] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [umbracoSample_Db] SET  MULTI_USER 
GO
ALTER DATABASE [umbracoSample_Db] SET PAGE_VERIFY TORN_PAGE_DETECTION  
GO
ALTER DATABASE [umbracoSample_Db] SET DB_CHAINING OFF 
GO
ALTER DATABASE [umbracoSample_Db] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [umbracoSample_Db] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [umbracoSample_Db] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'umbracoSample_Db', N'ON'
GO
USE [umbracoSample_Db]
GO
/****** Object:  User [umbracoUser]    Script Date: 12/23/2016 2:55:45 PM ******/
CREATE USER [umbracoUser] FOR LOGIN [umbracoUser] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[cmsContent]    Script Date: 12/23/2016 2:55:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsContent](
	[pk] [int] IDENTITY(1,1) NOT NULL,
	[nodeId] [int] NOT NULL,
	[contentType] [int] NOT NULL,
 CONSTRAINT [PK_cmsContent] PRIMARY KEY CLUSTERED 
(
	[pk] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[cmsContentType]    Script Date: 12/23/2016 2:55:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsContentType](
	[pk] [int] IDENTITY(1,1) NOT NULL,
	[nodeId] [int] NOT NULL,
	[alias] [nvarchar](255) NULL,
	[icon] [nvarchar](255) NULL,
	[thumbnail] [nvarchar](255) NOT NULL CONSTRAINT [DF_cmsContentType_thumbnail]  DEFAULT ('folder.png'),
	[description] [nvarchar](1500) NULL,
	[isContainer] [bit] NOT NULL CONSTRAINT [DF_cmsContentType_isContainer]  DEFAULT ('0'),
	[allowAtRoot] [bit] NOT NULL CONSTRAINT [DF_cmsContentType_allowAtRoot]  DEFAULT ('0'),
 CONSTRAINT [PK_cmsContentType] PRIMARY KEY CLUSTERED 
(
	[pk] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[cmsContentType2ContentType]    Script Date: 12/23/2016 2:55:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsContentType2ContentType](
	[parentContentTypeId] [int] NOT NULL,
	[childContentTypeId] [int] NOT NULL,
 CONSTRAINT [PK_cmsContentType2ContentType] PRIMARY KEY CLUSTERED 
(
	[parentContentTypeId] ASC,
	[childContentTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[cmsContentTypeAllowedContentType]    Script Date: 12/23/2016 2:55:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsContentTypeAllowedContentType](
	[Id] [int] NOT NULL,
	[AllowedId] [int] NOT NULL,
	[SortOrder] [int] NOT NULL CONSTRAINT [df_cmsContentTypeAllowedContentType_sortOrder]  DEFAULT ('0'),
 CONSTRAINT [PK_cmsContentTypeAllowedContentType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC,
	[AllowedId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[cmsContentVersion]    Script Date: 12/23/2016 2:55:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsContentVersion](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ContentId] [int] NOT NULL,
	[VersionId] [uniqueidentifier] NOT NULL,
	[VersionDate] [datetime] NOT NULL CONSTRAINT [DF_cmsContentVersion_VersionDate]  DEFAULT (getdate()),
 CONSTRAINT [PK_cmsContentVersion] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[cmsContentXml]    Script Date: 12/23/2016 2:55:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsContentXml](
	[nodeId] [int] NOT NULL,
	[xml] [ntext] NOT NULL,
 CONSTRAINT [PK_cmsContentXml] PRIMARY KEY CLUSTERED 
(
	[nodeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[cmsDataType]    Script Date: 12/23/2016 2:55:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsDataType](
	[pk] [int] IDENTITY(1,1) NOT NULL,
	[nodeId] [int] NOT NULL,
	[propertyEditorAlias] [nvarchar](255) NOT NULL,
	[dbType] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_cmsDataType] PRIMARY KEY CLUSTERED 
(
	[pk] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[cmsDataTypePreValues]    Script Date: 12/23/2016 2:55:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsDataTypePreValues](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[datatypeNodeId] [int] NOT NULL,
	[value] [ntext] NULL,
	[sortorder] [int] NOT NULL,
	[alias] [nvarchar](50) NULL,
 CONSTRAINT [PK_cmsDataTypePreValues] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[cmsDictionary]    Script Date: 12/23/2016 2:55:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsDictionary](
	[pk] [int] IDENTITY(1,1) NOT NULL,
	[id] [uniqueidentifier] NOT NULL,
	[parent] [uniqueidentifier] NULL,
	[key] [nvarchar](1000) NOT NULL,
 CONSTRAINT [PK_cmsDictionary] PRIMARY KEY CLUSTERED 
(
	[pk] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[cmsDocument]    Script Date: 12/23/2016 2:55:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsDocument](
	[nodeId] [int] NOT NULL,
	[published] [bit] NOT NULL,
	[documentUser] [int] NOT NULL,
	[versionId] [uniqueidentifier] NOT NULL,
	[text] [nvarchar](255) NOT NULL,
	[releaseDate] [datetime] NULL,
	[expireDate] [datetime] NULL,
	[updateDate] [datetime] NOT NULL CONSTRAINT [DF_cmsDocument_updateDate]  DEFAULT (getdate()),
	[templateId] [int] NULL,
	[newest] [bit] NOT NULL CONSTRAINT [DF_cmsDocument_newest]  DEFAULT ('0'),
 CONSTRAINT [PK_cmsDocument] PRIMARY KEY CLUSTERED 
(
	[versionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[cmsDocumentType]    Script Date: 12/23/2016 2:55:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsDocumentType](
	[contentTypeNodeId] [int] NOT NULL,
	[templateNodeId] [int] NOT NULL,
	[IsDefault] [bit] NOT NULL CONSTRAINT [DF_cmsDocumentType_IsDefault]  DEFAULT ('0'),
 CONSTRAINT [PK_cmsDocumentType] PRIMARY KEY CLUSTERED 
(
	[contentTypeNodeId] ASC,
	[templateNodeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[cmsLanguageText]    Script Date: 12/23/2016 2:55:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsLanguageText](
	[pk] [int] IDENTITY(1,1) NOT NULL,
	[languageId] [int] NOT NULL,
	[UniqueId] [uniqueidentifier] NOT NULL,
	[value] [nvarchar](1000) NOT NULL,
 CONSTRAINT [PK_cmsLanguageText] PRIMARY KEY CLUSTERED 
(
	[pk] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[cmsMacro]    Script Date: 12/23/2016 2:55:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsMacro](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[macroUseInEditor] [bit] NOT NULL,
	[macroRefreshRate] [int] NOT NULL,
	[macroAlias] [nvarchar](255) NOT NULL,
	[macroName] [nvarchar](255) NULL,
	[macroScriptType] [nvarchar](255) NULL,
	[macroScriptAssembly] [nvarchar](255) NULL,
	[macroXSLT] [nvarchar](255) NULL,
	[macroCacheByPage] [bit] NOT NULL,
	[macroCachePersonalized] [bit] NOT NULL,
	[macroDontRender] [bit] NOT NULL,
	[macroPython] [nvarchar](255) NULL,
 CONSTRAINT [PK_cmsMacro] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[cmsMacroProperty]    Script Date: 12/23/2016 2:55:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsMacroProperty](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[editorAlias] [nvarchar](255) NOT NULL,
	[macro] [int] NOT NULL,
	[macroPropertySortOrder] [int] NOT NULL,
	[macroPropertyAlias] [nvarchar](50) NOT NULL,
	[macroPropertyName] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_cmsMacroProperty] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[cmsMember]    Script Date: 12/23/2016 2:55:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsMember](
	[nodeId] [int] NOT NULL,
	[Email] [nvarchar](1000) NOT NULL,
	[LoginName] [nvarchar](1000) NOT NULL,
	[Password] [nvarchar](1000) NOT NULL,
 CONSTRAINT [PK_cmsMember] PRIMARY KEY CLUSTERED 
(
	[nodeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[cmsMember2MemberGroup]    Script Date: 12/23/2016 2:55:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsMember2MemberGroup](
	[Member] [int] NOT NULL,
	[MemberGroup] [int] NOT NULL,
 CONSTRAINT [PK_cmsMember2MemberGroup] PRIMARY KEY CLUSTERED 
(
	[Member] ASC,
	[MemberGroup] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[cmsMemberType]    Script Date: 12/23/2016 2:55:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsMemberType](
	[pk] [int] IDENTITY(1,1) NOT NULL,
	[NodeId] [int] NOT NULL,
	[propertytypeId] [int] NOT NULL,
	[memberCanEdit] [bit] NOT NULL,
	[viewOnProfile] [bit] NOT NULL,
 CONSTRAINT [PK_cmsMemberType] PRIMARY KEY CLUSTERED 
(
	[pk] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[cmsPreviewXml]    Script Date: 12/23/2016 2:55:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsPreviewXml](
	[nodeId] [int] NOT NULL,
	[versionId] [uniqueidentifier] NOT NULL,
	[timestamp] [datetime] NOT NULL,
	[xml] [ntext] NOT NULL,
 CONSTRAINT [PK_cmsContentPreviewXml] PRIMARY KEY CLUSTERED 
(
	[nodeId] ASC,
	[versionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[cmsPropertyData]    Script Date: 12/23/2016 2:55:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsPropertyData](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[contentNodeId] [int] NOT NULL,
	[versionId] [uniqueidentifier] NULL,
	[propertytypeid] [int] NOT NULL,
	[dataInt] [int] NULL,
	[dataDecimal] [decimal](38, 6) NULL,
	[dataDate] [datetime] NULL,
	[dataNvarchar] [nvarchar](500) NULL,
	[dataNtext] [ntext] NULL,
 CONSTRAINT [PK_cmsPropertyData] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[cmsPropertyType]    Script Date: 12/23/2016 2:55:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsPropertyType](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[dataTypeId] [int] NOT NULL,
	[contentTypeId] [int] NOT NULL,
	[propertyTypeGroupId] [int] NULL,
	[Alias] [nvarchar](255) NOT NULL,
	[Name] [nvarchar](255) NULL,
	[sortOrder] [int] NOT NULL CONSTRAINT [DF_cmsPropertyType_sortOrder]  DEFAULT ('0'),
	[mandatory] [bit] NOT NULL CONSTRAINT [DF_cmsPropertyType_mandatory]  DEFAULT ('0'),
	[validationRegExp] [nvarchar](255) NULL,
	[Description] [nvarchar](2000) NULL,
	[UniqueID] [uniqueidentifier] NOT NULL CONSTRAINT [DF_cmsPropertyType_UniqueID]  DEFAULT (newid()),
 CONSTRAINT [PK_cmsPropertyType] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[cmsPropertyTypeGroup]    Script Date: 12/23/2016 2:55:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsPropertyTypeGroup](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[contenttypeNodeId] [int] NOT NULL,
	[text] [nvarchar](255) NOT NULL,
	[sortorder] [int] NOT NULL,
	[uniqueID] [uniqueidentifier] NOT NULL CONSTRAINT [DF_cmsPropertyTypeGroup_uniqueID]  DEFAULT (newid()),
 CONSTRAINT [PK_cmsPropertyTypeGroup] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[cmsTagRelationship]    Script Date: 12/23/2016 2:55:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsTagRelationship](
	[nodeId] [int] NOT NULL,
	[tagId] [int] NOT NULL,
	[propertyTypeId] [int] NOT NULL,
 CONSTRAINT [PK_cmsTagRelationship] PRIMARY KEY CLUSTERED 
(
	[nodeId] ASC,
	[propertyTypeId] ASC,
	[tagId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[cmsTags]    Script Date: 12/23/2016 2:55:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsTags](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[tag] [nvarchar](200) NULL,
	[ParentId] [int] NULL,
	[group] [nvarchar](100) NULL,
 CONSTRAINT [PK_cmsTags] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[cmsTask]    Script Date: 12/23/2016 2:55:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsTask](
	[closed] [bit] NOT NULL,
	[id] [int] IDENTITY(1,1) NOT NULL,
	[taskTypeId] [int] NOT NULL,
	[nodeId] [int] NOT NULL,
	[parentUserId] [int] NOT NULL,
	[userId] [int] NOT NULL,
	[DateTime] [datetime] NOT NULL,
	[Comment] [nvarchar](500) NULL,
 CONSTRAINT [PK_cmsTask] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[cmsTaskType]    Script Date: 12/23/2016 2:55:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsTaskType](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[alias] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_cmsTaskType] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[cmsTemplate]    Script Date: 12/23/2016 2:55:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsTemplate](
	[pk] [int] IDENTITY(1,1) NOT NULL,
	[nodeId] [int] NOT NULL,
	[alias] [nvarchar](100) NULL,
	[design] [ntext] NOT NULL,
 CONSTRAINT [PK_cmsTemplate] PRIMARY KEY CLUSTERED 
(
	[pk] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[umbCategories]    Script Date: 12/23/2016 2:55:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbCategories](
	[category_id] [int] IDENTITY(1,1) NOT NULL,
	[category_parent_id] [int] NULL,
	[category_name] [nvarchar](15) NOT NULL,
	[description] [ntext] NULL,
	[picture] [image] NULL,
 CONSTRAINT [PK_umbCategories] PRIMARY KEY CLUSTERED 
(
	[category_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[umbProducts]    Script Date: 12/23/2016 2:55:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[umbProducts](
	[product_id] [int] IDENTITY(1,1) NOT NULL,
	[category_id] [int] NOT NULL,
	[published] [smallint] NOT NULL DEFAULT ('0'),
	[rating_cache] [float] NOT NULL DEFAULT (CONVERT([float],'3.0',(0))),
	[rating_count] [int] NOT NULL DEFAULT (CONVERT([int],'0.00',(0))),
	[name] [varchar](255) NOT NULL,
	[pricing] [float] NOT NULL DEFAULT (CONVERT([float],'0.00',(0))),
	[short_description] [varchar](255) NOT NULL,
	[long_description] [varchar](max) NOT NULL,
	[icon] [varchar](255) NOT NULL,
	[created_at] [datetime2](0) NOT NULL,
	[updated_at] [datetime2](0) NOT NULL,
 CONSTRAINT [PK_umbProducts] PRIMARY KEY CLUSTERED 
(
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[umbracoAccess]    Script Date: 12/23/2016 2:55:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoAccess](
	[id] [uniqueidentifier] NOT NULL,
	[nodeId] [int] NOT NULL,
	[loginNodeId] [int] NOT NULL,
	[noAccessNodeId] [int] NOT NULL,
	[createDate] [datetime] NOT NULL,
	[updateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_umbracoAccess] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[umbracoAccessRule]    Script Date: 12/23/2016 2:55:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoAccessRule](
	[id] [uniqueidentifier] NOT NULL,
	[accessId] [uniqueidentifier] NOT NULL,
	[ruleValue] [nvarchar](255) NOT NULL,
	[ruleType] [nvarchar](255) NOT NULL,
	[createDate] [datetime] NOT NULL,
	[updateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_umbracoAccessRule] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[umbracoCacheInstruction]    Script Date: 12/23/2016 2:55:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoCacheInstruction](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[utcStamp] [datetime] NOT NULL,
	[jsonInstruction] [ntext] NOT NULL,
	[originated] [nvarchar](500) NOT NULL,
 CONSTRAINT [PK_umbracoCacheInstruction] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[umbracoDeployChecksum]    Script Date: 12/23/2016 2:55:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoDeployChecksum](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[entityType] [nvarchar](32) NOT NULL,
	[entityGuid] [uniqueidentifier] NULL,
	[entityPath] [nvarchar](256) NULL,
	[localChecksum] [nvarchar](32) NOT NULL,
	[compositeChecksum] [nvarchar](32) NULL,
 CONSTRAINT [PK_umbracoDeployChecksum] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[umbracoDeployDependency]    Script Date: 12/23/2016 2:55:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoDeployDependency](
	[sourceId] [int] NOT NULL,
	[targetId] [int] NOT NULL,
	[mode] [int] NOT NULL,
 CONSTRAINT [PK_umbracoDeployDependency] PRIMARY KEY CLUSTERED 
(
	[sourceId] ASC,
	[targetId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[umbracoDomains]    Script Date: 12/23/2016 2:55:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoDomains](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[domainDefaultLanguage] [int] NULL,
	[domainRootStructureID] [int] NULL,
	[domainName] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_umbracoDomains] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[umbracoExternalLogin]    Script Date: 12/23/2016 2:55:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoExternalLogin](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[userId] [int] NOT NULL,
	[loginProvider] [nvarchar](4000) NOT NULL,
	[providerKey] [nvarchar](4000) NOT NULL,
	[createDate] [datetime] NOT NULL,
 CONSTRAINT [PK_umbracoExternalLogin] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[umbracoLanguage]    Script Date: 12/23/2016 2:55:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoLanguage](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[languageISOCode] [nvarchar](10) NULL,
	[languageCultureName] [nvarchar](100) NULL,
 CONSTRAINT [PK_umbracoLanguage] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[umbracoLog]    Script Date: 12/23/2016 2:55:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoLog](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[userId] [int] NOT NULL,
	[NodeId] [int] NOT NULL,
	[Datestamp] [datetime] NOT NULL CONSTRAINT [DF_umbracoLog_Datestamp]  DEFAULT (getdate()),
	[logHeader] [nvarchar](50) NOT NULL,
	[logComment] [nvarchar](4000) NULL,
 CONSTRAINT [PK_umbracoLog] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[umbracoMigration]    Script Date: 12/23/2016 2:55:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoMigration](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[createDate] [datetime] NOT NULL CONSTRAINT [DF_umbracoMigration_createDate]  DEFAULT (getdate()),
	[version] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_umbracoMigration] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[umbracoNode]    Script Date: 12/23/2016 2:55:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoNode](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[trashed] [bit] NOT NULL CONSTRAINT [DF_umbracoNode_trashed]  DEFAULT ('0'),
	[parentID] [int] NOT NULL,
	[nodeUser] [int] NULL,
	[level] [int] NOT NULL,
	[path] [nvarchar](150) NOT NULL,
	[sortOrder] [int] NOT NULL,
	[uniqueID] [uniqueidentifier] NOT NULL CONSTRAINT [DF_umbracoNode_uniqueID]  DEFAULT (newid()),
	[text] [nvarchar](255) NULL,
	[nodeObjectType] [uniqueidentifier] NULL,
	[createDate] [datetime] NOT NULL CONSTRAINT [DF_umbracoNode_createDate]  DEFAULT (getdate()),
 CONSTRAINT [PK_structure] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[umbracoRedirectUrl]    Script Date: 12/23/2016 2:55:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoRedirectUrl](
	[id] [uniqueidentifier] NOT NULL,
	[contentKey] [uniqueidentifier] NOT NULL,
	[createDateUtc] [datetime] NOT NULL,
	[url] [nvarchar](255) NOT NULL,
	[urlHash] [nvarchar](40) NOT NULL,
 CONSTRAINT [PK_umbracoRedirectUrl] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[umbracoRelation]    Script Date: 12/23/2016 2:55:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoRelation](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[parentId] [int] NOT NULL,
	[childId] [int] NOT NULL,
	[relType] [int] NOT NULL,
	[datetime] [datetime] NOT NULL CONSTRAINT [DF_umbracoRelation_datetime]  DEFAULT (getdate()),
	[comment] [nvarchar](1000) NOT NULL,
 CONSTRAINT [PK_umbracoRelation] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[umbracoRelationType]    Script Date: 12/23/2016 2:55:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoRelationType](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[dual] [bit] NOT NULL,
	[parentObjectType] [uniqueidentifier] NOT NULL,
	[childObjectType] [uniqueidentifier] NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[alias] [nvarchar](100) NULL,
 CONSTRAINT [PK_umbracoRelationType] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[umbracoServer]    Script Date: 12/23/2016 2:55:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoServer](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[address] [nvarchar](500) NOT NULL,
	[computerName] [nvarchar](255) NOT NULL,
	[registeredDate] [datetime] NOT NULL CONSTRAINT [DF_umbracoServer_registeredDate]  DEFAULT (getdate()),
	[lastNotifiedDate] [datetime] NOT NULL,
	[isActive] [bit] NOT NULL,
	[isMaster] [bit] NOT NULL,
 CONSTRAINT [PK_umbracoServer] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[umbracoUser]    Script Date: 12/23/2016 2:55:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoUser](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[userDisabled] [bit] NOT NULL CONSTRAINT [DF_umbracoUser_userDisabled]  DEFAULT ('0'),
	[userNoConsole] [bit] NOT NULL CONSTRAINT [DF_umbracoUser_userNoConsole]  DEFAULT ('0'),
	[userType] [int] NOT NULL,
	[startStructureID] [int] NOT NULL,
	[startMediaID] [int] NULL,
	[userName] [nvarchar](255) NOT NULL,
	[userLogin] [nvarchar](125) NOT NULL,
	[userPassword] [nvarchar](500) NOT NULL,
	[userEmail] [nvarchar](255) NOT NULL,
	[userLanguage] [nvarchar](10) NULL,
	[securityStampToken] [nvarchar](255) NULL,
	[failedLoginAttempts] [int] NULL,
	[lastLockoutDate] [datetime] NULL,
	[lastPasswordChangeDate] [datetime] NULL,
	[lastLoginDate] [datetime] NULL,
 CONSTRAINT [PK_user] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[umbracoUser2app]    Script Date: 12/23/2016 2:55:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoUser2app](
	[user] [int] NOT NULL,
	[app] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_user2app] PRIMARY KEY CLUSTERED 
(
	[user] ASC,
	[app] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[umbracoUser2NodeNotify]    Script Date: 12/23/2016 2:55:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoUser2NodeNotify](
	[userId] [int] NOT NULL,
	[nodeId] [int] NOT NULL,
	[action] [nchar](1) NOT NULL,
 CONSTRAINT [PK_umbracoUser2NodeNotify] PRIMARY KEY CLUSTERED 
(
	[userId] ASC,
	[nodeId] ASC,
	[action] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[umbracoUser2NodePermission]    Script Date: 12/23/2016 2:55:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoUser2NodePermission](
	[userId] [int] NOT NULL,
	[nodeId] [int] NOT NULL,
	[permission] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_umbracoUser2NodePermission] PRIMARY KEY CLUSTERED 
(
	[userId] ASC,
	[nodeId] ASC,
	[permission] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[umbracoUserType]    Script Date: 12/23/2016 2:55:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoUserType](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[userTypeAlias] [nvarchar](50) NULL,
	[userTypeName] [nvarchar](255) NOT NULL,
	[userTypeDefaultPermissions] [nvarchar](50) NULL,
 CONSTRAINT [PK_umbracoUserType] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[umbReviews]    Script Date: 12/23/2016 2:55:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[umbReviews](
	[review_id] [int] IDENTITY(1,1) NOT NULL,
	[product_id] [int] NOT NULL,
	[user_id] [int] NOT NULL,
	[rating] [int] NOT NULL,
	[comment] [varchar](max) NOT NULL,
	[approved] [smallint] NOT NULL,
	[spam] [smallint] NOT NULL,
	[created_at] [datetime2](0) NOT NULL,
	[updated_at] [datetime2](0) NOT NULL,
 CONSTRAINT [PK_umbReviews] PRIMARY KEY CLUSTERED 
(
	[review_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  View [dbo].[Order Details Extended]    Script Date: 12/23/2016 2:55:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[Order Details Extended] AS SELECT "Order Details".OrderID, "Order Details".ProductID, Products.ProductName, 	"Order Details".UnitPrice, "Order Details".Quantity, "Order Details".Discount, 	(CONVERT(money,("Order Details".UnitPrice*Quantity*(1-Discount)/100))*100) AS ExtendedPrice FROM Products INNER JOIN "Order Details" ON Products.ProductID = "Order Details".ProductID --ORDER BY "Order Details".OrderID 
GO
/****** Object:  View [dbo].[Sales by Category]    Script Date: 12/23/2016 2:55:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[Sales by Category] AS SELECT Categories.CategoryID, Categories.CategoryName, Products.ProductName, 	Sum("Order Details Extended".ExtendedPrice) AS ProductSales FROM 	Categories INNER JOIN 		(Products INNER JOIN 			(Orders INNER JOIN "Order Details Extended" ON Orders.OrderID = "Order Details Extended".OrderID) 		ON Products.ProductID = "Order Details Extended".ProductID) 	ON Categories.CategoryID = Products.CategoryID WHERE Orders.OrderDate BETWEEN '19970101' And '19971231' GROUP BY Categories.CategoryID, Categories.CategoryName, Products.ProductName --ORDER BY Products.ProductName 
GO
/****** Object:  View [dbo].[Order Subtotals]    Script Date: 12/23/2016 2:55:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[Order Subtotals] AS SELECT "Order Details".OrderID, Sum(CONVERT(money,("Order Details".UnitPrice*Quantity*(1-Discount)/100))*100) AS Subtotal FROM "Order Details" GROUP BY "Order Details".OrderID 
GO
/****** Object:  View [dbo].[Sales Totals by Amount]    Script Date: 12/23/2016 2:55:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[Sales Totals by Amount] AS SELECT "Order Subtotals".Subtotal AS SaleAmount, Orders.OrderID, Customers.CompanyName, Orders.ShippedDate FROM 	Customers INNER JOIN 		(Orders INNER JOIN "Order Subtotals" ON Orders.OrderID = "Order Subtotals".OrderID) 	ON Customers.CustomerID = Orders.CustomerID WHERE ("Order Subtotals".Subtotal >2500) AND (Orders.ShippedDate BETWEEN '19970101' And '19971231') 
GO
/****** Object:  View [dbo].[Summary of Sales by Quarter]    Script Date: 12/23/2016 2:55:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[Summary of Sales by Quarter] AS SELECT Orders.ShippedDate, Orders.OrderID, "Order Subtotals".Subtotal FROM Orders INNER JOIN "Order Subtotals" ON Orders.OrderID = "Order Subtotals".OrderID WHERE Orders.ShippedDate IS NOT NULL --ORDER BY Orders.ShippedDate 
GO
/****** Object:  View [dbo].[Summary of Sales by Year]    Script Date: 12/23/2016 2:55:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[Summary of Sales by Year] AS SELECT Orders.ShippedDate, Orders.OrderID, "Order Subtotals".Subtotal FROM Orders INNER JOIN "Order Subtotals" ON Orders.OrderID = "Order Subtotals".OrderID WHERE Orders.ShippedDate IS NOT NULL --ORDER BY Orders.ShippedDate 
GO
/****** Object:  View [dbo].[Product Sales for 1997]    Script Date: 12/23/2016 2:55:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[Product Sales for 1997] AS SELECT Categories.CategoryName, Products.ProductName, Sum(CONVERT(money,("Order Details".UnitPrice*Quantity*(1-Discount)/100))*100) AS ProductSales FROM (Categories INNER JOIN Products ON Categories.CategoryID = Products.CategoryID) 	INNER JOIN (Orders 		INNER JOIN "Order Details" ON Orders.OrderID = "Order Details".OrderID) 	ON Products.ProductID = "Order Details".ProductID WHERE (((Orders.ShippedDate) Between '19970101' And '19971231')) GROUP BY Categories.CategoryName, Products.ProductName 
GO
/****** Object:  View [dbo].[Category Sales for 1997]    Script Date: 12/23/2016 2:55:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[Category Sales for 1997] AS SELECT "Product Sales for 1997".CategoryName, Sum("Product Sales for 1997".ProductSales) AS CategorySales FROM "Product Sales for 1997" GROUP BY "Product Sales for 1997".CategoryName 
GO
/****** Object:  View [dbo].[Alphabetical list of products]    Script Date: 12/23/2016 2:55:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[Alphabetical list of products] AS SELECT Products.*, Categories.CategoryName FROM Categories INNER JOIN Products ON Categories.CategoryID = Products.CategoryID WHERE (((Products.Discontinued)=0)) 
GO
/****** Object:  View [dbo].[Current Product List]    Script Date: 12/23/2016 2:55:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[Current Product List] AS SELECT Product_List.ProductID, Product_List.ProductName FROM Products AS Product_List WHERE (((Product_List.Discontinued)=0)) --ORDER BY Product_List.ProductName 
GO
/****** Object:  View [dbo].[Customer and Suppliers by City]    Script Date: 12/23/2016 2:55:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[Customer and Suppliers by City] AS SELECT City, CompanyName, ContactName, 'Customers' AS Relationship FROM Customers UNION SELECT City, CompanyName, ContactName, 'Suppliers' FROM Suppliers --ORDER BY City, CompanyName 
GO
/****** Object:  View [dbo].[Invoices]    Script Date: 12/23/2016 2:55:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[Invoices] AS SELECT Orders.ShipName, Orders.ShipAddress, Orders.ShipCity, Orders.ShipRegion, Orders.ShipPostalCode, 	Orders.ShipCountry, Orders.CustomerID, Customers.CompanyName AS CustomerName, Customers.Address, Customers.City, 	Customers.Region, Customers.PostalCode, Customers.Country, 	(FirstName + ' ' + LastName) AS Salesperson, 	Orders.OrderID, Orders.OrderDate, Orders.RequiredDate, Orders.ShippedDate, Shippers.CompanyName As ShipperName, 	"Order Details".ProductID, Products.ProductName, "Order Details".UnitPrice, "Order Details".Quantity, 	"Order Details".Discount, 	(CONVERT(money,("Order Details".UnitPrice*Quantity*(1-Discount)/100))*100) AS ExtendedPrice, Orders.Freight FROM 	Shippers INNER JOIN 		(Products INNER JOIN 			( 				(Employees INNER JOIN 					(Customers INNER JOIN Orders ON Customers.CustomerID = Orders.CustomerID) 				ON Employees.EmployeeID = Orders.EmployeeID) 			INNER JOIN "Order Details" ON Orders.OrderID = "Order Details".OrderID) 		ON Products.ProductID = "Order Details".ProductID) 	ON Shippers.ShipperID = Orders.ShipVia 
GO
/****** Object:  View [dbo].[Orders Qry]    Script Date: 12/23/2016 2:55:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[Orders Qry] AS SELECT Orders.OrderID, Orders.CustomerID, Orders.EmployeeID, Orders.OrderDate, Orders.RequiredDate, 	Orders.ShippedDate, Orders.ShipVia, Orders.Freight, Orders.ShipName, Orders.ShipAddress, Orders.ShipCity, 	Orders.ShipRegion, Orders.ShipPostalCode, Orders.ShipCountry, 	Customers.CompanyName, Customers.Address, Customers.City, Customers.Region, Customers.PostalCode, Customers.Country FROM Customers INNER JOIN Orders ON Customers.CustomerID = Orders.CustomerID 
GO
/****** Object:  View [dbo].[Products Above Average Price]    Script Date: 12/23/2016 2:55:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[Products Above Average Price] AS SELECT Products.ProductName, Products.UnitPrice FROM Products WHERE Products.UnitPrice>(SELECT AVG(UnitPrice) From Products) --ORDER BY Products.UnitPrice DESC 
GO
/****** Object:  View [dbo].[Products by Category]    Script Date: 12/23/2016 2:55:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[Products by Category] AS SELECT Categories.CategoryName, Products.ProductName, Products.QuantityPerUnit, Products.UnitsInStock, Products.Discontinued FROM Categories INNER JOIN Products ON Categories.CategoryID = Products.CategoryID WHERE Products.Discontinued <> 1 --ORDER BY Categories.CategoryName, Products.ProductName 
GO
/****** Object:  View [dbo].[Quarterly Orders]    Script Date: 12/23/2016 2:55:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[Quarterly Orders] AS SELECT DISTINCT Customers.CustomerID, Customers.CompanyName, Customers.City, Customers.Country FROM Customers RIGHT JOIN Orders ON Customers.CustomerID = Orders.CustomerID WHERE Orders.OrderDate BETWEEN '19970101' And '19971231' 
GO
SET IDENTITY_INSERT [dbo].[cmsContent] ON 

INSERT [dbo].[cmsContent] ([pk], [nodeId], [contentType]) VALUES (1, 1056, 1052)
INSERT [dbo].[cmsContent] ([pk], [nodeId], [contentType]) VALUES (2, 1057, 1055)
INSERT [dbo].[cmsContent] ([pk], [nodeId], [contentType]) VALUES (3, 1058, 1055)
INSERT [dbo].[cmsContent] ([pk], [nodeId], [contentType]) VALUES (4, 1059, 1055)
INSERT [dbo].[cmsContent] ([pk], [nodeId], [contentType]) VALUES (5, 1060, 1055)
INSERT [dbo].[cmsContent] ([pk], [nodeId], [contentType]) VALUES (6, 1061, 1054)
INSERT [dbo].[cmsContent] ([pk], [nodeId], [contentType]) VALUES (7, 1062, 1053)
INSERT [dbo].[cmsContent] ([pk], [nodeId], [contentType]) VALUES (8, 1063, 1053)
INSERT [dbo].[cmsContent] ([pk], [nodeId], [contentType]) VALUES (9, 1064, 1053)
INSERT [dbo].[cmsContent] ([pk], [nodeId], [contentType]) VALUES (10, 1065, 1053)
INSERT [dbo].[cmsContent] ([pk], [nodeId], [contentType]) VALUES (15, 1086, 1085)
INSERT [dbo].[cmsContent] ([pk], [nodeId], [contentType]) VALUES (16, 1089, 1088)
INSERT [dbo].[cmsContent] ([pk], [nodeId], [contentType]) VALUES (17, 1092, 1091)
INSERT [dbo].[cmsContent] ([pk], [nodeId], [contentType]) VALUES (18, 1095, 1094)
SET IDENTITY_INSERT [dbo].[cmsContent] OFF
SET IDENTITY_INSERT [dbo].[cmsContentType] ON 

INSERT [dbo].[cmsContentType] ([pk], [nodeId], [alias], [icon], [thumbnail], [description], [isContainer], [allowAtRoot]) VALUES (531, 1044, N'Member', N'icon-user', N'icon-user', NULL, 0, 0)
INSERT [dbo].[cmsContentType] ([pk], [nodeId], [alias], [icon], [thumbnail], [description], [isContainer], [allowAtRoot]) VALUES (532, 1031, N'Folder', N'icon-folder', N'icon-folder', NULL, 0, 1)
INSERT [dbo].[cmsContentType] ([pk], [nodeId], [alias], [icon], [thumbnail], [description], [isContainer], [allowAtRoot]) VALUES (533, 1032, N'Image', N'icon-picture', N'icon-picture', NULL, 0, 1)
INSERT [dbo].[cmsContentType] ([pk], [nodeId], [alias], [icon], [thumbnail], [description], [isContainer], [allowAtRoot]) VALUES (534, 1033, N'File', N'icon-document', N'icon-document', NULL, 0, 1)
INSERT [dbo].[cmsContentType] ([pk], [nodeId], [alias], [icon], [thumbnail], [description], [isContainer], [allowAtRoot]) VALUES (535, 1051, N'umbMaster', N'folder.gif', N'folder.png', N'', 0, 0)
INSERT [dbo].[cmsContentType] ([pk], [nodeId], [alias], [icon], [thumbnail], [description], [isContainer], [allowAtRoot]) VALUES (536, 1052, N'umbHomePage', N'icon-home', N'docWithImage.png', N'', 0, 0)
INSERT [dbo].[cmsContentType] ([pk], [nodeId], [alias], [icon], [thumbnail], [description], [isContainer], [allowAtRoot]) VALUES (537, 1053, N'umbNewsItem', N'.sprTreeDocPic', N'docWithImage.png', N'', 0, 0)
INSERT [dbo].[cmsContentType] ([pk], [nodeId], [alias], [icon], [thumbnail], [description], [isContainer], [allowAtRoot]) VALUES (538, 1054, N'umbNewsOverview', N'package.png', N'folder_media.png', N'', 0, 0)
INSERT [dbo].[cmsContentType] ([pk], [nodeId], [alias], [icon], [thumbnail], [description], [isContainer], [allowAtRoot]) VALUES (539, 1055, N'umbTextPage', N'icon-document', N'doc.png', N'', 0, 0)
INSERT [dbo].[cmsContentType] ([pk], [nodeId], [alias], [icon], [thumbnail], [description], [isContainer], [allowAtRoot]) VALUES (540, 1067, N'newsPage', N'icon-document', N'folder.png', NULL, 0, 0)
INSERT [dbo].[cmsContentType] ([pk], [nodeId], [alias], [icon], [thumbnail], [description], [isContainer], [allowAtRoot]) VALUES (544, 1085, N'category', N'icon-document', N'folder.png', NULL, 0, 0)
INSERT [dbo].[cmsContentType] ([pk], [nodeId], [alias], [icon], [thumbnail], [description], [isContainer], [allowAtRoot]) VALUES (545, 1088, N'product', N'icon-document', N'folder.png', NULL, 0, 0)
INSERT [dbo].[cmsContentType] ([pk], [nodeId], [alias], [icon], [thumbnail], [description], [isContainer], [allowAtRoot]) VALUES (546, 1091, N'dealerLocator', N'icon-document', N'folder.png', NULL, 0, 0)
INSERT [dbo].[cmsContentType] ([pk], [nodeId], [alias], [icon], [thumbnail], [description], [isContainer], [allowAtRoot]) VALUES (547, 1094, N'contactPage', N'icon-document', N'folder.png', NULL, 0, 0)
SET IDENTITY_INSERT [dbo].[cmsContentType] OFF
INSERT [dbo].[cmsContentType2ContentType] ([parentContentTypeId], [childContentTypeId]) VALUES (1051, 1052)
INSERT [dbo].[cmsContentType2ContentType] ([parentContentTypeId], [childContentTypeId]) VALUES (1051, 1053)
INSERT [dbo].[cmsContentType2ContentType] ([parentContentTypeId], [childContentTypeId]) VALUES (1051, 1054)
INSERT [dbo].[cmsContentType2ContentType] ([parentContentTypeId], [childContentTypeId]) VALUES (1051, 1055)
INSERT [dbo].[cmsContentTypeAllowedContentType] ([Id], [AllowedId], [SortOrder]) VALUES (1031, 1031, 0)
INSERT [dbo].[cmsContentTypeAllowedContentType] ([Id], [AllowedId], [SortOrder]) VALUES (1031, 1032, 0)
INSERT [dbo].[cmsContentTypeAllowedContentType] ([Id], [AllowedId], [SortOrder]) VALUES (1031, 1033, 0)
INSERT [dbo].[cmsContentTypeAllowedContentType] ([Id], [AllowedId], [SortOrder]) VALUES (1052, 1055, 0)
INSERT [dbo].[cmsContentTypeAllowedContentType] ([Id], [AllowedId], [SortOrder]) VALUES (1052, 1067, 1)
INSERT [dbo].[cmsContentTypeAllowedContentType] ([Id], [AllowedId], [SortOrder]) VALUES (1052, 1085, 2)
INSERT [dbo].[cmsContentTypeAllowedContentType] ([Id], [AllowedId], [SortOrder]) VALUES (1052, 1088, 3)
INSERT [dbo].[cmsContentTypeAllowedContentType] ([Id], [AllowedId], [SortOrder]) VALUES (1052, 1091, 4)
INSERT [dbo].[cmsContentTypeAllowedContentType] ([Id], [AllowedId], [SortOrder]) VALUES (1052, 1094, 5)
INSERT [dbo].[cmsContentTypeAllowedContentType] ([Id], [AllowedId], [SortOrder]) VALUES (1054, 1053, 0)
INSERT [dbo].[cmsContentTypeAllowedContentType] ([Id], [AllowedId], [SortOrder]) VALUES (1055, 1055, 0)
SET IDENTITY_INSERT [dbo].[cmsContentVersion] ON 

INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (1, 1056, N'3eee7e1d-fe91-4236-8d48-3e099a7a5823', CAST(N'2016-12-13 15:34:40.740' AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (2, 1057, N'ba82e73f-745a-4329-ab5c-5cb5d97d77b4', CAST(N'2016-12-13 15:34:40.860' AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (3, 1058, N'475cbbcb-aa48-4ea5-a1ab-d466313fabeb', CAST(N'2016-12-13 15:34:40.873' AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (4, 1059, N'f8aefa51-5b92-4991-ba2e-e0625ef93673', CAST(N'2016-12-13 15:34:40.883' AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (5, 1060, N'433d811f-6515-45e5-a052-01d55e559fe9', CAST(N'2016-12-13 15:34:40.920' AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (6, 1061, N'e3aca069-c456-4a91-b36b-8b4bada2ec95', CAST(N'2016-12-13 15:34:40.957' AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (7, 1062, N'50bc10ba-174c-4538-8ff5-621cbf1728a0', CAST(N'2016-12-13 15:34:40.993' AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (8, 1063, N'13bbcefa-9dc0-4342-94d1-86d68e2f1cb0', CAST(N'2016-12-13 15:34:41.067' AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (9, 1064, N'2a397f04-229a-4099-b39f-c5bd74abc0d7', CAST(N'2016-12-13 15:34:41.083' AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (10, 1065, N'c9f8eac5-c7e0-40ef-92bb-7be66e937049', CAST(N'2016-12-13 15:34:41.093' AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (11, 1056, N'884c887e-7b3c-4970-9509-efb7efbc1da7', CAST(N'2016-12-13 15:34:41.297' AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (12, 1057, N'e948a105-4b11-46a3-a110-4833877f7d14', CAST(N'2016-12-13 15:34:41.350' AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (13, 1058, N'fdea77b0-1c61-4339-92e8-0d647ded2772', CAST(N'2016-12-13 15:34:41.363' AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (14, 1059, N'7427af80-4164-40cb-86eb-31b6a492f2de', CAST(N'2016-12-13 15:34:41.373' AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (15, 1060, N'cc910286-dfa8-422e-a3d0-436e54423ab4', CAST(N'2016-12-13 15:34:41.383' AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (16, 1061, N'2011443f-aa5d-4d9b-bc77-948f82025f15', CAST(N'2016-12-13 15:34:41.393' AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (17, 1062, N'63f193a4-14fe-49fa-a906-abd170a6d476', CAST(N'2016-12-13 15:34:41.400' AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (18, 1063, N'e50c59bb-f8ed-4af3-99b8-3dae1835d432', CAST(N'2016-12-13 15:34:41.413' AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (19, 1064, N'b488a477-6131-4179-abd4-0014509eda9b', CAST(N'2016-12-13 15:34:41.427' AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (20, 1065, N'bc64aa91-600e-4c3a-bb12-a2d70a58ea46', CAST(N'2016-12-13 15:34:41.437' AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (27, 1062, N'91479a6e-9ce4-40c3-8b5b-c1c631fde454', CAST(N'2016-12-15 16:52:43.657' AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (28, 1062, N'dd1c6e98-134f-4a40-9419-82f4222125bc', CAST(N'2016-12-19 13:54:50.210' AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (29, 1057, N'a637945b-e349-427c-9098-045dcb2c24c5', CAST(N'2016-12-19 13:54:04.430' AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (30, 1058, N'314b0c49-304f-4e36-8539-4ece9ea4b291', CAST(N'2016-12-19 13:54:12.363' AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (31, 1059, N'32821f4f-4e00-4726-811b-dd6f74bfe747', CAST(N'2016-12-19 13:54:21.897' AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (32, 1060, N'99fad01a-ebaf-41f0-a819-91b7ea945b1f', CAST(N'2016-12-19 13:55:15.457' AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (41, 1057, N'15f8770f-8a65-43ae-a738-996c8f5ce96a', CAST(N'2016-12-19 14:24:19.073' AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (42, 1057, N'2869eca0-4bd9-4a6b-84b0-c2ee516443af', CAST(N'2016-12-19 14:24:19.167' AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (43, 1058, N'81540c1b-48d5-4a14-91a2-68a8d095c20a', CAST(N'2016-12-19 14:24:23.590' AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (44, 1058, N'076820e8-f26f-431d-8713-83d0333447d5', CAST(N'2016-12-19 14:24:23.623' AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (45, 1059, N'537a2d33-9591-429d-8320-d20eff25c9a9', CAST(N'2016-12-19 14:24:27.947' AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (46, 1059, N'721945ff-ba48-42c5-925b-917ddedb8d74', CAST(N'2016-12-19 14:24:27.967' AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (47, 1060, N'6175c3b5-28c6-4d87-a5cd-90a0bd76a147', CAST(N'2016-12-19 14:24:33.050' AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (48, 1060, N'87f7aa5f-d9d4-4537-aba0-bab33921ee26', CAST(N'2016-12-19 14:24:33.070' AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (49, 1056, N'b5306b13-4938-43bd-97ce-09506fce4020', CAST(N'2016-12-19 14:32:00.450' AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (50, 1056, N'f4190853-e84d-4605-9961-b64a34a616f2', CAST(N'2016-12-19 14:36:15.027' AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (51, 1056, N'b4d6069a-aad9-4e4d-b20c-64a0a577644b', CAST(N'2016-12-19 14:37:08.687' AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (52, 1056, N'1934a8e7-b4aa-4996-9d35-b487073d5383', CAST(N'2016-12-19 14:38:02.567' AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (59, 1086, N'3645753c-b53d-41d6-85a4-1f599ac25ec3', CAST(N'2016-12-19 17:13:27.977' AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (60, 1089, N'dcaafaed-35de-4ad9-b014-46e0eb10df22', CAST(N'2016-12-19 17:19:53.753' AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (61, 1092, N'fc4e4b09-695b-41dc-a120-27dae91d11f4', CAST(N'2016-12-19 17:36:51.820' AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (62, 1095, N'6deeba6e-a76a-4d15-b203-74c5f8f59b01', CAST(N'2016-12-21 16:58:28.977' AS DateTime))
SET IDENTITY_INSERT [dbo].[cmsContentVersion] OFF
INSERT [dbo].[cmsContentXml] ([nodeId], [xml]) VALUES (1056, N'<umbHomePage id="1056" key="b5ad3353-cdc0-4743-ba86-dea44a401b85" parentID="-1" level="1" creatorID="0" sortOrder="0" createDate="2016-12-13T15:34:40" updateDate="2016-12-19T14:38:02" nodeName="Home" urlName="home" path="-1,1056" isDoc="" nodeType="1052" creatorName="HarveyNash" writerName="HarveyNash" writerID="0" template="1047" nodeTypeAlias="umbHomePage"><umbracoNaviHide>0</umbracoNaviHide><title><![CDATA[NashTech Demo Umbraco]]></title><facebookLink><![CDATA[http://facebook.com/Umbraco]]></facebookLink><googleLink><![CDATA[https://google.com/+Umbraco]]></googleLink><rssLink><![CDATA[http://feeds.feedburner.com/umbracoblog]]></rssLink><twitterLink><![CDATA[http://twitter.com/UmbracoProject]]></twitterLink><hideBanner>0</hideBanner><aboutTitle><![CDATA[What''s this about?]]></aboutTitle><aboutText><![CDATA[<p>This is <a href="http://html5up.net/txt/">TXT</a>, a free site template designed by <a href="http://n33.co">n33</a> for <a href="http://html5up.net/">HTML5 UP</a>. It''s built on the <a href="http://skeljs.org">skelJS</a> framework, uses well-thought out HTML5 and CSS3, and is fully responsive making it a great starting point for your own projects. And, like everything else we make, it''s also free to use for pretty much any personal or commercial work under the <a href="http://html5up.net/license/">Creative Commons Attribution</a> license, so go ahead and use it – just don''t forget to credit us!</p>]]></aboutText><byline><![CDATA[A simple demo for Umbraco]]></byline><copyright><![CDATA[NashTech Demo Umbraco]]></copyright><siteName><![CDATA[NashTech Demo Umbraco]]></siteName></umbHomePage>')
INSERT [dbo].[cmsContentXml] ([nodeId], [xml]) VALUES (1061, N'<umbNewsOverview id="1061" key="3b6561bf-3756-4d95-8838-c6cdea523180" parentID="1056" level="2" creatorID="0" sortOrder="4" createDate="2016-12-13T15:34:40" updateDate="2016-12-13T15:34:41" nodeName="News" urlName="news" path="-1,1056,1061" isDoc="" nodeType="1054" creatorName="HarveyNash" writerName="HarveyNash" writerID="0" template="1049" nodeTypeAlias="umbNewsOverview"><umbracoNaviHide>0</umbracoNaviHide><title><![CDATA[Adventure log]]></title></umbNewsOverview>')
INSERT [dbo].[cmsContentXml] ([nodeId], [xml]) VALUES (1062, N'<umbNewsItem id="1062" key="85c99fab-dd88-43eb-86a0-1ec1e51ebc8a" parentID="1061" level="3" creatorID="0" sortOrder="0" createDate="2016-12-13T15:34:40" updateDate="2016-12-19T13:54:50" nodeName="The 10 remarkable features of object" urlName="the-10-remarkable-features-of-object" path="-1,1056,1061,1062" isDoc="" nodeType="1053" creatorName="HarveyNash" writerName="HarveyNash" writerID="0" template="1048" nodeTypeAlias="umbNewsItem"><umbracoNaviHide>0</umbracoNaviHide><bodyText><![CDATA[<p>Ita prorsus, inquam; Hanc ergo intuens debet institutum illud quasi signum absolvere. Ergo adhuc, quantum equidem intellego, causa non videtur fuisse mutandi nominis. Quia dolori non voluptas contraria est, sed doloris privatio. Nos autem non solum beatae vitae istam esse oblectationem videmus, sed etiam levamentum miseriarum. Quodsi ipsam honestatem undique pertectam atque absolutam. Nos cum te, M. Quod vestri non item.</p>
<p>Cum id quoque, ut cupiebat, audivisset, evelli iussit eam, qua erat transfixus, hastam. Quarum ambarum rerum cum medicinam pollicetur, luxuriae licentiam pollicetur. Quid iudicant sensus? Quo tandem modo?</p>]]></bodyText></umbNewsItem>')
INSERT [dbo].[cmsContentXml] ([nodeId], [xml]) VALUES (1063, N'<umbNewsItem id="1063" key="656160c9-481a-4c61-a03d-16a50918bdee" parentID="1061" level="3" creatorID="0" sortOrder="1" createDate="2016-12-13T15:34:41" updateDate="2016-12-13T15:34:41" nodeName="This is a wonderful news item" urlName="this-is-a-wonderful-news-item" path="-1,1056,1061,1063" isDoc="" nodeType="1053" creatorName="HarveyNash" writerName="HarveyNash" writerID="0" template="1048" nodeTypeAlias="umbNewsItem"><umbracoNaviHide>0</umbracoNaviHide><bodyText><![CDATA[<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Commoda autem et incommoda in eo genere sunt, quae praeposita et reiecta diximus; Bestiarum vero nullum iudicium puto. Est enim effectrix multarum et magnarum voluptatum. Duo Reges: constructio interrete. Claudii libidini, qui tum erat summo ne imperio, dederetur. Quarum ambarum rerum cum medicinam pollicetur, luxuriae licentiam pollicetur. Sed virtutem ipsam inchoavit, nihil amplius.</p>
<p>Ita redarguitur ipse a sese, convincunturque scripta eius probitate ipsius ac moribus. Istam voluptatem, inquit, Epicurus ignorat? Sed venio ad inconstantiae crimen, ne saepius dicas me aberrare; Sic, et quidem diligentius saepiusque ista loquemur inter nos agemusque communiter. Primum in nostrane potestate est, quid meminerimus? Consequens enim est et post oritur, ut dixi. Hoc mihi cum tuo fratre convenit. Immo videri fortasse. Itaque in rebus minime obscuris non multus est apud eos disserendi labor. Aliud igitur esse censet gaudere, aliud non dolere.</p>]]></bodyText></umbNewsItem>')
INSERT [dbo].[cmsContentXml] ([nodeId], [xml]) VALUES (1064, N'<umbNewsItem id="1064" key="7d3f85db-ce76-4dfd-b3f0-9789de3ff128" parentID="1061" level="3" creatorID="0" sortOrder="2" createDate="2016-12-13T15:34:41" updateDate="2016-12-13T15:34:41" nodeName="You really need to read this!" urlName="you-really-need-to-read-this" path="-1,1056,1061,1064" isDoc="" nodeType="1053" creatorName="HarveyNash" writerName="HarveyNash" writerID="0" template="1048" nodeTypeAlias="umbNewsItem"><umbracoNaviHide>0</umbracoNaviHide><bodyText><![CDATA[<p><span>Ut aliquid scire se gaudeant? Hanc ergo intuens debet institutum illud quasi signum absolvere. Vestri haec verecundius, illi fortasse constantius. Itaque sensibus rationem adiunxit et ratione effecta sensus non reliquit. Sed ea mala virtuti magnitudine obruebantur. Quasi ego id curem, quid ille aiat aut neget. Verum tamen cum de rebus grandioribus dicas, ipsae res verba rapiunt; Apparet statim, quae sint officia, quae actiones.</span></p>
<p><span><span>Virtutibus igitur rectissime mihi videris et ad consuetudinem nostrae orationis vitia posuisse contraria. Nonne videmus quanta perturbatio rerum omnium consequatur, quanta confusio? Sed eum qui audiebant, quoad poterant, defendebant sententiam suam. Ut necesse sit omnium rerum, quae natura vigeant, similem esse finem, non eundem.</span></span></p>]]></bodyText></umbNewsItem>')
INSERT [dbo].[cmsContentXml] ([nodeId], [xml]) VALUES (1065, N'<umbNewsItem id="1065" key="28bbdd81-0a37-4935-a34c-8eca44654580" parentID="1061" level="3" creatorID="0" sortOrder="3" createDate="2016-12-13T15:34:41" updateDate="2016-12-13T15:34:41" nodeName="Txt Starter Kit For Umbraco Released" urlName="txt-starter-kit-for-umbraco-released" path="-1,1056,1061,1065" isDoc="" nodeType="1053" creatorName="HarveyNash" writerName="HarveyNash" writerID="0" template="1048" nodeTypeAlias="umbNewsItem"><umbracoNaviHide>0</umbracoNaviHide><publishDate>2021-09-20T00:00:00</publishDate><subheader><![CDATA[In all it''s MVC Views goodness]]></subheader><image><![CDATA[/media/SampleImages/1077/pic05.jpg]]></image><bodyText><![CDATA[<p><span>Sed ad haec, nisi molestum est, habeo quae velim. Neque enim disputari sine reprehensione nec cum iracundia aut pertinacia recte disputari potest. Nec vero alia sunt quaerenda contra Carneadeam illam sententiam. Deinde disputat, quod cuiusque generis animantium statui deceat extremum. Facit igitur Lucius noster prudenter, qui audire de summo bono potissimum velit; Quis non odit sordidos, vanos, leves, futtiles?</span></p>
<p><span><span>Negat enim summo bono afferre incrementum diem. Haec mihi videtur delicatior, ut ita dicam, molliorque ratio, quam virtutis vis gravitasque postulat. Haec quo modo conveniant, non sane intellego. Quis enim confidit semper sibi illud stabile et firmum permansurum, quod fragile et caducum sit? Multoque hoc melius nos veriusque quam Stoici. Igitur neque stultorum quisquam beatus neque sapientium non beatus. De hominibus dici non necesse est. Non enim iam stirpis bonum quaeret, sed animalis. Nobis Heracleotes ille Dionysius flagitiose descivisse videtur a Stoicis propter oculorum dolorem. At, illa, ut vobis placet, partem quandam tuetur, reliquam deserit.</span></span></p>]]></bodyText></umbNewsItem>')
INSERT [dbo].[cmsContentXml] ([nodeId], [xml]) VALUES (1086, N'<category id="1086" key="4d95bde3-d7a0-4d9a-b99b-eab8241e7605" parentID="1056" level="2" creatorID="0" sortOrder="5" createDate="2016-12-19T17:13:27" updateDate="2016-12-19T17:13:27" nodeName="Category" urlName="category" path="-1,1056,1086" isDoc="" nodeType="1085" creatorName="HarveyNash" writerName="HarveyNash" writerID="0" template="1084" nodeTypeAlias="category" />')
INSERT [dbo].[cmsContentXml] ([nodeId], [xml]) VALUES (1089, N'<product id="1089" key="2dd89232-9545-40f1-b2a8-c089dd41f966" parentID="1056" level="2" creatorID="0" sortOrder="6" createDate="2016-12-19T17:19:53" updateDate="2016-12-19T17:19:53" nodeName="Product" urlName="product" path="-1,1056,1089" isDoc="" nodeType="1088" creatorName="HarveyNash" writerName="HarveyNash" writerID="0" template="1087" nodeTypeAlias="product" />')
INSERT [dbo].[cmsContentXml] ([nodeId], [xml]) VALUES (1092, N'<dealerLocator id="1092" key="6b4110ce-6e66-4faf-af5f-f6de31ac65df" parentID="1056" level="2" creatorID="0" sortOrder="7" createDate="2016-12-19T17:36:51" updateDate="2016-12-19T17:36:51" nodeName="Dealer Locator" urlName="dealer-locator" path="-1,1056,1092" isDoc="" nodeType="1091" creatorName="HarveyNash" writerName="HarveyNash" writerID="0" template="1090" nodeTypeAlias="dealerLocator" />')
INSERT [dbo].[cmsContentXml] ([nodeId], [xml]) VALUES (1095, N'<contactPage id="1095" key="556f9b10-4c03-4bf0-ba9f-74a45280a961" parentID="1056" level="2" creatorID="0" sortOrder="8" createDate="2016-12-21T16:58:28" updateDate="2016-12-21T16:58:28" nodeName="Contact" urlName="contact" path="-1,1056,1095" isDoc="" nodeType="1094" creatorName="HarveyNash" writerName="HarveyNash" writerID="0" template="1093" nodeTypeAlias="contactPage" />')
SET IDENTITY_INSERT [dbo].[cmsDataType] ON 

INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (-28, -97, N'Umbraco.ListView', N'Nvarchar')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (-27, -96, N'Umbraco.ListView', N'Nvarchar')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (-26, -95, N'Umbraco.ListView', N'Nvarchar')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (1, -49, N'Umbraco.TrueFalse', N'Integer')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (2, -51, N'Umbraco.Integer', N'Integer')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (3, -87, N'Umbraco.TinyMCEv3', N'Ntext')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (4, -88, N'Umbraco.Textbox', N'Nvarchar')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (5, -89, N'Umbraco.TextboxMultiple', N'Ntext')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (6, -90, N'Umbraco.UploadField', N'Nvarchar')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (7, -92, N'Umbraco.NoEdit', N'Nvarchar')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (8, -36, N'Umbraco.DateTime', N'Date')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (9, -37, N'Umbraco.ColorPickerAlias', N'Nvarchar')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (11, -39, N'Umbraco.DropDownMultiple', N'Nvarchar')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (12, -40, N'Umbraco.RadioButtonList', N'Nvarchar')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (13, -41, N'Umbraco.Date', N'Date')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (14, -42, N'Umbraco.DropDown', N'Integer')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (15, -43, N'Umbraco.CheckBoxList', N'Nvarchar')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (16, 1034, N'Umbraco.ContentPickerAlias', N'Integer')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (17, 1035, N'Umbraco.MultipleMediaPicker', N'Nvarchar')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (18, 1036, N'Umbraco.MemberPicker', N'Integer')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (21, 1040, N'Umbraco.RelatedLinks', N'Ntext')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (22, 1041, N'Umbraco.Tags', N'Ntext')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (24, 1043, N'Umbraco.ImageCropper', N'Ntext')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (25, 1045, N'Umbraco.MultipleMediaPicker', N'Nvarchar')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (26, 1069, N'Umbraco.TinyMCEv3', N'Ntext')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (27, 1073, N'Umbraco.ListView', N'Ntext')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (28, 1076, N'Umbraco.ListView', N'Ntext')
SET IDENTITY_INSERT [dbo].[cmsDataType] OFF
SET IDENTITY_INSERT [dbo].[cmsDataTypePreValues] ON 

INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (-9, -96, N'[{"alias":"updateDate","header":"Last edited","isSystem":1},{"alias":"owner","header":"Updated by","isSystem":1}]', 5, N'includeProperties')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (-8, -96, N'[{"name": "Grid","path": "views/propertyeditors/listview/layouts/grid/grid.html", "icon": "icon-thumbnails-small", "isSystem": 1, "selected": true},{"name": "List","path": "views/propertyeditors/listview/layouts/list/list.html","icon": "icon-list", "isSystem": 1,"selected": true}]', 4, N'layouts')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (-7, -96, N'desc', 3, N'orderDirection')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (-6, -96, N'updateDate', 2, N'orderBy')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (-5, -96, N'100', 1, N'pageSize')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (-4, -97, N'[{"alias":"username","isSystem":1},{"alias":"email","isSystem":1},{"alias":"updateDate","header":"Last edited","isSystem":1}]', 4, N'includeProperties')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (-3, -97, N'asc', 3, N'orderDirection')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (-2, -97, N'username', 2, N'orderBy')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (-1, -97, N'10', 1, N'pageSize')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (3, -87, N',code,undo,redo,cut,copy,mcepasteword,stylepicker,bold,italic,bullist,numlist,outdent,indent,mcelink,unlink,mceinsertanchor,mceimage,umbracomacro,mceinserttable,umbracoembed,mcecharmap,|1|1,2,3,|0|500,400|1049,|true|', 0, N'')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (4, 1041, N'default', 0, N'group')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (5, 1045, N'1', 0, N'multiPicker')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (6, 1069, N'{
  "toolbar": [
    "code",
    "codemirror",
    "removeformat",
    "undo",
    "redo",
    "cut",
    "copy",
    "paste",
    "styleselect",
    "bold",
    "italic",
    "underline",
    "strikethrough",
    "alignleft",
    "aligncenter",
    "alignright",
    "bullist",
    "numlist",
    "outdent",
    "indent",
    "link",
    "umbmediapicker",
    "umbmacro",
    "umbembeddialog"
  ],
  "stylesheets": [],
  "dimensions": {
    "height": 500
  },
  "maxImageSize": 500
}', 1, N'editor')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (7, 1069, NULL, 2, N'hideLabel')
SET IDENTITY_INSERT [dbo].[cmsDataTypePreValues] OFF
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1064, 1, 0, N'b488a477-6131-4179-abd4-0014509eda9b', N'You really need to read this!', NULL, NULL, CAST(N'2016-12-13 15:34:41.427' AS DateTime), 1048, 1)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1060, 0, 0, N'433d811f-6515-45e5-a052-01d55e559fe9', N'About', NULL, NULL, CAST(N'2016-12-13 15:34:40.920' AS DateTime), 1050, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1057, 0, 0, N'a637945b-e349-427c-9098-045dcb2c24c5', N'Getting Started', NULL, NULL, CAST(N'2016-12-19 13:54:04.430' AS DateTime), 1050, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1056, 0, 0, N'b5306b13-4938-43bd-97ce-09506fce4020', N'Home', NULL, NULL, CAST(N'2016-12-19 14:32:00.450' AS DateTime), 1047, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1058, 0, 0, N'fdea77b0-1c61-4339-92e8-0d647ded2772', N'Go Further', NULL, NULL, CAST(N'2016-12-13 15:34:41.363' AS DateTime), 1050, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1086, 1, 0, N'3645753c-b53d-41d6-85a4-1f599ac25ec3', N'Category', NULL, NULL, CAST(N'2016-12-19 17:13:27.977' AS DateTime), 1084, 1)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1092, 1, 0, N'fc4e4b09-695b-41dc-a120-27dae91d11f4', N'Dealer Locator', NULL, NULL, CAST(N'2016-12-19 17:36:51.820' AS DateTime), 1090, 1)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1059, 0, 0, N'7427af80-4164-40cb-86eb-31b6a492f2de', N'Installing Modules', NULL, NULL, CAST(N'2016-12-13 15:34:41.373' AS DateTime), 1050, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1063, 1, 0, N'e50c59bb-f8ed-4af3-99b8-3dae1835d432', N'This is a wonderful news item', NULL, NULL, CAST(N'2016-12-13 15:34:41.413' AS DateTime), 1048, 1)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1056, 0, 0, N'3eee7e1d-fe91-4236-8d48-3e099a7a5823', N'Home', NULL, NULL, CAST(N'2016-12-13 15:34:40.740' AS DateTime), 1047, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1060, 0, 0, N'cc910286-dfa8-422e-a3d0-436e54423ab4', N'About', NULL, NULL, CAST(N'2016-12-13 15:34:41.383' AS DateTime), 1050, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1089, 1, 0, N'dcaafaed-35de-4ad9-b014-46e0eb10df22', N'Product', NULL, NULL, CAST(N'2016-12-19 17:19:53.753' AS DateTime), 1087, 1)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1057, 0, 0, N'e948a105-4b11-46a3-a110-4833877f7d14', N'Getting Started', NULL, NULL, CAST(N'2016-12-13 15:34:41.350' AS DateTime), 1050, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1058, 0, 0, N'314b0c49-304f-4e36-8539-4ece9ea4b291', N'Go Further', NULL, NULL, CAST(N'2016-12-19 13:54:12.363' AS DateTime), 1050, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1057, 0, 0, N'ba82e73f-745a-4329-ab5c-5cb5d97d77b4', N'Getting Started', NULL, NULL, CAST(N'2016-12-13 15:34:40.860' AS DateTime), 1050, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1062, 0, 0, N'50bc10ba-174c-4538-8ff5-621cbf1728a0', N'The 10 remarkable features of object', NULL, NULL, CAST(N'2016-12-13 15:34:40.993' AS DateTime), 1048, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1056, 0, 0, N'b4d6069a-aad9-4e4d-b20c-64a0a577644b', N'Home', NULL, NULL, CAST(N'2016-12-19 14:37:08.687' AS DateTime), 1047, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1058, 0, 0, N'81540c1b-48d5-4a14-91a2-68a8d095c20a', N'Go Further', NULL, NULL, CAST(N'2016-12-19 14:24:23.590' AS DateTime), 1050, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1095, 1, 0, N'6deeba6e-a76a-4d15-b203-74c5f8f59b01', N'Contact', NULL, NULL, CAST(N'2016-12-21 16:58:28.977' AS DateTime), 1093, 1)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1065, 0, 0, N'c9f8eac5-c7e0-40ef-92bb-7be66e937049', N'Txt Starter Kit For Umbraco Released', NULL, NULL, CAST(N'2016-12-13 15:34:41.093' AS DateTime), 1048, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1062, 1, 0, N'dd1c6e98-134f-4a40-9419-82f4222125bc', N'The 10 remarkable features of object', NULL, NULL, CAST(N'2016-12-19 13:54:50.210' AS DateTime), 1048, 1)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1058, 0, 0, N'076820e8-f26f-431d-8713-83d0333447d5', N'Go Further', NULL, NULL, CAST(N'2016-12-19 14:24:23.623' AS DateTime), 1050, 1)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1063, 0, 0, N'13bbcefa-9dc0-4342-94d1-86d68e2f1cb0', N'This is a wonderful news item', NULL, NULL, CAST(N'2016-12-13 15:34:41.067' AS DateTime), 1048, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1061, 0, 0, N'e3aca069-c456-4a91-b36b-8b4bada2ec95', N'News', NULL, NULL, CAST(N'2016-12-13 15:34:40.957' AS DateTime), 1049, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1060, 0, 0, N'6175c3b5-28c6-4d87-a5cd-90a0bd76a147', N'About', NULL, NULL, CAST(N'2016-12-19 14:24:33.050' AS DateTime), 1050, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1059, 0, 0, N'721945ff-ba48-42c5-925b-917ddedb8d74', N'Installing Modules', NULL, NULL, CAST(N'2016-12-19 14:24:27.967' AS DateTime), 1050, 1)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1060, 0, 0, N'99fad01a-ebaf-41f0-a819-91b7ea945b1f', N'About', NULL, NULL, CAST(N'2016-12-19 13:55:15.457' AS DateTime), 1050, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1061, 1, 0, N'2011443f-aa5d-4d9b-bc77-948f82025f15', N'News', NULL, NULL, CAST(N'2016-12-13 15:34:41.393' AS DateTime), 1049, 1)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1057, 0, 0, N'15f8770f-8a65-43ae-a738-996c8f5ce96a', N'Getting Started', NULL, NULL, CAST(N'2016-12-19 14:24:19.073' AS DateTime), 1050, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1065, 1, 0, N'bc64aa91-600e-4c3a-bb12-a2d70a58ea46', N'Txt Starter Kit For Umbraco Released', NULL, NULL, CAST(N'2016-12-13 15:34:41.437' AS DateTime), 1048, 1)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1062, 0, 0, N'63f193a4-14fe-49fa-a906-abd170a6d476', N'The 10 remarkable features of object', NULL, NULL, CAST(N'2016-12-13 15:34:41.400' AS DateTime), 1048, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1056, 1, 0, N'1934a8e7-b4aa-4996-9d35-b487073d5383', N'Home', NULL, NULL, CAST(N'2016-12-19 14:38:02.567' AS DateTime), 1047, 1)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1056, 0, 0, N'f4190853-e84d-4605-9961-b64a34a616f2', N'Home', NULL, NULL, CAST(N'2016-12-19 14:36:15.027' AS DateTime), 1047, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1060, 0, 0, N'87f7aa5f-d9d4-4537-aba0-bab33921ee26', N'About', NULL, NULL, CAST(N'2016-12-19 14:24:33.070' AS DateTime), 1050, 1)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1062, 0, 0, N'91479a6e-9ce4-40c3-8b5b-c1c631fde454', N'The 10 remarkable features of object', NULL, NULL, CAST(N'2016-12-15 16:52:43.657' AS DateTime), 1048, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1057, 0, 0, N'2869eca0-4bd9-4a6b-84b0-c2ee516443af', N'Getting Started', NULL, NULL, CAST(N'2016-12-19 14:24:19.167' AS DateTime), 1050, 1)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1064, 0, 0, N'2a397f04-229a-4099-b39f-c5bd74abc0d7', N'You really need to read this!', NULL, NULL, CAST(N'2016-12-13 15:34:41.083' AS DateTime), 1048, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1059, 0, 0, N'537a2d33-9591-429d-8320-d20eff25c9a9', N'Installing Modules', NULL, NULL, CAST(N'2016-12-19 14:24:27.947' AS DateTime), 1050, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1058, 0, 0, N'475cbbcb-aa48-4ea5-a1ab-d466313fabeb', N'Go Further', NULL, NULL, CAST(N'2016-12-13 15:34:40.873' AS DateTime), 1050, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1059, 0, 0, N'32821f4f-4e00-4726-811b-dd6f74bfe747', N'Installing Modules', NULL, NULL, CAST(N'2016-12-19 13:54:21.897' AS DateTime), 1050, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1059, 0, 0, N'f8aefa51-5b92-4991-ba2e-e0625ef93673', N'Installing Modules', NULL, NULL, CAST(N'2016-12-13 15:34:40.883' AS DateTime), 1050, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1056, 0, 0, N'884c887e-7b3c-4970-9509-efb7efbc1da7', N'Home', NULL, NULL, CAST(N'2016-12-13 15:34:41.297' AS DateTime), 1047, 0)
INSERT [dbo].[cmsDocumentType] ([contentTypeNodeId], [templateNodeId], [IsDefault]) VALUES (1052, 1047, 1)
INSERT [dbo].[cmsDocumentType] ([contentTypeNodeId], [templateNodeId], [IsDefault]) VALUES (1053, 1048, 1)
INSERT [dbo].[cmsDocumentType] ([contentTypeNodeId], [templateNodeId], [IsDefault]) VALUES (1054, 1049, 1)
INSERT [dbo].[cmsDocumentType] ([contentTypeNodeId], [templateNodeId], [IsDefault]) VALUES (1055, 1050, 1)
INSERT [dbo].[cmsDocumentType] ([contentTypeNodeId], [templateNodeId], [IsDefault]) VALUES (1067, 1066, 1)
INSERT [dbo].[cmsDocumentType] ([contentTypeNodeId], [templateNodeId], [IsDefault]) VALUES (1085, 1084, 1)
INSERT [dbo].[cmsDocumentType] ([contentTypeNodeId], [templateNodeId], [IsDefault]) VALUES (1088, 1087, 1)
INSERT [dbo].[cmsDocumentType] ([contentTypeNodeId], [templateNodeId], [IsDefault]) VALUES (1091, 1090, 1)
INSERT [dbo].[cmsDocumentType] ([contentTypeNodeId], [templateNodeId], [IsDefault]) VALUES (1094, 1093, 1)
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1056, N'b5306b13-4938-43bd-97ce-09506fce4020', CAST(N'2016-12-19 14:32:00.473' AS DateTime), N'<umbHomePage id="1056" key="b5ad3353-cdc0-4743-ba86-dea44a401b85" parentID="-1" level="1" creatorID="0" sortOrder="0" createDate="2016-12-13T15:34:40" updateDate="2016-12-19T14:32:00" nodeName="Home" urlName="home" path="-1,1056" isDoc="" nodeType="1052" creatorName="HarveyNash" writerName="HarveyNash" writerID="0" template="1047" nodeTypeAlias="umbHomePage"><umbracoNaviHide>0</umbracoNaviHide><title><![CDATA[NashTech Demo Umbraco]]></title><facebookLink><![CDATA[http://facebook.com/Umbraco]]></facebookLink><googleLink><![CDATA[https://google.com/+Umbraco]]></googleLink><rssLink><![CDATA[http://feeds.feedburner.com/umbracoblog]]></rssLink><twitterLink><![CDATA[http://twitter.com/UmbracoProject]]></twitterLink><bannerSubheader><![CDATA[It will lead to a call-to-action, just click the button...]]></bannerSubheader><hideBanner>0</hideBanner><bannerHeader><![CDATA[This is some text that needs to pop]]></bannerHeader><bannerBackgroundImage><![CDATA[/media/SampleImages/1008/banner.jpg]]></bannerBackgroundImage><bannerLinkText><![CDATA[You know you want to click me]]></bannerLinkText><aboutTitle><![CDATA[What''s this about?]]></aboutTitle><aboutText><![CDATA[<p>This is <a href="http://html5up.net/txt/">TXT</a>, a free site template designed by <a href="http://n33.co">n33</a> for <a href="http://html5up.net/">HTML5 UP</a>. It''s built on the <a href="http://skeljs.org">skelJS</a> framework, uses well-thought out HTML5 and CSS3, and is fully responsive making it a great starting point for your own projects. And, like everything else we make, it''s also free to use for pretty much any personal or commercial work under the <a href="http://html5up.net/license/">Creative Commons Attribution</a> license, so go ahead and use it – just don''t forget to credit us!</p>]]></aboutText><byline><![CDATA[A simple demo for Umbraco]]></byline><copyright><![CDATA[NashTech Demo Umbraco]]></copyright><siteName><![CDATA[NashTech Demo Umbraco]]></siteName></umbHomePage>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1056, N'3eee7e1d-fe91-4236-8d48-3e099a7a5823', CAST(N'2016-12-13 15:34:40.793' AS DateTime), N'<umbHomePage id="1056" key="b5ad3353-cdc0-4743-ba86-dea44a401b85" parentID="-1" level="1" creatorID="0" sortOrder="0" createDate="2016-12-13T15:34:40" updateDate="2016-12-13T15:34:40" nodeName="Home" urlName="home" path="-1,1056" isDoc="" nodeType="1052" creatorName="HarveyNash" writerName="HarveyNash" writerID="0" template="1047" nodeTypeAlias="umbHomePage"><umbracoNaviHide>0</umbracoNaviHide><title><![CDATA[Txt: A responsive starter kit for Umbraco]]></title><facebookLink><![CDATA[http://facebook.com/Umbraco]]></facebookLink><twitterLink><![CDATA[http://twitter.com/UmbracoProject]]></twitterLink><rssLink><![CDATA[http://feeds.feedburner.com/umbracoblog]]></rssLink><googleLink><![CDATA[https://google.com/+Umbraco]]></googleLink><hideBanner>0</hideBanner><bannerHeader><![CDATA[This is some text that needs to pop]]></bannerHeader><bannerSubheader><![CDATA[It will lead to a call-to-action, just click the button...]]></bannerSubheader><bannerLinkText><![CDATA[You know you want to click me]]></bannerLinkText><bannerLink>1054</bannerLink><bannerBackgroundImage><![CDATA[/media/SampleImages/1008/banner.jpg]]></bannerBackgroundImage><aboutTitle><![CDATA[What''s this about?]]></aboutTitle><aboutText><![CDATA[<p>This is <a href="http://html5up.net/txt/">TXT</a>, a free site template designed by <a href="http://n33.co">n33</a> for <a href="http://html5up.net/">HTML5 UP</a>. It''s built on the <a href="http://skeljs.org">skelJS</a> framework, uses well-thought out HTML5 and CSS3, and is fully responsive making it a great starting point for your own projects. And, like everything else we make, it''s also free to use for pretty much any personal or commercial work under the <a href="http://html5up.net/license/">Creative Commons Attribution</a> license, so go ahead and use it – just don''t forget to credit us!</p>]]></aboutText><siteName><![CDATA[Umbraco Txt]]></siteName><byline><![CDATA[A responsive starter kit for Umbraco]]></byline><copyright><![CDATA[Umbraco]]></copyright></umbHomePage>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1056, N'b4d6069a-aad9-4e4d-b20c-64a0a577644b', CAST(N'2016-12-19 14:37:08.707' AS DateTime), N'<umbHomePage id="1056" key="b5ad3353-cdc0-4743-ba86-dea44a401b85" parentID="-1" level="1" creatorID="0" sortOrder="0" createDate="2016-12-13T15:34:40" updateDate="2016-12-19T14:37:08" nodeName="Home" urlName="home" path="-1,1056" isDoc="" nodeType="1052" creatorName="HarveyNash" writerName="HarveyNash" writerID="0" template="1047" nodeTypeAlias="umbHomePage"><umbracoNaviHide>0</umbracoNaviHide><title><![CDATA[NashTech Demo Umbraco]]></title><facebookLink><![CDATA[http://facebook.com/Umbraco]]></facebookLink><googleLink><![CDATA[https://google.com/+Umbraco]]></googleLink><rssLink><![CDATA[http://feeds.feedburner.com/umbracoblog]]></rssLink><twitterLink><![CDATA[http://twitter.com/UmbracoProject]]></twitterLink><hideBanner>0</hideBanner><bannerBackgroundImage><![CDATA[/media/SampleImages/1008/banner.jpg]]></bannerBackgroundImage><aboutTitle><![CDATA[What''s this about?]]></aboutTitle><aboutText><![CDATA[<p>This is <a href="http://html5up.net/txt/">TXT</a>, a free site template designed by <a href="http://n33.co">n33</a> for <a href="http://html5up.net/">HTML5 UP</a>. It''s built on the <a href="http://skeljs.org">skelJS</a> framework, uses well-thought out HTML5 and CSS3, and is fully responsive making it a great starting point for your own projects. And, like everything else we make, it''s also free to use for pretty much any personal or commercial work under the <a href="http://html5up.net/license/">Creative Commons Attribution</a> license, so go ahead and use it – just don''t forget to credit us!</p>]]></aboutText><byline><![CDATA[A simple demo for Umbraco]]></byline><copyright><![CDATA[NashTech Demo Umbraco]]></copyright><siteName><![CDATA[NashTech Demo Umbraco]]></siteName></umbHomePage>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1056, N'1934a8e7-b4aa-4996-9d35-b487073d5383', CAST(N'2016-12-19 14:38:02.573' AS DateTime), N'<umbHomePage id="1056" key="b5ad3353-cdc0-4743-ba86-dea44a401b85" parentID="-1" level="1" creatorID="0" sortOrder="0" createDate="2016-12-13T15:34:40" updateDate="2016-12-19T14:38:02" nodeName="Home" urlName="home" path="-1,1056" isDoc="" nodeType="1052" creatorName="HarveyNash" writerName="HarveyNash" writerID="0" template="1047" nodeTypeAlias="umbHomePage"><umbracoNaviHide>0</umbracoNaviHide><title><![CDATA[NashTech Demo Umbraco]]></title><facebookLink><![CDATA[http://facebook.com/Umbraco]]></facebookLink><googleLink><![CDATA[https://google.com/+Umbraco]]></googleLink><rssLink><![CDATA[http://feeds.feedburner.com/umbracoblog]]></rssLink><twitterLink><![CDATA[http://twitter.com/UmbracoProject]]></twitterLink><hideBanner>0</hideBanner><aboutTitle><![CDATA[What''s this about?]]></aboutTitle><aboutText><![CDATA[<p>This is <a href="http://html5up.net/txt/">TXT</a>, a free site template designed by <a href="http://n33.co">n33</a> for <a href="http://html5up.net/">HTML5 UP</a>. It''s built on the <a href="http://skeljs.org">skelJS</a> framework, uses well-thought out HTML5 and CSS3, and is fully responsive making it a great starting point for your own projects. And, like everything else we make, it''s also free to use for pretty much any personal or commercial work under the <a href="http://html5up.net/license/">Creative Commons Attribution</a> license, so go ahead and use it – just don''t forget to credit us!</p>]]></aboutText><byline><![CDATA[A simple demo for Umbraco]]></byline><copyright><![CDATA[NashTech Demo Umbraco]]></copyright><siteName><![CDATA[NashTech Demo Umbraco]]></siteName></umbHomePage>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1056, N'f4190853-e84d-4605-9961-b64a34a616f2', CAST(N'2016-12-19 14:36:15.057' AS DateTime), N'<umbHomePage id="1056" key="b5ad3353-cdc0-4743-ba86-dea44a401b85" parentID="-1" level="1" creatorID="0" sortOrder="0" createDate="2016-12-13T15:34:40" updateDate="2016-12-19T14:36:15" nodeName="Home" urlName="home" path="-1,1056" isDoc="" nodeType="1052" creatorName="HarveyNash" writerName="HarveyNash" writerID="0" template="1047" nodeTypeAlias="umbHomePage"><umbracoNaviHide>0</umbracoNaviHide><title><![CDATA[NashTech Demo Umbraco]]></title><facebookLink><![CDATA[http://facebook.com/Umbraco]]></facebookLink><googleLink><![CDATA[https://google.com/+Umbraco]]></googleLink><rssLink><![CDATA[http://feeds.feedburner.com/umbracoblog]]></rssLink><twitterLink><![CDATA[http://twitter.com/UmbracoProject]]></twitterLink><hideBanner>0</hideBanner><bannerBackgroundImage><![CDATA[/media/SampleImages/1008/banner.jpg]]></bannerBackgroundImage><bannerLinkText><![CDATA[You know you want to click me]]></bannerLinkText><aboutTitle><![CDATA[What''s this about?]]></aboutTitle><aboutText><![CDATA[<p>This is <a href="http://html5up.net/txt/">TXT</a>, a free site template designed by <a href="http://n33.co">n33</a> for <a href="http://html5up.net/">HTML5 UP</a>. It''s built on the <a href="http://skeljs.org">skelJS</a> framework, uses well-thought out HTML5 and CSS3, and is fully responsive making it a great starting point for your own projects. And, like everything else we make, it''s also free to use for pretty much any personal or commercial work under the <a href="http://html5up.net/license/">Creative Commons Attribution</a> license, so go ahead and use it – just don''t forget to credit us!</p>]]></aboutText><byline><![CDATA[A simple demo for Umbraco]]></byline><copyright><![CDATA[NashTech Demo Umbraco]]></copyright><siteName><![CDATA[NashTech Demo Umbraco]]></siteName></umbHomePage>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1056, N'884c887e-7b3c-4970-9509-efb7efbc1da7', CAST(N'2016-12-13 15:34:41.343' AS DateTime), N'<umbHomePage id="1056" key="b5ad3353-cdc0-4743-ba86-dea44a401b85" parentID="-1" level="1" creatorID="0" sortOrder="0" createDate="2016-12-13T15:34:40" updateDate="2016-12-13T15:34:41" nodeName="Home" urlName="home" path="-1,1056" isDoc="" nodeType="1052" creatorName="HarveyNash" writerName="HarveyNash" writerID="0" template="1047" nodeTypeAlias="umbHomePage"><umbracoNaviHide>0</umbracoNaviHide><title><![CDATA[Txt: A responsive starter kit for Umbraco]]></title><facebookLink><![CDATA[http://facebook.com/Umbraco]]></facebookLink><googleLink><![CDATA[https://google.com/+Umbraco]]></googleLink><rssLink><![CDATA[http://feeds.feedburner.com/umbracoblog]]></rssLink><twitterLink><![CDATA[http://twitter.com/UmbracoProject]]></twitterLink><bannerSubheader><![CDATA[It will lead to a call-to-action, just click the button...]]></bannerSubheader><hideBanner>0</hideBanner><bannerHeader><![CDATA[This is some text that needs to pop]]></bannerHeader><bannerBackgroundImage><![CDATA[/media/SampleImages/1008/banner.jpg]]></bannerBackgroundImage><bannerLinkText><![CDATA[You know you want to click me]]></bannerLinkText><bannerLink>1054</bannerLink><aboutTitle><![CDATA[What''s this about?]]></aboutTitle><aboutText><![CDATA[<p>This is <a href="http://html5up.net/txt/">TXT</a>, a free site template designed by <a href="http://n33.co">n33</a> for <a href="http://html5up.net/">HTML5 UP</a>. It''s built on the <a href="http://skeljs.org">skelJS</a> framework, uses well-thought out HTML5 and CSS3, and is fully responsive making it a great starting point for your own projects. And, like everything else we make, it''s also free to use for pretty much any personal or commercial work under the <a href="http://html5up.net/license/">Creative Commons Attribution</a> license, so go ahead and use it – just don''t forget to credit us!</p>]]></aboutText><byline><![CDATA[A responsive starter kit for Umbraco]]></byline><copyright><![CDATA[Umbraco]]></copyright><siteName><![CDATA[Umbraco Txt]]></siteName></umbHomePage>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1057, N'a637945b-e349-427c-9098-045dcb2c24c5', CAST(N'2016-12-19 13:54:04.527' AS DateTime), N'<umbTextPage id="1057" key="bb138c5a-e3cc-4aa1-a385-252332b5d333" parentID="1056" level="2" creatorID="0" sortOrder="0" createDate="2016-12-13T15:34:40" updateDate="2016-12-19T13:54:04" nodeName="Getting Started" urlName="getting-started" path="-1,1056,1057" isDoc="" nodeType="1055" creatorName="HarveyNash" writerName="HarveyNash" writerID="0" template="1050" nodeTypeAlias="umbTextPage"><umbracoNaviHide>1</umbracoNaviHide><featuredPage>1</featuredPage><bodyText><![CDATA[<p>You''ve installed Umbraco and the "Txt" Starter Kit.</p>
<p>Edit the text on the homepage and create a site structure by adding new texpages to your site. This is all done in the <strong>Content</strong> section.</p>
<p>If you find the editing options provided by the Txt site too limited for you needs, simply add more properties to the page by going to the <strong>Settings</strong> section, expanding the <strong>Document Types</strong> item and adding new properties on the <strong>Generic Properties</strong> tab. You can find more information about <a href="http://umbraco.org/help-and-support/video-tutorials/introduction-to-umbraco/sitebuilder-introduction/document-types" title="About Umbraco Document Types">document types and properties</a> at the <a href="http://umbraco.com" title="The Umbraco Website">Umbraco website</a>.</p>
<p>You''ll probably want to personalize your site by changing the current design. This is also done in the <strong>Settings</strong> section, by editing the CSS styles and HTML templates. Umbraco uses master templates, so the main, common markup is placed in the <strong>Starterkit Master</strong> template, while the Homeage and Textpage have separate templates for their unique layouts. You can find more information about <a href="http://umbraco.org/help-and-support/video-tutorials/introduction-to-umbraco/sitebuilder-introduction/templates" title="Umbraco Templates and Stylesheets">templates and css</a> in umbraco at the umbraco website.</p>
<p>Once you''re happy with your site''s design, you might want to add more functionality, such as maps, image galleries or forms. This is done by <a href="http://umbraco.org/help-and-support/video-tutorials/getting-started" title="Umbraco Modules">installing Umbraco modules</a>.</p>]]></bodyText><image><![CDATA[/media/SampleImages/1063/pic01.jpg]]></image></umbTextPage>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1057, N'e948a105-4b11-46a3-a110-4833877f7d14', CAST(N'2016-12-13 15:34:41.360' AS DateTime), N'<umbTextPage id="1057" key="bb138c5a-e3cc-4aa1-a385-252332b5d333" parentID="1056" level="2" creatorID="0" sortOrder="0" createDate="2016-12-13T15:34:40" updateDate="2016-12-13T15:34:41" nodeName="Getting Started" urlName="getting-started" path="-1,1056,1057" isDoc="" nodeType="1055" creatorName="HarveyNash" writerName="HarveyNash" writerID="0" template="1050" nodeTypeAlias="umbTextPage"><umbracoNaviHide>0</umbracoNaviHide><featuredPage>1</featuredPage><bodyText><![CDATA[<p>You''ve installed Umbraco and the "Txt" Starter Kit.</p>
<p>Edit the text on the homepage and create a site structure by adding new texpages to your site. This is all done in the <strong>Content</strong> section.</p>
<p>If you find the editing options provided by the Txt site too limited for you needs, simply add more properties to the page by going to the <strong>Settings</strong> section, expanding the <strong>Document Types</strong> item and adding new properties on the <strong>Generic Properties</strong> tab. You can find more information about <a href="http://umbraco.org/help-and-support/video-tutorials/introduction-to-umbraco/sitebuilder-introduction/document-types" title="About Umbraco Document Types">document types and properties</a> at the <a href="http://umbraco.com" title="The Umbraco Website">Umbraco website</a>.</p>
<p>You''ll probably want to personalize your site by changing the current design. This is also done in the <strong>Settings</strong> section, by editing the CSS styles and HTML templates. Umbraco uses master templates, so the main, common markup is placed in the <strong>Starterkit Master</strong> template, while the Homeage and Textpage have separate templates for their unique layouts. You can find more information about <a href="http://umbraco.org/help-and-support/video-tutorials/introduction-to-umbraco/sitebuilder-introduction/templates" title="Umbraco Templates and Stylesheets">templates and css</a> in umbraco at the umbraco website.</p>
<p>Once you''re happy with your site''s design, you might want to add more functionality, such as maps, image galleries or forms. This is done by <a href="http://umbraco.org/help-and-support/video-tutorials/getting-started" title="Umbraco Modules">installing Umbraco modules</a>.</p>]]></bodyText><image><![CDATA[/media/SampleImages/1063/pic01.jpg]]></image></umbTextPage>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1057, N'ba82e73f-745a-4329-ab5c-5cb5d97d77b4', CAST(N'2016-12-13 15:34:40.870' AS DateTime), N'<umbTextPage id="1057" key="bb138c5a-e3cc-4aa1-a385-252332b5d333" parentID="1056" level="2" creatorID="0" sortOrder="0" createDate="2016-12-13T15:34:40" updateDate="2016-12-13T15:34:40" nodeName="Getting Started" urlName="getting-started" path="-1,1056,1057" isDoc="" nodeType="1055" creatorName="HarveyNash" writerName="HarveyNash" writerID="0" template="1050" nodeTypeAlias="umbTextPage"><umbracoNaviHide>0</umbracoNaviHide><featuredPage>1</featuredPage><image><![CDATA[/media/SampleImages/1063/pic01.jpg]]></image><bodyText><![CDATA[<p>You''ve installed Umbraco and the "Txt" Starter Kit.</p>
<p>Edit the text on the homepage and create a site structure by adding new texpages to your site. This is all done in the <strong>Content</strong> section.</p>
<p>If you find the editing options provided by the Txt site too limited for you needs, simply add more properties to the page by going to the <strong>Settings</strong> section, expanding the <strong>Document Types</strong> item and adding new properties on the <strong>Generic Properties</strong> tab. You can find more information about <a href="http://umbraco.org/help-and-support/video-tutorials/introduction-to-umbraco/sitebuilder-introduction/document-types" title="About Umbraco Document Types">document types and properties</a> at the <a href="http://umbraco.com" title="The Umbraco Website">Umbraco website</a>.</p>
<p>You''ll probably want to personalize your site by changing the current design. This is also done in the <strong>Settings</strong> section, by editing the CSS styles and HTML templates. Umbraco uses master templates, so the main, common markup is placed in the <strong>Starterkit Master</strong> template, while the Homeage and Textpage have separate templates for their unique layouts. You can find more information about <a href="http://umbraco.org/help-and-support/video-tutorials/introduction-to-umbraco/sitebuilder-introduction/templates" title="Umbraco Templates and Stylesheets">templates and css</a> in umbraco at the umbraco website.</p>
<p>Once you''re happy with your site''s design, you might want to add more functionality, such as maps, image galleries or forms. This is done by <a href="http://umbraco.org/help-and-support/video-tutorials/getting-started" title="Umbraco Modules">installing Umbraco modules</a>.</p>]]></bodyText></umbTextPage>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1058, N'fdea77b0-1c61-4339-92e8-0d647ded2772', CAST(N'2016-12-13 15:34:41.370' AS DateTime), N'<umbTextPage id="1058" key="d6d0da43-34a7-493f-bb6d-b3691ea6cabe" parentID="1056" level="2" creatorID="0" sortOrder="1" createDate="2016-12-13T15:34:40" updateDate="2016-12-13T15:34:41" nodeName="Go Further" urlName="go-further" path="-1,1056,1058" isDoc="" nodeType="1055" creatorName="HarveyNash" writerName="HarveyNash" writerID="0" template="1050" nodeTypeAlias="umbTextPage"><umbracoNaviHide>0</umbracoNaviHide><featuredPage>1</featuredPage><bodyText><![CDATA[<p>The Txt Starter Kit only scratches the surface of what''s possible with Umbraco. Below the Txt Starter Kit and its modules lies a great architecture that lets you implement whatever you need.</p>
<p>With Umbraco you''ve finally got a solid, open and reliable platform for websites as basic as the Txt site, and Umbraco can be rapidly expanded to support multi-language websites, collaboration platforms and intra/extranets, to name just a few.</p>
<p>Advanced functionality is created with Umbraco macros, built with Umbraco''s award-winning .NET integration, including full support for any .NET User or Custom control and ASP.NET MVC. Create and integrate your own .NET macros in mere minutes with point and click simplicity. Simply copy your controls to the Umbraco website, go to the <strong>Developer</strong> section and create a new macro, selecting your control from the list.</p>
<p>You can also use <a href="http://umbraco.org/help-and-support/video-tutorials/getting-started/working-with-webmatrix" title="Working with Razor">Microsoft''s Razor</a> syntax to quickly add dynamic functionality to your site.</p>
<p>We''ve also gathered the best community macros into a repository that''s also accessed from the <strong>Developer</strong> section, in the <strong>Packages</strong> area. You can find more information <a href="http://umbraco.org/help-and-support/video-tutorials/introduction-to-umbraco/sitebuilder-introduction/what-are-macros" title="About creating Umbraco macros">about creating macros</a>, on the Umbraco website.</p>
<p>The sky is the limit with Umbraco, and you have the benefit a friendly community, training, and guaranteed support. Find out how to <a href="http://umbraco.org/help-and-support" title="Get Umbraco Support">get help</a>.</p>]]></bodyText><image><![CDATA[/media/SampleImages/1060/pic02.jpg]]></image></umbTextPage>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1058, N'314b0c49-304f-4e36-8539-4ece9ea4b291', CAST(N'2016-12-19 13:54:12.367' AS DateTime), N'<umbTextPage id="1058" key="d6d0da43-34a7-493f-bb6d-b3691ea6cabe" parentID="1056" level="2" creatorID="0" sortOrder="1" createDate="2016-12-13T15:34:40" updateDate="2016-12-19T13:54:12" nodeName="Go Further" urlName="go-further" path="-1,1056,1058" isDoc="" nodeType="1055" creatorName="HarveyNash" writerName="HarveyNash" writerID="0" template="1050" nodeTypeAlias="umbTextPage"><umbracoNaviHide>1</umbracoNaviHide><featuredPage>1</featuredPage><bodyText><![CDATA[<p>The Txt Starter Kit only scratches the surface of what''s possible with Umbraco. Below the Txt Starter Kit and its modules lies a great architecture that lets you implement whatever you need.</p>
<p>With Umbraco you''ve finally got a solid, open and reliable platform for websites as basic as the Txt site, and Umbraco can be rapidly expanded to support multi-language websites, collaboration platforms and intra/extranets, to name just a few.</p>
<p>Advanced functionality is created with Umbraco macros, built with Umbraco''s award-winning .NET integration, including full support for any .NET User or Custom control and ASP.NET MVC. Create and integrate your own .NET macros in mere minutes with point and click simplicity. Simply copy your controls to the Umbraco website, go to the <strong>Developer</strong> section and create a new macro, selecting your control from the list.</p>
<p>You can also use <a href="http://umbraco.org/help-and-support/video-tutorials/getting-started/working-with-webmatrix" title="Working with Razor">Microsoft''s Razor</a> syntax to quickly add dynamic functionality to your site.</p>
<p>We''ve also gathered the best community macros into a repository that''s also accessed from the <strong>Developer</strong> section, in the <strong>Packages</strong> area. You can find more information <a href="http://umbraco.org/help-and-support/video-tutorials/introduction-to-umbraco/sitebuilder-introduction/what-are-macros" title="About creating Umbraco macros">about creating macros</a>, on the Umbraco website.</p>
<p>The sky is the limit with Umbraco, and you have the benefit a friendly community, training, and guaranteed support. Find out how to <a href="http://umbraco.org/help-and-support" title="Get Umbraco Support">get help</a>.</p>]]></bodyText><image><![CDATA[/media/SampleImages/1060/pic02.jpg]]></image></umbTextPage>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1058, N'475cbbcb-aa48-4ea5-a1ab-d466313fabeb', CAST(N'2016-12-13 15:34:40.880' AS DateTime), N'<umbTextPage id="1058" key="d6d0da43-34a7-493f-bb6d-b3691ea6cabe" parentID="1056" level="2" creatorID="0" sortOrder="1" createDate="2016-12-13T15:34:40" updateDate="2016-12-13T15:34:40" nodeName="Go Further" urlName="go-further" path="-1,1056,1058" isDoc="" nodeType="1055" creatorName="HarveyNash" writerName="HarveyNash" writerID="0" template="1050" nodeTypeAlias="umbTextPage"><umbracoNaviHide>0</umbracoNaviHide><featuredPage>1</featuredPage><image><![CDATA[/media/SampleImages/1060/pic02.jpg]]></image><bodyText><![CDATA[<p>The Txt Starter Kit only scratches the surface of what''s possible with Umbraco. Below the Txt Starter Kit and its modules lies a great architecture that lets you implement whatever you need.</p>
<p>With Umbraco you''ve finally got a solid, open and reliable platform for websites as basic as the Txt site, and Umbraco can be rapidly expanded to support multi-language websites, collaboration platforms and intra/extranets, to name just a few.</p>
<p>Advanced functionality is created with Umbraco macros, built with Umbraco''s award-winning .NET integration, including full support for any .NET User or Custom control and ASP.NET MVC. Create and integrate your own .NET macros in mere minutes with point and click simplicity. Simply copy your controls to the Umbraco website, go to the <strong>Developer</strong> section and create a new macro, selecting your control from the list.</p>
<p>You can also use <a href="http://umbraco.org/help-and-support/video-tutorials/getting-started/working-with-webmatrix" title="Working with Razor">Microsoft''s Razor</a> syntax to quickly add dynamic functionality to your site.</p>
<p>We''ve also gathered the best community macros into a repository that''s also accessed from the <strong>Developer</strong> section, in the <strong>Packages</strong> area. You can find more information <a href="http://umbraco.org/help-and-support/video-tutorials/introduction-to-umbraco/sitebuilder-introduction/what-are-macros" title="About creating Umbraco macros">about creating macros</a>, on the Umbraco website.</p>
<p>The sky is the limit with Umbraco, and you have the benefit a friendly community, training, and guaranteed support. Find out how to <a href="http://umbraco.org/help-and-support" title="Get Umbraco Support">get help</a>.</p>]]></bodyText></umbTextPage>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1059, N'7427af80-4164-40cb-86eb-31b6a492f2de', CAST(N'2016-12-13 15:34:41.380' AS DateTime), N'<umbTextPage id="1059" key="f4605439-ee73-4abf-b026-941c51fc5403" parentID="1056" level="2" creatorID="0" sortOrder="2" createDate="2016-12-13T15:34:40" updateDate="2016-12-13T15:34:41" nodeName="Installing Modules" urlName="installing-modules" path="-1,1056,1059" isDoc="" nodeType="1055" creatorName="HarveyNash" writerName="HarveyNash" writerID="0" template="1050" nodeTypeAlias="umbTextPage"><umbracoNaviHide>0</umbracoNaviHide><featuredPage>1</featuredPage><bodyText><![CDATA[<p>Umbraco modules encapsulate specific bits of advanced functionality that are easily added to your website.</p>
<p>Once installed, Umbraco modules are open source and easy to customize if you want to modify the behavior for your specific needs.</p>
<p>Because Umbraco modules are provided under the MIT license you are free to use and modify them any way you want, with no strings attached.</p>
<p>To add Umbraco modules to your website, go to the <strong>Settings</strong> section, expand the <strong>Templates</strong> item, select the <strong>Starterkit Master</strong> template, then click the <strong>Customize Skin</strong> button on the toolbar.</p>
<p>Umbraco modules are available for various kinds of navigation, a sitemap, social media feeds, and a contact form. The list of available Umbraco modules is growing rapidly and is automatically updated from a central source, always fresh and current.</p>
<p><a href="http://umbraco.org/get-started" title="Get Started with Umbraco">Get more information</a> about the umbraco way.</p>]]></bodyText><image><![CDATA[/media/SampleImages/1061/pic04.jpg]]></image></umbTextPage>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1059, N'32821f4f-4e00-4726-811b-dd6f74bfe747', CAST(N'2016-12-19 13:54:21.990' AS DateTime), N'<umbTextPage id="1059" key="f4605439-ee73-4abf-b026-941c51fc5403" parentID="1056" level="2" creatorID="0" sortOrder="2" createDate="2016-12-13T15:34:40" updateDate="2016-12-19T13:54:21" nodeName="Installing Modules" urlName="installing-modules" path="-1,1056,1059" isDoc="" nodeType="1055" creatorName="HarveyNash" writerName="HarveyNash" writerID="0" template="1050" nodeTypeAlias="umbTextPage"><umbracoNaviHide>1</umbracoNaviHide><featuredPage>1</featuredPage><bodyText><![CDATA[<p>Umbraco modules encapsulate specific bits of advanced functionality that are easily added to your website.</p>
<p>Once installed, Umbraco modules are open source and easy to customize if you want to modify the behavior for your specific needs.</p>
<p>Because Umbraco modules are provided under the MIT license you are free to use and modify them any way you want, with no strings attached.</p>
<p>To add Umbraco modules to your website, go to the <strong>Settings</strong> section, expand the <strong>Templates</strong> item, select the <strong>Starterkit Master</strong> template, then click the <strong>Customize Skin</strong> button on the toolbar.</p>
<p>Umbraco modules are available for various kinds of navigation, a sitemap, social media feeds, and a contact form. The list of available Umbraco modules is growing rapidly and is automatically updated from a central source, always fresh and current.</p>
<p><a href="http://umbraco.org/get-started" title="Get Started with Umbraco">Get more information</a> about the umbraco way.</p>]]></bodyText><image><![CDATA[/media/SampleImages/1061/pic04.jpg]]></image></umbTextPage>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1059, N'f8aefa51-5b92-4991-ba2e-e0625ef93673', CAST(N'2016-12-13 15:34:40.917' AS DateTime), N'<umbTextPage id="1059" key="f4605439-ee73-4abf-b026-941c51fc5403" parentID="1056" level="2" creatorID="0" sortOrder="2" createDate="2016-12-13T15:34:40" updateDate="2016-12-13T15:34:40" nodeName="Installing Modules" urlName="installing-modules" path="-1,1056,1059" isDoc="" nodeType="1055" creatorName="HarveyNash" writerName="HarveyNash" writerID="0" template="1050" nodeTypeAlias="umbTextPage"><umbracoNaviHide>0</umbracoNaviHide><featuredPage>1</featuredPage><image><![CDATA[/media/SampleImages/1061/pic04.jpg]]></image><bodyText><![CDATA[<p>Umbraco modules encapsulate specific bits of advanced functionality that are easily added to your website.</p>
<p>Once installed, Umbraco modules are open source and easy to customize if you want to modify the behavior for your specific needs.</p>
<p>Because Umbraco modules are provided under the MIT license you are free to use and modify them any way you want, with no strings attached.</p>
<p>To add Umbraco modules to your website, go to the <strong>Settings</strong> section, expand the <strong>Templates</strong> item, select the <strong>Starterkit Master</strong> template, then click the <strong>Customize Skin</strong> button on the toolbar.</p>
<p>Umbraco modules are available for various kinds of navigation, a sitemap, social media feeds, and a contact form. The list of available Umbraco modules is growing rapidly and is automatically updated from a central source, always fresh and current.</p>
<p><a href="http://umbraco.org/get-started" title="Get Started with Umbraco">Get more information</a> about the umbraco way.</p>]]></bodyText></umbTextPage>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1060, N'433d811f-6515-45e5-a052-01d55e559fe9', CAST(N'2016-12-13 15:34:40.950' AS DateTime), N'<umbTextPage id="1060" key="0911d7e9-c381-4ed4-8845-e5c107af4db6" parentID="1056" level="2" creatorID="0" sortOrder="3" createDate="2016-12-13T15:34:40" updateDate="2016-12-13T15:34:40" nodeName="About" urlName="about" path="-1,1056,1060" isDoc="" nodeType="1055" creatorName="HarveyNash" writerName="HarveyNash" writerID="0" template="1050" nodeTypeAlias="umbTextPage"><umbracoNaviHide>0</umbracoNaviHide><featuredPage>1</featuredPage><image><![CDATA[/media/SampleImages/1001/pic03.jpg]]></image><bodyText><![CDATA[<p>The Txt Starter Kit gives you a small website that introduces you to a set of well-defined conventions for building an Umbraco website.</p>
<p>Now that you know what the Txt Starter Kit is, it is time to get started using Umbraco.</p>]]></bodyText></umbTextPage>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1060, N'cc910286-dfa8-422e-a3d0-436e54423ab4', CAST(N'2016-12-13 15:34:41.390' AS DateTime), N'<umbTextPage id="1060" key="0911d7e9-c381-4ed4-8845-e5c107af4db6" parentID="1056" level="2" creatorID="0" sortOrder="3" createDate="2016-12-13T15:34:40" updateDate="2016-12-13T15:34:41" nodeName="About" urlName="about" path="-1,1056,1060" isDoc="" nodeType="1055" creatorName="HarveyNash" writerName="HarveyNash" writerID="0" template="1050" nodeTypeAlias="umbTextPage"><umbracoNaviHide>0</umbracoNaviHide><featuredPage>1</featuredPage><bodyText><![CDATA[<p>The Txt Starter Kit gives you a small website that introduces you to a set of well-defined conventions for building an Umbraco website.</p>
<p>Now that you know what the Txt Starter Kit is, it is time to get started using Umbraco.</p>]]></bodyText><image><![CDATA[/media/SampleImages/1001/pic03.jpg]]></image></umbTextPage>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1060, N'99fad01a-ebaf-41f0-a819-91b7ea945b1f', CAST(N'2016-12-19 13:55:15.493' AS DateTime), N'<umbTextPage id="1060" key="0911d7e9-c381-4ed4-8845-e5c107af4db6" parentID="1056" level="2" creatorID="0" sortOrder="3" createDate="2016-12-13T15:34:40" updateDate="2016-12-19T13:55:15" nodeName="About" urlName="about" path="-1,1056,1060" isDoc="" nodeType="1055" creatorName="HarveyNash" writerName="HarveyNash" writerID="0" template="1050" nodeTypeAlias="umbTextPage"><umbracoNaviHide>1</umbracoNaviHide><featuredPage>1</featuredPage><bodyText><![CDATA[<p>The Txt Starter Kit gives you a small website that introduces you to a set of well-defined conventions for building an Umbraco website.</p>
<p>Now that you know what the Txt Starter Kit is, it is time to get started using Umbraco.</p>]]></bodyText><image><![CDATA[/media/SampleImages/1001/pic03.jpg]]></image></umbTextPage>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1061, N'e3aca069-c456-4a91-b36b-8b4bada2ec95', CAST(N'2016-12-13 15:34:40.987' AS DateTime), N'<umbNewsOverview id="1061" key="3b6561bf-3756-4d95-8838-c6cdea523180" parentID="1056" level="2" creatorID="0" sortOrder="4" createDate="2016-12-13T15:34:40" updateDate="2016-12-13T15:34:40" nodeName="News" urlName="news" path="-1,1056,1061" isDoc="" nodeType="1054" creatorName="HarveyNash" writerName="HarveyNash" writerID="0" template="1049" nodeTypeAlias="umbNewsOverview"><umbracoNaviHide>0</umbracoNaviHide><title><![CDATA[Adventure log]]></title></umbNewsOverview>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1061, N'2011443f-aa5d-4d9b-bc77-948f82025f15', CAST(N'2016-12-13 15:34:41.400' AS DateTime), N'<umbNewsOverview id="1061" key="3b6561bf-3756-4d95-8838-c6cdea523180" parentID="1056" level="2" creatorID="0" sortOrder="4" createDate="2016-12-13T15:34:40" updateDate="2016-12-13T15:34:41" nodeName="News" urlName="news" path="-1,1056,1061" isDoc="" nodeType="1054" creatorName="HarveyNash" writerName="HarveyNash" writerID="0" template="1049" nodeTypeAlias="umbNewsOverview"><umbracoNaviHide>0</umbracoNaviHide><title><![CDATA[Adventure log]]></title></umbNewsOverview>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1062, N'50bc10ba-174c-4538-8ff5-621cbf1728a0', CAST(N'2016-12-13 15:34:41.063' AS DateTime), N'<umbNewsItem id="1062" key="85c99fab-dd88-43eb-86a0-1ec1e51ebc8a" parentID="1061" level="3" creatorID="0" sortOrder="0" createDate="2016-12-13T15:34:40" updateDate="2016-12-13T15:34:40" nodeName="The 10 remarkable features of object" urlName="the-10-remarkable-features-of-object" path="-1,1056,1061,1062" isDoc="" nodeType="1053" creatorName="HarveyNash" writerName="HarveyNash" writerID="0" template="1048" nodeTypeAlias="umbNewsItem"><umbracoNaviHide>0</umbracoNaviHide><bodyText><![CDATA[<p>Ita prorsus, inquam; Hanc ergo intuens debet institutum illud quasi signum absolvere. Ergo adhuc, quantum equidem intellego, causa non videtur fuisse mutandi nominis. Quia dolori non voluptas contraria est, sed doloris privatio. Nos autem non solum beatae vitae istam esse oblectationem videmus, sed etiam levamentum miseriarum. Quodsi ipsam honestatem undique pertectam atque absolutam. Nos cum te, M. Quod vestri non item.</p>
<p>Cum id quoque, ut cupiebat, audivisset, evelli iussit eam, qua erat transfixus, hastam. Quarum ambarum rerum cum medicinam pollicetur, luxuriae licentiam pollicetur. Quid iudicant sensus? Quo tandem modo?</p>]]></bodyText></umbNewsItem>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1062, N'dd1c6e98-134f-4a40-9419-82f4222125bc', CAST(N'2016-12-19 13:54:50.240' AS DateTime), N'<umbNewsItem id="1062" key="85c99fab-dd88-43eb-86a0-1ec1e51ebc8a" parentID="1061" level="3" creatorID="0" sortOrder="0" createDate="2016-12-13T15:34:40" updateDate="2016-12-19T13:54:50" nodeName="The 10 remarkable features of object" urlName="the-10-remarkable-features-of-object" path="-1,1056,1061,1062" isDoc="" nodeType="1053" creatorName="HarveyNash" writerName="HarveyNash" writerID="0" template="1048" nodeTypeAlias="umbNewsItem"><umbracoNaviHide>0</umbracoNaviHide><bodyText><![CDATA[<p>Ita prorsus, inquam; Hanc ergo intuens debet institutum illud quasi signum absolvere. Ergo adhuc, quantum equidem intellego, causa non videtur fuisse mutandi nominis. Quia dolori non voluptas contraria est, sed doloris privatio. Nos autem non solum beatae vitae istam esse oblectationem videmus, sed etiam levamentum miseriarum. Quodsi ipsam honestatem undique pertectam atque absolutam. Nos cum te, M. Quod vestri non item.</p>
<p>Cum id quoque, ut cupiebat, audivisset, evelli iussit eam, qua erat transfixus, hastam. Quarum ambarum rerum cum medicinam pollicetur, luxuriae licentiam pollicetur. Quid iudicant sensus? Quo tandem modo?</p>]]></bodyText></umbNewsItem>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1062, N'63f193a4-14fe-49fa-a906-abd170a6d476', CAST(N'2016-12-13 15:34:41.413' AS DateTime), N'<umbNewsItem id="1062" key="85c99fab-dd88-43eb-86a0-1ec1e51ebc8a" parentID="1061" level="3" creatorID="0" sortOrder="0" createDate="2016-12-13T15:34:40" updateDate="2016-12-13T15:34:41" nodeName="The 10 remarkable features of object" urlName="the-10-remarkable-features-of-object" path="-1,1056,1061,1062" isDoc="" nodeType="1053" creatorName="HarveyNash" writerName="HarveyNash" writerID="0" template="1048" nodeTypeAlias="umbNewsItem"><umbracoNaviHide>0</umbracoNaviHide><bodyText><![CDATA[<p>Ita prorsus, inquam; Hanc ergo intuens debet institutum illud quasi signum absolvere. Ergo adhuc, quantum equidem intellego, causa non videtur fuisse mutandi nominis. Quia dolori non voluptas contraria est, sed doloris privatio. Nos autem non solum beatae vitae istam esse oblectationem videmus, sed etiam levamentum miseriarum. Quodsi ipsam honestatem undique pertectam atque absolutam. Nos cum te, M. Quod vestri non item.</p>
<p>Cum id quoque, ut cupiebat, audivisset, evelli iussit eam, qua erat transfixus, hastam. Quarum ambarum rerum cum medicinam pollicetur, luxuriae licentiam pollicetur. Quid iudicant sensus? Quo tandem modo?</p>]]></bodyText></umbNewsItem>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1062, N'91479a6e-9ce4-40c3-8b5b-c1c631fde454', CAST(N'2016-12-15 16:52:53.077' AS DateTime), N'<umbNewsItem id="1062" key="85c99fab-dd88-43eb-86a0-1ec1e51ebc8a" parentID="1061" level="3" creatorID="0" sortOrder="0" createDate="2016-12-13T15:34:40" updateDate="2016-12-15T16:52:43" nodeName="The 10 remarkable features of object" urlName="the-10-remarkable-features-of-object" path="-1,1056,1061,1062" isDoc="" nodeType="1053" creatorName="HarveyNash" writerName="HarveyNash" writerID="0" template="1048" nodeTypeAlias="umbNewsItem"><umbracoNaviHide>0</umbracoNaviHide><bodyText><![CDATA[<p>Ita prorsus, inquam; Hanc ergo intuens debet institutum illud quasi signum absolvere. Ergo adhuc, quantum equidem intellego, causa non videtur fuisse mutandi nominis. Quia dolori non voluptas contraria est, sed doloris privatio. Nos autem non solum beatae vitae istam esse oblectationem videmus, sed etiam levamentum miseriarum. Quodsi ipsam honestatem undique pertectam atque absolutam. Nos cum te, M. Quod vestri non item.</p>
<p>Cum id quoque, ut cupiebat, audivisset, evelli iussit eam, qua erat transfixus, hastam. Quarum ambarum rerum cum medicinam pollicetur, luxuriae licentiam pollicetur. Quid iudicant sensus? Quo tandem modo Hello from Mạnh Nguyễn?</p>]]></bodyText></umbNewsItem>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1063, N'e50c59bb-f8ed-4af3-99b8-3dae1835d432', CAST(N'2016-12-13 15:34:41.423' AS DateTime), N'<umbNewsItem id="1063" key="656160c9-481a-4c61-a03d-16a50918bdee" parentID="1061" level="3" creatorID="0" sortOrder="1" createDate="2016-12-13T15:34:41" updateDate="2016-12-13T15:34:41" nodeName="This is a wonderful news item" urlName="this-is-a-wonderful-news-item" path="-1,1056,1061,1063" isDoc="" nodeType="1053" creatorName="HarveyNash" writerName="HarveyNash" writerID="0" template="1048" nodeTypeAlias="umbNewsItem"><umbracoNaviHide>0</umbracoNaviHide><bodyText><![CDATA[<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Commoda autem et incommoda in eo genere sunt, quae praeposita et reiecta diximus; Bestiarum vero nullum iudicium puto. Est enim effectrix multarum et magnarum voluptatum. Duo Reges: constructio interrete. Claudii libidini, qui tum erat summo ne imperio, dederetur. Quarum ambarum rerum cum medicinam pollicetur, luxuriae licentiam pollicetur. Sed virtutem ipsam inchoavit, nihil amplius.</p>
<p>Ita redarguitur ipse a sese, convincunturque scripta eius probitate ipsius ac moribus. Istam voluptatem, inquit, Epicurus ignorat? Sed venio ad inconstantiae crimen, ne saepius dicas me aberrare; Sic, et quidem diligentius saepiusque ista loquemur inter nos agemusque communiter. Primum in nostrane potestate est, quid meminerimus? Consequens enim est et post oritur, ut dixi. Hoc mihi cum tuo fratre convenit. Immo videri fortasse. Itaque in rebus minime obscuris non multus est apud eos disserendi labor. Aliud igitur esse censet gaudere, aliud non dolere.</p>]]></bodyText></umbNewsItem>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1063, N'13bbcefa-9dc0-4342-94d1-86d68e2f1cb0', CAST(N'2016-12-13 15:34:41.080' AS DateTime), N'<umbNewsItem id="1063" key="656160c9-481a-4c61-a03d-16a50918bdee" parentID="1061" level="3" creatorID="0" sortOrder="1" createDate="2016-12-13T15:34:41" updateDate="2016-12-13T15:34:41" nodeName="This is a wonderful news item" urlName="this-is-a-wonderful-news-item" path="-1,1056,1061,1063" isDoc="" nodeType="1053" creatorName="HarveyNash" writerName="HarveyNash" writerID="0" template="1048" nodeTypeAlias="umbNewsItem"><umbracoNaviHide>0</umbracoNaviHide><bodyText><![CDATA[<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Commoda autem et incommoda in eo genere sunt, quae praeposita et reiecta diximus; Bestiarum vero nullum iudicium puto. Est enim effectrix multarum et magnarum voluptatum. Duo Reges: constructio interrete. Claudii libidini, qui tum erat summo ne imperio, dederetur. Quarum ambarum rerum cum medicinam pollicetur, luxuriae licentiam pollicetur. Sed virtutem ipsam inchoavit, nihil amplius.</p>
<p>Ita redarguitur ipse a sese, convincunturque scripta eius probitate ipsius ac moribus. Istam voluptatem, inquit, Epicurus ignorat? Sed venio ad inconstantiae crimen, ne saepius dicas me aberrare; Sic, et quidem diligentius saepiusque ista loquemur inter nos agemusque communiter. Primum in nostrane potestate est, quid meminerimus? Consequens enim est et post oritur, ut dixi. Hoc mihi cum tuo fratre convenit. Immo videri fortasse. Itaque in rebus minime obscuris non multus est apud eos disserendi labor. Aliud igitur esse censet gaudere, aliud non dolere.</p>]]></bodyText></umbNewsItem>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1064, N'b488a477-6131-4179-abd4-0014509eda9b', CAST(N'2016-12-13 15:34:41.437' AS DateTime), N'<umbNewsItem id="1064" key="7d3f85db-ce76-4dfd-b3f0-9789de3ff128" parentID="1061" level="3" creatorID="0" sortOrder="2" createDate="2016-12-13T15:34:41" updateDate="2016-12-13T15:34:41" nodeName="You really need to read this!" urlName="you-really-need-to-read-this" path="-1,1056,1061,1064" isDoc="" nodeType="1053" creatorName="HarveyNash" writerName="HarveyNash" writerID="0" template="1048" nodeTypeAlias="umbNewsItem"><umbracoNaviHide>0</umbracoNaviHide><bodyText><![CDATA[<p><span>Ut aliquid scire se gaudeant? Hanc ergo intuens debet institutum illud quasi signum absolvere. Vestri haec verecundius, illi fortasse constantius. Itaque sensibus rationem adiunxit et ratione effecta sensus non reliquit. Sed ea mala virtuti magnitudine obruebantur. Quasi ego id curem, quid ille aiat aut neget. Verum tamen cum de rebus grandioribus dicas, ipsae res verba rapiunt; Apparet statim, quae sint officia, quae actiones.</span></p>
<p><span><span>Virtutibus igitur rectissime mihi videris et ad consuetudinem nostrae orationis vitia posuisse contraria. Nonne videmus quanta perturbatio rerum omnium consequatur, quanta confusio? Sed eum qui audiebant, quoad poterant, defendebant sententiam suam. Ut necesse sit omnium rerum, quae natura vigeant, similem esse finem, non eundem.</span></span></p>]]></bodyText></umbNewsItem>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1064, N'2a397f04-229a-4099-b39f-c5bd74abc0d7', CAST(N'2016-12-13 15:34:41.093' AS DateTime), N'<umbNewsItem id="1064" key="7d3f85db-ce76-4dfd-b3f0-9789de3ff128" parentID="1061" level="3" creatorID="0" sortOrder="2" createDate="2016-12-13T15:34:41" updateDate="2016-12-13T15:34:41" nodeName="You really need to read this!" urlName="you-really-need-to-read-this" path="-1,1056,1061,1064" isDoc="" nodeType="1053" creatorName="HarveyNash" writerName="HarveyNash" writerID="0" template="1048" nodeTypeAlias="umbNewsItem"><umbracoNaviHide>0</umbracoNaviHide><bodyText><![CDATA[<p><span>Ut aliquid scire se gaudeant? Hanc ergo intuens debet institutum illud quasi signum absolvere. Vestri haec verecundius, illi fortasse constantius. Itaque sensibus rationem adiunxit et ratione effecta sensus non reliquit. Sed ea mala virtuti magnitudine obruebantur. Quasi ego id curem, quid ille aiat aut neget. Verum tamen cum de rebus grandioribus dicas, ipsae res verba rapiunt; Apparet statim, quae sint officia, quae actiones.</span></p>
<p><span><span>Virtutibus igitur rectissime mihi videris et ad consuetudinem nostrae orationis vitia posuisse contraria. Nonne videmus quanta perturbatio rerum omnium consequatur, quanta confusio? Sed eum qui audiebant, quoad poterant, defendebant sententiam suam. Ut necesse sit omnium rerum, quae natura vigeant, similem esse finem, non eundem.</span></span></p>]]></bodyText></umbNewsItem>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1065, N'c9f8eac5-c7e0-40ef-92bb-7be66e937049', CAST(N'2016-12-13 15:34:41.123' AS DateTime), N'<umbNewsItem id="1065" key="28bbdd81-0a37-4935-a34c-8eca44654580" parentID="1061" level="3" creatorID="0" sortOrder="3" createDate="2016-12-13T15:34:41" updateDate="2016-12-13T15:34:41" nodeName="Txt Starter Kit For Umbraco Released" urlName="txt-starter-kit-for-umbraco-released" path="-1,1056,1061,1065" isDoc="" nodeType="1053" creatorName="HarveyNash" writerName="HarveyNash" writerID="0" template="1048" nodeTypeAlias="umbNewsItem"><umbracoNaviHide>0</umbracoNaviHide><publishDate>2021-09-20T00:00:00</publishDate><image><![CDATA[/media/SampleImages/1077/pic05.jpg]]></image><subheader><![CDATA[In all it''s MVC Views goodness]]></subheader><bodyText><![CDATA[<p><span>Sed ad haec, nisi molestum est, habeo quae velim. Neque enim disputari sine reprehensione nec cum iracundia aut pertinacia recte disputari potest. Nec vero alia sunt quaerenda contra Carneadeam illam sententiam. Deinde disputat, quod cuiusque generis animantium statui deceat extremum. Facit igitur Lucius noster prudenter, qui audire de summo bono potissimum velit; Quis non odit sordidos, vanos, leves, futtiles?</span></p>
<p><span><span>Negat enim summo bono afferre incrementum diem. Haec mihi videtur delicatior, ut ita dicam, molliorque ratio, quam virtutis vis gravitasque postulat. Haec quo modo conveniant, non sane intellego. Quis enim confidit semper sibi illud stabile et firmum permansurum, quod fragile et caducum sit? Multoque hoc melius nos veriusque quam Stoici. Igitur neque stultorum quisquam beatus neque sapientium non beatus. De hominibus dici non necesse est. Non enim iam stirpis bonum quaeret, sed animalis. Nobis Heracleotes ille Dionysius flagitiose descivisse videtur a Stoicis propter oculorum dolorem. At, illa, ut vobis placet, partem quandam tuetur, reliquam deserit.</span></span></p>]]></bodyText></umbNewsItem>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1065, N'bc64aa91-600e-4c3a-bb12-a2d70a58ea46', CAST(N'2016-12-13 15:34:41.447' AS DateTime), N'<umbNewsItem id="1065" key="28bbdd81-0a37-4935-a34c-8eca44654580" parentID="1061" level="3" creatorID="0" sortOrder="3" createDate="2016-12-13T15:34:41" updateDate="2016-12-13T15:34:41" nodeName="Txt Starter Kit For Umbraco Released" urlName="txt-starter-kit-for-umbraco-released" path="-1,1056,1061,1065" isDoc="" nodeType="1053" creatorName="HarveyNash" writerName="HarveyNash" writerID="0" template="1048" nodeTypeAlias="umbNewsItem"><umbracoNaviHide>0</umbracoNaviHide><publishDate>2021-09-20T00:00:00</publishDate><subheader><![CDATA[In all it''s MVC Views goodness]]></subheader><image><![CDATA[/media/SampleImages/1077/pic05.jpg]]></image><bodyText><![CDATA[<p><span>Sed ad haec, nisi molestum est, habeo quae velim. Neque enim disputari sine reprehensione nec cum iracundia aut pertinacia recte disputari potest. Nec vero alia sunt quaerenda contra Carneadeam illam sententiam. Deinde disputat, quod cuiusque generis animantium statui deceat extremum. Facit igitur Lucius noster prudenter, qui audire de summo bono potissimum velit; Quis non odit sordidos, vanos, leves, futtiles?</span></p>
<p><span><span>Negat enim summo bono afferre incrementum diem. Haec mihi videtur delicatior, ut ita dicam, molliorque ratio, quam virtutis vis gravitasque postulat. Haec quo modo conveniant, non sane intellego. Quis enim confidit semper sibi illud stabile et firmum permansurum, quod fragile et caducum sit? Multoque hoc melius nos veriusque quam Stoici. Igitur neque stultorum quisquam beatus neque sapientium non beatus. De hominibus dici non necesse est. Non enim iam stirpis bonum quaeret, sed animalis. Nobis Heracleotes ille Dionysius flagitiose descivisse videtur a Stoicis propter oculorum dolorem. At, illa, ut vobis placet, partem quandam tuetur, reliquam deserit.</span></span></p>]]></bodyText></umbNewsItem>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1086, N'3645753c-b53d-41d6-85a4-1f599ac25ec3', CAST(N'2016-12-19 17:13:28.007' AS DateTime), N'<category id="1086" key="4d95bde3-d7a0-4d9a-b99b-eab8241e7605" parentID="1056" level="2" creatorID="0" sortOrder="5" createDate="2016-12-19T17:13:27" updateDate="2016-12-19T17:13:27" nodeName="Category" urlName="category" path="-1,1056,1086" isDoc="" nodeType="1085" creatorName="HarveyNash" writerName="HarveyNash" writerID="0" template="1084" nodeTypeAlias="category" />')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1089, N'dcaafaed-35de-4ad9-b014-46e0eb10df22', CAST(N'2016-12-19 17:19:53.773' AS DateTime), N'<product id="1089" key="2dd89232-9545-40f1-b2a8-c089dd41f966" parentID="1056" level="2" creatorID="0" sortOrder="6" createDate="2016-12-19T17:19:53" updateDate="2016-12-19T17:19:53" nodeName="Product" urlName="product" path="-1,1056,1089" isDoc="" nodeType="1088" creatorName="HarveyNash" writerName="HarveyNash" writerID="0" template="1087" nodeTypeAlias="product" />')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1092, N'fc4e4b09-695b-41dc-a120-27dae91d11f4', CAST(N'2016-12-19 17:36:51.853' AS DateTime), N'<dealerLocator id="1092" key="6b4110ce-6e66-4faf-af5f-f6de31ac65df" parentID="1056" level="2" creatorID="0" sortOrder="7" createDate="2016-12-19T17:36:51" updateDate="2016-12-19T17:36:51" nodeName="Dealer Locator" urlName="dealer-locator" path="-1,1056,1092" isDoc="" nodeType="1091" creatorName="HarveyNash" writerName="HarveyNash" writerID="0" template="1090" nodeTypeAlias="dealerLocator" />')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1095, N'6deeba6e-a76a-4d15-b203-74c5f8f59b01', CAST(N'2016-12-21 16:58:29.067' AS DateTime), N'<contactPage id="1095" key="556f9b10-4c03-4bf0-ba9f-74a45280a961" parentID="1056" level="2" creatorID="0" sortOrder="8" createDate="2016-12-21T16:58:28" updateDate="2016-12-21T16:58:28" nodeName="Contact" urlName="contact" path="-1,1056,1095" isDoc="" nodeType="1094" creatorName="HarveyNash" writerName="HarveyNash" writerID="0" template="1093" nodeTypeAlias="contactPage" />')
SET IDENTITY_INSERT [dbo].[cmsPropertyData] ON 

INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1, 1056, N'3eee7e1d-fe91-4236-8d48-3e099a7a5823', 35, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (2, 1056, N'3eee7e1d-fe91-4236-8d48-3e099a7a5823', 36, NULL, NULL, NULL, N'Txt: A responsive starter kit for Umbraco', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (3, 1056, N'3eee7e1d-fe91-4236-8d48-3e099a7a5823', 37, NULL, NULL, NULL, N'http://facebook.com/Umbraco', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (4, 1056, N'3eee7e1d-fe91-4236-8d48-3e099a7a5823', 38, NULL, NULL, NULL, N'http://twitter.com/UmbracoProject', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (5, 1056, N'3eee7e1d-fe91-4236-8d48-3e099a7a5823', 39, NULL, NULL, NULL, N'http://feeds.feedburner.com/umbracoblog', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (6, 1056, N'3eee7e1d-fe91-4236-8d48-3e099a7a5823', 40, NULL, NULL, NULL, N'', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (7, 1056, N'3eee7e1d-fe91-4236-8d48-3e099a7a5823', 41, NULL, NULL, NULL, N'', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (8, 1056, N'3eee7e1d-fe91-4236-8d48-3e099a7a5823', 42, NULL, NULL, NULL, N'https://google.com/+Umbraco', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (9, 1056, N'3eee7e1d-fe91-4236-8d48-3e099a7a5823', 43, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (10, 1056, N'3eee7e1d-fe91-4236-8d48-3e099a7a5823', 44, NULL, NULL, NULL, N'This is some text that needs to pop', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (11, 1056, N'3eee7e1d-fe91-4236-8d48-3e099a7a5823', 45, NULL, NULL, NULL, N'It will lead to a call-to-action, just click the button...', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (12, 1056, N'3eee7e1d-fe91-4236-8d48-3e099a7a5823', 46, NULL, NULL, NULL, N'You know you want to click me', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (13, 1056, N'3eee7e1d-fe91-4236-8d48-3e099a7a5823', 47, 1054, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (14, 1056, N'3eee7e1d-fe91-4236-8d48-3e099a7a5823', 48, NULL, NULL, NULL, N'/media/SampleImages/1008/banner.jpg', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (15, 1056, N'3eee7e1d-fe91-4236-8d48-3e099a7a5823', 49, NULL, NULL, NULL, N'What''s this about?', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (16, 1056, N'3eee7e1d-fe91-4236-8d48-3e099a7a5823', 50, NULL, NULL, NULL, NULL, N'<p>This is <a href="http://html5up.net/txt/">TXT</a>, a free site template designed by <a href="http://n33.co">n33</a> for <a href="http://html5up.net/">HTML5 UP</a>. It''s built on the <a href="http://skeljs.org">skelJS</a> framework, uses well-thought out HTML5 and CSS3, and is fully responsive making it a great starting point for your own projects. And, like everything else we make, it''s also free to use for pretty much any personal or commercial work under the <a href="http://html5up.net/license/">Creative Commons Attribution</a> license, so go ahead and use it – just don''t forget to credit us!</p>')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (17, 1056, N'3eee7e1d-fe91-4236-8d48-3e099a7a5823', 51, NULL, NULL, NULL, N'Umbraco Txt', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (18, 1056, N'3eee7e1d-fe91-4236-8d48-3e099a7a5823', 52, NULL, NULL, NULL, N'A responsive starter kit for Umbraco', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (19, 1056, N'3eee7e1d-fe91-4236-8d48-3e099a7a5823', 53, NULL, NULL, NULL, N'Umbraco', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (20, 1057, N'ba82e73f-745a-4329-ab5c-5cb5d97d77b4', 35, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (21, 1057, N'ba82e73f-745a-4329-ab5c-5cb5d97d77b4', 36, NULL, NULL, NULL, N'', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (22, 1057, N'ba82e73f-745a-4329-ab5c-5cb5d97d77b4', 58, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (23, 1057, N'ba82e73f-745a-4329-ab5c-5cb5d97d77b4', 59, NULL, NULL, NULL, N'/media/SampleImages/1063/pic01.jpg', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (24, 1057, N'ba82e73f-745a-4329-ab5c-5cb5d97d77b4', 60, NULL, NULL, NULL, NULL, N'<p>You''ve installed Umbraco and the "Txt" Starter Kit.</p>
<p>Edit the text on the homepage and create a site structure by adding new texpages to your site. This is all done in the <strong>Content</strong> section.</p>
<p>If you find the editing options provided by the Txt site too limited for you needs, simply add more properties to the page by going to the <strong>Settings</strong> section, expanding the <strong>Document Types</strong> item and adding new properties on the <strong>Generic Properties</strong> tab. You can find more information about <a href="http://umbraco.org/help-and-support/video-tutorials/introduction-to-umbraco/sitebuilder-introduction/document-types" title="About Umbraco Document Types">document types and properties</a> at the <a href="http://umbraco.com" title="The Umbraco Website">Umbraco website</a>.</p>
<p>You''ll probably want to personalize your site by changing the current design. This is also done in the <strong>Settings</strong> section, by editing the CSS styles and HTML templates. Umbraco uses master templates, so the main, common markup is placed in the <strong>Starterkit Master</strong> template, while the Homeage and Textpage have separate templates for their unique layouts. You can find more information about <a href="http://umbraco.org/help-and-support/video-tutorials/introduction-to-umbraco/sitebuilder-introduction/templates" title="Umbraco Templates and Stylesheets">templates and css</a> in umbraco at the umbraco website.</p>
<p>Once you''re happy with your site''s design, you might want to add more functionality, such as maps, image galleries or forms. This is done by <a href="http://umbraco.org/help-and-support/video-tutorials/getting-started" title="Umbraco Modules">installing Umbraco modules</a>.</p>')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (25, 1058, N'475cbbcb-aa48-4ea5-a1ab-d466313fabeb', 35, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (26, 1058, N'475cbbcb-aa48-4ea5-a1ab-d466313fabeb', 36, NULL, NULL, NULL, N'', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (27, 1058, N'475cbbcb-aa48-4ea5-a1ab-d466313fabeb', 58, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (28, 1058, N'475cbbcb-aa48-4ea5-a1ab-d466313fabeb', 59, NULL, NULL, NULL, N'/media/SampleImages/1060/pic02.jpg', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (29, 1058, N'475cbbcb-aa48-4ea5-a1ab-d466313fabeb', 60, NULL, NULL, NULL, NULL, N'<p>The Txt Starter Kit only scratches the surface of what''s possible with Umbraco. Below the Txt Starter Kit and its modules lies a great architecture that lets you implement whatever you need.</p>
<p>With Umbraco you''ve finally got a solid, open and reliable platform for websites as basic as the Txt site, and Umbraco can be rapidly expanded to support multi-language websites, collaboration platforms and intra/extranets, to name just a few.</p>
<p>Advanced functionality is created with Umbraco macros, built with Umbraco''s award-winning .NET integration, including full support for any .NET User or Custom control and ASP.NET MVC. Create and integrate your own .NET macros in mere minutes with point and click simplicity. Simply copy your controls to the Umbraco website, go to the <strong>Developer</strong> section and create a new macro, selecting your control from the list.</p>
<p>You can also use <a href="http://umbraco.org/help-and-support/video-tutorials/getting-started/working-with-webmatrix" title="Working with Razor">Microsoft''s Razor</a> syntax to quickly add dynamic functionality to your site.</p>
<p>We''ve also gathered the best community macros into a repository that''s also accessed from the <strong>Developer</strong> section, in the <strong>Packages</strong> area. You can find more information <a href="http://umbraco.org/help-and-support/video-tutorials/introduction-to-umbraco/sitebuilder-introduction/what-are-macros" title="About creating Umbraco macros">about creating macros</a>, on the Umbraco website.</p>
<p>The sky is the limit with Umbraco, and you have the benefit a friendly community, training, and guaranteed support. Find out how to <a href="http://umbraco.org/help-and-support" title="Get Umbraco Support">get help</a>.</p>')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (30, 1059, N'f8aefa51-5b92-4991-ba2e-e0625ef93673', 35, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (31, 1059, N'f8aefa51-5b92-4991-ba2e-e0625ef93673', 36, NULL, NULL, NULL, N'', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (32, 1059, N'f8aefa51-5b92-4991-ba2e-e0625ef93673', 58, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (33, 1059, N'f8aefa51-5b92-4991-ba2e-e0625ef93673', 59, NULL, NULL, NULL, N'/media/SampleImages/1061/pic04.jpg', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (34, 1059, N'f8aefa51-5b92-4991-ba2e-e0625ef93673', 60, NULL, NULL, NULL, NULL, N'<p>Umbraco modules encapsulate specific bits of advanced functionality that are easily added to your website.</p>
<p>Once installed, Umbraco modules are open source and easy to customize if you want to modify the behavior for your specific needs.</p>
<p>Because Umbraco modules are provided under the MIT license you are free to use and modify them any way you want, with no strings attached.</p>
<p>To add Umbraco modules to your website, go to the <strong>Settings</strong> section, expand the <strong>Templates</strong> item, select the <strong>Starterkit Master</strong> template, then click the <strong>Customize Skin</strong> button on the toolbar.</p>
<p>Umbraco modules are available for various kinds of navigation, a sitemap, social media feeds, and a contact form. The list of available Umbraco modules is growing rapidly and is automatically updated from a central source, always fresh and current.</p>
<p><a href="http://umbraco.org/get-started" title="Get Started with Umbraco">Get more information</a> about the umbraco way.</p>')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (35, 1060, N'433d811f-6515-45e5-a052-01d55e559fe9', 35, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (36, 1060, N'433d811f-6515-45e5-a052-01d55e559fe9', 36, NULL, NULL, NULL, N'', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (37, 1060, N'433d811f-6515-45e5-a052-01d55e559fe9', 58, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (38, 1060, N'433d811f-6515-45e5-a052-01d55e559fe9', 59, NULL, NULL, NULL, N'/media/SampleImages/1001/pic03.jpg', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (39, 1060, N'433d811f-6515-45e5-a052-01d55e559fe9', 60, NULL, NULL, NULL, NULL, N'<p>The Txt Starter Kit gives you a small website that introduces you to a set of well-defined conventions for building an Umbraco website.</p>
<p>Now that you know what the Txt Starter Kit is, it is time to get started using Umbraco.</p>')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (40, 1061, N'e3aca069-c456-4a91-b36b-8b4bada2ec95', 35, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (41, 1061, N'e3aca069-c456-4a91-b36b-8b4bada2ec95', 36, NULL, NULL, NULL, N'Adventure log', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (42, 1062, N'50bc10ba-174c-4538-8ff5-621cbf1728a0', 35, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (43, 1062, N'50bc10ba-174c-4538-8ff5-621cbf1728a0', 36, NULL, NULL, NULL, N'', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (44, 1062, N'50bc10ba-174c-4538-8ff5-621cbf1728a0', 54, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (45, 1062, N'50bc10ba-174c-4538-8ff5-621cbf1728a0', 55, NULL, NULL, NULL, N'', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (46, 1062, N'50bc10ba-174c-4538-8ff5-621cbf1728a0', 56, NULL, NULL, NULL, N'', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (47, 1062, N'50bc10ba-174c-4538-8ff5-621cbf1728a0', 57, NULL, NULL, NULL, NULL, N'<p>Ita prorsus, inquam; Hanc ergo intuens debet institutum illud quasi signum absolvere. Ergo adhuc, quantum equidem intellego, causa non videtur fuisse mutandi nominis. Quia dolori non voluptas contraria est, sed doloris privatio. Nos autem non solum beatae vitae istam esse oblectationem videmus, sed etiam levamentum miseriarum. Quodsi ipsam honestatem undique pertectam atque absolutam. Nos cum te, M. Quod vestri non item.</p>
<p>Cum id quoque, ut cupiebat, audivisset, evelli iussit eam, qua erat transfixus, hastam. Quarum ambarum rerum cum medicinam pollicetur, luxuriae licentiam pollicetur. Quid iudicant sensus? Quo tandem modo?</p>')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (48, 1063, N'13bbcefa-9dc0-4342-94d1-86d68e2f1cb0', 35, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (49, 1063, N'13bbcefa-9dc0-4342-94d1-86d68e2f1cb0', 36, NULL, NULL, NULL, N'', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (50, 1063, N'13bbcefa-9dc0-4342-94d1-86d68e2f1cb0', 54, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (51, 1063, N'13bbcefa-9dc0-4342-94d1-86d68e2f1cb0', 55, NULL, NULL, NULL, N'', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (52, 1063, N'13bbcefa-9dc0-4342-94d1-86d68e2f1cb0', 56, NULL, NULL, NULL, N'', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (53, 1063, N'13bbcefa-9dc0-4342-94d1-86d68e2f1cb0', 57, NULL, NULL, NULL, NULL, N'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Commoda autem et incommoda in eo genere sunt, quae praeposita et reiecta diximus; Bestiarum vero nullum iudicium puto. Est enim effectrix multarum et magnarum voluptatum. Duo Reges: constructio interrete. Claudii libidini, qui tum erat summo ne imperio, dederetur. Quarum ambarum rerum cum medicinam pollicetur, luxuriae licentiam pollicetur. Sed virtutem ipsam inchoavit, nihil amplius.</p>
<p>Ita redarguitur ipse a sese, convincunturque scripta eius probitate ipsius ac moribus. Istam voluptatem, inquit, Epicurus ignorat? Sed venio ad inconstantiae crimen, ne saepius dicas me aberrare; Sic, et quidem diligentius saepiusque ista loquemur inter nos agemusque communiter. Primum in nostrane potestate est, quid meminerimus? Consequens enim est et post oritur, ut dixi. Hoc mihi cum tuo fratre convenit. Immo videri fortasse. Itaque in rebus minime obscuris non multus est apud eos disserendi labor. Aliud igitur esse censet gaudere, aliud non dolere.</p>')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (54, 1064, N'2a397f04-229a-4099-b39f-c5bd74abc0d7', 35, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (55, 1064, N'2a397f04-229a-4099-b39f-c5bd74abc0d7', 36, NULL, NULL, NULL, N'', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (56, 1064, N'2a397f04-229a-4099-b39f-c5bd74abc0d7', 54, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (57, 1064, N'2a397f04-229a-4099-b39f-c5bd74abc0d7', 55, NULL, NULL, NULL, N'', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (58, 1064, N'2a397f04-229a-4099-b39f-c5bd74abc0d7', 56, NULL, NULL, NULL, N'', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (59, 1064, N'2a397f04-229a-4099-b39f-c5bd74abc0d7', 57, NULL, NULL, NULL, NULL, N'<p><span>Ut aliquid scire se gaudeant? Hanc ergo intuens debet institutum illud quasi signum absolvere. Vestri haec verecundius, illi fortasse constantius. Itaque sensibus rationem adiunxit et ratione effecta sensus non reliquit. Sed ea mala virtuti magnitudine obruebantur. Quasi ego id curem, quid ille aiat aut neget. Verum tamen cum de rebus grandioribus dicas, ipsae res verba rapiunt; Apparet statim, quae sint officia, quae actiones.</span></p>
<p><span><span>Virtutibus igitur rectissime mihi videris et ad consuetudinem nostrae orationis vitia posuisse contraria. Nonne videmus quanta perturbatio rerum omnium consequatur, quanta confusio? Sed eum qui audiebant, quoad poterant, defendebant sententiam suam. Ut necesse sit omnium rerum, quae natura vigeant, similem esse finem, non eundem.</span></span></p>')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (60, 1065, N'c9f8eac5-c7e0-40ef-92bb-7be66e937049', 35, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (61, 1065, N'c9f8eac5-c7e0-40ef-92bb-7be66e937049', 36, NULL, NULL, NULL, N'', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (62, 1065, N'c9f8eac5-c7e0-40ef-92bb-7be66e937049', 54, NULL, NULL, CAST(N'2021-09-20 00:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (63, 1065, N'c9f8eac5-c7e0-40ef-92bb-7be66e937049', 55, NULL, NULL, NULL, N'/media/SampleImages/1077/pic05.jpg', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (64, 1065, N'c9f8eac5-c7e0-40ef-92bb-7be66e937049', 56, NULL, NULL, NULL, N'In all it''s MVC Views goodness', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (65, 1065, N'c9f8eac5-c7e0-40ef-92bb-7be66e937049', 57, NULL, NULL, NULL, NULL, N'<p><span>Sed ad haec, nisi molestum est, habeo quae velim. Neque enim disputari sine reprehensione nec cum iracundia aut pertinacia recte disputari potest. Nec vero alia sunt quaerenda contra Carneadeam illam sententiam. Deinde disputat, quod cuiusque generis animantium statui deceat extremum. Facit igitur Lucius noster prudenter, qui audire de summo bono potissimum velit; Quis non odit sordidos, vanos, leves, futtiles?</span></p>
<p><span><span>Negat enim summo bono afferre incrementum diem. Haec mihi videtur delicatior, ut ita dicam, molliorque ratio, quam virtutis vis gravitasque postulat. Haec quo modo conveniant, non sane intellego. Quis enim confidit semper sibi illud stabile et firmum permansurum, quod fragile et caducum sit? Multoque hoc melius nos veriusque quam Stoici. Igitur neque stultorum quisquam beatus neque sapientium non beatus. De hominibus dici non necesse est. Non enim iam stirpis bonum quaeret, sed animalis. Nobis Heracleotes ille Dionysius flagitiose descivisse videtur a Stoicis propter oculorum dolorem. At, illa, ut vobis placet, partem quandam tuetur, reliquam deserit.</span></span></p>')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (66, 1056, N'884c887e-7b3c-4970-9509-efb7efbc1da7', 35, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (67, 1056, N'884c887e-7b3c-4970-9509-efb7efbc1da7', 36, NULL, NULL, NULL, N'Txt: A responsive starter kit for Umbraco', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (68, 1056, N'884c887e-7b3c-4970-9509-efb7efbc1da7', 37, NULL, NULL, NULL, N'http://facebook.com/Umbraco', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (69, 1056, N'884c887e-7b3c-4970-9509-efb7efbc1da7', 42, NULL, NULL, NULL, N'https://google.com/+Umbraco', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (70, 1056, N'884c887e-7b3c-4970-9509-efb7efbc1da7', 39, NULL, NULL, NULL, N'http://feeds.feedburner.com/umbracoblog', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (71, 1056, N'884c887e-7b3c-4970-9509-efb7efbc1da7', 40, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (72, 1056, N'884c887e-7b3c-4970-9509-efb7efbc1da7', 38, NULL, NULL, NULL, N'http://twitter.com/UmbracoProject', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (73, 1056, N'884c887e-7b3c-4970-9509-efb7efbc1da7', 41, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (74, 1056, N'884c887e-7b3c-4970-9509-efb7efbc1da7', 45, NULL, NULL, NULL, N'It will lead to a call-to-action, just click the button...', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (75, 1056, N'884c887e-7b3c-4970-9509-efb7efbc1da7', 43, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (76, 1056, N'884c887e-7b3c-4970-9509-efb7efbc1da7', 44, NULL, NULL, NULL, N'This is some text that needs to pop', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (77, 1056, N'884c887e-7b3c-4970-9509-efb7efbc1da7', 48, NULL, NULL, NULL, N'/media/SampleImages/1008/banner.jpg', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (78, 1056, N'884c887e-7b3c-4970-9509-efb7efbc1da7', 46, NULL, NULL, NULL, N'You know you want to click me', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (79, 1056, N'884c887e-7b3c-4970-9509-efb7efbc1da7', 47, 1054, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (80, 1056, N'884c887e-7b3c-4970-9509-efb7efbc1da7', 49, NULL, NULL, NULL, N'What''s this about?', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (81, 1056, N'884c887e-7b3c-4970-9509-efb7efbc1da7', 50, NULL, NULL, NULL, NULL, N'<p>This is <a href="http://html5up.net/txt/">TXT</a>, a free site template designed by <a href="http://n33.co">n33</a> for <a href="http://html5up.net/">HTML5 UP</a>. It''s built on the <a href="http://skeljs.org">skelJS</a> framework, uses well-thought out HTML5 and CSS3, and is fully responsive making it a great starting point for your own projects. And, like everything else we make, it''s also free to use for pretty much any personal or commercial work under the <a href="http://html5up.net/license/">Creative Commons Attribution</a> license, so go ahead and use it – just don''t forget to credit us!</p>')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (82, 1056, N'884c887e-7b3c-4970-9509-efb7efbc1da7', 52, NULL, NULL, NULL, N'A responsive starter kit for Umbraco', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (83, 1056, N'884c887e-7b3c-4970-9509-efb7efbc1da7', 53, NULL, NULL, NULL, N'Umbraco', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (84, 1056, N'884c887e-7b3c-4970-9509-efb7efbc1da7', 51, NULL, NULL, NULL, N'Umbraco Txt', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (85, 1057, N'e948a105-4b11-46a3-a110-4833877f7d14', 35, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (86, 1057, N'e948a105-4b11-46a3-a110-4833877f7d14', 36, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (87, 1057, N'e948a105-4b11-46a3-a110-4833877f7d14', 58, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (88, 1057, N'e948a105-4b11-46a3-a110-4833877f7d14', 60, NULL, NULL, NULL, NULL, N'<p>You''ve installed Umbraco and the "Txt" Starter Kit.</p>
<p>Edit the text on the homepage and create a site structure by adding new texpages to your site. This is all done in the <strong>Content</strong> section.</p>
<p>If you find the editing options provided by the Txt site too limited for you needs, simply add more properties to the page by going to the <strong>Settings</strong> section, expanding the <strong>Document Types</strong> item and adding new properties on the <strong>Generic Properties</strong> tab. You can find more information about <a href="http://umbraco.org/help-and-support/video-tutorials/introduction-to-umbraco/sitebuilder-introduction/document-types" title="About Umbraco Document Types">document types and properties</a> at the <a href="http://umbraco.com" title="The Umbraco Website">Umbraco website</a>.</p>
<p>You''ll probably want to personalize your site by changing the current design. This is also done in the <strong>Settings</strong> section, by editing the CSS styles and HTML templates. Umbraco uses master templates, so the main, common markup is placed in the <strong>Starterkit Master</strong> template, while the Homeage and Textpage have separate templates for their unique layouts. You can find more information about <a href="http://umbraco.org/help-and-support/video-tutorials/introduction-to-umbraco/sitebuilder-introduction/templates" title="Umbraco Templates and Stylesheets">templates and css</a> in umbraco at the umbraco website.</p>
<p>Once you''re happy with your site''s design, you might want to add more functionality, such as maps, image galleries or forms. This is done by <a href="http://umbraco.org/help-and-support/video-tutorials/getting-started" title="Umbraco Modules">installing Umbraco modules</a>.</p>')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (89, 1057, N'e948a105-4b11-46a3-a110-4833877f7d14', 59, NULL, NULL, NULL, N'/media/SampleImages/1063/pic01.jpg', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (90, 1058, N'fdea77b0-1c61-4339-92e8-0d647ded2772', 35, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (91, 1058, N'fdea77b0-1c61-4339-92e8-0d647ded2772', 36, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (92, 1058, N'fdea77b0-1c61-4339-92e8-0d647ded2772', 58, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (93, 1058, N'fdea77b0-1c61-4339-92e8-0d647ded2772', 60, NULL, NULL, NULL, NULL, N'<p>The Txt Starter Kit only scratches the surface of what''s possible with Umbraco. Below the Txt Starter Kit and its modules lies a great architecture that lets you implement whatever you need.</p>
<p>With Umbraco you''ve finally got a solid, open and reliable platform for websites as basic as the Txt site, and Umbraco can be rapidly expanded to support multi-language websites, collaboration platforms and intra/extranets, to name just a few.</p>
<p>Advanced functionality is created with Umbraco macros, built with Umbraco''s award-winning .NET integration, including full support for any .NET User or Custom control and ASP.NET MVC. Create and integrate your own .NET macros in mere minutes with point and click simplicity. Simply copy your controls to the Umbraco website, go to the <strong>Developer</strong> section and create a new macro, selecting your control from the list.</p>
<p>You can also use <a href="http://umbraco.org/help-and-support/video-tutorials/getting-started/working-with-webmatrix" title="Working with Razor">Microsoft''s Razor</a> syntax to quickly add dynamic functionality to your site.</p>
<p>We''ve also gathered the best community macros into a repository that''s also accessed from the <strong>Developer</strong> section, in the <strong>Packages</strong> area. You can find more information <a href="http://umbraco.org/help-and-support/video-tutorials/introduction-to-umbraco/sitebuilder-introduction/what-are-macros" title="About creating Umbraco macros">about creating macros</a>, on the Umbraco website.</p>
<p>The sky is the limit with Umbraco, and you have the benefit a friendly community, training, and guaranteed support. Find out how to <a href="http://umbraco.org/help-and-support" title="Get Umbraco Support">get help</a>.</p>')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (94, 1058, N'fdea77b0-1c61-4339-92e8-0d647ded2772', 59, NULL, NULL, NULL, N'/media/SampleImages/1060/pic02.jpg', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (95, 1059, N'7427af80-4164-40cb-86eb-31b6a492f2de', 35, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (96, 1059, N'7427af80-4164-40cb-86eb-31b6a492f2de', 36, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (97, 1059, N'7427af80-4164-40cb-86eb-31b6a492f2de', 58, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (98, 1059, N'7427af80-4164-40cb-86eb-31b6a492f2de', 60, NULL, NULL, NULL, NULL, N'<p>Umbraco modules encapsulate specific bits of advanced functionality that are easily added to your website.</p>
<p>Once installed, Umbraco modules are open source and easy to customize if you want to modify the behavior for your specific needs.</p>
<p>Because Umbraco modules are provided under the MIT license you are free to use and modify them any way you want, with no strings attached.</p>
<p>To add Umbraco modules to your website, go to the <strong>Settings</strong> section, expand the <strong>Templates</strong> item, select the <strong>Starterkit Master</strong> template, then click the <strong>Customize Skin</strong> button on the toolbar.</p>
<p>Umbraco modules are available for various kinds of navigation, a sitemap, social media feeds, and a contact form. The list of available Umbraco modules is growing rapidly and is automatically updated from a central source, always fresh and current.</p>
<p><a href="http://umbraco.org/get-started" title="Get Started with Umbraco">Get more information</a> about the umbraco way.</p>')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (99, 1059, N'7427af80-4164-40cb-86eb-31b6a492f2de', 59, NULL, NULL, NULL, N'/media/SampleImages/1061/pic04.jpg', NULL)
GO
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (100, 1060, N'cc910286-dfa8-422e-a3d0-436e54423ab4', 35, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (101, 1060, N'cc910286-dfa8-422e-a3d0-436e54423ab4', 36, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (102, 1060, N'cc910286-dfa8-422e-a3d0-436e54423ab4', 58, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (103, 1060, N'cc910286-dfa8-422e-a3d0-436e54423ab4', 60, NULL, NULL, NULL, NULL, N'<p>The Txt Starter Kit gives you a small website that introduces you to a set of well-defined conventions for building an Umbraco website.</p>
<p>Now that you know what the Txt Starter Kit is, it is time to get started using Umbraco.</p>')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (104, 1060, N'cc910286-dfa8-422e-a3d0-436e54423ab4', 59, NULL, NULL, NULL, N'/media/SampleImages/1001/pic03.jpg', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (105, 1061, N'2011443f-aa5d-4d9b-bc77-948f82025f15', 35, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (106, 1061, N'2011443f-aa5d-4d9b-bc77-948f82025f15', 36, NULL, NULL, NULL, N'Adventure log', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (107, 1062, N'63f193a4-14fe-49fa-a906-abd170a6d476', 35, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (108, 1062, N'63f193a4-14fe-49fa-a906-abd170a6d476', 36, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (109, 1062, N'63f193a4-14fe-49fa-a906-abd170a6d476', 54, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (110, 1062, N'63f193a4-14fe-49fa-a906-abd170a6d476', 56, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (111, 1062, N'63f193a4-14fe-49fa-a906-abd170a6d476', 55, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (112, 1062, N'63f193a4-14fe-49fa-a906-abd170a6d476', 57, NULL, NULL, NULL, NULL, N'<p>Ita prorsus, inquam; Hanc ergo intuens debet institutum illud quasi signum absolvere. Ergo adhuc, quantum equidem intellego, causa non videtur fuisse mutandi nominis. Quia dolori non voluptas contraria est, sed doloris privatio. Nos autem non solum beatae vitae istam esse oblectationem videmus, sed etiam levamentum miseriarum. Quodsi ipsam honestatem undique pertectam atque absolutam. Nos cum te, M. Quod vestri non item.</p>
<p>Cum id quoque, ut cupiebat, audivisset, evelli iussit eam, qua erat transfixus, hastam. Quarum ambarum rerum cum medicinam pollicetur, luxuriae licentiam pollicetur. Quid iudicant sensus? Quo tandem modo?</p>')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (113, 1063, N'e50c59bb-f8ed-4af3-99b8-3dae1835d432', 35, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (114, 1063, N'e50c59bb-f8ed-4af3-99b8-3dae1835d432', 36, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (115, 1063, N'e50c59bb-f8ed-4af3-99b8-3dae1835d432', 54, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (116, 1063, N'e50c59bb-f8ed-4af3-99b8-3dae1835d432', 56, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (117, 1063, N'e50c59bb-f8ed-4af3-99b8-3dae1835d432', 55, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (118, 1063, N'e50c59bb-f8ed-4af3-99b8-3dae1835d432', 57, NULL, NULL, NULL, NULL, N'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Commoda autem et incommoda in eo genere sunt, quae praeposita et reiecta diximus; Bestiarum vero nullum iudicium puto. Est enim effectrix multarum et magnarum voluptatum. Duo Reges: constructio interrete. Claudii libidini, qui tum erat summo ne imperio, dederetur. Quarum ambarum rerum cum medicinam pollicetur, luxuriae licentiam pollicetur. Sed virtutem ipsam inchoavit, nihil amplius.</p>
<p>Ita redarguitur ipse a sese, convincunturque scripta eius probitate ipsius ac moribus. Istam voluptatem, inquit, Epicurus ignorat? Sed venio ad inconstantiae crimen, ne saepius dicas me aberrare; Sic, et quidem diligentius saepiusque ista loquemur inter nos agemusque communiter. Primum in nostrane potestate est, quid meminerimus? Consequens enim est et post oritur, ut dixi. Hoc mihi cum tuo fratre convenit. Immo videri fortasse. Itaque in rebus minime obscuris non multus est apud eos disserendi labor. Aliud igitur esse censet gaudere, aliud non dolere.</p>')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (119, 1064, N'b488a477-6131-4179-abd4-0014509eda9b', 35, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (120, 1064, N'b488a477-6131-4179-abd4-0014509eda9b', 36, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (121, 1064, N'b488a477-6131-4179-abd4-0014509eda9b', 54, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (122, 1064, N'b488a477-6131-4179-abd4-0014509eda9b', 56, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (123, 1064, N'b488a477-6131-4179-abd4-0014509eda9b', 55, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (124, 1064, N'b488a477-6131-4179-abd4-0014509eda9b', 57, NULL, NULL, NULL, NULL, N'<p><span>Ut aliquid scire se gaudeant? Hanc ergo intuens debet institutum illud quasi signum absolvere. Vestri haec verecundius, illi fortasse constantius. Itaque sensibus rationem adiunxit et ratione effecta sensus non reliquit. Sed ea mala virtuti magnitudine obruebantur. Quasi ego id curem, quid ille aiat aut neget. Verum tamen cum de rebus grandioribus dicas, ipsae res verba rapiunt; Apparet statim, quae sint officia, quae actiones.</span></p>
<p><span><span>Virtutibus igitur rectissime mihi videris et ad consuetudinem nostrae orationis vitia posuisse contraria. Nonne videmus quanta perturbatio rerum omnium consequatur, quanta confusio? Sed eum qui audiebant, quoad poterant, defendebant sententiam suam. Ut necesse sit omnium rerum, quae natura vigeant, similem esse finem, non eundem.</span></span></p>')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (125, 1065, N'bc64aa91-600e-4c3a-bb12-a2d70a58ea46', 35, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (126, 1065, N'bc64aa91-600e-4c3a-bb12-a2d70a58ea46', 36, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (127, 1065, N'bc64aa91-600e-4c3a-bb12-a2d70a58ea46', 54, NULL, NULL, CAST(N'2021-09-20 00:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (128, 1065, N'bc64aa91-600e-4c3a-bb12-a2d70a58ea46', 56, NULL, NULL, NULL, N'In all it''s MVC Views goodness', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (129, 1065, N'bc64aa91-600e-4c3a-bb12-a2d70a58ea46', 55, NULL, NULL, NULL, N'/media/SampleImages/1077/pic05.jpg', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (130, 1065, N'bc64aa91-600e-4c3a-bb12-a2d70a58ea46', 57, NULL, NULL, NULL, NULL, N'<p><span>Sed ad haec, nisi molestum est, habeo quae velim. Neque enim disputari sine reprehensione nec cum iracundia aut pertinacia recte disputari potest. Nec vero alia sunt quaerenda contra Carneadeam illam sententiam. Deinde disputat, quod cuiusque generis animantium statui deceat extremum. Facit igitur Lucius noster prudenter, qui audire de summo bono potissimum velit; Quis non odit sordidos, vanos, leves, futtiles?</span></p>
<p><span><span>Negat enim summo bono afferre incrementum diem. Haec mihi videtur delicatior, ut ita dicam, molliorque ratio, quam virtutis vis gravitasque postulat. Haec quo modo conveniant, non sane intellego. Quis enim confidit semper sibi illud stabile et firmum permansurum, quod fragile et caducum sit? Multoque hoc melius nos veriusque quam Stoici. Igitur neque stultorum quisquam beatus neque sapientium non beatus. De hominibus dici non necesse est. Non enim iam stirpis bonum quaeret, sed animalis. Nobis Heracleotes ille Dionysius flagitiose descivisse videtur a Stoicis propter oculorum dolorem. At, illa, ut vobis placet, partem quandam tuetur, reliquam deserit.</span></span></p>')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (140, 1062, N'91479a6e-9ce4-40c3-8b5b-c1c631fde454', 35, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (141, 1062, N'91479a6e-9ce4-40c3-8b5b-c1c631fde454', 36, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (142, 1062, N'91479a6e-9ce4-40c3-8b5b-c1c631fde454', 54, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (143, 1062, N'91479a6e-9ce4-40c3-8b5b-c1c631fde454', 56, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (144, 1062, N'91479a6e-9ce4-40c3-8b5b-c1c631fde454', 55, NULL, NULL, NULL, N'', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (145, 1062, N'91479a6e-9ce4-40c3-8b5b-c1c631fde454', 57, NULL, NULL, NULL, NULL, N'<p>Ita prorsus, inquam; Hanc ergo intuens debet institutum illud quasi signum absolvere. Ergo adhuc, quantum equidem intellego, causa non videtur fuisse mutandi nominis. Quia dolori non voluptas contraria est, sed doloris privatio. Nos autem non solum beatae vitae istam esse oblectationem videmus, sed etiam levamentum miseriarum. Quodsi ipsam honestatem undique pertectam atque absolutam. Nos cum te, M. Quod vestri non item.</p>
<p>Cum id quoque, ut cupiebat, audivisset, evelli iussit eam, qua erat transfixus, hastam. Quarum ambarum rerum cum medicinam pollicetur, luxuriae licentiam pollicetur. Quid iudicant sensus? Quo tandem modo Hello from Mạnh Nguyễn?</p>')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (146, 1062, N'dd1c6e98-134f-4a40-9419-82f4222125bc', 35, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (147, 1062, N'dd1c6e98-134f-4a40-9419-82f4222125bc', 36, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (148, 1062, N'dd1c6e98-134f-4a40-9419-82f4222125bc', 54, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (149, 1062, N'dd1c6e98-134f-4a40-9419-82f4222125bc', 56, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (150, 1062, N'dd1c6e98-134f-4a40-9419-82f4222125bc', 55, NULL, NULL, NULL, N'', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (151, 1062, N'dd1c6e98-134f-4a40-9419-82f4222125bc', 57, NULL, NULL, NULL, NULL, N'<p>Ita prorsus, inquam; Hanc ergo intuens debet institutum illud quasi signum absolvere. Ergo adhuc, quantum equidem intellego, causa non videtur fuisse mutandi nominis. Quia dolori non voluptas contraria est, sed doloris privatio. Nos autem non solum beatae vitae istam esse oblectationem videmus, sed etiam levamentum miseriarum. Quodsi ipsam honestatem undique pertectam atque absolutam. Nos cum te, M. Quod vestri non item.</p>
<p>Cum id quoque, ut cupiebat, audivisset, evelli iussit eam, qua erat transfixus, hastam. Quarum ambarum rerum cum medicinam pollicetur, luxuriae licentiam pollicetur. Quid iudicant sensus? Quo tandem modo?</p>')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (152, 1057, N'a637945b-e349-427c-9098-045dcb2c24c5', 35, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (153, 1057, N'a637945b-e349-427c-9098-045dcb2c24c5', 36, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (154, 1057, N'a637945b-e349-427c-9098-045dcb2c24c5', 58, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (155, 1057, N'a637945b-e349-427c-9098-045dcb2c24c5', 60, NULL, NULL, NULL, NULL, N'<p>You''ve installed Umbraco and the "Txt" Starter Kit.</p>
<p>Edit the text on the homepage and create a site structure by adding new texpages to your site. This is all done in the <strong>Content</strong> section.</p>
<p>If you find the editing options provided by the Txt site too limited for you needs, simply add more properties to the page by going to the <strong>Settings</strong> section, expanding the <strong>Document Types</strong> item and adding new properties on the <strong>Generic Properties</strong> tab. You can find more information about <a href="http://umbraco.org/help-and-support/video-tutorials/introduction-to-umbraco/sitebuilder-introduction/document-types" title="About Umbraco Document Types">document types and properties</a> at the <a href="http://umbraco.com" title="The Umbraco Website">Umbraco website</a>.</p>
<p>You''ll probably want to personalize your site by changing the current design. This is also done in the <strong>Settings</strong> section, by editing the CSS styles and HTML templates. Umbraco uses master templates, so the main, common markup is placed in the <strong>Starterkit Master</strong> template, while the Homeage and Textpage have separate templates for their unique layouts. You can find more information about <a href="http://umbraco.org/help-and-support/video-tutorials/introduction-to-umbraco/sitebuilder-introduction/templates" title="Umbraco Templates and Stylesheets">templates and css</a> in umbraco at the umbraco website.</p>
<p>Once you''re happy with your site''s design, you might want to add more functionality, such as maps, image galleries or forms. This is done by <a href="http://umbraco.org/help-and-support/video-tutorials/getting-started" title="Umbraco Modules">installing Umbraco modules</a>.</p>')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (156, 1057, N'a637945b-e349-427c-9098-045dcb2c24c5', 59, NULL, NULL, NULL, N'/media/SampleImages/1063/pic01.jpg', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (157, 1058, N'314b0c49-304f-4e36-8539-4ece9ea4b291', 35, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (158, 1058, N'314b0c49-304f-4e36-8539-4ece9ea4b291', 36, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (159, 1058, N'314b0c49-304f-4e36-8539-4ece9ea4b291', 58, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (160, 1058, N'314b0c49-304f-4e36-8539-4ece9ea4b291', 60, NULL, NULL, NULL, NULL, N'<p>The Txt Starter Kit only scratches the surface of what''s possible with Umbraco. Below the Txt Starter Kit and its modules lies a great architecture that lets you implement whatever you need.</p>
<p>With Umbraco you''ve finally got a solid, open and reliable platform for websites as basic as the Txt site, and Umbraco can be rapidly expanded to support multi-language websites, collaboration platforms and intra/extranets, to name just a few.</p>
<p>Advanced functionality is created with Umbraco macros, built with Umbraco''s award-winning .NET integration, including full support for any .NET User or Custom control and ASP.NET MVC. Create and integrate your own .NET macros in mere minutes with point and click simplicity. Simply copy your controls to the Umbraco website, go to the <strong>Developer</strong> section and create a new macro, selecting your control from the list.</p>
<p>You can also use <a href="http://umbraco.org/help-and-support/video-tutorials/getting-started/working-with-webmatrix" title="Working with Razor">Microsoft''s Razor</a> syntax to quickly add dynamic functionality to your site.</p>
<p>We''ve also gathered the best community macros into a repository that''s also accessed from the <strong>Developer</strong> section, in the <strong>Packages</strong> area. You can find more information <a href="http://umbraco.org/help-and-support/video-tutorials/introduction-to-umbraco/sitebuilder-introduction/what-are-macros" title="About creating Umbraco macros">about creating macros</a>, on the Umbraco website.</p>
<p>The sky is the limit with Umbraco, and you have the benefit a friendly community, training, and guaranteed support. Find out how to <a href="http://umbraco.org/help-and-support" title="Get Umbraco Support">get help</a>.</p>')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (161, 1058, N'314b0c49-304f-4e36-8539-4ece9ea4b291', 59, NULL, NULL, NULL, N'/media/SampleImages/1060/pic02.jpg', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (162, 1059, N'32821f4f-4e00-4726-811b-dd6f74bfe747', 35, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (163, 1059, N'32821f4f-4e00-4726-811b-dd6f74bfe747', 36, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (164, 1059, N'32821f4f-4e00-4726-811b-dd6f74bfe747', 58, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (165, 1059, N'32821f4f-4e00-4726-811b-dd6f74bfe747', 60, NULL, NULL, NULL, NULL, N'<p>Umbraco modules encapsulate specific bits of advanced functionality that are easily added to your website.</p>
<p>Once installed, Umbraco modules are open source and easy to customize if you want to modify the behavior for your specific needs.</p>
<p>Because Umbraco modules are provided under the MIT license you are free to use and modify them any way you want, with no strings attached.</p>
<p>To add Umbraco modules to your website, go to the <strong>Settings</strong> section, expand the <strong>Templates</strong> item, select the <strong>Starterkit Master</strong> template, then click the <strong>Customize Skin</strong> button on the toolbar.</p>
<p>Umbraco modules are available for various kinds of navigation, a sitemap, social media feeds, and a contact form. The list of available Umbraco modules is growing rapidly and is automatically updated from a central source, always fresh and current.</p>
<p><a href="http://umbraco.org/get-started" title="Get Started with Umbraco">Get more information</a> about the umbraco way.</p>')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (166, 1059, N'32821f4f-4e00-4726-811b-dd6f74bfe747', 59, NULL, NULL, NULL, N'/media/SampleImages/1061/pic04.jpg', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (167, 1060, N'99fad01a-ebaf-41f0-a819-91b7ea945b1f', 35, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (168, 1060, N'99fad01a-ebaf-41f0-a819-91b7ea945b1f', 36, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (169, 1060, N'99fad01a-ebaf-41f0-a819-91b7ea945b1f', 58, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (170, 1060, N'99fad01a-ebaf-41f0-a819-91b7ea945b1f', 60, NULL, NULL, NULL, NULL, N'<p>The Txt Starter Kit gives you a small website that introduces you to a set of well-defined conventions for building an Umbraco website.</p>
<p>Now that you know what the Txt Starter Kit is, it is time to get started using Umbraco.</p>')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (171, 1060, N'99fad01a-ebaf-41f0-a819-91b7ea945b1f', 59, NULL, NULL, NULL, N'/media/SampleImages/1001/pic03.jpg', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (206, 1057, N'15f8770f-8a65-43ae-a738-996c8f5ce96a', 35, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (207, 1057, N'15f8770f-8a65-43ae-a738-996c8f5ce96a', 36, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (208, 1057, N'15f8770f-8a65-43ae-a738-996c8f5ce96a', 58, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (209, 1057, N'15f8770f-8a65-43ae-a738-996c8f5ce96a', 60, NULL, NULL, NULL, NULL, N'<p>You''ve installed Umbraco and the "Txt" Starter Kit.</p>
<p>Edit the text on the homepage and create a site structure by adding new texpages to your site. This is all done in the <strong>Content</strong> section.</p>
<p>If you find the editing options provided by the Txt site too limited for you needs, simply add more properties to the page by going to the <strong>Settings</strong> section, expanding the <strong>Document Types</strong> item and adding new properties on the <strong>Generic Properties</strong> tab. You can find more information about <a href="http://umbraco.org/help-and-support/video-tutorials/introduction-to-umbraco/sitebuilder-introduction/document-types" title="About Umbraco Document Types">document types and properties</a> at the <a href="http://umbraco.com" title="The Umbraco Website">Umbraco website</a>.</p>
<p>You''ll probably want to personalize your site by changing the current design. This is also done in the <strong>Settings</strong> section, by editing the CSS styles and HTML templates. Umbraco uses master templates, so the main, common markup is placed in the <strong>Starterkit Master</strong> template, while the Homeage and Textpage have separate templates for their unique layouts. You can find more information about <a href="http://umbraco.org/help-and-support/video-tutorials/introduction-to-umbraco/sitebuilder-introduction/templates" title="Umbraco Templates and Stylesheets">templates and css</a> in umbraco at the umbraco website.</p>
<p>Once you''re happy with your site''s design, you might want to add more functionality, such as maps, image galleries or forms. This is done by <a href="http://umbraco.org/help-and-support/video-tutorials/getting-started" title="Umbraco Modules">installing Umbraco modules</a>.</p>')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (210, 1057, N'15f8770f-8a65-43ae-a738-996c8f5ce96a', 59, NULL, NULL, NULL, N'/media/SampleImages/1063/pic01.jpg', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (211, 1057, N'2869eca0-4bd9-4a6b-84b0-c2ee516443af', 35, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (212, 1057, N'2869eca0-4bd9-4a6b-84b0-c2ee516443af', 36, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (213, 1057, N'2869eca0-4bd9-4a6b-84b0-c2ee516443af', 58, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (214, 1057, N'2869eca0-4bd9-4a6b-84b0-c2ee516443af', 60, NULL, NULL, NULL, NULL, N'<p>You''ve installed Umbraco and the "Txt" Starter Kit.</p>
<p>Edit the text on the homepage and create a site structure by adding new texpages to your site. This is all done in the <strong>Content</strong> section.</p>
<p>If you find the editing options provided by the Txt site too limited for you needs, simply add more properties to the page by going to the <strong>Settings</strong> section, expanding the <strong>Document Types</strong> item and adding new properties on the <strong>Generic Properties</strong> tab. You can find more information about <a href="http://umbraco.org/help-and-support/video-tutorials/introduction-to-umbraco/sitebuilder-introduction/document-types" title="About Umbraco Document Types">document types and properties</a> at the <a href="http://umbraco.com" title="The Umbraco Website">Umbraco website</a>.</p>
<p>You''ll probably want to personalize your site by changing the current design. This is also done in the <strong>Settings</strong> section, by editing the CSS styles and HTML templates. Umbraco uses master templates, so the main, common markup is placed in the <strong>Starterkit Master</strong> template, while the Homeage and Textpage have separate templates for their unique layouts. You can find more information about <a href="http://umbraco.org/help-and-support/video-tutorials/introduction-to-umbraco/sitebuilder-introduction/templates" title="Umbraco Templates and Stylesheets">templates and css</a> in umbraco at the umbraco website.</p>
<p>Once you''re happy with your site''s design, you might want to add more functionality, such as maps, image galleries or forms. This is done by <a href="http://umbraco.org/help-and-support/video-tutorials/getting-started" title="Umbraco Modules">installing Umbraco modules</a>.</p>')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (215, 1057, N'2869eca0-4bd9-4a6b-84b0-c2ee516443af', 59, NULL, NULL, NULL, N'/media/SampleImages/1063/pic01.jpg', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (216, 1058, N'81540c1b-48d5-4a14-91a2-68a8d095c20a', 35, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (217, 1058, N'81540c1b-48d5-4a14-91a2-68a8d095c20a', 36, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (218, 1058, N'81540c1b-48d5-4a14-91a2-68a8d095c20a', 58, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (219, 1058, N'81540c1b-48d5-4a14-91a2-68a8d095c20a', 60, NULL, NULL, NULL, NULL, N'<p>The Txt Starter Kit only scratches the surface of what''s possible with Umbraco. Below the Txt Starter Kit and its modules lies a great architecture that lets you implement whatever you need.</p>
<p>With Umbraco you''ve finally got a solid, open and reliable platform for websites as basic as the Txt site, and Umbraco can be rapidly expanded to support multi-language websites, collaboration platforms and intra/extranets, to name just a few.</p>
<p>Advanced functionality is created with Umbraco macros, built with Umbraco''s award-winning .NET integration, including full support for any .NET User or Custom control and ASP.NET MVC. Create and integrate your own .NET macros in mere minutes with point and click simplicity. Simply copy your controls to the Umbraco website, go to the <strong>Developer</strong> section and create a new macro, selecting your control from the list.</p>
<p>You can also use <a href="http://umbraco.org/help-and-support/video-tutorials/getting-started/working-with-webmatrix" title="Working with Razor">Microsoft''s Razor</a> syntax to quickly add dynamic functionality to your site.</p>
<p>We''ve also gathered the best community macros into a repository that''s also accessed from the <strong>Developer</strong> section, in the <strong>Packages</strong> area. You can find more information <a href="http://umbraco.org/help-and-support/video-tutorials/introduction-to-umbraco/sitebuilder-introduction/what-are-macros" title="About creating Umbraco macros">about creating macros</a>, on the Umbraco website.</p>
<p>The sky is the limit with Umbraco, and you have the benefit a friendly community, training, and guaranteed support. Find out how to <a href="http://umbraco.org/help-and-support" title="Get Umbraco Support">get help</a>.</p>')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (220, 1058, N'81540c1b-48d5-4a14-91a2-68a8d095c20a', 59, NULL, NULL, NULL, N'/media/SampleImages/1060/pic02.jpg', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (221, 1058, N'076820e8-f26f-431d-8713-83d0333447d5', 35, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (222, 1058, N'076820e8-f26f-431d-8713-83d0333447d5', 36, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (223, 1058, N'076820e8-f26f-431d-8713-83d0333447d5', 58, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (224, 1058, N'076820e8-f26f-431d-8713-83d0333447d5', 60, NULL, NULL, NULL, NULL, N'<p>The Txt Starter Kit only scratches the surface of what''s possible with Umbraco. Below the Txt Starter Kit and its modules lies a great architecture that lets you implement whatever you need.</p>
<p>With Umbraco you''ve finally got a solid, open and reliable platform for websites as basic as the Txt site, and Umbraco can be rapidly expanded to support multi-language websites, collaboration platforms and intra/extranets, to name just a few.</p>
<p>Advanced functionality is created with Umbraco macros, built with Umbraco''s award-winning .NET integration, including full support for any .NET User or Custom control and ASP.NET MVC. Create and integrate your own .NET macros in mere minutes with point and click simplicity. Simply copy your controls to the Umbraco website, go to the <strong>Developer</strong> section and create a new macro, selecting your control from the list.</p>
<p>You can also use <a href="http://umbraco.org/help-and-support/video-tutorials/getting-started/working-with-webmatrix" title="Working with Razor">Microsoft''s Razor</a> syntax to quickly add dynamic functionality to your site.</p>
<p>We''ve also gathered the best community macros into a repository that''s also accessed from the <strong>Developer</strong> section, in the <strong>Packages</strong> area. You can find more information <a href="http://umbraco.org/help-and-support/video-tutorials/introduction-to-umbraco/sitebuilder-introduction/what-are-macros" title="About creating Umbraco macros">about creating macros</a>, on the Umbraco website.</p>
<p>The sky is the limit with Umbraco, and you have the benefit a friendly community, training, and guaranteed support. Find out how to <a href="http://umbraco.org/help-and-support" title="Get Umbraco Support">get help</a>.</p>')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (225, 1058, N'076820e8-f26f-431d-8713-83d0333447d5', 59, NULL, NULL, NULL, N'/media/SampleImages/1060/pic02.jpg', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (226, 1059, N'537a2d33-9591-429d-8320-d20eff25c9a9', 35, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (227, 1059, N'537a2d33-9591-429d-8320-d20eff25c9a9', 36, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (228, 1059, N'537a2d33-9591-429d-8320-d20eff25c9a9', 58, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (229, 1059, N'537a2d33-9591-429d-8320-d20eff25c9a9', 60, NULL, NULL, NULL, NULL, N'<p>Umbraco modules encapsulate specific bits of advanced functionality that are easily added to your website.</p>
<p>Once installed, Umbraco modules are open source and easy to customize if you want to modify the behavior for your specific needs.</p>
<p>Because Umbraco modules are provided under the MIT license you are free to use and modify them any way you want, with no strings attached.</p>
<p>To add Umbraco modules to your website, go to the <strong>Settings</strong> section, expand the <strong>Templates</strong> item, select the <strong>Starterkit Master</strong> template, then click the <strong>Customize Skin</strong> button on the toolbar.</p>
<p>Umbraco modules are available for various kinds of navigation, a sitemap, social media feeds, and a contact form. The list of available Umbraco modules is growing rapidly and is automatically updated from a central source, always fresh and current.</p>
<p><a href="http://umbraco.org/get-started" title="Get Started with Umbraco">Get more information</a> about the umbraco way.</p>')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (230, 1059, N'537a2d33-9591-429d-8320-d20eff25c9a9', 59, NULL, NULL, NULL, N'/media/SampleImages/1061/pic04.jpg', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (231, 1059, N'721945ff-ba48-42c5-925b-917ddedb8d74', 35, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (232, 1059, N'721945ff-ba48-42c5-925b-917ddedb8d74', 36, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (233, 1059, N'721945ff-ba48-42c5-925b-917ddedb8d74', 58, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (234, 1059, N'721945ff-ba48-42c5-925b-917ddedb8d74', 60, NULL, NULL, NULL, NULL, N'<p>Umbraco modules encapsulate specific bits of advanced functionality that are easily added to your website.</p>
<p>Once installed, Umbraco modules are open source and easy to customize if you want to modify the behavior for your specific needs.</p>
<p>Because Umbraco modules are provided under the MIT license you are free to use and modify them any way you want, with no strings attached.</p>
<p>To add Umbraco modules to your website, go to the <strong>Settings</strong> section, expand the <strong>Templates</strong> item, select the <strong>Starterkit Master</strong> template, then click the <strong>Customize Skin</strong> button on the toolbar.</p>
<p>Umbraco modules are available for various kinds of navigation, a sitemap, social media feeds, and a contact form. The list of available Umbraco modules is growing rapidly and is automatically updated from a central source, always fresh and current.</p>
<p><a href="http://umbraco.org/get-started" title="Get Started with Umbraco">Get more information</a> about the umbraco way.</p>')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (235, 1059, N'721945ff-ba48-42c5-925b-917ddedb8d74', 59, NULL, NULL, NULL, N'/media/SampleImages/1061/pic04.jpg', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (236, 1060, N'6175c3b5-28c6-4d87-a5cd-90a0bd76a147', 35, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (237, 1060, N'6175c3b5-28c6-4d87-a5cd-90a0bd76a147', 36, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (238, 1060, N'6175c3b5-28c6-4d87-a5cd-90a0bd76a147', 58, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (239, 1060, N'6175c3b5-28c6-4d87-a5cd-90a0bd76a147', 60, NULL, NULL, NULL, NULL, N'<p>The Txt Starter Kit gives you a small website that introduces you to a set of well-defined conventions for building an Umbraco website.</p>
<p>Now that you know what the Txt Starter Kit is, it is time to get started using Umbraco.</p>')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (240, 1060, N'6175c3b5-28c6-4d87-a5cd-90a0bd76a147', 59, NULL, NULL, NULL, N'/media/SampleImages/1001/pic03.jpg', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (241, 1060, N'87f7aa5f-d9d4-4537-aba0-bab33921ee26', 35, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (242, 1060, N'87f7aa5f-d9d4-4537-aba0-bab33921ee26', 36, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (243, 1060, N'87f7aa5f-d9d4-4537-aba0-bab33921ee26', 58, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (244, 1060, N'87f7aa5f-d9d4-4537-aba0-bab33921ee26', 60, NULL, NULL, NULL, NULL, N'<p>The Txt Starter Kit gives you a small website that introduces you to a set of well-defined conventions for building an Umbraco website.</p>
<p>Now that you know what the Txt Starter Kit is, it is time to get started using Umbraco.</p>')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (245, 1060, N'87f7aa5f-d9d4-4537-aba0-bab33921ee26', 59, NULL, NULL, NULL, N'/media/SampleImages/1001/pic03.jpg', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (246, 1056, N'b5306b13-4938-43bd-97ce-09506fce4020', 35, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (247, 1056, N'b5306b13-4938-43bd-97ce-09506fce4020', 36, NULL, NULL, NULL, N'NashTech Demo Umbraco', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (248, 1056, N'b5306b13-4938-43bd-97ce-09506fce4020', 37, NULL, NULL, NULL, N'http://facebook.com/Umbraco', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (249, 1056, N'b5306b13-4938-43bd-97ce-09506fce4020', 42, NULL, NULL, NULL, N'https://google.com/+Umbraco', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (250, 1056, N'b5306b13-4938-43bd-97ce-09506fce4020', 39, NULL, NULL, NULL, N'http://feeds.feedburner.com/umbracoblog', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (251, 1056, N'b5306b13-4938-43bd-97ce-09506fce4020', 40, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (252, 1056, N'b5306b13-4938-43bd-97ce-09506fce4020', 38, NULL, NULL, NULL, N'http://twitter.com/UmbracoProject', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (253, 1056, N'b5306b13-4938-43bd-97ce-09506fce4020', 41, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (254, 1056, N'b5306b13-4938-43bd-97ce-09506fce4020', 45, NULL, NULL, NULL, N'It will lead to a call-to-action, just click the button...', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (255, 1056, N'b5306b13-4938-43bd-97ce-09506fce4020', 43, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (256, 1056, N'b5306b13-4938-43bd-97ce-09506fce4020', 44, NULL, NULL, NULL, N'This is some text that needs to pop', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (257, 1056, N'b5306b13-4938-43bd-97ce-09506fce4020', 48, NULL, NULL, NULL, N'/media/SampleImages/1008/banner.jpg', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (258, 1056, N'b5306b13-4938-43bd-97ce-09506fce4020', 46, NULL, NULL, NULL, N'You know you want to click me', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (259, 1056, N'b5306b13-4938-43bd-97ce-09506fce4020', 47, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (260, 1056, N'b5306b13-4938-43bd-97ce-09506fce4020', 49, NULL, NULL, NULL, N'What''s this about?', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (261, 1056, N'b5306b13-4938-43bd-97ce-09506fce4020', 50, NULL, NULL, NULL, NULL, N'<p>This is <a href="http://html5up.net/txt/">TXT</a>, a free site template designed by <a href="http://n33.co">n33</a> for <a href="http://html5up.net/">HTML5 UP</a>. It''s built on the <a href="http://skeljs.org">skelJS</a> framework, uses well-thought out HTML5 and CSS3, and is fully responsive making it a great starting point for your own projects. And, like everything else we make, it''s also free to use for pretty much any personal or commercial work under the <a href="http://html5up.net/license/">Creative Commons Attribution</a> license, so go ahead and use it – just don''t forget to credit us!</p>')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (262, 1056, N'b5306b13-4938-43bd-97ce-09506fce4020', 52, NULL, NULL, NULL, N'A simple demo for Umbraco', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (263, 1056, N'b5306b13-4938-43bd-97ce-09506fce4020', 53, NULL, NULL, NULL, N'NashTech Demo Umbraco', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (264, 1056, N'b5306b13-4938-43bd-97ce-09506fce4020', 51, NULL, NULL, NULL, N'NashTech Demo Umbraco', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (265, 1056, N'f4190853-e84d-4605-9961-b64a34a616f2', 35, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (266, 1056, N'f4190853-e84d-4605-9961-b64a34a616f2', 36, NULL, NULL, NULL, N'NashTech Demo Umbraco', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (267, 1056, N'f4190853-e84d-4605-9961-b64a34a616f2', 37, NULL, NULL, NULL, N'http://facebook.com/Umbraco', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (268, 1056, N'f4190853-e84d-4605-9961-b64a34a616f2', 42, NULL, NULL, NULL, N'https://google.com/+Umbraco', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (269, 1056, N'f4190853-e84d-4605-9961-b64a34a616f2', 39, NULL, NULL, NULL, N'http://feeds.feedburner.com/umbracoblog', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (270, 1056, N'f4190853-e84d-4605-9961-b64a34a616f2', 40, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (271, 1056, N'f4190853-e84d-4605-9961-b64a34a616f2', 38, NULL, NULL, NULL, N'http://twitter.com/UmbracoProject', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (272, 1056, N'f4190853-e84d-4605-9961-b64a34a616f2', 41, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (273, 1056, N'f4190853-e84d-4605-9961-b64a34a616f2', 45, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (274, 1056, N'f4190853-e84d-4605-9961-b64a34a616f2', 43, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (275, 1056, N'f4190853-e84d-4605-9961-b64a34a616f2', 44, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (276, 1056, N'f4190853-e84d-4605-9961-b64a34a616f2', 48, NULL, NULL, NULL, N'/media/SampleImages/1008/banner.jpg', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (277, 1056, N'f4190853-e84d-4605-9961-b64a34a616f2', 46, NULL, NULL, NULL, N'You know you want to click me', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (278, 1056, N'f4190853-e84d-4605-9961-b64a34a616f2', 47, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (279, 1056, N'f4190853-e84d-4605-9961-b64a34a616f2', 49, NULL, NULL, NULL, N'What''s this about?', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (280, 1056, N'f4190853-e84d-4605-9961-b64a34a616f2', 50, NULL, NULL, NULL, NULL, N'<p>This is <a href="http://html5up.net/txt/">TXT</a>, a free site template designed by <a href="http://n33.co">n33</a> for <a href="http://html5up.net/">HTML5 UP</a>. It''s built on the <a href="http://skeljs.org">skelJS</a> framework, uses well-thought out HTML5 and CSS3, and is fully responsive making it a great starting point for your own projects. And, like everything else we make, it''s also free to use for pretty much any personal or commercial work under the <a href="http://html5up.net/license/">Creative Commons Attribution</a> license, so go ahead and use it – just don''t forget to credit us!</p>')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (281, 1056, N'f4190853-e84d-4605-9961-b64a34a616f2', 52, NULL, NULL, NULL, N'A simple demo for Umbraco', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (282, 1056, N'f4190853-e84d-4605-9961-b64a34a616f2', 53, NULL, NULL, NULL, N'NashTech Demo Umbraco', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (283, 1056, N'f4190853-e84d-4605-9961-b64a34a616f2', 51, NULL, NULL, NULL, N'NashTech Demo Umbraco', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (284, 1056, N'b4d6069a-aad9-4e4d-b20c-64a0a577644b', 35, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (285, 1056, N'b4d6069a-aad9-4e4d-b20c-64a0a577644b', 36, NULL, NULL, NULL, N'NashTech Demo Umbraco', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (286, 1056, N'b4d6069a-aad9-4e4d-b20c-64a0a577644b', 37, NULL, NULL, NULL, N'http://facebook.com/Umbraco', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (287, 1056, N'b4d6069a-aad9-4e4d-b20c-64a0a577644b', 42, NULL, NULL, NULL, N'https://google.com/+Umbraco', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (288, 1056, N'b4d6069a-aad9-4e4d-b20c-64a0a577644b', 39, NULL, NULL, NULL, N'http://feeds.feedburner.com/umbracoblog', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (289, 1056, N'b4d6069a-aad9-4e4d-b20c-64a0a577644b', 40, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (290, 1056, N'b4d6069a-aad9-4e4d-b20c-64a0a577644b', 38, NULL, NULL, NULL, N'http://twitter.com/UmbracoProject', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (291, 1056, N'b4d6069a-aad9-4e4d-b20c-64a0a577644b', 41, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (292, 1056, N'b4d6069a-aad9-4e4d-b20c-64a0a577644b', 45, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (293, 1056, N'b4d6069a-aad9-4e4d-b20c-64a0a577644b', 43, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (294, 1056, N'b4d6069a-aad9-4e4d-b20c-64a0a577644b', 44, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (295, 1056, N'b4d6069a-aad9-4e4d-b20c-64a0a577644b', 48, NULL, NULL, NULL, N'/media/SampleImages/1008/banner.jpg', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (296, 1056, N'b4d6069a-aad9-4e4d-b20c-64a0a577644b', 46, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (297, 1056, N'b4d6069a-aad9-4e4d-b20c-64a0a577644b', 47, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (298, 1056, N'b4d6069a-aad9-4e4d-b20c-64a0a577644b', 49, NULL, NULL, NULL, N'What''s this about?', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (299, 1056, N'b4d6069a-aad9-4e4d-b20c-64a0a577644b', 50, NULL, NULL, NULL, NULL, N'<p>This is <a href="http://html5up.net/txt/">TXT</a>, a free site template designed by <a href="http://n33.co">n33</a> for <a href="http://html5up.net/">HTML5 UP</a>. It''s built on the <a href="http://skeljs.org">skelJS</a> framework, uses well-thought out HTML5 and CSS3, and is fully responsive making it a great starting point for your own projects. And, like everything else we make, it''s also free to use for pretty much any personal or commercial work under the <a href="http://html5up.net/license/">Creative Commons Attribution</a> license, so go ahead and use it – just don''t forget to credit us!</p>')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (300, 1056, N'b4d6069a-aad9-4e4d-b20c-64a0a577644b', 52, NULL, NULL, NULL, N'A simple demo for Umbraco', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (301, 1056, N'b4d6069a-aad9-4e4d-b20c-64a0a577644b', 53, NULL, NULL, NULL, N'NashTech Demo Umbraco', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (302, 1056, N'b4d6069a-aad9-4e4d-b20c-64a0a577644b', 51, NULL, NULL, NULL, N'NashTech Demo Umbraco', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (303, 1056, N'1934a8e7-b4aa-4996-9d35-b487073d5383', 35, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (304, 1056, N'1934a8e7-b4aa-4996-9d35-b487073d5383', 36, NULL, NULL, NULL, N'NashTech Demo Umbraco', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (305, 1056, N'1934a8e7-b4aa-4996-9d35-b487073d5383', 37, NULL, NULL, NULL, N'http://facebook.com/Umbraco', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (306, 1056, N'1934a8e7-b4aa-4996-9d35-b487073d5383', 42, NULL, NULL, NULL, N'https://google.com/+Umbraco', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (307, 1056, N'1934a8e7-b4aa-4996-9d35-b487073d5383', 39, NULL, NULL, NULL, N'http://feeds.feedburner.com/umbracoblog', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (308, 1056, N'1934a8e7-b4aa-4996-9d35-b487073d5383', 40, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (309, 1056, N'1934a8e7-b4aa-4996-9d35-b487073d5383', 38, NULL, NULL, NULL, N'http://twitter.com/UmbracoProject', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (310, 1056, N'1934a8e7-b4aa-4996-9d35-b487073d5383', 41, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (311, 1056, N'1934a8e7-b4aa-4996-9d35-b487073d5383', 45, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (312, 1056, N'1934a8e7-b4aa-4996-9d35-b487073d5383', 43, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (313, 1056, N'1934a8e7-b4aa-4996-9d35-b487073d5383', 44, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (314, 1056, N'1934a8e7-b4aa-4996-9d35-b487073d5383', 48, NULL, NULL, NULL, N'', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (315, 1056, N'1934a8e7-b4aa-4996-9d35-b487073d5383', 46, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (316, 1056, N'1934a8e7-b4aa-4996-9d35-b487073d5383', 47, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (317, 1056, N'1934a8e7-b4aa-4996-9d35-b487073d5383', 49, NULL, NULL, NULL, N'What''s this about?', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (318, 1056, N'1934a8e7-b4aa-4996-9d35-b487073d5383', 50, NULL, NULL, NULL, NULL, N'<p>This is <a href="http://html5up.net/txt/">TXT</a>, a free site template designed by <a href="http://n33.co">n33</a> for <a href="http://html5up.net/">HTML5 UP</a>. It''s built on the <a href="http://skeljs.org">skelJS</a> framework, uses well-thought out HTML5 and CSS3, and is fully responsive making it a great starting point for your own projects. And, like everything else we make, it''s also free to use for pretty much any personal or commercial work under the <a href="http://html5up.net/license/">Creative Commons Attribution</a> license, so go ahead and use it – just don''t forget to credit us!</p>')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (319, 1056, N'1934a8e7-b4aa-4996-9d35-b487073d5383', 52, NULL, NULL, NULL, N'A simple demo for Umbraco', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (320, 1056, N'1934a8e7-b4aa-4996-9d35-b487073d5383', 53, NULL, NULL, NULL, N'NashTech Demo Umbraco', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDecimal], [dataDate], [dataNvarchar], [dataNtext]) VALUES (321, 1056, N'1934a8e7-b4aa-4996-9d35-b487073d5383', 51, NULL, NULL, NULL, N'NashTech Demo Umbraco', NULL)
SET IDENTITY_INSERT [dbo].[cmsPropertyData] OFF
SET IDENTITY_INSERT [dbo].[cmsPropertyType] ON 

INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (6, 1043, 1032, 3, N'umbracoFile', N'Upload image', 0, 0, NULL, NULL, N'00000006-0000-0000-0000-000000000000')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (7, -92, 1032, 3, N'umbracoWidth', N'Width', 0, 0, NULL, NULL, N'00000007-0000-0000-0000-000000000000')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (8, -92, 1032, 3, N'umbracoHeight', N'Height', 0, 0, NULL, NULL, N'00000008-0000-0000-0000-000000000000')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (9, -92, 1032, 3, N'umbracoBytes', N'Size', 0, 0, NULL, NULL, N'00000009-0000-0000-0000-000000000000')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (10, -92, 1032, 3, N'umbracoExtension', N'Type', 0, 0, NULL, NULL, N'0000000a-0000-0000-0000-000000000000')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (24, -90, 1033, 4, N'umbracoFile', N'Upload file', 0, 0, NULL, NULL, N'00000018-0000-0000-0000-000000000000')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (25, -92, 1033, 4, N'umbracoExtension', N'Type', 0, 0, NULL, NULL, N'00000019-0000-0000-0000-000000000000')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (26, -92, 1033, 4, N'umbracoBytes', N'Size', 0, 0, NULL, NULL, N'0000001a-0000-0000-0000-000000000000')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (27, -96, 1031, 5, N'contents', N'Contents:', 0, 0, NULL, NULL, N'0000001b-0000-0000-0000-000000000000')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (28, -89, 1044, 11, N'umbracoMemberComments', N'Comments', 0, 0, NULL, NULL, N'0000001c-0000-0000-0000-000000000000')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (29, -92, 1044, 11, N'umbracoMemberFailedPasswordAttempts', N'Failed Password Attempts', 1, 0, NULL, NULL, N'0000001d-0000-0000-0000-000000000000')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (30, -49, 1044, 11, N'umbracoMemberApproved', N'Is Approved', 2, 0, NULL, NULL, N'0000001e-0000-0000-0000-000000000000')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (31, -49, 1044, 11, N'umbracoMemberLockedOut', N'Is Locked Out', 3, 0, NULL, NULL, N'0000001f-0000-0000-0000-000000000000')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (32, -92, 1044, 11, N'umbracoMemberLastLockoutDate', N'Last Lockout Date', 4, 0, NULL, NULL, N'00000020-0000-0000-0000-000000000000')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (33, -92, 1044, 11, N'umbracoMemberLastLogin', N'Last Login Date', 5, 0, NULL, NULL, N'00000021-0000-0000-0000-000000000000')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (34, -92, 1044, 11, N'umbracoMemberLastPasswordChangeDate', N'Last Password Change Date', 6, 0, NULL, NULL, N'00000022-0000-0000-0000-000000000000')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (35, -49, 1051, NULL, N'umbracoNaviHide', N'Hide in navigation?', 0, 0, N'', N'If set to "Yes", this page will be hidden from the navigation menu at the top.', N'f26a1612-688c-4a8c-a004-ccfe48f8bb1a')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (36, -88, 1051, 12, N'title', N'Page title', 0, 0, N'', N'The page title overrules the name this page was given. So if the page name is "About us" the title could be "About Our Company Name".', N'e69a8a4c-c444-4b14-8a0f-f409fc329e51')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (37, -88, 1052, 13, N'facebookLink', N'Facebook link', 0, 0, N'', N'', N'01ab80bc-4d45-44a4-8da8-0d14ba49b9d2')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (38, -88, 1052, 13, N'twitterLink', N'Twitter link', 1, 0, N'', N'', N'c5acf2c9-5dc8-4e11-807b-76be93d7a665')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (39, -88, 1052, 13, N'rssLink', N'Rss link', 2, 0, N'', N'', N'43d1e677-5d10-429f-98ca-1bb4be46e8f0')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (40, -88, 1052, 13, N'dribbbleLink', N'Dribbble link', 3, 0, N'', N'', N'217a6a71-f259-4219-9208-390cfd9bcc6a')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (41, -88, 1052, 13, N'linkedInLink', N'LinkedIn link', 4, 0, N'', N'', N'0d6553d9-b5ee-40d5-aec5-d89910eedcbb')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (42, -88, 1052, 13, N'googleLink', N'Google+ link', 5, 0, N'', N'', N'e5206d7c-9952-4c77-8385-102d20f8c780')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (43, -49, 1052, 14, N'hideBanner', N'Hide banner?', 0, 0, N'', N'', N'c1e61cd6-524a-4fca-afde-7946d48a8e0c')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (44, -88, 1052, 14, N'bannerHeader', N'Banner Header', 1, 0, N'', N'', N'56c97e30-d4af-46d7-b1fc-81e51d49c46c')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (45, -88, 1052, 14, N'bannerSubheader', N'Banner Subheader', 2, 0, N'', N'', N'332235df-2ee4-4905-aa0c-7728933e61f3')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (46, -88, 1052, 14, N'bannerLinkText', N'Banner link text', 3, 0, N'', N'', N'15834efb-8083-43d7-b354-93adc8ee689e')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (47, 1034, 1052, 14, N'bannerLink', N'Banner link', 4, 0, N'', N'', N'ffd83a49-9512-4400-bc56-c7b70b0a8b04')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (48, -90, 1052, 14, N'bannerBackgroundImage', N'Banner background image', 5, 0, N'', N'', N'42e73e2b-bf48-451e-bf05-8495d291818c')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (49, -88, 1052, 15, N'aboutTitle', N'About Title', 0, 0, N'', N'', N'8867d8a8-83a7-4ade-a2c2-42e6236c964d')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (50, -87, 1052, 15, N'aboutText', N'AboutText', 1, 0, N'', N'', N'341caf1b-bdbf-430e-b249-7bd520f7dca7')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (51, -88, 1052, 16, N'siteName', N'Site Name', 0, 0, N'', N'', N'c92c2d86-2d84-48f2-8bd1-9ad389da78c9')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (52, -88, 1052, 16, N'byline', N'Byline', 1, 0, N'', N'', N'71a6a4e9-eea0-45f4-9bd4-15d025a5906b')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (53, -88, 1052, 16, N'copyright', N'Copyright', 2, 0, N'', N'', N'47f1dc18-f7e6-468a-b1a4-3be69ffcc724')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (54, -36, 1053, NULL, N'publishDate', N'Publish date', 0, 0, N'', N'You can overrule the date shown on the site by changing it here. If you don''t set a date explicitly here then the news item''s create date will be shown.', N'191917e0-68e2-4432-8369-74fbd9d41ac5')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (55, -90, 1053, 17, N'image', N'Image', 0, 0, N'', N'', N'ae068950-a047-47d3-b3ad-7bfa1bfe5689')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (56, -88, 1053, 17, N'subheader', N'Subheader', 1, 0, N'', N'', N'79356ffb-ac77-4902-a9ae-483381e37b32')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (57, -87, 1053, 17, N'bodyText', N'Content', 2, 0, N'', N'', N'b4c96f97-b7b5-49fa-a624-a002a79fc523')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (58, -49, 1055, 18, N'featuredPage', N'Featured Page?', 0, 0, N'', N'Is this a page that should be featured on the home page?', N'ce1b021d-4d41-4cb9-ad98-2f7b286aab3c')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (59, -90, 1055, 18, N'image', N'Image', 1, 0, N'', N'', N'38d94f16-172a-4791-b882-b89ea27bc972')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (60, -87, 1055, 18, N'bodyText', N'Content', 2, 0, N'', N'', N'b8dc1c78-aeb7-49a4-a443-7a089b3cfa0b')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (61, -88, 1067, 19, N'pageName', N'Page Name', 0, 0, NULL, NULL, N'b8e70534-86e1-44b5-9759-540ec54f5377')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (62, 1069, 1067, 19, N'content', N'Content', 1, 0, NULL, NULL, N'bacfe4f8-af8f-4654-8d2a-c935855a2c76')
SET IDENTITY_INSERT [dbo].[cmsPropertyType] OFF
SET IDENTITY_INSERT [dbo].[cmsPropertyTypeGroup] ON 

INSERT [dbo].[cmsPropertyTypeGroup] ([id], [contenttypeNodeId], [text], [sortorder], [uniqueID]) VALUES (3, 1032, N'Image', 1, N'79ed4d07-254a-42cf-8fa9-ebe1c116a596')
INSERT [dbo].[cmsPropertyTypeGroup] ([id], [contenttypeNodeId], [text], [sortorder], [uniqueID]) VALUES (4, 1033, N'File', 1, N'50899f9c-023a-4466-b623-aba9049885fe')
INSERT [dbo].[cmsPropertyTypeGroup] ([id], [contenttypeNodeId], [text], [sortorder], [uniqueID]) VALUES (5, 1031, N'Contents', 1, N'79995fa2-63ee-453c-a29b-2e66f324cdbe')
INSERT [dbo].[cmsPropertyTypeGroup] ([id], [contenttypeNodeId], [text], [sortorder], [uniqueID]) VALUES (11, 1044, N'Membership', 1, N'0756729d-d665-46e3-b84a-37aceaa614f8')
INSERT [dbo].[cmsPropertyTypeGroup] ([id], [contenttypeNodeId], [text], [sortorder], [uniqueID]) VALUES (12, 1051, N'Content', 0, N'c673e2f2-fbf9-4d83-96aa-ef6774adc043')
INSERT [dbo].[cmsPropertyTypeGroup] ([id], [contenttypeNodeId], [text], [sortorder], [uniqueID]) VALUES (13, 1052, N'Social', 0, N'83838ffe-f9c1-4a71-8114-f46c82d385b1')
INSERT [dbo].[cmsPropertyTypeGroup] ([id], [contenttypeNodeId], [text], [sortorder], [uniqueID]) VALUES (14, 1052, N'Banner', 1, N'e83d74a5-66a5-4154-badc-6874496b9f65')
INSERT [dbo].[cmsPropertyTypeGroup] ([id], [contenttypeNodeId], [text], [sortorder], [uniqueID]) VALUES (15, 1052, N'About', 2, N'47c2d15a-fb0a-49e0-aac5-0ed91360dd10')
INSERT [dbo].[cmsPropertyTypeGroup] ([id], [contenttypeNodeId], [text], [sortorder], [uniqueID]) VALUES (16, 1052, N'Content', 0, N'f2ae4d9c-cec7-44b5-a3b7-8bf3e5c6d32e')
INSERT [dbo].[cmsPropertyTypeGroup] ([id], [contenttypeNodeId], [text], [sortorder], [uniqueID]) VALUES (17, 1053, N'Content', 0, N'a712cd41-a7ce-4bd9-86b6-8a7cbd429392')
INSERT [dbo].[cmsPropertyTypeGroup] ([id], [contenttypeNodeId], [text], [sortorder], [uniqueID]) VALUES (18, 1055, N'Content', 0, N'e89930f0-27c7-4d36-9dd3-09099868f935')
INSERT [dbo].[cmsPropertyTypeGroup] ([id], [contenttypeNodeId], [text], [sortorder], [uniqueID]) VALUES (19, 1067, N'Content', 0, N'09c26f45-ad62-4844-90b3-2153096062bc')
SET IDENTITY_INSERT [dbo].[cmsPropertyTypeGroup] OFF
SET IDENTITY_INSERT [dbo].[cmsTaskType] ON 

INSERT [dbo].[cmsTaskType] ([id], [alias]) VALUES (1, N'toTranslate')
SET IDENTITY_INSERT [dbo].[cmsTaskType] OFF
SET IDENTITY_INSERT [dbo].[cmsTemplate] ON 

INSERT [dbo].[cmsTemplate] ([pk], [nodeId], [alias], [design]) VALUES (1, 1046, N'umbLayout', N'@inherits UmbracoTemplatePage
@{
    Layout = null;
}<!DOCTYPE html>
<!--
    TXT 2.0 by HTML5 UP
    html5up.net | twitter.com/n33co
    Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
<head>
    <title>@Umbraco.Field("title", altFieldAlias: "pageName") | @Umbraco.Field("siteName", recursive: true)</title>
    <meta http-equiv="content-type" content="text/html; charset=utf-8" />
    <meta name="description" content="" />
    <meta name="keywords" content="" />
    <link href="http://fonts.googleapis.com/css?family=Open+Sans:400,700|Open+Sans+Condensed:700" rel="stylesheet" />
    <script src="/js/jquery.min.js"></script>
    <script src="/js/config.js"></script>
    <script src="/js/skel.min.js"></script>
    <script src="/js/skel-panels.min.js"></script>
    <noscript>
        <link rel="stylesheet" href="/css/skel-noscript.css" />
        <link rel="stylesheet" href="/css/style.css" />
        <link rel="stylesheet" href="/css/style-desktop.css" />
    </noscript>
    <!--[if lte IE 9]><link rel="stylesheet" href="/css/ie9.css" /><![endif]-->
    <!--[if lte IE 8]><script src="/js/html5shiv.js"></script><link rel="stylesheet" href="/css/ie8.css" /><![endif]-->
    <!--[if lte IE 7]><link rel="stylesheet" href="/css/ie7.css" /><![endif]-->
</head>
<body class="homepage">
    <!-- Header -->
    <header id="header">
        <div class="logo">
            <div>
                <h1><a href="/" id="logo">@Umbraco.Field("siteName", recursive: true)</a></h1>
                <span class="byline">@Umbraco.Field("byline", recursive: true)</span>
            </div>
        </div>
    </header>
    <!-- /Header -->
    @{ Html.RenderPartial("umbTopNavigation"); }

    @RenderBody()

    <!-- Footer -->
    <footer id="footer" class="container">
        <div class="row">
            <div class="12u">
                @{ Html.RenderPartial("umbAbout"); }
            </div>
        </div>
        <div class="row">
            <div class="12u">
                @{ Html.RenderPartial("umbSocial"); }
            </div>
        </div>
        <div class="row">
            <!-- Copyright -->
            <div id="copyright">
                &copy; @DateTime.Now.Year @Umbraco.Field("copyright", recursive: true) | Images: <a href="http://fotogrph.com">fotogrph</a> + <a href="http://iconify.it">Iconify.it</a> | Design: <a href="http://html5up.net/">HTML5 UP</a>
            </div>
            <!-- /Copyright -->
        </div>
    </footer>
    <!-- /Footer -->
</body>
</html>')
INSERT [dbo].[cmsTemplate] ([pk], [nodeId], [alias], [design]) VALUES (2, 1047, N'umbHomePage', N'@inherits UmbracoTemplatePage
@{
    Layout = "umbLayout.cshtml";
}
@{ Html.RenderPartial("umbHomepageBanner"); }
<!-- Main -->
<div id="main-wrapper">
    <div id="main" class="container">
        <div class="row">
            <div class="12u">
                @{ Html.RenderPartial("umbFeatures"); }
            </div>
        </div>
        <div class="row">
            <div class="12u">
                @{   Html.RenderPartial("umbNewsOverviewWidget"); }
            </div>
        </div>
    </div>
</div>
<!-- /Main -->
')
INSERT [dbo].[cmsTemplate] ([pk], [nodeId], [alias], [design]) VALUES (3, 1048, N'umbNewsItem', N'@inherits UmbracoTemplatePage
@{
    Layout = "umbLayout.cshtml";
    
    // If the editor has not explicitly provided the "Page title" property page 
    // then just show the name of the page otherwise show the provided title
    var pageTitle = string.IsNullOrWhiteSpace(CurrentPage.Title)
        ? CurrentPage.Name
        : CurrentPage.Title;
}
<div id="main-wrapper">
    <div id="main" class="container">
        <div class="row">
            <div class="9u skel-cell-mainContent">
                <div class="content content-left">
                    <!-- Content -->
                    <article class="is-page-content">
                        <header>
                            <h2>@pageTitle</h2>
                        </header>
                        <section>
                            @if (string.IsNullOrWhiteSpace(CurrentPage.Image) == false)
                            {
                                <span class="image image-full"><img src="@CurrentPage.Image" alt="" /></span>
                            }

                            @CurrentPage.BodyText
                        </section>                           
                    </article>
                    <!-- /Content -->
                </div>
            </div>
            <div class="3u">
                <div class="sidebar">
                    <!-- Sidebar -->
                    @{ Html.RenderPartial("umbLatestNewsWidget"); }
                    <!-- /Sidebar -->
                </div>
            </div>
        </div>
        <div class="row">
            <div class="12u">
                @{ Html.RenderPartial("umbFeatures"); }
            </div>
        </div>
    </div>
</div>
<!-- /Main -->')
INSERT [dbo].[cmsTemplate] ([pk], [nodeId], [alias], [design]) VALUES (4, 1049, N'umbNewsOverview', N'@inherits UmbracoTemplatePage
@{
    Layout = "umbLayout.cshtml";

    // If the editor has not explicitly provided the "Page title" property page 
    // then just show the name of the page otherwise show the provided title
    var pageTitle = string.IsNullOrWhiteSpace(CurrentPage.Title)
        ? CurrentPage.Name
        : CurrentPage.Title;

    // Model.Content is the current page that we''re on
    // AncestorsOrSelf is all of the ancestors this page has in the tree
    // (1) means: go up to level 1 and stop looking for more ancestors when you get there
    // First() gets the first ancestor found (the home page, on level 1)
    var homePage = CurrentPage.AncestorsOrSelf(1).First();    
    
    // Find all pages with document type alias umbNewsOverview
    // We do that using the plural, umbNewsOverviews (note the extra "s" in the end)
    // Then take the first one, as we know there will only be on news overview page
    var newsOverview = homePage.umbNewsOverviews.First();

    // Similar to above: find all pages with document type umbNewsItem under the news overview page
    // Then order them, first by publishDate (a property the editor can explicitly set on the news item)
    // and then by createDate, which is set by Umbraco automatically when a page gets created.
    var newsItems = newsOverview.umbNewsItems.OrderBy("publishDate desc, createDate desc").Take(5);

}
<!-- Main -->
<div id="main-wrapper">
    <div id="main" class="container">
        <div class="row">
            <div class="12u skel-cell-mainContent">
                <div class="content">
                    <!-- Content -->
                    <article class="is-page-content">
                        <header>
                            <h2>@pageTitle</h2>
                        </header>

                        @foreach (var item in newsItems)
                        {

                            // If the editor has not explicitly provided the "Page title" property page 
                            // then just show the name of the page otherwise show the provided title
                            var title = string.IsNullOrWhiteSpace(item.Title) 
                                ? item.Name 
                                : item.Title;


                            // If the editor has not explicitly set the publishDate property then show the create date
                            var dateTime = item.PublishDate == default(DateTime) 
                                ? item.CreateDate 
                                : item.PublishDate;
                            
                            <section>
                                <h3><a href="@item.Url">@title</a></h3>
                                <span class="byline">@item.SubHeader</span>
                                <ul class="meta">
                                    <li class="timestamp">@dateTime.ToString("f")</li>
                                </ul>

                                @if (string.IsNullOrWhiteSpace(item.Image) == false)
                                {
                                    <a href="@item.Url" class="image image-full"><img src="@item.Image" alt="" /></a>
                                }

                                @Umbraco.Truncate(item.BodyText, 200)

                                <a href="@item.Url" class="button">Continue Reading</a>
                            </section>
                        }
                    </article>
                    <!-- /Content -->
                </div>
            </div>
        </div>
        <div class="row">
            <div class="12u">
                @{ Html.RenderPartial("umbFeatures"); }
            </div>
        </div>
    </div>
</div>
<!-- /Main -->
')
INSERT [dbo].[cmsTemplate] ([pk], [nodeId], [alias], [design]) VALUES (5, 1050, N'umbTextPage', N'@inherits UmbracoTemplatePage
@{
    Layout = "umbLayout.cshtml";

    // If the editor has not explicitly provided the "Page title" property page 
    // then just show the name of the page otherwise show the provided title
    var pageTitle = string.IsNullOrWhiteSpace(CurrentPage.Title)
        ? CurrentPage.Name
        : CurrentPage.Title;    
}
<div id="main-wrapper">
    <div id="main" class="container">
        <div class="row">
            <div class="9u skel-cell-mainContent">
                <div class="content content-left">
                    <!-- Content -->
                    <article class="is-page-content">
                        <header>
                            <h2>@pageTitle</h2>
                        </header>
                        <section>
                            @if (string.IsNullOrWhiteSpace(CurrentPage.Image) == false)
                            {
                                <span class="image image-full"><img src="@CurrentPage.Image" alt="" /></span>
                            }

                            @CurrentPage.BodyText
                        </section>                           
                    </article>
                    <!-- /Content -->
                </div>
            </div>
            <div class="3u">
                <div class="sidebar">
                    <!-- Sidebar -->
                    @{ Html.RenderPartial("umbLatestNewsWidget"); }
                    <!-- /Sidebar -->
                </div>
            </div>
        </div>
        <div class="row">
            <div class="12u">
                @{ Html.RenderPartial("umbFeatures"); }
            </div>
        </div>
    </div>
</div>
<!-- /Main -->')
INSERT [dbo].[cmsTemplate] ([pk], [nodeId], [alias], [design]) VALUES (6, 1066, N'NewsPage', N'@inherits Umbraco.Web.Mvc.UmbracoTemplatePage<ContentModels.NewsPage>
@using ContentModels = Umbraco.Web.PublishedContentModels;
@{
	Layout = "umbLayout.cshtml";
}')
INSERT [dbo].[cmsTemplate] ([pk], [nodeId], [alias], [design]) VALUES (13, 1084, N'Category', N'@inherits Umbraco.Web.Mvc.UmbracoTemplatePage<ContentModels.Category>
@using ContentModels = Umbraco.Web.PublishedContentModels;
@{
	Layout = "umbLayout.cshtml";
}')
INSERT [dbo].[cmsTemplate] ([pk], [nodeId], [alias], [design]) VALUES (14, 1087, N'Product', N'@inherits Umbraco.Web.Mvc.UmbracoTemplatePage<ContentModels.Product>
@using ContentModels = Umbraco.Web.PublishedContentModels;
@{
	Layout = "umbLayout.cshtml";
}')
INSERT [dbo].[cmsTemplate] ([pk], [nodeId], [alias], [design]) VALUES (15, 1090, N'DealerLocator', N'@inherits Umbraco.Web.Mvc.UmbracoTemplatePage<ContentModels.DealerLocator>
@using ContentModels = Umbraco.Web.PublishedContentModels;
@{
	Layout = "umbLayout.cshtml";
}')
INSERT [dbo].[cmsTemplate] ([pk], [nodeId], [alias], [design]) VALUES (16, 1093, N'ContactPage', N'@inherits Umbraco.Web.Mvc.UmbracoTemplatePage
@{
	Layout = null;
}')
SET IDENTITY_INSERT [dbo].[cmsTemplate] OFF
SET IDENTITY_INSERT [dbo].[umbCategories] ON 

INSERT [dbo].[umbCategories] ([category_id], [category_parent_id], [category_name], [description], [picture]) VALUES (1, 0, N'Men', N'For men only', NULL)
INSERT [dbo].[umbCategories] ([category_id], [category_parent_id], [category_name], [description], [picture]) VALUES (2, 0, N'Women', N'For women only', NULL)
INSERT [dbo].[umbCategories] ([category_id], [category_parent_id], [category_name], [description], [picture]) VALUES (3, 1, N'Quần nam', N'Quần nam', NULL)
INSERT [dbo].[umbCategories] ([category_id], [category_parent_id], [category_name], [description], [picture]) VALUES (4, 1, N'Áo nam', N'Áo nam', NULL)
INSERT [dbo].[umbCategories] ([category_id], [category_parent_id], [category_name], [description], [picture]) VALUES (5, 2, N'Váy nữ', N'Váy nữ', NULL)
INSERT [dbo].[umbCategories] ([category_id], [category_parent_id], [category_name], [description], [picture]) VALUES (6, 2, N'Túi nữ', N'Túi nữ', NULL)
SET IDENTITY_INSERT [dbo].[umbCategories] OFF
SET IDENTITY_INSERT [dbo].[umbProducts] ON 

INSERT [dbo].[umbProducts] ([product_id], [category_id], [published], [rating_cache], [rating_count], [name], [pricing], [short_description], [long_description], [icon], [created_at], [updated_at]) VALUES (1, 3, 1, 3, 0, N'First product', 20.99, N'This is a short description asdf as This is a short description asdf as', N'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum', N'', CAST(N'2016-11-06 05:11:00.0000000' AS DateTime2), CAST(N'2016-11-12 05:51:07.0000000' AS DateTime2))
INSERT [dbo].[umbProducts] ([product_id], [category_id], [published], [rating_cache], [rating_count], [name], [pricing], [short_description], [long_description], [icon], [created_at], [updated_at]) VALUES (2, 3, 1, 3, 0, N'Second product', 55, N'This is a short description', N'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum', N'', CAST(N'2016-11-06 05:11:00.0000000' AS DateTime2), CAST(N'2016-11-11 16:17:23.0000000' AS DateTime2))
INSERT [dbo].[umbProducts] ([product_id], [category_id], [published], [rating_cache], [rating_count], [name], [pricing], [short_description], [long_description], [icon], [created_at], [updated_at]) VALUES (3, 4, 1, 3, 0, N'Third product', 65, N'This is a short description', N'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum', N'', CAST(N'2016-11-06 05:11:00.0000000' AS DateTime2), CAST(N'2016-11-06 06:08:00.0000000' AS DateTime2))
INSERT [dbo].[umbProducts] ([product_id], [category_id], [published], [rating_cache], [rating_count], [name], [pricing], [short_description], [long_description], [icon], [created_at], [updated_at]) VALUES (4, 5, 1, 3, 0, N'Fourth product', 85, N'This is a short description', N'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum', N'', CAST(N'2016-11-06 05:11:00.0000000' AS DateTime2), CAST(N'2016-11-06 06:08:00.0000000' AS DateTime2))
INSERT [dbo].[umbProducts] ([product_id], [category_id], [published], [rating_cache], [rating_count], [name], [pricing], [short_description], [long_description], [icon], [created_at], [updated_at]) VALUES (5, 6, 1, 3, 0, N'Fifth product', 95, N'This is a short description', N'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum', N'', CAST(N'2016-11-06 05:11:00.0000000' AS DateTime2), CAST(N'2016-11-06 06:08:00.0000000' AS DateTime2))
SET IDENTITY_INSERT [dbo].[umbProducts] OFF
SET IDENTITY_INSERT [dbo].[umbracoCacheInstruction] ON 

INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated]) VALUES (104, CAST(N'2016-12-21 09:56:55.087' AS DateTime), N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1093]","JsonPayload":null},{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonPayload":"[{\"Alias\":\"contactPage\",\"Id\":1094,\"PropertyTypeIds\":[],\"Type\":\"IContentType\",\"AliasChanged\":true,\"PropertyRemoved\":false,\"PropertyTypeAliasChanged\":false,\"DescendantPayloads\":[],\"WasDeleted\":false,\"IsNew\":true}]"}]', N'HN-SD-0381-WK//LM/W3SVC/2/ROOT [P158276/D2] 00ACA7AA64FF4D20A87311EBE4DBF3B2')
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated]) VALUES (105, CAST(N'2016-12-21 09:57:08.820' AS DateTime), N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonPayload":"[{\"Alias\":\"umbHomePage\",\"Id\":1052,\"PropertyTypeIds\":[37,38,39,40,41,42,51,52,53,43,44,45,46,47,48,49,50],\"Type\":\"IContentType\",\"AliasChanged\":false,\"PropertyRemoved\":false,\"PropertyTypeAliasChanged\":false,\"DescendantPayloads\":[],\"WasDeleted\":false,\"IsNew\":false}]"}]', N'HN-SD-0381-WK//LM/W3SVC/2/ROOT [P158276/D2] 00ACA7AA64FF4D20A87311EBE4DBF3B2')
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated]) VALUES (106, CAST(N'2016-12-21 09:58:29.327' AS DateTime), N'[{"RefreshType":3,"RefresherId":"27ab3022-3dfa-47b6-9119-5945bc88fd66","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1095]","JsonPayload":null}]', N'HN-SD-0381-WK//LM/W3SVC/2/ROOT [P158276/D2] 00ACA7AA64FF4D20A87311EBE4DBF3B2')
SET IDENTITY_INSERT [dbo].[umbracoCacheInstruction] OFF
SET IDENTITY_INSERT [dbo].[umbracoLanguage] ON 

INSERT [dbo].[umbracoLanguage] ([id], [languageISOCode], [languageCultureName]) VALUES (1, N'en-US', N'en-US')
SET IDENTITY_INSERT [dbo].[umbracoLanguage] OFF
SET IDENTITY_INSERT [dbo].[umbracoLog] ON 

INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (1, 0, -1, CAST(N'2016-12-13 15:34:39.710' AS DateTime), N'Save', N'Save Template performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (2, 0, -1, CAST(N'2016-12-13 15:34:40.083' AS DateTime), N'Save', N'Save ContentTypes performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (3, 0, -1, CAST(N'2016-12-13 15:34:40.633' AS DateTime), N'Save', N'Save ContentTypes performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (4, 0, -1, CAST(N'2016-12-13 15:34:40.647' AS DateTime), N'Save', N'Save Stylesheet performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (5, 0, -1, CAST(N'2016-12-13 15:34:40.647' AS DateTime), N'Save', N'Save Stylesheet performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (6, 0, -1, CAST(N'2016-12-13 15:34:40.653' AS DateTime), N'Save', N'Save Stylesheet performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (7, 0, -1, CAST(N'2016-12-13 15:34:40.657' AS DateTime), N'Save', N'Save Stylesheet performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (8, 0, -1, CAST(N'2016-12-13 15:34:40.660' AS DateTime), N'Save', N'Save Stylesheet performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (9, 0, -1, CAST(N'2016-12-13 15:34:40.660' AS DateTime), N'Save', N'Save Stylesheet performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (10, 0, -1, CAST(N'2016-12-13 15:34:40.667' AS DateTime), N'Save', N'Save Stylesheet performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (11, 0, -1, CAST(N'2016-12-13 15:34:40.670' AS DateTime), N'Save', N'Save Stylesheet performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (12, 0, -1, CAST(N'2016-12-13 15:34:40.673' AS DateTime), N'Save', N'Save Stylesheet performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (13, 0, -1, CAST(N'2016-12-13 15:34:40.680' AS DateTime), N'Save', N'Save Stylesheet performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (14, 0, -1, CAST(N'2016-12-13 15:34:40.683' AS DateTime), N'Save', N'Save Stylesheet performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (15, 0, -1, CAST(N'2016-12-13 15:34:40.687' AS DateTime), N'Save', N'Save Stylesheet performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (16, 0, -1, CAST(N'2016-12-13 15:34:40.693' AS DateTime), N'Save', N'Save Stylesheet performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (17, 0, -1, CAST(N'2016-12-13 15:34:40.697' AS DateTime), N'Save', N'Save Stylesheet performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (18, 0, -1, CAST(N'2016-12-13 15:34:40.703' AS DateTime), N'Save', N'Save Stylesheet performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (19, 0, -1, CAST(N'2016-12-13 15:34:40.707' AS DateTime), N'Save', N'Save Stylesheet performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (20, 0, -1, CAST(N'2016-12-13 15:34:41.127' AS DateTime), N'Save', N'Bulk Save content performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (21, 0, 1056, CAST(N'2016-12-13 15:34:41.450' AS DateTime), N'Publish', N'Publish with Children performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (22, 0, 0, CAST(N'2016-12-13 15:38:48.457' AS DateTime), N'New', N'Content '''' was created')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (23, 0, 1066, CAST(N'2016-12-13 15:40:36.527' AS DateTime), N'Save', N'Save Template performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (24, 0, 1067, CAST(N'2016-12-13 15:40:36.733' AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (25, 0, 1052, CAST(N'2016-12-13 15:52:16.460' AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (26, 0, 0, CAST(N'2016-12-13 15:52:24.467' AS DateTime), N'New', N'Content '''' was created')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (27, 0, 1068, CAST(N'2016-12-13 15:52:37.133' AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (28, 0, 1067, CAST(N'2016-12-15 16:14:56.817' AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (29, 0, 1055, CAST(N'2016-12-15 16:15:07.467' AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (30, 0, 1068, CAST(N'2016-12-15 16:20:12.493' AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (31, 0, 1068, CAST(N'2016-12-15 16:20:41.817' AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (32, 0, 1068, CAST(N'2016-12-15 16:20:47.010' AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (33, 0, 1069, CAST(N'2016-12-15 16:47:58.563' AS DateTime), N'Save', N'Save DataTypeDefinition performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (34, 0, 1067, CAST(N'2016-12-15 16:48:13.353' AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (35, 0, 1068, CAST(N'2016-12-15 16:48:58.243' AS DateTime), N'Save', N'Save Content performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (36, 0, 1068, CAST(N'2016-12-15 16:49:53.570' AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (37, 0, 1068, CAST(N'2016-12-15 16:50:05.147' AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (38, 0, 1068, CAST(N'2016-12-15 16:50:08.800' AS DateTime), N'Save', N'Save Content performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (39, 0, 1068, CAST(N'2016-12-15 16:51:02.207' AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (40, 0, 1062, CAST(N'2016-12-15 16:52:43.753' AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (41, 0, 1062, CAST(N'2016-12-15 16:52:53.103' AS DateTime), N'Save', N'Save Content performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (42, 0, 1062, CAST(N'2016-12-15 16:53:20.123' AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (43, 0, 1062, CAST(N'2016-12-15 16:55:50.033' AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (44, 0, 1066, CAST(N'2016-12-19 13:46:41.620' AS DateTime), N'Save', N'Save Template performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (45, 0, 1057, CAST(N'2016-12-19 13:54:04.767' AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (46, 0, 1058, CAST(N'2016-12-19 13:54:12.380' AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (47, 0, 1059, CAST(N'2016-12-19 13:54:22.003' AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (48, 0, 1062, CAST(N'2016-12-19 13:54:50.270' AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (49, 0, 1060, CAST(N'2016-12-19 13:55:15.520' AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (50, 0, 1068, CAST(N'2016-12-19 14:01:06.067' AS DateTime), N'Publish', N'Publish with Children performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (51, 0, 1068, CAST(N'2016-12-19 14:01:35.037' AS DateTime), N'UnPublish', N'UnPublish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (52, 0, 1068, CAST(N'2016-12-19 14:01:35.153' AS DateTime), N'Delete', N'Trashed content with Id: ''1068'' related to original parent content with Id: ''1056''')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (53, 0, 1068, CAST(N'2016-12-19 14:01:35.153' AS DateTime), N'Move', N'Move Content to Recycle Bin performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (54, 0, 0, CAST(N'2016-12-19 14:04:15.520' AS DateTime), N'New', N'Content '''' was created')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (55, 0, 1070, CAST(N'2016-12-19 14:04:44.683' AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (56, 0, 1070, CAST(N'2016-12-19 14:04:53.637' AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (57, 0, 0, CAST(N'2016-12-19 14:05:08.877' AS DateTime), N'New', N'Content '''' was created')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (58, 0, 1071, CAST(N'2016-12-19 14:05:32.673' AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (59, 0, 1071, CAST(N'2016-12-19 14:05:33.940' AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (60, 0, 1071, CAST(N'2016-12-19 14:05:49.613' AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (61, 0, 1071, CAST(N'2016-12-19 14:05:59.270' AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (62, 0, 0, CAST(N'2016-12-19 14:07:53.743' AS DateTime), N'New', N'Content '''' was created')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (63, 0, 1072, CAST(N'2016-12-19 14:08:20.193' AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (64, 0, 1068, CAST(N'2016-12-19 14:23:57.437' AS DateTime), N'Delete', N'Delete Content performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (65, 0, 1057, CAST(N'2016-12-19 14:24:19.150' AS DateTime), N'UnPublish', N'UnPublish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (66, 0, 1057, CAST(N'2016-12-19 14:24:19.197' AS DateTime), N'Delete', N'Trashed content with Id: ''1057'' related to original parent content with Id: ''1056''')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (67, 0, 1057, CAST(N'2016-12-19 14:24:19.197' AS DateTime), N'Move', N'Move Content to Recycle Bin performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (68, 0, 1058, CAST(N'2016-12-19 14:24:23.620' AS DateTime), N'UnPublish', N'UnPublish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (69, 0, 1058, CAST(N'2016-12-19 14:24:23.633' AS DateTime), N'Delete', N'Trashed content with Id: ''1058'' related to original parent content with Id: ''1056''')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (70, 0, 1058, CAST(N'2016-12-19 14:24:23.637' AS DateTime), N'Move', N'Move Content to Recycle Bin performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (71, 0, 1059, CAST(N'2016-12-19 14:24:27.963' AS DateTime), N'UnPublish', N'UnPublish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (72, 0, 1059, CAST(N'2016-12-19 14:24:27.977' AS DateTime), N'Delete', N'Trashed content with Id: ''1059'' related to original parent content with Id: ''1056''')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (73, 0, 1059, CAST(N'2016-12-19 14:24:27.977' AS DateTime), N'Move', N'Move Content to Recycle Bin performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (74, 0, 1060, CAST(N'2016-12-19 14:24:33.067' AS DateTime), N'UnPublish', N'UnPublish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (75, 0, 1060, CAST(N'2016-12-19 14:24:33.080' AS DateTime), N'Delete', N'Trashed content with Id: ''1060'' related to original parent content with Id: ''1056''')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (76, 0, 1060, CAST(N'2016-12-19 14:24:33.083' AS DateTime), N'Move', N'Move Content to Recycle Bin performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (77, 0, 1056, CAST(N'2016-12-19 14:28:09.337' AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (78, 0, 1056, CAST(N'2016-12-19 14:32:00.500' AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (79, 0, 1056, CAST(N'2016-12-19 14:36:15.090' AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (80, 0, 1056, CAST(N'2016-12-19 14:36:40.870' AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (81, 0, 1056, CAST(N'2016-12-19 14:37:08.723' AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (82, 0, 1056, CAST(N'2016-12-19 14:38:02.587' AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (83, 0, 1073, CAST(N'2016-12-19 15:15:05.467' AS DateTime), N'Save', N'Save DataTypeDefinition performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (84, 0, 1074, CAST(N'2016-12-19 15:16:20.203' AS DateTime), N'Save', N'Save Template performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (85, 0, 1075, CAST(N'2016-12-19 15:16:20.607' AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (86, 0, 1076, CAST(N'2016-12-19 15:16:43.707' AS DateTime), N'Save', N'Save DataTypeDefinition performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (87, 0, 1077, CAST(N'2016-12-19 15:16:54.317' AS DateTime), N'Save', N'Save Template performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (88, 0, 1078, CAST(N'2016-12-19 15:16:54.357' AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (89, 0, 1078, CAST(N'2016-12-19 15:17:17.803' AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (90, 0, 1075, CAST(N'2016-12-19 15:17:27.657' AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (91, 0, 1079, CAST(N'2016-12-19 15:17:45.490' AS DateTime), N'Save', N'Save Template performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (92, 0, 1080, CAST(N'2016-12-19 15:17:45.500' AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (93, 0, 1077, CAST(N'2016-12-19 15:18:04.743' AS DateTime), N'Save', N'Save Template performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (94, 0, 1081, CAST(N'2016-12-19 15:33:04.697' AS DateTime), N'Save', N'Save Template performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (95, 0, 1081, CAST(N'2016-12-19 15:33:13.757' AS DateTime), N'Save', N'Save Template performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (96, 0, 1077, CAST(N'2016-12-19 15:33:34.257' AS DateTime), N'Save', N'Save Template performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (97, 0, 1077, CAST(N'2016-12-19 15:34:04.387' AS DateTime), N'Save', N'Save Template performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (98, 0, 1074, CAST(N'2016-12-19 15:34:25.347' AS DateTime), N'Save', N'Save Template performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (99, 0, 1079, CAST(N'2016-12-19 15:34:35.200' AS DateTime), N'Save', N'Save Template performed by user')
GO
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (100, 0, 1074, CAST(N'2016-12-19 15:34:48.190' AS DateTime), N'Save', N'Save Template performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (101, 0, 1081, CAST(N'2016-12-19 15:36:40.483' AS DateTime), N'Save', N'Save Template performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (102, 0, 1081, CAST(N'2016-12-19 15:38:06.043' AS DateTime), N'Save', N'Save Template performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (103, 0, 1081, CAST(N'2016-12-19 15:39:36.467' AS DateTime), N'Save', N'Save Template performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (104, 0, 1082, CAST(N'2016-12-19 15:40:35.243' AS DateTime), N'Save', N'Save Template performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (105, 0, 1082, CAST(N'2016-12-19 15:41:11.160' AS DateTime), N'Save', N'Save Template performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (106, 0, 1072, CAST(N'2016-12-19 15:43:51.643' AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (107, 0, 1082, CAST(N'2016-12-19 16:25:46.427' AS DateTime), N'Save', N'Save Template performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (108, 0, 1082, CAST(N'2016-12-19 16:25:58.663' AS DateTime), N'Save', N'Save Template performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (109, 0, 1075, CAST(N'2016-12-19 16:31:07.080' AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (110, 0, 1078, CAST(N'2016-12-19 16:31:17.940' AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (111, 0, 1080, CAST(N'2016-12-19 16:31:26.147' AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (112, 0, 1083, CAST(N'2016-12-19 16:40:40.030' AS DateTime), N'Save', N'Save Template performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (113, 0, -1, CAST(N'2016-12-19 16:50:11.957' AS DateTime), N'Delete', N'Delete Content of Type 1075 performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (114, 0, 1075, CAST(N'2016-12-19 16:50:12.450' AS DateTime), N'Delete', N'Delete ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (115, 0, -1, CAST(N'2016-12-19 16:50:19.177' AS DateTime), N'Delete', N'Delete Content of Type 1080 performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (116, 0, 1080, CAST(N'2016-12-19 16:50:19.207' AS DateTime), N'Delete', N'Delete ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (117, 0, -1, CAST(N'2016-12-19 16:50:34.777' AS DateTime), N'Delete', N'Delete Content of Type 1078 performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (118, 0, 1078, CAST(N'2016-12-19 16:50:34.973' AS DateTime), N'Delete', N'Delete ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (119, 0, 1083, CAST(N'2016-12-19 16:50:45.787' AS DateTime), N'Delete', N'Delete Template performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (120, 0, 1082, CAST(N'2016-12-19 16:51:05.790' AS DateTime), N'Delete', N'Delete Template performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (121, 0, 1081, CAST(N'2016-12-19 16:51:10.213' AS DateTime), N'Delete', N'Delete Template performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (122, 0, 1074, CAST(N'2016-12-19 16:51:20.467' AS DateTime), N'Delete', N'Delete Template performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (123, 0, 1079, CAST(N'2016-12-19 16:51:25.710' AS DateTime), N'Delete', N'Delete Template performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (124, 0, 1077, CAST(N'2016-12-19 16:51:36.113' AS DateTime), N'Delete', N'Delete Template performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (125, 0, 1070, CAST(N'2016-12-19 16:52:04.633' AS DateTime), N'UnPublish', N'UnPublish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (126, 0, 1070, CAST(N'2016-12-19 16:52:04.777' AS DateTime), N'Delete', N'Trashed content with Id: ''1070'' related to original parent content with Id: ''1056''')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (127, 0, 1070, CAST(N'2016-12-19 16:52:04.807' AS DateTime), N'Move', N'Move Content to Recycle Bin performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (128, 0, 1071, CAST(N'2016-12-19 16:52:31.273' AS DateTime), N'UnPublish', N'UnPublish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (129, 0, 1071, CAST(N'2016-12-19 16:52:31.323' AS DateTime), N'Delete', N'Trashed content with Id: ''1071'' related to original parent content with Id: ''1056''')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (130, 0, 1071, CAST(N'2016-12-19 16:52:31.340' AS DateTime), N'Move', N'Move Content to Recycle Bin performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (131, 0, 1072, CAST(N'2016-12-19 16:52:37.050' AS DateTime), N'UnPublish', N'UnPublish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (132, 0, 1072, CAST(N'2016-12-19 16:52:37.163' AS DateTime), N'Delete', N'Trashed content with Id: ''1072'' related to original parent content with Id: ''1056''')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (133, 0, 1072, CAST(N'2016-12-19 16:52:37.173' AS DateTime), N'Move', N'Move Content to Recycle Bin performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (134, 0, 1072, CAST(N'2016-12-19 16:52:46.513' AS DateTime), N'Delete', N'Delete Content performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (135, 0, 1071, CAST(N'2016-12-19 16:52:52.690' AS DateTime), N'Delete', N'Delete Content performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (136, 0, 1070, CAST(N'2016-12-19 16:52:57.390' AS DateTime), N'Delete', N'Delete Content performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (137, 0, 1084, CAST(N'2016-12-19 16:56:57.170' AS DateTime), N'Save', N'Save Template performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (138, 0, 1085, CAST(N'2016-12-19 16:56:57.407' AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (139, 0, 1084, CAST(N'2016-12-19 16:57:47.390' AS DateTime), N'Save', N'Save Template performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (140, 0, 1084, CAST(N'2016-12-19 17:00:08.127' AS DateTime), N'Save', N'Save Template performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (141, 0, 1084, CAST(N'2016-12-19 17:00:15.297' AS DateTime), N'Save', N'Save Template performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (142, 0, 1085, CAST(N'2016-12-19 17:06:33.180' AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (143, 0, 1052, CAST(N'2016-12-19 17:12:55.663' AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (144, 0, 0, CAST(N'2016-12-19 17:13:12.273' AS DateTime), N'New', N'Content '''' was created')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (145, 0, 1086, CAST(N'2016-12-19 17:13:28.120' AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (146, 0, 1087, CAST(N'2016-12-19 17:13:53.010' AS DateTime), N'Save', N'Save Template performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (147, 0, 1088, CAST(N'2016-12-19 17:13:53.040' AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (148, 0, 1052, CAST(N'2016-12-19 17:15:24.933' AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (149, 0, 0, CAST(N'2016-12-19 17:15:39.080' AS DateTime), N'New', N'Content '''' was created')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (150, 0, 1089, CAST(N'2016-12-19 17:19:53.837' AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (151, 0, 1090, CAST(N'2016-12-19 17:35:19.623' AS DateTime), N'Save', N'Save Template performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (152, 0, 1091, CAST(N'2016-12-19 17:35:19.730' AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (153, 0, 1052, CAST(N'2016-12-19 17:35:39.873' AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (154, 0, 0, CAST(N'2016-12-19 17:36:32.203' AS DateTime), N'New', N'Content '''' was created')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (155, 0, 1092, CAST(N'2016-12-19 17:36:51.953' AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (156, 0, 1084, CAST(N'2016-12-19 17:43:26.417' AS DateTime), N'Save', N'Save Template performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (157, 0, 1087, CAST(N'2016-12-19 17:44:03.470' AS DateTime), N'Save', N'Save Template performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (158, 0, 1090, CAST(N'2016-12-19 17:44:11.310' AS DateTime), N'Save', N'Save Template performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (159, 0, 1093, CAST(N'2016-12-21 16:56:54.117' AS DateTime), N'Save', N'Save Template performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (160, 0, 1094, CAST(N'2016-12-21 16:56:55.047' AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (161, 0, 1052, CAST(N'2016-12-21 16:57:08.763' AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (162, 0, 0, CAST(N'2016-12-21 16:57:42.270' AS DateTime), N'New', N'Content '''' was created')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (163, 0, 1095, CAST(N'2016-12-21 16:58:29.307' AS DateTime), N'Publish', N'Save and Publish performed by user')
SET IDENTITY_INSERT [dbo].[umbracoLog] OFF
SET IDENTITY_INSERT [dbo].[umbracoMigration] ON 

INSERT [dbo].[umbracoMigration] ([id], [name], [createDate], [version]) VALUES (1, N'Umbraco', CAST(N'2016-12-13 15:34:01.970' AS DateTime), N'7.5.6')
SET IDENTITY_INSERT [dbo].[umbracoMigration] OFF
SET IDENTITY_INSERT [dbo].[umbracoNode] ON 

INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (-331, 0, -1, 0, 1, N'-1,-331', 1, N'0af5e610-a310-4b6f-925f-e928d5416af7', N'LOCK: Servers', N'87a9f1ff-b1e4-4a25-babb-465a4a47ec41', CAST(N'2016-12-13 15:34:00.153' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (-97, 0, -1, 0, 1, N'-1,-97', 2, N'aa2c52a0-ce87-4e65-a47c-7df09358585d', N'List View - Members', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2016-12-13 15:34:00.150' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (-96, 0, -1, 0, 1, N'-1,-96', 2, N'3a0156c4-3b8c-4803-bdc1-6871faa83fff', N'List View - Media', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2016-12-13 15:34:00.147' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (-95, 0, -1, 0, 1, N'-1,-95', 2, N'c0808dd3-8133-4e4b-8ce8-e2bea84a96a4', N'List View - Content', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2016-12-13 15:34:00.147' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (-92, 0, -1, 0, 1, N'-1,-92', 35, N'f0bc4bfb-b499-40d6-ba86-058885a5178c', N'Label', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2016-12-13 15:34:00.140' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (-90, 0, -1, 0, 1, N'-1,-90', 34, N'84c6b441-31df-4ffe-b67e-67d5bc3ae65a', N'Upload', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2016-12-13 15:34:00.140' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (-89, 0, -1, 0, 1, N'-1,-89', 33, N'c6bac0dd-4ab9-45b1-8e30-e4b619ee5da3', N'Textarea', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2016-12-13 15:34:00.140' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (-88, 0, -1, 0, 1, N'-1,-88', 32, N'0cc0eba1-9960-42c9-bf9b-60e150b429ae', N'Textstring', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2016-12-13 15:34:00.143' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (-87, 0, -1, 0, 1, N'-1,-87', 4, N'ca90c950-0aff-4e72-b976-a30b1ac57dad', N'Richtext editor', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2016-12-13 15:34:00.143' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (-51, 0, -1, 0, 1, N'-1,-51', 2, N'2e6d3631-066e-44b8-aec4-96f09099b2b5', N'Numeric', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2016-12-13 15:34:00.143' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (-49, 0, -1, 0, 1, N'-1,-49', 2, N'92897bc6-a5f3-4ffe-ae27-f2e7e33dda49', N'True/false', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2016-12-13 15:34:00.143' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (-43, 0, -1, 0, 1, N'-1,-43', 2, N'fbaf13a8-4036-41f2-93a3-974f678c312a', N'Checkbox list', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2016-12-13 15:34:00.143' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (-42, 0, -1, 0, 1, N'-1,-42', 2, N'0b6a45e7-44ba-430d-9da5-4e46060b9e03', N'Dropdown', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2016-12-13 15:34:00.147' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (-41, 0, -1, 0, 1, N'-1,-41', 2, N'5046194e-4237-453c-a547-15db3a07c4e1', N'Date Picker', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2016-12-13 15:34:00.147' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (-40, 0, -1, 0, 1, N'-1,-40', 2, N'bb5f57c9-ce2b-4bb9-b697-4caca783a805', N'Radiobox', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2016-12-13 15:34:00.147' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (-39, 0, -1, 0, 1, N'-1,-39', 2, N'f38f0ac7-1d27-439c-9f3f-089cd8825a53', N'Dropdown multiple', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2016-12-13 15:34:00.147' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (-37, 0, -1, 0, 1, N'-1,-37', 2, N'0225af17-b302-49cb-9176-b9f35cab9c17', N'Approved Color', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2016-12-13 15:34:00.147' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (-36, 0, -1, 0, 1, N'-1,-36', 2, N'e4d66c0f-b935-4200-81f0-025f7256b89a', N'Date Picker with time', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2016-12-13 15:34:00.147' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (-21, 0, -1, 0, 0, N'-1,-21', 0, N'bf7c7cbc-952f-4518-97a2-69e9c7b33842', N'Recycle Bin', N'cf3d8e34-1c1c-41e9-ae56-878b57b32113', CAST(N'2016-12-13 15:34:00.140' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (-20, 0, -1, 0, 0, N'-1,-20', 0, N'0f582a79-1e41-4cf0-bfa0-76340651891a', N'Recycle Bin', N'01bb7ff2-24dc-4c0c-95a2-c24ef72bbac8', CAST(N'2016-12-13 15:34:00.140' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (-1, 0, -1, 0, 0, N'-1', 0, N'916724a5-173d-4619-b97e-b9de133dd6f5', N'SYSTEM DATA: umbraco master root', N'ea7d8624-4cfe-4578-a871-24aa946bf34d', CAST(N'2016-12-13 15:34:00.107' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1031, 0, -1, 0, 1, N'-1,1031', 2, N'f38bd2d7-65d0-48e6-95dc-87ce06ec2d3d', N'Folder', N'4ea4382b-2f5a-4c2b-9587-ae9b3cf3602e', CAST(N'2016-12-13 15:34:00.150' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1032, 0, -1, 0, 1, N'-1,1032', 2, N'cc07b313-0843-4aa8-bbda-871c8da728c8', N'Image', N'4ea4382b-2f5a-4c2b-9587-ae9b3cf3602e', CAST(N'2016-12-13 15:34:00.150' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1033, 0, -1, 0, 1, N'-1,1033', 2, N'4c52d8ab-54e6-40cd-999c-7a5f24903e4d', N'File', N'4ea4382b-2f5a-4c2b-9587-ae9b3cf3602e', CAST(N'2016-12-13 15:34:00.150' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1034, 0, -1, 0, 1, N'-1,1034', 2, N'a6857c73-d6e9-480c-b6e6-f15f6ad11125', N'Content Picker', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2016-12-13 15:34:00.150' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1035, 0, -1, 0, 1, N'-1,1035', 2, N'93929b9a-93a2-4e2a-b239-d99334440a59', N'Media Picker', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2016-12-13 15:34:00.150' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1036, 0, -1, 0, 1, N'-1,1036', 2, N'2b24165f-9782-4aa3-b459-1de4a4d21f60', N'Member Picker', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2016-12-13 15:34:00.150' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1040, 0, -1, 0, 1, N'-1,1040', 2, N'21e798da-e06e-4eda-a511-ed257f78d4fa', N'Related Links', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2016-12-13 15:34:00.150' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1041, 0, -1, 0, 1, N'-1,1041', 2, N'b6b73142-b9c1-4bf8-a16d-e1c23320b549', N'Tags', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2016-12-13 15:34:00.153' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1043, 0, -1, 0, 1, N'-1,1043', 2, N'1df9f033-e6d4-451f-b8d2-e0cbc50a836f', N'Image Cropper', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2016-12-13 15:34:00.153' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1044, 0, -1, 0, 1, N'-1,1044', 0, N'd59be02f-1df9-4228-aa1e-01917d806cda', N'Member', N'9b5416fb-e72f-45a9-a07b-5a9a2709ce43', CAST(N'2016-12-13 15:34:00.153' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1045, 0, -1, 0, 1, N'-1,1045', 2, N'7e3962cc-ce20-4ffc-b661-5897a894ba7e', N'Multiple Media Picker', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2016-12-13 15:34:00.153' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1046, 0, -1, NULL, 1, N'-1,1046', 0, N'd4630185-7c70-46ec-82a1-104c4e88f0cc', N'Layout', N'6fbde604-4178-42ce-a10b-8a2600a2f07d', CAST(N'2016-12-13 15:34:39.510' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1047, 0, 1046, NULL, 1, N'-1,1046,1047', 0, N'3af564f2-3bde-45f7-a184-3782604eeabb', N'HomePage', N'6fbde604-4178-42ce-a10b-8a2600a2f07d', CAST(N'2016-12-13 15:34:39.637' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1048, 0, 1046, NULL, 1, N'-1,1046,1048', 0, N'60671e08-da0e-46e8-a959-7e4a4e49141c', N'News Item', N'6fbde604-4178-42ce-a10b-8a2600a2f07d', CAST(N'2016-12-13 15:34:39.667' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1049, 0, 1046, NULL, 1, N'-1,1046,1049', 0, N'dc463235-0eeb-40fc-8ad5-5baa1acc5a5b', N'News Overview', N'6fbde604-4178-42ce-a10b-8a2600a2f07d', CAST(N'2016-12-13 15:34:39.680' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1050, 0, 1046, NULL, 1, N'-1,1046,1050', 0, N'06d8dd88-a8c8-4910-afb6-29f8065dfd99', N'Text Page', N'6fbde604-4178-42ce-a10b-8a2600a2f07d', CAST(N'2016-12-13 15:34:39.693' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1051, 0, -1, 0, 1, N'-1,1051', 0, N'8a2db26f-2a3b-4899-adb9-787439b332bf', N'Master', N'a2cb7800-f571-4787-9638-bc48539a0efb', CAST(N'2016-12-13 15:34:39.977' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1052, 0, 1051, 0, 2, N'-1,1051,1052', 9, N'c27b04c0-b102-40cd-ba5a-287d8ddce19b', N'Home', N'a2cb7800-f571-4787-9638-bc48539a0efb', CAST(N'2016-12-13 15:34:40.030' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1053, 0, 1051, 0, 2, N'-1,1051,1053', 1, N'51cb708d-cc3f-489e-ab96-cd913caf5e03', N'News Item', N'a2cb7800-f571-4787-9638-bc48539a0efb', CAST(N'2016-12-13 15:34:40.060' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1054, 0, 1051, 0, 2, N'-1,1051,1054', 2, N'48c13f90-8c1e-426d-a872-04d7591e6afe', N'News Overview', N'a2cb7800-f571-4787-9638-bc48539a0efb', CAST(N'2016-12-13 15:34:40.070' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1055, 0, 1051, 0, 2, N'-1,1051,1055', 5, N'94770bd1-7431-40a7-9c2f-ff21a70918a5', N'Text Page', N'a2cb7800-f571-4787-9638-bc48539a0efb', CAST(N'2016-12-13 15:34:40.073' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1056, 0, -1, 0, 1, N'-1,1056', 0, N'b5ad3353-cdc0-4743-ba86-dea44a401b85', N'Home', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', CAST(N'2016-12-13 15:34:40.740' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1057, 1, -20, 0, 1, N'-1,-20,1057', 1, N'bb138c5a-e3cc-4aa1-a385-252332b5d333', N'Getting Started', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', CAST(N'2016-12-13 15:34:40.860' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1058, 1, -20, 0, 1, N'-1,-20,1058', 2, N'd6d0da43-34a7-493f-bb6d-b3691ea6cabe', N'Go Further', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', CAST(N'2016-12-13 15:34:40.873' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1059, 1, -20, 0, 1, N'-1,-20,1059', 3, N'f4605439-ee73-4abf-b026-941c51fc5403', N'Installing Modules', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', CAST(N'2016-12-13 15:34:40.883' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1060, 1, -20, 0, 1, N'-1,-20,1060', 4, N'0911d7e9-c381-4ed4-8845-e5c107af4db6', N'About', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', CAST(N'2016-12-13 15:34:40.920' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1061, 0, 1056, 0, 2, N'-1,1056,1061', 4, N'3b6561bf-3756-4d95-8838-c6cdea523180', N'News', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', CAST(N'2016-12-13 15:34:40.957' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1062, 0, 1061, 0, 3, N'-1,1056,1061,1062', 0, N'85c99fab-dd88-43eb-86a0-1ec1e51ebc8a', N'The 10 remarkable features of object', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', CAST(N'2016-12-13 15:34:40.993' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1063, 0, 1061, 0, 3, N'-1,1056,1061,1063', 1, N'656160c9-481a-4c61-a03d-16a50918bdee', N'This is a wonderful news item', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', CAST(N'2016-12-13 15:34:41.067' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1064, 0, 1061, 0, 3, N'-1,1056,1061,1064', 2, N'7d3f85db-ce76-4dfd-b3f0-9789de3ff128', N'You really need to read this!', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', CAST(N'2016-12-13 15:34:41.083' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1065, 0, 1061, 0, 3, N'-1,1056,1061,1065', 3, N'28bbdd81-0a37-4935-a34c-8eca44654580', N'Txt Starter Kit For Umbraco Released', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', CAST(N'2016-12-13 15:34:41.093' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1066, 0, -1, NULL, 1, N'-1,1066', 0, N'd7e60439-f0ff-485f-b97e-6863ce7592ff', N'NewsPage', N'6fbde604-4178-42ce-a10b-8a2600a2f07d', CAST(N'2016-12-13 15:40:36.473' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1067, 0, -1, 0, 1, N'-1,1067', 3, N'cc14d4f1-67e4-4a24-ba61-e6f4339257f1', N'NewsPage', N'a2cb7800-f571-4787-9638-bc48539a0efb', CAST(N'2016-12-13 15:40:36.577' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1069, 0, -1, 0, 1, N'-1,1069', 24, N'48969c65-9a29-4bdc-a9c9-01f9b877b9c3', N'NewsPage - Content - Rich Text Editor', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2016-12-15 16:47:58.473' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1073, 0, -1, 0, 1, N'-1,1073', 25, N'0278d628-d526-408a-ae19-5d8b86741ef5', N'List View - category', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2016-12-19 15:15:04.810' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1076, 0, -1, 0, 1, N'-1,1076', 26, N'eb0ac98b-d619-43b1-bffc-45b2b9503f16', N'List View - product', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2016-12-19 15:16:43.697' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1084, 0, 1046, NULL, 1, N'-1,1046,1084', 0, N'3e6157d7-4aad-4d84-9d1d-1ac9f7efc495', N'Category', N'6fbde604-4178-42ce-a10b-8a2600a2f07d', CAST(N'2016-12-19 16:56:57.073' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1085, 0, -1, 0, 1, N'-1,1085', 4, N'730cd283-201c-427e-8c86-59293a58f8e1', N'Category', N'a2cb7800-f571-4787-9638-bc48539a0efb', CAST(N'2016-12-19 16:56:57.250' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1086, 0, 1056, 0, 2, N'-1,1056,1086', 5, N'4d95bde3-d7a0-4d9a-b99b-eab8241e7605', N'Category', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', CAST(N'2016-12-19 17:13:27.977' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1087, 0, 1046, NULL, 1, N'-1,1046,1087', 0, N'c6d2e79a-7a8b-44d3-aec6-8c3e89261051', N'Product', N'6fbde604-4178-42ce-a10b-8a2600a2f07d', CAST(N'2016-12-19 17:13:52.990' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1088, 0, -1, 0, 1, N'-1,1088', 3, N'3b13c884-6b65-4941-ab87-b04c8be7ccc7', N'Product', N'a2cb7800-f571-4787-9638-bc48539a0efb', CAST(N'2016-12-19 17:13:53.017' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1089, 0, 1056, 0, 2, N'-1,1056,1089', 6, N'2dd89232-9545-40f1-b2a8-c089dd41f966', N'Product', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', CAST(N'2016-12-19 17:19:53.753' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1090, 0, 1046, NULL, 1, N'-1,1046,1090', 0, N'06a18dac-f198-4b8c-beb8-d90889feaa21', N'Dealer Locator', N'6fbde604-4178-42ce-a10b-8a2600a2f07d', CAST(N'2016-12-19 17:35:19.557' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1091, 0, -1, 0, 1, N'-1,1091', 4, N'10b87443-b810-4f24-b862-7b651b0ef7e6', N'Dealer Locator', N'a2cb7800-f571-4787-9638-bc48539a0efb', CAST(N'2016-12-19 17:35:19.647' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1092, 0, 1056, 0, 2, N'-1,1056,1092', 7, N'6b4110ce-6e66-4faf-af5f-f6de31ac65df', N'Dealer Locator', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', CAST(N'2016-12-19 17:36:51.820' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1093, 0, -1, NULL, 1, N'-1,1093', 0, N'4b9d46c3-a0e2-4982-a82a-d000b7cc4cb2', N'ContactPage', N'6fbde604-4178-42ce-a10b-8a2600a2f07d', CAST(N'2016-12-21 16:56:53.573' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1094, 0, -1, 0, 1, N'-1,1094', 5, N'7d4462a5-71dc-41d8-9a97-22657aa660d5', N'ContactPage', N'a2cb7800-f571-4787-9638-bc48539a0efb', CAST(N'2016-12-21 16:56:54.650' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1095, 0, 1056, 0, 2, N'-1,1056,1095', 8, N'556f9b10-4c03-4bf0-ba9f-74a45280a961', N'Contact', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', CAST(N'2016-12-21 16:58:28.977' AS DateTime))
SET IDENTITY_INSERT [dbo].[umbracoNode] OFF
SET IDENTITY_INSERT [dbo].[umbracoRelation] ON 

INSERT [dbo].[umbracoRelation] ([id], [parentId], [childId], [relType], [datetime], [comment]) VALUES (2, 1056, 1057, 2, CAST(N'2016-12-19 14:24:19.193' AS DateTime), N'')
INSERT [dbo].[umbracoRelation] ([id], [parentId], [childId], [relType], [datetime], [comment]) VALUES (3, 1056, 1058, 2, CAST(N'2016-12-19 14:24:23.633' AS DateTime), N'')
INSERT [dbo].[umbracoRelation] ([id], [parentId], [childId], [relType], [datetime], [comment]) VALUES (4, 1056, 1059, 2, CAST(N'2016-12-19 14:24:27.977' AS DateTime), N'')
INSERT [dbo].[umbracoRelation] ([id], [parentId], [childId], [relType], [datetime], [comment]) VALUES (5, 1056, 1060, 2, CAST(N'2016-12-19 14:24:33.080' AS DateTime), N'')
SET IDENTITY_INSERT [dbo].[umbracoRelation] OFF
SET IDENTITY_INSERT [dbo].[umbracoRelationType] ON 

INSERT [dbo].[umbracoRelationType] ([id], [dual], [parentObjectType], [childObjectType], [name], [alias]) VALUES (1, 1, N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', N'Relate Document On Copy', N'relateDocumentOnCopy')
INSERT [dbo].[umbracoRelationType] ([id], [dual], [parentObjectType], [childObjectType], [name], [alias]) VALUES (2, 0, N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', N'Relate Parent Document On Delete', N'relateParentDocumentOnDelete')
SET IDENTITY_INSERT [dbo].[umbracoRelationType] OFF
SET IDENTITY_INSERT [dbo].[umbracoServer] ON 

INSERT [dbo].[umbracoServer] ([id], [address], [computerName], [registeredDate], [lastNotifiedDate], [isActive], [isMaster]) VALUES (1, N'http://localhost:62845/umbraco', N'HN-SD-0381-WK//LM/W3SVC/2/ROOT', CAST(N'2016-12-13 15:35:22.450' AS DateTime), CAST(N'2016-12-23 12:41:17.543' AS DateTime), 1, 1)
INSERT [dbo].[umbracoServer] ([id], [address], [computerName], [registeredDate], [lastNotifiedDate], [isActive], [isMaster]) VALUES (2, N'http://localhost:80/umbraco', N'HN-SD-0381-WK//LM/W3SVC/10/ROOT', CAST(N'2016-12-20 16:56:08.140' AS DateTime), CAST(N'2016-12-22 13:21:51.643' AS DateTime), 0, 0)
SET IDENTITY_INSERT [dbo].[umbracoServer] OFF
SET IDENTITY_INSERT [dbo].[umbracoUser] ON 

INSERT [dbo].[umbracoUser] ([id], [userDisabled], [userNoConsole], [userType], [startStructureID], [startMediaID], [userName], [userLogin], [userPassword], [userEmail], [userLanguage], [securityStampToken], [failedLoginAttempts], [lastLockoutDate], [lastPasswordChangeDate], [lastLoginDate]) VALUES (0, 0, 0, 1, -1, -1, N'HarveyNash', N'manhnv83@gmail.com', N'dSJ3IcXb3Y8KebvHnbbVsxCSbHU=', N'manhnv83@gmail.com', N'en-GB', N'5a2d8308-8a7f-4d87-9357-f22c144c4473', 0, NULL, CAST(N'2016-12-13 15:34:02.423' AS DateTime), CAST(N'2016-12-22 16:56:25.307' AS DateTime))
SET IDENTITY_INSERT [dbo].[umbracoUser] OFF
INSERT [dbo].[umbracoUser2app] ([user], [app]) VALUES (0, N'content')
INSERT [dbo].[umbracoUser2app] ([user], [app]) VALUES (0, N'developer')
INSERT [dbo].[umbracoUser2app] ([user], [app]) VALUES (0, N'forms')
INSERT [dbo].[umbracoUser2app] ([user], [app]) VALUES (0, N'media')
INSERT [dbo].[umbracoUser2app] ([user], [app]) VALUES (0, N'member')
INSERT [dbo].[umbracoUser2app] ([user], [app]) VALUES (0, N'settings')
INSERT [dbo].[umbracoUser2app] ([user], [app]) VALUES (0, N'users')
SET IDENTITY_INSERT [dbo].[umbracoUserType] ON 

INSERT [dbo].[umbracoUserType] ([id], [userTypeAlias], [userTypeName], [userTypeDefaultPermissions]) VALUES (1, N'admin', N'Administrators', N'CADMOSKTPIURZ:5F7')
INSERT [dbo].[umbracoUserType] ([id], [userTypeAlias], [userTypeName], [userTypeDefaultPermissions]) VALUES (2, N'writer', N'Writer', N'CAH:F')
INSERT [dbo].[umbracoUserType] ([id], [userTypeAlias], [userTypeName], [userTypeDefaultPermissions]) VALUES (3, N'editor', N'Editors', N'CADMOSKTPUZ:5F')
INSERT [dbo].[umbracoUserType] ([id], [userTypeAlias], [userTypeName], [userTypeDefaultPermissions]) VALUES (4, N'translator', N'Translator', N'AF')
SET IDENTITY_INSERT [dbo].[umbracoUserType] OFF
/****** Object:  Index [IX_cmsContent]    Script Date: 12/23/2016 2:55:45 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_cmsContent] ON [dbo].[cmsContent]
(
	[nodeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_cmsContentType]    Script Date: 12/23/2016 2:55:45 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_cmsContentType] ON [dbo].[cmsContentType]
(
	[nodeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_cmsContentType_icon]    Script Date: 12/23/2016 2:55:45 PM ******/
CREATE NONCLUSTERED INDEX [IX_cmsContentType_icon] ON [dbo].[cmsContentType]
(
	[icon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_cmsContentVersion_ContentId]    Script Date: 12/23/2016 2:55:45 PM ******/
CREATE NONCLUSTERED INDEX [IX_cmsContentVersion_ContentId] ON [dbo].[cmsContentVersion]
(
	[ContentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_cmsContentVersion_VersionId]    Script Date: 12/23/2016 2:55:45 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_cmsContentVersion_VersionId] ON [dbo].[cmsContentVersion]
(
	[VersionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_cmsDataType_nodeId]    Script Date: 12/23/2016 2:55:45 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_cmsDataType_nodeId] ON [dbo].[cmsDataType]
(
	[nodeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_cmsDictionary_id]    Script Date: 12/23/2016 2:55:45 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_cmsDictionary_id] ON [dbo].[cmsDictionary]
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_cmsDocument]    Script Date: 12/23/2016 2:55:45 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_cmsDocument] ON [dbo].[cmsDocument]
(
	[nodeId] ASC,
	[versionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_cmsDocument_newest]    Script Date: 12/23/2016 2:55:45 PM ******/
CREATE NONCLUSTERED INDEX [IX_cmsDocument_newest] ON [dbo].[cmsDocument]
(
	[newest] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_cmsDocument_published]    Script Date: 12/23/2016 2:55:45 PM ******/
CREATE NONCLUSTERED INDEX [IX_cmsDocument_published] ON [dbo].[cmsDocument]
(
	[published] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_cmsMacroPropertyAlias]    Script Date: 12/23/2016 2:55:45 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_cmsMacroPropertyAlias] ON [dbo].[cmsMacro]
(
	[macroAlias] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_cmsMacroProperty_Alias]    Script Date: 12/23/2016 2:55:45 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_cmsMacroProperty_Alias] ON [dbo].[cmsMacroProperty]
(
	[macro] ASC,
	[macroPropertyAlias] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_cmsPropertyData_1]    Script Date: 12/23/2016 2:55:45 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_cmsPropertyData_1] ON [dbo].[cmsPropertyData]
(
	[contentNodeId] ASC,
	[versionId] ASC,
	[propertytypeid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_cmsPropertyData_2]    Script Date: 12/23/2016 2:55:45 PM ******/
CREATE NONCLUSTERED INDEX [IX_cmsPropertyData_2] ON [dbo].[cmsPropertyData]
(
	[versionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_cmsPropertyData_3]    Script Date: 12/23/2016 2:55:45 PM ******/
CREATE NONCLUSTERED INDEX [IX_cmsPropertyData_3] ON [dbo].[cmsPropertyData]
(
	[propertytypeid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_cmsPropertyTypeUniqueID]    Script Date: 12/23/2016 2:55:45 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_cmsPropertyTypeUniqueID] ON [dbo].[cmsPropertyType]
(
	[UniqueID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_cmsPropertyTypeGroupUniqueID]    Script Date: 12/23/2016 2:55:45 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_cmsPropertyTypeGroupUniqueID] ON [dbo].[cmsPropertyTypeGroup]
(
	[uniqueID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_cmsTags]    Script Date: 12/23/2016 2:55:45 PM ******/
CREATE NONCLUSTERED INDEX [IX_cmsTags] ON [dbo].[cmsTags]
(
	[tag] ASC,
	[group] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_cmsTaskType_alias]    Script Date: 12/23/2016 2:55:45 PM ******/
CREATE NONCLUSTERED INDEX [IX_cmsTaskType_alias] ON [dbo].[cmsTaskType]
(
	[alias] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_cmsTemplate_nodeId]    Script Date: 12/23/2016 2:55:45 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_cmsTemplate_nodeId] ON [dbo].[cmsTemplate]
(
	[nodeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_umbracoAccess_nodeId]    Script Date: 12/23/2016 2:55:45 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_umbracoAccess_nodeId] ON [dbo].[umbracoAccess]
(
	[nodeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_umbracoAccessRule]    Script Date: 12/23/2016 2:55:45 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_umbracoAccessRule] ON [dbo].[umbracoAccessRule]
(
	[ruleValue] ASC,
	[ruleType] ASC,
	[accessId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_umbracoDeployChecksum]    Script Date: 12/23/2016 2:55:45 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_umbracoDeployChecksum] ON [dbo].[umbracoDeployChecksum]
(
	[entityType] ASC,
	[entityGuid] ASC,
	[entityPath] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_umbracoLanguage_languageISOCode]    Script Date: 12/23/2016 2:55:45 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_umbracoLanguage_languageISOCode] ON [dbo].[umbracoLanguage]
(
	[languageISOCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_umbracoLog]    Script Date: 12/23/2016 2:55:45 PM ******/
CREATE NONCLUSTERED INDEX [IX_umbracoLog] ON [dbo].[umbracoLog]
(
	[NodeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_umbracoMigration]    Script Date: 12/23/2016 2:55:45 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_umbracoMigration] ON [dbo].[umbracoMigration]
(
	[name] ASC,
	[version] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_umbracoNodeObjectType]    Script Date: 12/23/2016 2:55:45 PM ******/
CREATE NONCLUSTERED INDEX [IX_umbracoNodeObjectType] ON [dbo].[umbracoNode]
(
	[nodeObjectType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_umbracoNodeParentId]    Script Date: 12/23/2016 2:55:45 PM ******/
CREATE NONCLUSTERED INDEX [IX_umbracoNodeParentId] ON [dbo].[umbracoNode]
(
	[parentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_umbracoNodeTrashed]    Script Date: 12/23/2016 2:55:45 PM ******/
CREATE NONCLUSTERED INDEX [IX_umbracoNodeTrashed] ON [dbo].[umbracoNode]
(
	[trashed] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_umbracoNodeUniqueID]    Script Date: 12/23/2016 2:55:45 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_umbracoNodeUniqueID] ON [dbo].[umbracoNode]
(
	[uniqueID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_umbracoRedirectUrl]    Script Date: 12/23/2016 2:55:45 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_umbracoRedirectUrl] ON [dbo].[umbracoRedirectUrl]
(
	[urlHash] ASC,
	[contentKey] ASC,
	[createDateUtc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_computerName]    Script Date: 12/23/2016 2:55:45 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_computerName] ON [dbo].[umbracoServer]
(
	[computerName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_umbracoServer_isActive]    Script Date: 12/23/2016 2:55:45 PM ******/
CREATE NONCLUSTERED INDEX [IX_umbracoServer_isActive] ON [dbo].[umbracoServer]
(
	[isActive] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_umbracoUser_userLogin]    Script Date: 12/23/2016 2:55:45 PM ******/
CREATE NONCLUSTERED INDEX [IX_umbracoUser_userLogin] ON [dbo].[umbracoUser]
(
	[userLogin] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[cmsMacro] ADD  CONSTRAINT [DF_cmsMacro_macroUseInEditor]  DEFAULT ('0') FOR [macroUseInEditor]
GO
ALTER TABLE [dbo].[cmsMacro] ADD  CONSTRAINT [DF_cmsMacro_macroRefreshRate]  DEFAULT ('0') FOR [macroRefreshRate]
GO
ALTER TABLE [dbo].[cmsMacro] ADD  CONSTRAINT [DF_cmsMacro_macroCacheByPage]  DEFAULT ('1') FOR [macroCacheByPage]
GO
ALTER TABLE [dbo].[cmsMacro] ADD  CONSTRAINT [DF_cmsMacro_macroCachePersonalized]  DEFAULT ('0') FOR [macroCachePersonalized]
GO
ALTER TABLE [dbo].[cmsMacro] ADD  CONSTRAINT [DF_cmsMacro_macroDontRender]  DEFAULT ('0') FOR [macroDontRender]
GO
ALTER TABLE [dbo].[cmsMacroProperty] ADD  CONSTRAINT [DF_cmsMacroProperty_macroPropertySortOrder]  DEFAULT ('0') FOR [macroPropertySortOrder]
GO
ALTER TABLE [dbo].[cmsMember] ADD  CONSTRAINT [DF_cmsMember_Email]  DEFAULT ('''') FOR [Email]
GO
ALTER TABLE [dbo].[cmsMember] ADD  CONSTRAINT [DF_cmsMember_LoginName]  DEFAULT ('''') FOR [LoginName]
GO
ALTER TABLE [dbo].[cmsMember] ADD  CONSTRAINT [DF_cmsMember_Password]  DEFAULT ('''') FOR [Password]
GO
ALTER TABLE [dbo].[cmsMemberType] ADD  CONSTRAINT [DF_cmsMemberType_memberCanEdit]  DEFAULT ('0') FOR [memberCanEdit]
GO
ALTER TABLE [dbo].[cmsMemberType] ADD  CONSTRAINT [DF_cmsMemberType_viewOnProfile]  DEFAULT ('0') FOR [viewOnProfile]
GO
ALTER TABLE [dbo].[cmsTask] ADD  CONSTRAINT [DF_cmsTask_closed]  DEFAULT ('0') FOR [closed]
GO
ALTER TABLE [dbo].[cmsTask] ADD  CONSTRAINT [DF_cmsTask_DateTime]  DEFAULT (getdate()) FOR [DateTime]
GO
ALTER TABLE [dbo].[umbracoAccess] ADD  CONSTRAINT [DF_umbracoAccess_createDate]  DEFAULT (getdate()) FOR [createDate]
GO
ALTER TABLE [dbo].[umbracoAccess] ADD  CONSTRAINT [DF_umbracoAccess_updateDate]  DEFAULT (getdate()) FOR [updateDate]
GO
ALTER TABLE [dbo].[umbracoAccessRule] ADD  CONSTRAINT [DF_umbracoAccessRule_createDate]  DEFAULT (getdate()) FOR [createDate]
GO
ALTER TABLE [dbo].[umbracoAccessRule] ADD  CONSTRAINT [DF_umbracoAccessRule_updateDate]  DEFAULT (getdate()) FOR [updateDate]
GO
ALTER TABLE [dbo].[umbracoExternalLogin] ADD  CONSTRAINT [DF_umbracoExternalLogin_createDate]  DEFAULT (getdate()) FOR [createDate]
GO
ALTER TABLE [dbo].[umbReviews] ADD  DEFAULT ((1)) FOR [approved]
GO
ALTER TABLE [dbo].[umbReviews] ADD  DEFAULT ((0)) FOR [spam]
GO
ALTER TABLE [dbo].[cmsContent]  WITH CHECK ADD  CONSTRAINT [FK_cmsContent_cmsContentType_nodeId] FOREIGN KEY([contentType])
REFERENCES [dbo].[cmsContentType] ([nodeId])
GO
ALTER TABLE [dbo].[cmsContent] CHECK CONSTRAINT [FK_cmsContent_cmsContentType_nodeId]
GO
ALTER TABLE [dbo].[cmsContent]  WITH CHECK ADD  CONSTRAINT [FK_cmsContent_umbracoNode_id] FOREIGN KEY([nodeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[cmsContent] CHECK CONSTRAINT [FK_cmsContent_umbracoNode_id]
GO
ALTER TABLE [dbo].[cmsContentType]  WITH CHECK ADD  CONSTRAINT [FK_cmsContentType_umbracoNode_id] FOREIGN KEY([nodeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[cmsContentType] CHECK CONSTRAINT [FK_cmsContentType_umbracoNode_id]
GO
ALTER TABLE [dbo].[cmsContentType2ContentType]  WITH CHECK ADD  CONSTRAINT [FK_cmsContentType2ContentType_umbracoNode_child] FOREIGN KEY([childContentTypeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[cmsContentType2ContentType] CHECK CONSTRAINT [FK_cmsContentType2ContentType_umbracoNode_child]
GO
ALTER TABLE [dbo].[cmsContentType2ContentType]  WITH CHECK ADD  CONSTRAINT [FK_cmsContentType2ContentType_umbracoNode_parent] FOREIGN KEY([parentContentTypeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[cmsContentType2ContentType] CHECK CONSTRAINT [FK_cmsContentType2ContentType_umbracoNode_parent]
GO
ALTER TABLE [dbo].[cmsContentTypeAllowedContentType]  WITH CHECK ADD  CONSTRAINT [FK_cmsContentTypeAllowedContentType_cmsContentType] FOREIGN KEY([Id])
REFERENCES [dbo].[cmsContentType] ([nodeId])
GO
ALTER TABLE [dbo].[cmsContentTypeAllowedContentType] CHECK CONSTRAINT [FK_cmsContentTypeAllowedContentType_cmsContentType]
GO
ALTER TABLE [dbo].[cmsContentTypeAllowedContentType]  WITH CHECK ADD  CONSTRAINT [FK_cmsContentTypeAllowedContentType_cmsContentType1] FOREIGN KEY([AllowedId])
REFERENCES [dbo].[cmsContentType] ([nodeId])
GO
ALTER TABLE [dbo].[cmsContentTypeAllowedContentType] CHECK CONSTRAINT [FK_cmsContentTypeAllowedContentType_cmsContentType1]
GO
ALTER TABLE [dbo].[cmsContentVersion]  WITH CHECK ADD  CONSTRAINT [FK_cmsContentVersion_cmsContent_nodeId] FOREIGN KEY([ContentId])
REFERENCES [dbo].[cmsContent] ([nodeId])
GO
ALTER TABLE [dbo].[cmsContentVersion] CHECK CONSTRAINT [FK_cmsContentVersion_cmsContent_nodeId]
GO
ALTER TABLE [dbo].[cmsContentXml]  WITH CHECK ADD  CONSTRAINT [FK_cmsContentXml_cmsContent_nodeId] FOREIGN KEY([nodeId])
REFERENCES [dbo].[cmsContent] ([nodeId])
GO
ALTER TABLE [dbo].[cmsContentXml] CHECK CONSTRAINT [FK_cmsContentXml_cmsContent_nodeId]
GO
ALTER TABLE [dbo].[cmsDataType]  WITH CHECK ADD  CONSTRAINT [FK_cmsDataType_umbracoNode_id] FOREIGN KEY([nodeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[cmsDataType] CHECK CONSTRAINT [FK_cmsDataType_umbracoNode_id]
GO
ALTER TABLE [dbo].[cmsDataTypePreValues]  WITH CHECK ADD  CONSTRAINT [FK_cmsDataTypePreValues_cmsDataType_nodeId] FOREIGN KEY([datatypeNodeId])
REFERENCES [dbo].[cmsDataType] ([nodeId])
GO
ALTER TABLE [dbo].[cmsDataTypePreValues] CHECK CONSTRAINT [FK_cmsDataTypePreValues_cmsDataType_nodeId]
GO
ALTER TABLE [dbo].[cmsDictionary]  WITH CHECK ADD  CONSTRAINT [FK_cmsDictionary_cmsDictionary_id] FOREIGN KEY([parent])
REFERENCES [dbo].[cmsDictionary] ([id])
GO
ALTER TABLE [dbo].[cmsDictionary] CHECK CONSTRAINT [FK_cmsDictionary_cmsDictionary_id]
GO
ALTER TABLE [dbo].[cmsDocument]  WITH CHECK ADD  CONSTRAINT [FK_cmsDocument_cmsContent_nodeId] FOREIGN KEY([nodeId])
REFERENCES [dbo].[cmsContent] ([nodeId])
GO
ALTER TABLE [dbo].[cmsDocument] CHECK CONSTRAINT [FK_cmsDocument_cmsContent_nodeId]
GO
ALTER TABLE [dbo].[cmsDocument]  WITH CHECK ADD  CONSTRAINT [FK_cmsDocument_cmsTemplate_nodeId] FOREIGN KEY([templateId])
REFERENCES [dbo].[cmsTemplate] ([nodeId])
GO
ALTER TABLE [dbo].[cmsDocument] CHECK CONSTRAINT [FK_cmsDocument_cmsTemplate_nodeId]
GO
ALTER TABLE [dbo].[cmsDocument]  WITH CHECK ADD  CONSTRAINT [FK_cmsDocument_umbracoNode_id] FOREIGN KEY([nodeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[cmsDocument] CHECK CONSTRAINT [FK_cmsDocument_umbracoNode_id]
GO
ALTER TABLE [dbo].[cmsDocumentType]  WITH CHECK ADD  CONSTRAINT [FK_cmsDocumentType_cmsContentType_nodeId] FOREIGN KEY([contentTypeNodeId])
REFERENCES [dbo].[cmsContentType] ([nodeId])
GO
ALTER TABLE [dbo].[cmsDocumentType] CHECK CONSTRAINT [FK_cmsDocumentType_cmsContentType_nodeId]
GO
ALTER TABLE [dbo].[cmsDocumentType]  WITH CHECK ADD  CONSTRAINT [FK_cmsDocumentType_cmsTemplate_nodeId] FOREIGN KEY([templateNodeId])
REFERENCES [dbo].[cmsTemplate] ([nodeId])
GO
ALTER TABLE [dbo].[cmsDocumentType] CHECK CONSTRAINT [FK_cmsDocumentType_cmsTemplate_nodeId]
GO
ALTER TABLE [dbo].[cmsDocumentType]  WITH CHECK ADD  CONSTRAINT [FK_cmsDocumentType_umbracoNode_id] FOREIGN KEY([contentTypeNodeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[cmsDocumentType] CHECK CONSTRAINT [FK_cmsDocumentType_umbracoNode_id]
GO
ALTER TABLE [dbo].[cmsLanguageText]  WITH CHECK ADD  CONSTRAINT [FK_cmsLanguageText_cmsDictionary_id] FOREIGN KEY([UniqueId])
REFERENCES [dbo].[cmsDictionary] ([id])
GO
ALTER TABLE [dbo].[cmsLanguageText] CHECK CONSTRAINT [FK_cmsLanguageText_cmsDictionary_id]
GO
ALTER TABLE [dbo].[cmsLanguageText]  WITH CHECK ADD  CONSTRAINT [FK_cmsLanguageText_umbracoLanguage_id] FOREIGN KEY([languageId])
REFERENCES [dbo].[umbracoLanguage] ([id])
GO
ALTER TABLE [dbo].[cmsLanguageText] CHECK CONSTRAINT [FK_cmsLanguageText_umbracoLanguage_id]
GO
ALTER TABLE [dbo].[cmsMacroProperty]  WITH CHECK ADD  CONSTRAINT [FK_cmsMacroProperty_cmsMacro_id] FOREIGN KEY([macro])
REFERENCES [dbo].[cmsMacro] ([id])
GO
ALTER TABLE [dbo].[cmsMacroProperty] CHECK CONSTRAINT [FK_cmsMacroProperty_cmsMacro_id]
GO
ALTER TABLE [dbo].[cmsMember]  WITH CHECK ADD  CONSTRAINT [FK_cmsMember_cmsContent_nodeId] FOREIGN KEY([nodeId])
REFERENCES [dbo].[cmsContent] ([nodeId])
GO
ALTER TABLE [dbo].[cmsMember] CHECK CONSTRAINT [FK_cmsMember_cmsContent_nodeId]
GO
ALTER TABLE [dbo].[cmsMember]  WITH CHECK ADD  CONSTRAINT [FK_cmsMember_umbracoNode_id] FOREIGN KEY([nodeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[cmsMember] CHECK CONSTRAINT [FK_cmsMember_umbracoNode_id]
GO
ALTER TABLE [dbo].[cmsMember2MemberGroup]  WITH CHECK ADD  CONSTRAINT [FK_cmsMember2MemberGroup_cmsMember_nodeId] FOREIGN KEY([Member])
REFERENCES [dbo].[cmsMember] ([nodeId])
GO
ALTER TABLE [dbo].[cmsMember2MemberGroup] CHECK CONSTRAINT [FK_cmsMember2MemberGroup_cmsMember_nodeId]
GO
ALTER TABLE [dbo].[cmsMember2MemberGroup]  WITH CHECK ADD  CONSTRAINT [FK_cmsMember2MemberGroup_umbracoNode_id] FOREIGN KEY([MemberGroup])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[cmsMember2MemberGroup] CHECK CONSTRAINT [FK_cmsMember2MemberGroup_umbracoNode_id]
GO
ALTER TABLE [dbo].[cmsMemberType]  WITH CHECK ADD  CONSTRAINT [FK_cmsMemberType_cmsContentType_nodeId] FOREIGN KEY([NodeId])
REFERENCES [dbo].[cmsContentType] ([nodeId])
GO
ALTER TABLE [dbo].[cmsMemberType] CHECK CONSTRAINT [FK_cmsMemberType_cmsContentType_nodeId]
GO
ALTER TABLE [dbo].[cmsMemberType]  WITH CHECK ADD  CONSTRAINT [FK_cmsMemberType_umbracoNode_id] FOREIGN KEY([NodeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[cmsMemberType] CHECK CONSTRAINT [FK_cmsMemberType_umbracoNode_id]
GO
ALTER TABLE [dbo].[cmsPreviewXml]  WITH CHECK ADD  CONSTRAINT [FK_cmsPreviewXml_cmsContent_nodeId] FOREIGN KEY([nodeId])
REFERENCES [dbo].[cmsContent] ([nodeId])
GO
ALTER TABLE [dbo].[cmsPreviewXml] CHECK CONSTRAINT [FK_cmsPreviewXml_cmsContent_nodeId]
GO
ALTER TABLE [dbo].[cmsPreviewXml]  WITH CHECK ADD  CONSTRAINT [FK_cmsPreviewXml_cmsContentVersion_VersionId] FOREIGN KEY([versionId])
REFERENCES [dbo].[cmsContentVersion] ([VersionId])
GO
ALTER TABLE [dbo].[cmsPreviewXml] CHECK CONSTRAINT [FK_cmsPreviewXml_cmsContentVersion_VersionId]
GO
ALTER TABLE [dbo].[cmsPropertyData]  WITH CHECK ADD  CONSTRAINT [FK_cmsPropertyData_cmsPropertyType_id] FOREIGN KEY([propertytypeid])
REFERENCES [dbo].[cmsPropertyType] ([id])
GO
ALTER TABLE [dbo].[cmsPropertyData] CHECK CONSTRAINT [FK_cmsPropertyData_cmsPropertyType_id]
GO
ALTER TABLE [dbo].[cmsPropertyData]  WITH CHECK ADD  CONSTRAINT [FK_cmsPropertyData_umbracoNode_id] FOREIGN KEY([contentNodeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[cmsPropertyData] CHECK CONSTRAINT [FK_cmsPropertyData_umbracoNode_id]
GO
ALTER TABLE [dbo].[cmsPropertyType]  WITH CHECK ADD  CONSTRAINT [FK_cmsPropertyType_cmsContentType_nodeId] FOREIGN KEY([contentTypeId])
REFERENCES [dbo].[cmsContentType] ([nodeId])
GO
ALTER TABLE [dbo].[cmsPropertyType] CHECK CONSTRAINT [FK_cmsPropertyType_cmsContentType_nodeId]
GO
ALTER TABLE [dbo].[cmsPropertyType]  WITH CHECK ADD  CONSTRAINT [FK_cmsPropertyType_cmsDataType_nodeId] FOREIGN KEY([dataTypeId])
REFERENCES [dbo].[cmsDataType] ([nodeId])
GO
ALTER TABLE [dbo].[cmsPropertyType] CHECK CONSTRAINT [FK_cmsPropertyType_cmsDataType_nodeId]
GO
ALTER TABLE [dbo].[cmsPropertyType]  WITH CHECK ADD  CONSTRAINT [FK_cmsPropertyType_cmsPropertyTypeGroup_id] FOREIGN KEY([propertyTypeGroupId])
REFERENCES [dbo].[cmsPropertyTypeGroup] ([id])
GO
ALTER TABLE [dbo].[cmsPropertyType] CHECK CONSTRAINT [FK_cmsPropertyType_cmsPropertyTypeGroup_id]
GO
ALTER TABLE [dbo].[cmsPropertyTypeGroup]  WITH CHECK ADD  CONSTRAINT [FK_cmsPropertyTypeGroup_cmsContentType_nodeId] FOREIGN KEY([contenttypeNodeId])
REFERENCES [dbo].[cmsContentType] ([nodeId])
GO
ALTER TABLE [dbo].[cmsPropertyTypeGroup] CHECK CONSTRAINT [FK_cmsPropertyTypeGroup_cmsContentType_nodeId]
GO
ALTER TABLE [dbo].[cmsTagRelationship]  WITH CHECK ADD  CONSTRAINT [FK_cmsTagRelationship_cmsContent] FOREIGN KEY([nodeId])
REFERENCES [dbo].[cmsContent] ([nodeId])
GO
ALTER TABLE [dbo].[cmsTagRelationship] CHECK CONSTRAINT [FK_cmsTagRelationship_cmsContent]
GO
ALTER TABLE [dbo].[cmsTagRelationship]  WITH CHECK ADD  CONSTRAINT [FK_cmsTagRelationship_cmsPropertyType] FOREIGN KEY([propertyTypeId])
REFERENCES [dbo].[cmsPropertyType] ([id])
GO
ALTER TABLE [dbo].[cmsTagRelationship] CHECK CONSTRAINT [FK_cmsTagRelationship_cmsPropertyType]
GO
ALTER TABLE [dbo].[cmsTagRelationship]  WITH CHECK ADD  CONSTRAINT [FK_cmsTagRelationship_cmsTags_id] FOREIGN KEY([tagId])
REFERENCES [dbo].[cmsTags] ([id])
GO
ALTER TABLE [dbo].[cmsTagRelationship] CHECK CONSTRAINT [FK_cmsTagRelationship_cmsTags_id]
GO
ALTER TABLE [dbo].[cmsTags]  WITH CHECK ADD  CONSTRAINT [FK_cmsTags_cmsTags] FOREIGN KEY([ParentId])
REFERENCES [dbo].[cmsTags] ([id])
GO
ALTER TABLE [dbo].[cmsTags] CHECK CONSTRAINT [FK_cmsTags_cmsTags]
GO
ALTER TABLE [dbo].[cmsTask]  WITH CHECK ADD  CONSTRAINT [FK_cmsTask_cmsTaskType_id] FOREIGN KEY([taskTypeId])
REFERENCES [dbo].[cmsTaskType] ([id])
GO
ALTER TABLE [dbo].[cmsTask] CHECK CONSTRAINT [FK_cmsTask_cmsTaskType_id]
GO
ALTER TABLE [dbo].[cmsTask]  WITH CHECK ADD  CONSTRAINT [FK_cmsTask_umbracoNode_id] FOREIGN KEY([nodeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[cmsTask] CHECK CONSTRAINT [FK_cmsTask_umbracoNode_id]
GO
ALTER TABLE [dbo].[cmsTask]  WITH CHECK ADD  CONSTRAINT [FK_cmsTask_umbracoUser] FOREIGN KEY([parentUserId])
REFERENCES [dbo].[umbracoUser] ([id])
GO
ALTER TABLE [dbo].[cmsTask] CHECK CONSTRAINT [FK_cmsTask_umbracoUser]
GO
ALTER TABLE [dbo].[cmsTask]  WITH CHECK ADD  CONSTRAINT [FK_cmsTask_umbracoUser1] FOREIGN KEY([userId])
REFERENCES [dbo].[umbracoUser] ([id])
GO
ALTER TABLE [dbo].[cmsTask] CHECK CONSTRAINT [FK_cmsTask_umbracoUser1]
GO
ALTER TABLE [dbo].[cmsTemplate]  WITH CHECK ADD  CONSTRAINT [FK_cmsTemplate_umbracoNode] FOREIGN KEY([nodeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[cmsTemplate] CHECK CONSTRAINT [FK_cmsTemplate_umbracoNode]
GO
ALTER TABLE [dbo].[umbProducts]  WITH CHECK ADD  CONSTRAINT [FK_umbProducts_umbCategories] FOREIGN KEY([category_id])
REFERENCES [dbo].[umbCategories] ([category_id])
GO
ALTER TABLE [dbo].[umbProducts] CHECK CONSTRAINT [FK_umbProducts_umbCategories]
GO
ALTER TABLE [dbo].[umbracoAccess]  WITH CHECK ADD  CONSTRAINT [FK_umbracoAccess_umbracoNode_id] FOREIGN KEY([nodeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[umbracoAccess] CHECK CONSTRAINT [FK_umbracoAccess_umbracoNode_id]
GO
ALTER TABLE [dbo].[umbracoAccess]  WITH CHECK ADD  CONSTRAINT [FK_umbracoAccess_umbracoNode_id1] FOREIGN KEY([loginNodeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[umbracoAccess] CHECK CONSTRAINT [FK_umbracoAccess_umbracoNode_id1]
GO
ALTER TABLE [dbo].[umbracoAccess]  WITH CHECK ADD  CONSTRAINT [FK_umbracoAccess_umbracoNode_id2] FOREIGN KEY([noAccessNodeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[umbracoAccess] CHECK CONSTRAINT [FK_umbracoAccess_umbracoNode_id2]
GO
ALTER TABLE [dbo].[umbracoAccessRule]  WITH CHECK ADD  CONSTRAINT [FK_umbracoAccessRule_umbracoAccess_id] FOREIGN KEY([accessId])
REFERENCES [dbo].[umbracoAccess] ([id])
GO
ALTER TABLE [dbo].[umbracoAccessRule] CHECK CONSTRAINT [FK_umbracoAccessRule_umbracoAccess_id]
GO
ALTER TABLE [dbo].[umbracoDeployDependency]  WITH CHECK ADD  CONSTRAINT [FK_umbracoDeployDependency_umbracoDeployChecksum_id1] FOREIGN KEY([sourceId])
REFERENCES [dbo].[umbracoDeployChecksum] ([id])
GO
ALTER TABLE [dbo].[umbracoDeployDependency] CHECK CONSTRAINT [FK_umbracoDeployDependency_umbracoDeployChecksum_id1]
GO
ALTER TABLE [dbo].[umbracoDeployDependency]  WITH CHECK ADD  CONSTRAINT [FK_umbracoDeployDependency_umbracoDeployChecksum_id2] FOREIGN KEY([targetId])
REFERENCES [dbo].[umbracoDeployChecksum] ([id])
GO
ALTER TABLE [dbo].[umbracoDeployDependency] CHECK CONSTRAINT [FK_umbracoDeployDependency_umbracoDeployChecksum_id2]
GO
ALTER TABLE [dbo].[umbracoDomains]  WITH CHECK ADD  CONSTRAINT [FK_umbracoDomains_umbracoNode_id] FOREIGN KEY([domainRootStructureID])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[umbracoDomains] CHECK CONSTRAINT [FK_umbracoDomains_umbracoNode_id]
GO
ALTER TABLE [dbo].[umbracoNode]  WITH CHECK ADD  CONSTRAINT [FK_umbracoNode_umbracoNode_id] FOREIGN KEY([parentID])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[umbracoNode] CHECK CONSTRAINT [FK_umbracoNode_umbracoNode_id]
GO
ALTER TABLE [dbo].[umbracoRedirectUrl]  WITH CHECK ADD  CONSTRAINT [FK_umbracoRedirectUrl_umbracoNode_uniqueID] FOREIGN KEY([contentKey])
REFERENCES [dbo].[umbracoNode] ([uniqueID])
GO
ALTER TABLE [dbo].[umbracoRedirectUrl] CHECK CONSTRAINT [FK_umbracoRedirectUrl_umbracoNode_uniqueID]
GO
ALTER TABLE [dbo].[umbracoRelation]  WITH CHECK ADD  CONSTRAINT [FK_umbracoRelation_umbracoNode] FOREIGN KEY([parentId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[umbracoRelation] CHECK CONSTRAINT [FK_umbracoRelation_umbracoNode]
GO
ALTER TABLE [dbo].[umbracoRelation]  WITH CHECK ADD  CONSTRAINT [FK_umbracoRelation_umbracoNode1] FOREIGN KEY([childId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[umbracoRelation] CHECK CONSTRAINT [FK_umbracoRelation_umbracoNode1]
GO
ALTER TABLE [dbo].[umbracoRelation]  WITH CHECK ADD  CONSTRAINT [FK_umbracoRelation_umbracoRelationType_id] FOREIGN KEY([relType])
REFERENCES [dbo].[umbracoRelationType] ([id])
GO
ALTER TABLE [dbo].[umbracoRelation] CHECK CONSTRAINT [FK_umbracoRelation_umbracoRelationType_id]
GO
ALTER TABLE [dbo].[umbracoUser]  WITH CHECK ADD  CONSTRAINT [FK_umbracoUser_umbracoUserType_id] FOREIGN KEY([userType])
REFERENCES [dbo].[umbracoUserType] ([id])
GO
ALTER TABLE [dbo].[umbracoUser] CHECK CONSTRAINT [FK_umbracoUser_umbracoUserType_id]
GO
ALTER TABLE [dbo].[umbracoUser2app]  WITH CHECK ADD  CONSTRAINT [FK_umbracoUser2app_umbracoUser_id] FOREIGN KEY([user])
REFERENCES [dbo].[umbracoUser] ([id])
GO
ALTER TABLE [dbo].[umbracoUser2app] CHECK CONSTRAINT [FK_umbracoUser2app_umbracoUser_id]
GO
ALTER TABLE [dbo].[umbracoUser2NodeNotify]  WITH CHECK ADD  CONSTRAINT [FK_umbracoUser2NodeNotify_umbracoNode_id] FOREIGN KEY([nodeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[umbracoUser2NodeNotify] CHECK CONSTRAINT [FK_umbracoUser2NodeNotify_umbracoNode_id]
GO
ALTER TABLE [dbo].[umbracoUser2NodeNotify]  WITH CHECK ADD  CONSTRAINT [FK_umbracoUser2NodeNotify_umbracoUser_id] FOREIGN KEY([userId])
REFERENCES [dbo].[umbracoUser] ([id])
GO
ALTER TABLE [dbo].[umbracoUser2NodeNotify] CHECK CONSTRAINT [FK_umbracoUser2NodeNotify_umbracoUser_id]
GO
ALTER TABLE [dbo].[umbracoUser2NodePermission]  WITH CHECK ADD  CONSTRAINT [FK_umbracoUser2NodePermission_umbracoNode_id] FOREIGN KEY([nodeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[umbracoUser2NodePermission] CHECK CONSTRAINT [FK_umbracoUser2NodePermission_umbracoNode_id]
GO
ALTER TABLE [dbo].[umbracoUser2NodePermission]  WITH CHECK ADD  CONSTRAINT [FK_umbracoUser2NodePermission_umbracoUser_id] FOREIGN KEY([userId])
REFERENCES [dbo].[umbracoUser] ([id])
GO
ALTER TABLE [dbo].[umbracoUser2NodePermission] CHECK CONSTRAINT [FK_umbracoUser2NodePermission_umbracoUser_id]
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
USE [master]
GO
ALTER DATABASE [umbracoSample_Db] SET  READ_WRITE 
GO
