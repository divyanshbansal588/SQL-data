CREATE TABLE [dbo].[GMCJob](
	[tsCreated] [datetime] NOT NULL,
	[ticketNumber] [varchar](8) NOT NULL,
	[fileNumber] [int] NOT NULL,
	[sequenceNumber] [int] NOT NULL,
	[GMCClientCode] [varchar](15) NOT NULL,
	[letterCode] [varchar](50) NOT NULL,
	[status] [varchar](4) NOT NULL,
	[WFDmode] [varchar](4) NOT NULL,
	[tsProcessingStarted] [datetime] NULL,
	[tsProcessingEnded] [datetime] NULL,
	[inputFileName] [varchar](200) NOT NULL,
	[DOCUfileName] [varchar](200) NOT NULL,
	[WFDFile] [varchar](100) NOT NULL,
	[JOBFile] [varchar](100) NOT NULL,
	[outputFileNamePDF] [varchar](100) NOT NULL,
	[outputFileNameDOCINFO] [varchar](100) NOT NULL,
	[UDF1] [varchar](100) NOT NULL,
	[UDF2] [varchar](100) NOT NULL,
	[UDF3] [varchar](100) NOT NULL,
	[UDF4] [varchar](100) NOT NULL,
	[UDF5] [varchar](100) NOT NULL,
	[openMinutes] [money] NOT NULL,
	[preprocessMinutes] [money] NOT NULL,
	[jobMinutes] [money] NOT NULL,
	[pagesProcessed] [int] NOT NULL,
	[pagesPerMinute] [int] NOT NULL,
	[tempFileSize] [int] NOT NULL,
	[endlessLoopLimit] [int] NOT NULL,
 CONSTRAINT [PK_GMCJob] PRIMARY KEY CLUSTERED 
(
	[ticketNumber] ASC,
	[fileNumber] ASC,
	[sequenceNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[GMCJob] ADD  CONSTRAINT [DF_GMCJobs_tsCreated]  DEFAULT (getdate()) FOR [tsCreated]
GO
ALTER TABLE [dbo].[GMCJob] ADD  CONSTRAINT [DF_GMCJob_seq]  DEFAULT ((1)) FOR [sequenceNumber]
GO
ALTER TABLE [dbo].[GMCJob] ADD  CONSTRAINT [DF_GMCJob_letterCode]  DEFAULT ('') FOR [letterCode]
GO
ALTER TABLE [dbo].[GMCJob] ADD  CONSTRAINT [DF_GMCJob_WFDmode]  DEFAULT ('TEST') FOR [WFDmode]
GO
ALTER TABLE [dbo].[GMCJob] ADD  CONSTRAINT [DF_GMCJob_fileNameDOCU]  DEFAULT ('') FOR [DOCUfileName]
GO
ALTER TABLE [dbo].[GMCJob] ADD  CONSTRAINT [DF_GMCJob_outputFileName]  DEFAULT ('') FOR [outputFileNamePDF]
GO
ALTER TABLE [dbo].[GMCJob] ADD  CONSTRAINT [DF_GMCJob_outputFileNameDOCINFO]  DEFAULT ('') FOR [outputFileNameDOCINFO]
GO
ALTER TABLE [dbo].[GMCJob] ADD  CONSTRAINT [DF_GMCJobs_UDF1]  DEFAULT ('') FOR [UDF1]
GO
ALTER TABLE [dbo].[GMCJob] ADD  CONSTRAINT [DF_GMCJobs_UDF2]  DEFAULT ('') FOR [UDF2]
GO
ALTER TABLE [dbo].[GMCJob] ADD  CONSTRAINT [DF_GMCJobs_UDF32]  DEFAULT ('') FOR [UDF3]
GO
ALTER TABLE [dbo].[GMCJob] ADD  CONSTRAINT [DF_GMCJobs_UDF4]  DEFAULT ('') FOR [UDF4]
GO
ALTER TABLE [dbo].[GMCJob] ADD  CONSTRAINT [DF_GMCJobs_UDF5]  DEFAULT ('') FOR [UDF5]
GO
ALTER TABLE [dbo].[GMCJob] ADD  CONSTRAINT [DF_GMCJob_minutesToOpen]  DEFAULT ((0)) FOR [openMinutes]
GO
ALTER TABLE [dbo].[GMCJob] ADD  CONSTRAINT [DF_GMCJob_minutesToPreprocess]  DEFAULT ((0)) FOR [preprocessMinutes]
GO
ALTER TABLE [dbo].[GMCJob] ADD  CONSTRAINT [DF_GMCJob_minutesToProcessJob]  DEFAULT ((0)) FOR [jobMinutes]
GO
ALTER TABLE [dbo].[GMCJob] ADD  CONSTRAINT [DF_GMCJob_totalPages]  DEFAULT ((0)) FOR [pagesProcessed]
GO
ALTER TABLE [dbo].[GMCJob] ADD  CONSTRAINT [DF_GMCJob_pagesPerMinute]  DEFAULT ((0)) FOR [pagesPerMinute]
GO
ALTER TABLE [dbo].[GMCJob] ADD  CONSTRAINT [DF_GMCJob_tempFileSize]  DEFAULT ((0)) FOR [tempFileSize]
GO
ALTER TABLE [dbo].[GMCJob] ADD  CONSTRAINT [DF_GMCJob_endlessLoopLimit]  DEFAULT ((1000)) FOR [endlessLoopLimit]