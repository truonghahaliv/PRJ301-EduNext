USE [master]
GO
/****** Object:  Database [PRJ_EduNext]    Script Date: 2024-07-14 9:26:41 PM ******/
CREATE DATABASE [PRJ_EduNext]
 CONTAINMENT = NONE
 
GO
ALTER DATABASE [PRJ_EduNext] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PRJ_EduNext].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PRJ_EduNext] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PRJ_EduNext] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PRJ_EduNext] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PRJ_EduNext] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PRJ_EduNext] SET ARITHABORT OFF 
GO
ALTER DATABASE [PRJ_EduNext] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PRJ_EduNext] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PRJ_EduNext] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PRJ_EduNext] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PRJ_EduNext] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PRJ_EduNext] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PRJ_EduNext] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PRJ_EduNext] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PRJ_EduNext] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PRJ_EduNext] SET  DISABLE_BROKER 
GO
ALTER DATABASE [PRJ_EduNext] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PRJ_EduNext] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PRJ_EduNext] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PRJ_EduNext] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PRJ_EduNext] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PRJ_EduNext] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PRJ_EduNext] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PRJ_EduNext] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [PRJ_EduNext] SET  MULTI_USER 
GO
ALTER DATABASE [PRJ_EduNext] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PRJ_EduNext] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PRJ_EduNext] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PRJ_EduNext] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PRJ_EduNext] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [PRJ_EduNext] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [PRJ_EduNext] SET QUERY_STORE = ON
GO
ALTER DATABASE [PRJ_EduNext] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [PRJ_EduNext]
GO
/****** Object:  Table [dbo].[Answer_question]    Script Date: 2024-07-14 9:26:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Answer_question](
	[answer_id] [int] IDENTITY(1,1) NOT NULL,
	[question_id] [int] NULL,
	[user_id] [int] NULL,
	[answer_content] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[answer_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Answers]    Script Date: 2024-07-14 9:26:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Answers](
	[answer_id] [int] IDENTITY(1,1) NOT NULL,
	[question_id] [int] NOT NULL,
	[user_id] [int] NOT NULL,
	[answer_content] [nvarchar](max) NULL,
	[created_at] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[answer_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Assignments]    Script Date: 2024-07-14 9:26:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Assignments](
	[assignment_id] [int] IDENTITY(1,1) NOT NULL,
	[class_id] [int] NOT NULL,
	[assignment_name] [nvarchar](255) NOT NULL,
	[description] [nvarchar](max) NULL,
	[start_time] [datetime] NULL,
	[end_time] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[assignment_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Class_User]    Script Date: 2024-07-14 9:26:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Class_User](
	[class_user_id] [int] IDENTITY(1,1) NOT NULL,
	[class_id] [int] NOT NULL,
	[user_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[class_user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Classes]    Script Date: 2024-07-14 9:26:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Classes](
	[class_id] [int] IDENTITY(1,1) NOT NULL,
	[course_id] [int] NOT NULL,
	[class_name] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[class_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Course_User]    Script Date: 2024-07-14 9:26:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Course_User](
	[course_user_id] [int] IDENTITY(1,1) NOT NULL,
	[course_id] [int] NOT NULL,
	[user_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[course_user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Courses]    Script Date: 2024-07-14 9:26:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Courses](
	[course_id] [int] IDENTITY(1,1) NOT NULL,
	[course_name] [nvarchar](255) NOT NULL,
	[description] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[course_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Grades]    Script Date: 2024-07-14 9:26:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Grades](
	[grade_id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NOT NULL,
	[assignment_id] [int] NOT NULL,
	[grade] [decimal](5, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[grade_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Lesson_question]    Script Date: 2024-07-14 9:26:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lesson_question](
	[question_id] [int] IDENTITY(1,1) NOT NULL,
	[lesson_id] [int] NULL,
	[name] [varchar](255) NULL,
	[content] [text] NULL,
	[status] [varchar](50) NULL,
	[startdate] [date] NULL,
	[enddate] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[question_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Lessons]    Script Date: 2024-07-14 9:26:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lessons](
	[lesson_id] [int] IDENTITY(1,1) NOT NULL,
	[class_id] [int] NOT NULL,
	[slot] [int] NOT NULL,
	[lesson_content] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[lesson_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Questions]    Script Date: 2024-07-14 9:26:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Questions](
	[question_id] [int] IDENTITY(1,1) NOT NULL,
	[assignment_id] [int] NOT NULL,
	[question_content] [nvarchar](max) NULL,
	[status] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[question_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 2024-07-14 9:26:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[user_id] [int] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](255) NOT NULL,
	[password] [nvarchar](255) NOT NULL,
	[email] [nvarchar](255) NOT NULL,
	[role] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Answer_question] ON 

INSERT [dbo].[Answer_question] ([answer_id], [question_id], [user_id], [answer_content]) VALUES (1, 2, 4, N'Java Web is ...')
INSERT [dbo].[Answer_question] ([answer_id], [question_id], [user_id], [answer_content]) VALUES (2, 2, 5, N'i love u')
INSERT [dbo].[Answer_question] ([answer_id], [question_id], [user_id], [answer_content]) VALUES (7, 2, 3, N'hehe')
SET IDENTITY_INSERT [dbo].[Answer_question] OFF
GO
SET IDENTITY_INSERT [dbo].[Answers] ON 

INSERT [dbo].[Answers] ([answer_id], [question_id], [user_id], [answer_content], [created_at]) VALUES (1, 1, 3, NULL, CAST(N'2024-06-19T18:27:53.450' AS DateTime))
SET IDENTITY_INSERT [dbo].[Answers] OFF
GO
SET IDENTITY_INSERT [dbo].[Assignments] ON 

INSERT [dbo].[Assignments] ([assignment_id], [class_id], [assignment_name], [description], [start_time], [end_time]) VALUES (1, 1, N'Project PRJ301', N'Final Project PRj301', CAST(N'2024-06-19T00:00:00.000' AS DateTime), CAST(N'2024-07-15T00:00:00.000' AS DateTime))
INSERT [dbo].[Assignments] ([assignment_id], [class_id], [assignment_name], [description], [start_time], [end_time]) VALUES (6, 1, N'Agile Project Management App', N'Create an app to manage Agile projects, with the ability to create and manage sprints, tasks, and user stories. Use for complex interfaces.', CAST(N'2024-06-19T00:00:00.000' AS DateTime), CAST(N'2024-07-15T00:00:00.000' AS DateTime))
INSERT [dbo].[Assignments] ([assignment_id], [class_id], [assignment_name], [description], [start_time], [end_time]) VALUES (7, 1, N'Multi-functional e-commerce platform', N'uild a fully featured e-commerce website, including product management, shopping cart, payment and order management. Results for interface and data.', CAST(N'2024-06-19T00:00:00.000' AS DateTime), CAST(N'2024-07-15T00:00:00.000' AS DateTime))
INSERT [dbo].[Assignments] ([assignment_id], [class_id], [assignment_name], [description], [start_time], [end_time]) VALUES (8, 1, N'Online Scheduling System', N'A system that allows users to book appointments with various services. Includes calendar management, customer information and processing of booking requests.', CAST(N'2024-06-19T00:00:00.000' AS DateTime), CAST(N'2024-07-15T00:00:00.000' AS DateTime))
INSERT [dbo].[Assignments] ([assignment_id], [class_id], [assignment_name], [description], [start_time], [end_time]) VALUES (9, 1, N'Customer Data Analytics App', N'Create a customer data analytics app, with interactive charts and reports, using and graphing libraries, combined to store and process data sample data.', CAST(N'2024-06-19T00:00:00.000' AS DateTime), CAST(N'2024-07-15T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Assignments] OFF
GO
SET IDENTITY_INSERT [dbo].[Class_User] ON 

INSERT [dbo].[Class_User] ([class_user_id], [class_id], [user_id]) VALUES (6, 1, 3)
INSERT [dbo].[Class_User] ([class_user_id], [class_id], [user_id]) VALUES (8, 1, 5)
INSERT [dbo].[Class_User] ([class_user_id], [class_id], [user_id]) VALUES (9, 1, 4)
INSERT [dbo].[Class_User] ([class_user_id], [class_id], [user_id]) VALUES (10, 1, 5)
INSERT [dbo].[Class_User] ([class_user_id], [class_id], [user_id]) VALUES (11, 1, 12)
INSERT [dbo].[Class_User] ([class_user_id], [class_id], [user_id]) VALUES (12, 1, 13)
INSERT [dbo].[Class_User] ([class_user_id], [class_id], [user_id]) VALUES (13, 1, 17)
INSERT [dbo].[Class_User] ([class_user_id], [class_id], [user_id]) VALUES (17, 1, 15)
SET IDENTITY_INSERT [dbo].[Class_User] OFF
GO
SET IDENTITY_INSERT [dbo].[Classes] ON 

INSERT [dbo].[Classes] ([class_id], [course_id], [class_name]) VALUES (1, 1, N'SE1234')
INSERT [dbo].[Classes] ([class_id], [course_id], [class_name]) VALUES (6, 2, N'SE1234')
INSERT [dbo].[Classes] ([class_id], [course_id], [class_name]) VALUES (12, 4, N'SE1')
INSERT [dbo].[Classes] ([class_id], [course_id], [class_name]) VALUES (13, 8, N'SE2')
INSERT [dbo].[Classes] ([class_id], [course_id], [class_name]) VALUES (14, 7, N'SE3')
INSERT [dbo].[Classes] ([class_id], [course_id], [class_name]) VALUES (15, 8, N'SE4')
INSERT [dbo].[Classes] ([class_id], [course_id], [class_name]) VALUES (16, 6, N'SE5')
SET IDENTITY_INSERT [dbo].[Classes] OFF
GO
SET IDENTITY_INSERT [dbo].[Course_User] ON 

INSERT [dbo].[Course_User] ([course_user_id], [course_id], [user_id]) VALUES (1, 1, 3)
INSERT [dbo].[Course_User] ([course_user_id], [course_id], [user_id]) VALUES (2, 2, 3)
INSERT [dbo].[Course_User] ([course_user_id], [course_id], [user_id]) VALUES (4, 1, 5)
INSERT [dbo].[Course_User] ([course_user_id], [course_id], [user_id]) VALUES (5, 1, 4)
INSERT [dbo].[Course_User] ([course_user_id], [course_id], [user_id]) VALUES (8, 4, 3)
INSERT [dbo].[Course_User] ([course_user_id], [course_id], [user_id]) VALUES (9, 5, 3)
INSERT [dbo].[Course_User] ([course_user_id], [course_id], [user_id]) VALUES (10, 6, 3)
INSERT [dbo].[Course_User] ([course_user_id], [course_id], [user_id]) VALUES (11, 7, 3)
INSERT [dbo].[Course_User] ([course_user_id], [course_id], [user_id]) VALUES (12, 2, 4)
INSERT [dbo].[Course_User] ([course_user_id], [course_id], [user_id]) VALUES (13, 5, 4)
INSERT [dbo].[Course_User] ([course_user_id], [course_id], [user_id]) VALUES (14, 6, 5)
INSERT [dbo].[Course_User] ([course_user_id], [course_id], [user_id]) VALUES (16, 7, 4)
SET IDENTITY_INSERT [dbo].[Course_User] OFF
GO
SET IDENTITY_INSERT [dbo].[Courses] ON 

INSERT [dbo].[Courses] ([course_id], [course_name], [description]) VALUES (1, N'PRJ301', N'Java Web Application Development')
INSERT [dbo].[Courses] ([course_id], [course_name], [description]) VALUES (2, N'SWE201c', N'Introduction to Software Engineering')
INSERT [dbo].[Courses] ([course_id], [course_name], [description]) VALUES (4, N'ITE302c', N'Ethics in IT')
INSERT [dbo].[Courses] ([course_id], [course_name], [description]) VALUES (5, N'	SWR302', N'Software Requirement')
INSERT [dbo].[Courses] ([course_id], [course_name], [description]) VALUES (6, N'SWT301', N'Software Testing')
INSERT [dbo].[Courses] ([course_id], [course_name], [description]) VALUES (7, N'	IOT102', N'Internet Of Things')
INSERT [dbo].[Courses] ([course_id], [course_name], [description]) VALUES (8, N'	MAS291', N'Statistics and Probability')
SET IDENTITY_INSERT [dbo].[Courses] OFF
GO
SET IDENTITY_INSERT [dbo].[Lesson_question] ON 

INSERT [dbo].[Lesson_question] ([question_id], [lesson_id], [name], [content], [status], [startdate], [enddate]) VALUES (2, 1, N'CQ1', N'What is Server', N'On Going', CAST(N'2024-08-08' AS Date), CAST(N'2024-09-09' AS Date))
INSERT [dbo].[Lesson_question] ([question_id], [lesson_id], [name], [content], [status], [startdate], [enddate]) VALUES (3, 1, N'CQ2', N'What is Client ?', N'Cancelled', NULL, NULL)
INSERT [dbo].[Lesson_question] ([question_id], [lesson_id], [name], [content], [status], [startdate], [enddate]) VALUES (38, 1, N'CQ3', N'What is the Verification and the validation?', N'On Going', CAST(N'2024-07-14' AS Date), CAST(N'2024-07-28' AS Date))
INSERT [dbo].[Lesson_question] ([question_id], [lesson_id], [name], [content], [status], [startdate], [enddate]) VALUES (40, 3, N'CQ1', N'Which of the following is likely to benefit most from the use of test tools providing test capture and replay facilities?', N'On Going', CAST(N'2024-07-14' AS Date), CAST(N'2024-07-28' AS Date))
INSERT [dbo].[Lesson_question] ([question_id], [lesson_id], [name], [content], [status], [startdate], [enddate]) VALUES (41, 3, N'CQ2', N'Which of these activities provides the biggest potential cost saving from the use of CAST?', N'Cancelled', NULL, NULL)
INSERT [dbo].[Lesson_question] ([question_id], [lesson_id], [name], [content], [status], [startdate], [enddate]) VALUES (42, 3, N'CQ3', N'When a new testing tool is purchased, it should be used first by:', N'Not Start', NULL, NULL)
INSERT [dbo].[Lesson_question] ([question_id], [lesson_id], [name], [content], [status], [startdate], [enddate]) VALUES (43, 4, N'CQ1', N'The place to start if you want a (new) test tool is:', N'Not Start', NULL, NULL)
INSERT [dbo].[Lesson_question] ([question_id], [lesson_id], [name], [content], [status], [startdate], [enddate]) VALUES (44, 4, N'CQ2', N'Given the following sets of test management terms (v-z), and activity descriptions (1-5), which one of the following best pairs the two sets?', N'On Going', CAST(N'2024-07-14' AS Date), CAST(N'2024-07-28' AS Date))
INSERT [dbo].[Lesson_question] ([question_id], [lesson_id], [name], [content], [status], [startdate], [enddate]) VALUES (45, 4, N'CQ3', N'We split testing into distinct stages primarily because:', N'Cancelled', NULL, NULL)
INSERT [dbo].[Lesson_question] ([question_id], [lesson_id], [name], [content], [status], [startdate], [enddate]) VALUES (46, 5, N'CQ1', N'A tool that supports traceability, recording of incidents or scheduling of tests is called:', N'Not Start', NULL, NULL)
INSERT [dbo].[Lesson_question] ([question_id], [lesson_id], [name], [content], [status], [startdate], [enddate]) VALUES (47, 5, N'CQ2', N'Which one of the following statements about system testing is NOT true?', N'On Going', CAST(N'2024-07-14' AS Date), CAST(N'2024-07-28' AS Date))
INSERT [dbo].[Lesson_question] ([question_id], [lesson_id], [name], [content], [status], [startdate], [enddate]) VALUES (48, 5, N'CQ3', N'Which of the following uses Impact Analysis most?', N'Cancelled', NULL, NULL)
INSERT [dbo].[Lesson_question] ([question_id], [lesson_id], [name], [content], [status], [startdate], [enddate]) VALUES (49, 6, N'CQ1', N'What is the purpose of test completion criteria in a test plan:', N'Not Start', NULL, NULL)
INSERT [dbo].[Lesson_question] ([question_id], [lesson_id], [name], [content], [status], [startdate], [enddate]) VALUES (50, 6, N'CQ2', N'A typical commercial test execution tool would be able to perform all of the following EXCEPT:', N'On Going', CAST(N'2024-07-14' AS Date), CAST(N'2024-07-28' AS Date))
INSERT [dbo].[Lesson_question] ([question_id], [lesson_id], [name], [content], [status], [startdate], [enddate]) VALUES (51, 6, N'CQ3', N'A configuration management system would NOT normally provide:', N'Cancelled', NULL, NULL)
SET IDENTITY_INSERT [dbo].[Lesson_question] OFF
GO
SET IDENTITY_INSERT [dbo].[Lessons] ON 

INSERT [dbo].[Lessons] ([lesson_id], [class_id], [slot], [lesson_content]) VALUES (1, 1, 1, N'Mobile Development Overview
Android Introduction')
INSERT [dbo].[Lessons] ([lesson_id], [class_id], [slot], [lesson_content]) VALUES (3, 1, 2, N'Android Studio')
INSERT [dbo].[Lessons] ([lesson_id], [class_id], [slot], [lesson_content]) VALUES (4, 1, 3, N'Android Application Structure')
INSERT [dbo].[Lessons] ([lesson_id], [class_id], [slot], [lesson_content]) VALUES (5, 1, 4, N'Build the first application')
INSERT [dbo].[Lessons] ([lesson_id], [class_id], [slot], [lesson_content]) VALUES (6, 1, 5, N'Simple UI Widgets')
SET IDENTITY_INSERT [dbo].[Lessons] OFF
GO
SET IDENTITY_INSERT [dbo].[Questions] ON 

INSERT [dbo].[Questions] ([question_id], [assignment_id], [question_content], [status]) VALUES (1, 1, N'The Assignment must login, logout and register', N'On Going')
INSERT [dbo].[Questions] ([question_id], [assignment_id], [question_content], [status]) VALUES (2, 1, N'đá', N'On Going')
SET IDENTITY_INSERT [dbo].[Questions] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([user_id], [username], [password], [email], [role]) VALUES (2, N'Admin', N'123', N'admin@gmail.com', N'admin')
INSERT [dbo].[Users] ([user_id], [username], [password], [email], [role]) VALUES (3, N'Student', N'123', N'student@gmail.com', N'student')
INSERT [dbo].[Users] ([user_id], [username], [password], [email], [role]) VALUES (4, N'Teacher', N'123', N'teacher@gmail.com', N'teacher')
INSERT [dbo].[Users] ([user_id], [username], [password], [email], [role]) VALUES (5, N'truong nguyen', N'123', N'kkk@gmail.com', N'student')
INSERT [dbo].[Users] ([user_id], [username], [password], [email], [role]) VALUES (12, N'Nguyễn	Thế	Anh', N'123', N'NUvutt@9pay.vnLL', N'student')
INSERT [dbo].[Users] ([user_id], [username], [password], [email], [role]) VALUES (13, N'phuonghd', N'123', N'phuonghd@9pay.vn	p', N'student')
INSERT [dbo].[Users] ([user_id], [username], [password], [email], [role]) VALUES (14, N'	vutt', N'123', N'vutt@9pay.vn', N'teacher')
INSERT [dbo].[Users] ([user_id], [username], [password], [email], [role]) VALUES (15, N'nhandtt', N'123', N'nhandtt@9pay.vn', N'student')
INSERT [dbo].[Users] ([user_id], [username], [password], [email], [role]) VALUES (17, N'phongpt', N'123', N'phongpt@9pay.vn', N'student')
INSERT [dbo].[Users] ([user_id], [username], [password], [email], [role]) VALUES (18, N'tuyetnta', N'123', N'tuyetnta@9pay.vn', N'teacher')
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
ALTER TABLE [dbo].[Answers] ADD  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[Answer_question]  WITH CHECK ADD  CONSTRAINT [FK_AnswerQuestion_LessonQuestion] FOREIGN KEY([question_id])
REFERENCES [dbo].[Lesson_question] ([question_id])
GO
ALTER TABLE [dbo].[Answer_question] CHECK CONSTRAINT [FK_AnswerQuestion_LessonQuestion]
GO
ALTER TABLE [dbo].[Answer_question]  WITH CHECK ADD  CONSTRAINT [FK_AnswerQuestion_Users] FOREIGN KEY([user_id])
REFERENCES [dbo].[Users] ([user_id])
GO
ALTER TABLE [dbo].[Answer_question] CHECK CONSTRAINT [FK_AnswerQuestion_Users]
GO
ALTER TABLE [dbo].[Answers]  WITH CHECK ADD FOREIGN KEY([question_id])
REFERENCES [dbo].[Questions] ([question_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Answers]  WITH CHECK ADD FOREIGN KEY([user_id])
REFERENCES [dbo].[Users] ([user_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Assignments]  WITH CHECK ADD FOREIGN KEY([class_id])
REFERENCES [dbo].[Classes] ([class_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Class_User]  WITH CHECK ADD FOREIGN KEY([class_id])
REFERENCES [dbo].[Classes] ([class_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Class_User]  WITH CHECK ADD FOREIGN KEY([user_id])
REFERENCES [dbo].[Users] ([user_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Classes]  WITH CHECK ADD FOREIGN KEY([course_id])
REFERENCES [dbo].[Courses] ([course_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Course_User]  WITH CHECK ADD FOREIGN KEY([course_id])
REFERENCES [dbo].[Courses] ([course_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Course_User]  WITH CHECK ADD FOREIGN KEY([user_id])
REFERENCES [dbo].[Users] ([user_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Grades]  WITH CHECK ADD FOREIGN KEY([assignment_id])
REFERENCES [dbo].[Assignments] ([assignment_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Grades]  WITH CHECK ADD FOREIGN KEY([user_id])
REFERENCES [dbo].[Users] ([user_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Lesson_question]  WITH CHECK ADD FOREIGN KEY([lesson_id])
REFERENCES [dbo].[Lessons] ([lesson_id])
GO
ALTER TABLE [dbo].[Lessons]  WITH CHECK ADD FOREIGN KEY([class_id])
REFERENCES [dbo].[Classes] ([class_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Questions]  WITH CHECK ADD FOREIGN KEY([assignment_id])
REFERENCES [dbo].[Assignments] ([assignment_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD CHECK  (([role]='admin' OR [role]='teacher' OR [role]='student'))
GO
USE [master]
GO
ALTER DATABASE [PRJ_EduNext] SET  READ_WRITE 
GO
