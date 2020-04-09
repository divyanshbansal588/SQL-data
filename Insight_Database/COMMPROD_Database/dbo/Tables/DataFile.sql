CREATE TABLE [dbo].[DataFile](
	[ticketNumber] [varchar](8) NOT NULL,
	[fileNumber] [int] NOT NULL,
	[clientCode] [varchar](15) NOT NULL,
	[tsCreated] [datetime] NOT NULL,
	[dataFileId] [uniqueidentifier] NOT NULL,
	[fileName] [varchar](255) NOT NULL,
	[processingStage] [varchar](4) NOT NULL,
	[processingStatus] [varchar](4) NOT NULL,
	[optionName] [varchar](15) NOT NULL,
	[statementCount] [int] NOT NULL,
	[pageCount] [int] NOT NULL,
	[qcStatementCount] [int] NOT NULL,
	[qcPageCount] [int] NOT NULL,
	[releaseStatus] [char](1) NOT NULL,
	[fileSize] [bigint] NOT NULL,
	[insert1] [varchar](8) NOT NULL,
	[insert2] [varchar](8) NOT NULL,
	[insert3] [varchar](8) NOT NULL,
	[tsProcessingStarted] [datetime] NULL,
	[tsProcessingEnded] [datetime] NULL,
	[processedOn] [varchar](50) NOT NULL,
	[tsProcessingStarted2] [datetime] NULL,
	[tsProcessingEnded2] [datetime] NULL,
	[processedOn2] [varchar](50) NOT NULL,
 CONSTRAINT [PK_DataFile] PRIMARY KEY CLUSTERED 
(
	[ticketNumber] ASC,
	[fileNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[DataFile]  WITH CHECK ADD  CONSTRAINT [FK_DataFile_Ticket] FOREIGN KEY([ticketNumber])
REFERENCES [dbo].[Ticket] ([ticketNumber])
GO

ALTER TABLE [dbo].[DataFile] CHECK CONSTRAINT [FK_DataFile_Ticket]
GO
ALTER TABLE [dbo].[DataFile] ADD  CONSTRAINT [DF_DataFile_tsCreated]  DEFAULT (getdate()) FOR [tsCreated]
GO
ALTER TABLE [dbo].[DataFile] ADD  CONSTRAINT [DF_DataFile_dadaFileId]  DEFAULT (newid()) FOR [dataFileId]
GO
ALTER TABLE [dbo].[DataFile] ADD  CONSTRAINT [DF_DataFile_QCstatementCOunt]  DEFAULT ((0)) FOR [qcStatementCount]
GO
ALTER TABLE [dbo].[DataFile] ADD  CONSTRAINT [DF_DataFile_QCpageCount]  DEFAULT ((0)) FOR [qcPageCount]
GO
ALTER TABLE [dbo].[DataFile] ADD  CONSTRAINT [DF_DataFile_releaseStatus]  DEFAULT ('') FOR [releaseStatus]
GO
ALTER TABLE [dbo].[DataFile] ADD  CONSTRAINT [DF_DataFile_insert1]  DEFAULT ('') FOR [insert1]
GO
ALTER TABLE [dbo].[DataFile] ADD  CONSTRAINT [DF_DataFile_insert2]  DEFAULT ('') FOR [insert2]
GO
ALTER TABLE [dbo].[DataFile] ADD  CONSTRAINT [DF_DataFile_insert3]  DEFAULT ('') FOR [insert3]
GO
ALTER TABLE [dbo].[DataFile] ADD  CONSTRAINT [DF_DataFile_processedOn]  DEFAULT ('') FOR [processedOn]
GO
ALTER TABLE [dbo].[DataFile] ADD  CONSTRAINT [DF_DataFile_procssedOn2]  DEFAULT ('') FOR [processedOn2]