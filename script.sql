USE [MechaAlumni]
GO
/****** Object:  Table [dbo].[AlumniUsersAuthenticates]    Script Date: 5/01/2021 4:22:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AlumniUsersAuthenticates](
	[alumni_id] [varchar](50) NOT NULL,
	[alumni_username] [int] NULL,
	[almuni_password] [varchar](50) NULL,
	[alumni_name] [varchar](50) NULL,
	[alumni_survey_status] [varchar](15) NULL,
	[alumni_employee_survey_status] [varchar](15) NULL,
	[alumni_email] [varchar](50) NULL,
	[alumni_firsttime_loggedin] [varchar](50) NULL,
 CONSTRAINT [PK_AlumniUsersAuthenticates] PRIMARY KEY CLUSTERED 
(
	[alumni_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EducationalInformations]    Script Date: 5/01/2021 4:22:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EducationalInformations](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[latest_qualification] [varchar](50) NOT NULL,
	[degree_title] [varchar](50) NOT NULL,
	[institute] [varchar](50) NOT NULL,
	[year_of_completion] [varchar](50) NOT NULL,
	[majors] [varchar](50) NOT NULL,
	[alumni_id] [varchar](50) NOT NULL,
 CONSTRAINT [PK_EducationalInformations] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EmployeeInformations]    Script Date: 5/01/2021 4:22:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmployeeInformations](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[alumni_id] [varchar](50) NOT NULL,
	[company_name] [varchar](50) NOT NULL,
	[address] [varchar](250) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[designation] [varchar](50) NOT NULL,
	[industry] [varchar](50) NOT NULL,
 CONSTRAINT [PK_EmployeeInformations] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PersonalInformations]    Script Date: 5/01/2021 4:22:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PersonalInformations](
	[full_name] [varchar](50) NOT NULL,
	[department] [varchar](50) NOT NULL,
	[reg_number] [int] NOT NULL,
	[email] [varchar](50) NOT NULL,
	[contact_number] [varchar](50) NOT NULL,
	[pec_registration] [varchar](50) NULL,
	[id] [int] IDENTITY(1,1) NOT NULL,
	[alumni_id] [varchar](50) NOT NULL,
 CONSTRAINT [PK_PersonalInformations] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProfessionalDetails]    Script Date: 5/01/2021 4:22:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProfessionalDetails](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[alumni_id] [varchar](50) NOT NULL,
	[job_title] [varchar](50) NOT NULL,
	[company_name] [varchar](50) NOT NULL,
	[department] [varchar](50) NOT NULL,
	[work_location] [varchar](50) NOT NULL,
	[work_contact] [varchar](50) NOT NULL,
	[email] [varchar](50) NOT NULL,
	[start_date] [varchar](50) NOT NULL,
	[supervisor_name] [varchar](50) NOT NULL,
	[supervisor_email] [varchar](50) NOT NULL,
	[supervisor_contact] [varchar](50) NOT NULL,
 CONSTRAINT [PK_ProfessionalDetails] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[AlumniUsersAuthenticates] ([alumni_id], [alumni_username], [almuni_password], [alumni_name], [alumni_survey_status], [alumni_employee_survey_status], [alumni_email], [alumni_firsttime_loggedin]) VALUES (N'1', 1512232, N'farhan', N'Saad Farhan', N'Not Filled', N'Not Filled', N'saadfarhan124@gmail.com', N'true')
ALTER TABLE [dbo].[EducationalInformations]  WITH CHECK ADD  CONSTRAINT [FK_Alumni_Users_Educational] FOREIGN KEY([alumni_id])
REFERENCES [dbo].[AlumniUsersAuthenticates] ([alumni_id])
GO
ALTER TABLE [dbo].[EducationalInformations] CHECK CONSTRAINT [FK_Alumni_Users_Educational]
GO
ALTER TABLE [dbo].[EmployeeInformations]  WITH CHECK ADD  CONSTRAINT [FK_Alumni_EmployeeInformation] FOREIGN KEY([alumni_id])
REFERENCES [dbo].[AlumniUsersAuthenticates] ([alumni_id])
GO
ALTER TABLE [dbo].[EmployeeInformations] CHECK CONSTRAINT [FK_Alumni_EmployeeInformation]
GO
ALTER TABLE [dbo].[PersonalInformations]  WITH CHECK ADD  CONSTRAINT [FK_Alumni_Users] FOREIGN KEY([alumni_id])
REFERENCES [dbo].[AlumniUsersAuthenticates] ([alumni_id])
GO
ALTER TABLE [dbo].[PersonalInformations] CHECK CONSTRAINT [FK_Alumni_Users]
GO
ALTER TABLE [dbo].[ProfessionalDetails]  WITH CHECK ADD  CONSTRAINT [FK_Professuianl_Alumni_Users] FOREIGN KEY([alumni_id])
REFERENCES [dbo].[AlumniUsersAuthenticates] ([alumni_id])
GO
ALTER TABLE [dbo].[ProfessionalDetails] CHECK CONSTRAINT [FK_Professuianl_Alumni_Users]
GO
