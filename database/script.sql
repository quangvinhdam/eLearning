USE [master]
GO
/****** Object:  Database [elearning]    Script Date: 6/23/2024 14:25:48 ******/
CREATE DATABASE [elearning]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'elearning', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\elearning.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'elearning_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\elearning_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [elearning] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [elearning].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [elearning] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [elearning] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [elearning] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [elearning] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [elearning] SET ARITHABORT OFF 
GO
ALTER DATABASE [elearning] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [elearning] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [elearning] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [elearning] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [elearning] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [elearning] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [elearning] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [elearning] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [elearning] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [elearning] SET  ENABLE_BROKER 
GO
ALTER DATABASE [elearning] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [elearning] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [elearning] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [elearning] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [elearning] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [elearning] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [elearning] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [elearning] SET RECOVERY FULL 
GO
ALTER DATABASE [elearning] SET  MULTI_USER 
GO
ALTER DATABASE [elearning] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [elearning] SET DB_CHAINING OFF 
GO
ALTER DATABASE [elearning] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [elearning] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [elearning] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [elearning] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'elearning', N'ON'
GO
ALTER DATABASE [elearning] SET QUERY_STORE = ON
GO
ALTER DATABASE [elearning] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [elearning]
GO
/****** Object:  Table [dbo].[account]    Script Date: 6/23/2024 14:25:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[account](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[email] [varchar](255) NOT NULL,
	[password_hash] [char](69) NULL,
	[activated] [bit] NOT NULL,
	[role_id] [int] NULL,
	[created_at] [datetime2](7) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[category]    Script Date: 6/23/2024 14:25:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[category](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[course]    Script Date: 6/23/2024 14:25:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[course](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[manager_id] [int] NOT NULL,
	[title] [nvarchar](255) NOT NULL,
	[description] [nvarchar](max) NULL,
	[language] [nvarchar](255) NULL,
	[category_id] [int] NULL,
	[price] [decimal](19, 4) NOT NULL,
	[archived] [bit] NOT NULL,
	[created_at] [datetime2](7) NOT NULL,
	[updated_at] [datetime2](7) NOT NULL,
	[active] [bit] NOT NULL,
	[image_path] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[enrollment]    Script Date: 6/23/2024 14:25:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[enrollment](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[course_id] [int] NULL,
	[student_id] [int] NOT NULL,
	[grade] [decimal](19, 4) NULL,
	[passed] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[lesson]    Script Date: 6/23/2024 14:25:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[lesson](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[course_id] [int] NOT NULL,
	[title] [nvarchar](255) NOT NULL,
	[content] [text] NOT NULL,
	[created_by] [int] NULL,
	[created_at] [datetime2](7) NOT NULL,
	[updated_at] [datetime2](7) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[manager_details]    Script Date: 6/23/2024 14:25:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[manager_details](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NULL,
	[org_name] [nvarchar](255) NOT NULL,
	[description] [nvarchar](max) NULL,
	[country] [nvarchar](255) NULL,
	[logo_path] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[org_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[payment]    Script Date: 6/23/2024 14:25:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[payment](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[course_id] [int] NULL,
	[student_id] [int] NOT NULL,
	[purchase_price] [decimal](19, 4) NOT NULL,
	[created_at] [datetime2](7) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[quiz]    Script Date: 6/23/2024 14:25:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[quiz](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[course_id] [int] NOT NULL,
	[title] [nvarchar](255) NOT NULL,
	[description] [nvarchar](max) NULL,
	[content_file_path] [nvarchar](max) NOT NULL,
	[pass_grade] [int] NULL,
	[weight] [int] NULL,
	[created_by] [int] NULL,
	[created_at] [datetime2](7) NOT NULL,
	[updated_at] [datetime2](7) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[role]    Script Date: 6/23/2024 14:25:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[role](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[student_quiz_result]    Script Date: 6/23/2024 14:25:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[student_quiz_result](
	[quiz_id] [int] NOT NULL,
	[student_id] [int] NOT NULL,
	[grade] [decimal](19, 4) NOT NULL,
	[passed] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[quiz_id] ASC,
	[student_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[teacher_assign_course]    Script Date: 6/23/2024 14:25:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[teacher_assign_course](
	[course_id] [int] NOT NULL,
	[teacher_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[course_id] ASC,
	[teacher_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[teacher_details]    Script Date: 6/23/2024 14:25:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[teacher_details](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NULL,
	[manager_id] [int] NULL,
	[position] [nvarchar](255) NULL,
	[bio] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user]    Script Date: 6/23/2024 14:25:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[account_id] [int] NULL,
	[first_name] [nvarchar](255) NULL,
	[last_name] [nvarchar](255) NULL,
	[gender] [bit] NULL,
	[date_of_birth] [date] NULL,
	[profile_image] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[account] ADD  DEFAULT (getutcdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[course] ADD  DEFAULT ((0)) FOR [archived]
GO
ALTER TABLE [dbo].[course] ADD  DEFAULT (getutcdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[course] ADD  DEFAULT (getutcdate()) FOR [updated_at]
GO
ALTER TABLE [dbo].[course] ADD  DEFAULT ((0)) FOR [active]
GO
ALTER TABLE [dbo].[enrollment] ADD  DEFAULT ((0)) FOR [passed]
GO
ALTER TABLE [dbo].[lesson] ADD  DEFAULT (getutcdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[lesson] ADD  DEFAULT (getutcdate()) FOR [updated_at]
GO
ALTER TABLE [dbo].[payment] ADD  DEFAULT (getutcdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[quiz] ADD  DEFAULT ((0)) FOR [pass_grade]
GO
ALTER TABLE [dbo].[quiz] ADD  DEFAULT ((0)) FOR [weight]
GO
ALTER TABLE [dbo].[quiz] ADD  DEFAULT (getutcdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[quiz] ADD  DEFAULT (getutcdate()) FOR [updated_at]
GO
ALTER TABLE [dbo].[user] ADD  DEFAULT ((0)) FOR [gender]
GO
ALTER TABLE [dbo].[account]  WITH CHECK ADD FOREIGN KEY([role_id])
REFERENCES [dbo].[role] ([id])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[course]  WITH CHECK ADD FOREIGN KEY([category_id])
REFERENCES [dbo].[category] ([id])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[course]  WITH CHECK ADD FOREIGN KEY([manager_id])
REFERENCES [dbo].[manager_details] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[enrollment]  WITH CHECK ADD FOREIGN KEY([course_id])
REFERENCES [dbo].[course] ([id])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[enrollment]  WITH CHECK ADD FOREIGN KEY([student_id])
REFERENCES [dbo].[user] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[lesson]  WITH CHECK ADD FOREIGN KEY([course_id])
REFERENCES [dbo].[course] ([id])
GO
ALTER TABLE [dbo].[lesson]  WITH CHECK ADD FOREIGN KEY([created_by])
REFERENCES [dbo].[teacher_details] ([id])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[manager_details]  WITH CHECK ADD FOREIGN KEY([user_id])
REFERENCES [dbo].[user] ([id])
GO
ALTER TABLE [dbo].[payment]  WITH CHECK ADD FOREIGN KEY([course_id])
REFERENCES [dbo].[course] ([id])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[payment]  WITH CHECK ADD FOREIGN KEY([student_id])
REFERENCES [dbo].[user] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[quiz]  WITH CHECK ADD FOREIGN KEY([course_id])
REFERENCES [dbo].[course] ([id])
GO
ALTER TABLE [dbo].[quiz]  WITH CHECK ADD FOREIGN KEY([created_by])
REFERENCES [dbo].[teacher_details] ([id])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[student_quiz_result]  WITH CHECK ADD FOREIGN KEY([quiz_id])
REFERENCES [dbo].[quiz] ([id])
GO
ALTER TABLE [dbo].[student_quiz_result]  WITH CHECK ADD FOREIGN KEY([student_id])
REFERENCES [dbo].[user] ([id])
GO
ALTER TABLE [dbo].[teacher_assign_course]  WITH CHECK ADD FOREIGN KEY([course_id])
REFERENCES [dbo].[course] ([id])
GO
ALTER TABLE [dbo].[teacher_assign_course]  WITH CHECK ADD FOREIGN KEY([teacher_id])
REFERENCES [dbo].[teacher_details] ([id])
GO
ALTER TABLE [dbo].[teacher_details]  WITH CHECK ADD FOREIGN KEY([manager_id])
REFERENCES [dbo].[manager_details] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[teacher_details]  WITH CHECK ADD FOREIGN KEY([user_id])
REFERENCES [dbo].[user] ([id])
GO
ALTER TABLE [dbo].[user]  WITH CHECK ADD FOREIGN KEY([account_id])
REFERENCES [dbo].[account] ([id])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[quiz]  WITH CHECK ADD CHECK  (([pass_grade]>=(0) AND [pass_grade]<=(100)))
GO
ALTER TABLE [dbo].[quiz]  WITH CHECK ADD CHECK  (([weight]>=(0) AND [weight]<=(100)))
GO
/****** Object:  StoredProcedure [dbo].[spActivateAccount]    Script Date: 6/23/2024 14:25:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create   procedure [dbo].[spActivateAccount]
	@Email varchar(max),
	@Success bit output
as
begin
	select @Success = 0;
	update [account]
	set [activated] = 1
	where [email] = @Email;

	declare @act bit;
	select @act = [activated] from [account] where [email] = @Email;
	if @act = 1
	begin
		select @Success = 1;
	end
end
GO
/****** Object:  StoredProcedure [dbo].[spGetAllContentsOfCourse]    Script Date: 6/23/2024 14:25:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   procedure [dbo].[spGetAllContentsOfCourse]
	@Id int
as
begin
	select * from [lesson] where [course_id] = @Id;
	select * from [quiz] where [course_id] = @Id;
end
GO
/****** Object:  StoredProcedure [dbo].[spGetUserByEmail]    Script Date: 6/23/2024 14:25:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   procedure [dbo].[spGetUserByEmail]
	@Email varchar(max)
as
begin
	select u.[id], u.[first_name], u.[last_name], u.[gender], u.[date_of_birth], u.[profile_image],
	acc.[id] as [account_id], acc.[email], acc.[password_hash], acc.[activated], acc.[created_at], r.[name] as [role_name]
	from [user] as u
	join [account] as acc on u.[account_id] = acc.[id]
	join [role] as r on acc.[role_id] = r.[id]
	where acc.[email] = @Email;
end
GO
/****** Object:  StoredProcedure [dbo].[spRegisterAccount]    Script Date: 6/23/2024 14:25:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create   procedure [dbo].[spRegisterAccount]
	@Email varchar(max),
	@Password char(69),
	@Role nvarchar(255),
	@Success bit output
as
begin
	select @Success = 0;
	declare @output table (account_id int);
	-- insert unactivated account
	insert into [account]([email], [password_hash], [activated], [role_id])
	output inserted.[id] into @output(account_id)
	values(
		@Email, @Password, 0, (select [id] from [role] where [name] = @Role)
	);
	
	-- insert empty user profile
	declare @account_id int;
	select @account_id = [account_id] from @output;
	if @account_id is not null
	begin
		insert into [user]([account_id]) values(@account_id);
		select @Success = 1;
	end
end
GO
USE [master]
GO
ALTER DATABASE [elearning] SET  READ_WRITE 
GO
