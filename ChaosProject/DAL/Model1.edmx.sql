
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 05/19/2017 21:38:21
-- Generated from EDMX file: C:\Users\Joey\Documents\ChaosProject\ChaosProject\DAL\Model1.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [Database1];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_LocationSchool]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Schools] DROP CONSTRAINT [FK_LocationSchool];
GO
IF OBJECT_ID(N'[dbo].[FK_UserSchool_User]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[UserSchool] DROP CONSTRAINT [FK_UserSchool_User];
GO
IF OBJECT_ID(N'[dbo].[FK_UserSchool_School]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[UserSchool] DROP CONSTRAINT [FK_UserSchool_School];
GO
IF OBJECT_ID(N'[dbo].[FK_CategorySubcategory]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Subcategories] DROP CONSTRAINT [FK_CategorySubcategory];
GO
IF OBJECT_ID(N'[dbo].[FK_FileKeyword_File]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[FileKeyword] DROP CONSTRAINT [FK_FileKeyword_File];
GO
IF OBJECT_ID(N'[dbo].[FK_FileKeyword_Keyword]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[FileKeyword] DROP CONSTRAINT [FK_FileKeyword_Keyword];
GO
IF OBJECT_ID(N'[dbo].[FK_FileSubcategory]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Files] DROP CONSTRAINT [FK_FileSubcategory];
GO
IF OBJECT_ID(N'[dbo].[FK_FormatFile]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Files] DROP CONSTRAINT [FK_FormatFile];
GO
IF OBJECT_ID(N'[dbo].[FK_FileUser]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Files] DROP CONSTRAINT [FK_FileUser];
GO
IF OBJECT_ID(N'[dbo].[FK_FileSchool]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Files] DROP CONSTRAINT [FK_FileSchool];
GO
IF OBJECT_ID(N'[dbo].[FK_UserCategory_User]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[UserCategory] DROP CONSTRAINT [FK_UserCategory_User];
GO
IF OBJECT_ID(N'[dbo].[FK_UserCategory_Category]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[UserCategory] DROP CONSTRAINT [FK_UserCategory_Category];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Users]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Users];
GO
IF OBJECT_ID(N'[dbo].[Categories]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Categories];
GO
IF OBJECT_ID(N'[dbo].[Subcategories]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Subcategories];
GO
IF OBJECT_ID(N'[dbo].[Schools]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Schools];
GO
IF OBJECT_ID(N'[dbo].[Files]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Files];
GO
IF OBJECT_ID(N'[dbo].[Keywords]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Keywords];
GO
IF OBJECT_ID(N'[dbo].[Formats]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Formats];
GO
IF OBJECT_ID(N'[dbo].[Locations]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Locations];
GO
IF OBJECT_ID(N'[dbo].[UserSchool]', 'U') IS NOT NULL
    DROP TABLE [dbo].[UserSchool];
GO
IF OBJECT_ID(N'[dbo].[FileKeyword]', 'U') IS NOT NULL
    DROP TABLE [dbo].[FileKeyword];
GO
IF OBJECT_ID(N'[dbo].[UserCategory]', 'U') IS NOT NULL
    DROP TABLE [dbo].[UserCategory];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Users'
CREATE TABLE [dbo].[Users] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Login] nvarchar(max)  NOT NULL,
    [Password] nvarchar(max)  NOT NULL,
    [AcademicTitle] nvarchar(max)  NOT NULL,
    [Firstname] nvarchar(max)  NOT NULL,
    [Lastname] nvarchar(max)  NOT NULL,
    [Tel] nvarchar(max)  NOT NULL,
    [Mail] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Categories'
CREATE TABLE [dbo].[Categories] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [CategoryName] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Subcategories'
CREATE TABLE [dbo].[Subcategories] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [CategoryId] int  NOT NULL,
    [SubcategoryName] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Schools'
CREATE TABLE [dbo].[Schools] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [Location_Id] int  NOT NULL
);
GO

-- Creating table 'Files'
CREATE TABLE [dbo].[Files] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Filename] nvarchar(max)  NOT NULL,
    [FormatId] int  NOT NULL,
    [Subcategory_Id] int  NOT NULL,
    [User_Id] int  NOT NULL,
    [School_Id] int  NOT NULL
);
GO

-- Creating table 'Keywords'
CREATE TABLE [dbo].[Keywords] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Tag] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Formats'
CREATE TABLE [dbo].[Formats] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Type] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Locations'
CREATE TABLE [dbo].[Locations] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Street] nvarchar(max)  NOT NULL,
    [StreetNumber] nvarchar(max)  NOT NULL,
    [PLZ] int  NOT NULL,
    [City] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'UserSchool'
CREATE TABLE [dbo].[UserSchool] (
    [User_Id] int  NOT NULL,
    [School_Id] int  NOT NULL
);
GO

-- Creating table 'FileKeyword'
CREATE TABLE [dbo].[FileKeyword] (
    [File_Id] int  NOT NULL,
    [Keyword_Id] int  NOT NULL
);
GO

-- Creating table 'UserCategory'
CREATE TABLE [dbo].[UserCategory] (
    [User_Id] int  NOT NULL,
    [Category_Id] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'Users'
ALTER TABLE [dbo].[Users]
ADD CONSTRAINT [PK_Users]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Categories'
ALTER TABLE [dbo].[Categories]
ADD CONSTRAINT [PK_Categories]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Subcategories'
ALTER TABLE [dbo].[Subcategories]
ADD CONSTRAINT [PK_Subcategories]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Schools'
ALTER TABLE [dbo].[Schools]
ADD CONSTRAINT [PK_Schools]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Files'
ALTER TABLE [dbo].[Files]
ADD CONSTRAINT [PK_Files]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Keywords'
ALTER TABLE [dbo].[Keywords]
ADD CONSTRAINT [PK_Keywords]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Formats'
ALTER TABLE [dbo].[Formats]
ADD CONSTRAINT [PK_Formats]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Locations'
ALTER TABLE [dbo].[Locations]
ADD CONSTRAINT [PK_Locations]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [User_Id], [School_Id] in table 'UserSchool'
ALTER TABLE [dbo].[UserSchool]
ADD CONSTRAINT [PK_UserSchool]
    PRIMARY KEY CLUSTERED ([User_Id], [School_Id] ASC);
GO

-- Creating primary key on [File_Id], [Keyword_Id] in table 'FileKeyword'
ALTER TABLE [dbo].[FileKeyword]
ADD CONSTRAINT [PK_FileKeyword]
    PRIMARY KEY CLUSTERED ([File_Id], [Keyword_Id] ASC);
GO

-- Creating primary key on [User_Id], [Category_Id] in table 'UserCategory'
ALTER TABLE [dbo].[UserCategory]
ADD CONSTRAINT [PK_UserCategory]
    PRIMARY KEY CLUSTERED ([User_Id], [Category_Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [Location_Id] in table 'Schools'
ALTER TABLE [dbo].[Schools]
ADD CONSTRAINT [FK_LocationSchool]
    FOREIGN KEY ([Location_Id])
    REFERENCES [dbo].[Locations]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_LocationSchool'
CREATE INDEX [IX_FK_LocationSchool]
ON [dbo].[Schools]
    ([Location_Id]);
GO

-- Creating foreign key on [User_Id] in table 'UserSchool'
ALTER TABLE [dbo].[UserSchool]
ADD CONSTRAINT [FK_UserSchool_User]
    FOREIGN KEY ([User_Id])
    REFERENCES [dbo].[Users]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [School_Id] in table 'UserSchool'
ALTER TABLE [dbo].[UserSchool]
ADD CONSTRAINT [FK_UserSchool_School]
    FOREIGN KEY ([School_Id])
    REFERENCES [dbo].[Schools]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_UserSchool_School'
CREATE INDEX [IX_FK_UserSchool_School]
ON [dbo].[UserSchool]
    ([School_Id]);
GO

-- Creating foreign key on [CategoryId] in table 'Subcategories'
ALTER TABLE [dbo].[Subcategories]
ADD CONSTRAINT [FK_CategorySubcategory]
    FOREIGN KEY ([CategoryId])
    REFERENCES [dbo].[Categories]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_CategorySubcategory'
CREATE INDEX [IX_FK_CategorySubcategory]
ON [dbo].[Subcategories]
    ([CategoryId]);
GO

-- Creating foreign key on [File_Id] in table 'FileKeyword'
ALTER TABLE [dbo].[FileKeyword]
ADD CONSTRAINT [FK_FileKeyword_File]
    FOREIGN KEY ([File_Id])
    REFERENCES [dbo].[Files]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Keyword_Id] in table 'FileKeyword'
ALTER TABLE [dbo].[FileKeyword]
ADD CONSTRAINT [FK_FileKeyword_Keyword]
    FOREIGN KEY ([Keyword_Id])
    REFERENCES [dbo].[Keywords]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_FileKeyword_Keyword'
CREATE INDEX [IX_FK_FileKeyword_Keyword]
ON [dbo].[FileKeyword]
    ([Keyword_Id]);
GO

-- Creating foreign key on [Subcategory_Id] in table 'Files'
ALTER TABLE [dbo].[Files]
ADD CONSTRAINT [FK_FileSubcategory]
    FOREIGN KEY ([Subcategory_Id])
    REFERENCES [dbo].[Subcategories]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_FileSubcategory'
CREATE INDEX [IX_FK_FileSubcategory]
ON [dbo].[Files]
    ([Subcategory_Id]);
GO

-- Creating foreign key on [FormatId] in table 'Files'
ALTER TABLE [dbo].[Files]
ADD CONSTRAINT [FK_FormatFile]
    FOREIGN KEY ([FormatId])
    REFERENCES [dbo].[Formats]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_FormatFile'
CREATE INDEX [IX_FK_FormatFile]
ON [dbo].[Files]
    ([FormatId]);
GO

-- Creating foreign key on [User_Id] in table 'Files'
ALTER TABLE [dbo].[Files]
ADD CONSTRAINT [FK_FileUser]
    FOREIGN KEY ([User_Id])
    REFERENCES [dbo].[Users]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_FileUser'
CREATE INDEX [IX_FK_FileUser]
ON [dbo].[Files]
    ([User_Id]);
GO

-- Creating foreign key on [School_Id] in table 'Files'
ALTER TABLE [dbo].[Files]
ADD CONSTRAINT [FK_FileSchool]
    FOREIGN KEY ([School_Id])
    REFERENCES [dbo].[Schools]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_FileSchool'
CREATE INDEX [IX_FK_FileSchool]
ON [dbo].[Files]
    ([School_Id]);
GO

-- Creating foreign key on [User_Id] in table 'UserCategory'
ALTER TABLE [dbo].[UserCategory]
ADD CONSTRAINT [FK_UserCategory_User]
    FOREIGN KEY ([User_Id])
    REFERENCES [dbo].[Users]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Category_Id] in table 'UserCategory'
ALTER TABLE [dbo].[UserCategory]
ADD CONSTRAINT [FK_UserCategory_Category]
    FOREIGN KEY ([Category_Id])
    REFERENCES [dbo].[Categories]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_UserCategory_Category'
CREATE INDEX [IX_FK_UserCategory_Category]
ON [dbo].[UserCategory]
    ([Category_Id]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------