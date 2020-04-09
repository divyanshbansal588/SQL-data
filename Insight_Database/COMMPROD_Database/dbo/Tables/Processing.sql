CREATE TABLE [dbo].[Processing](
	[tsCreated] [datetime] NOT NULL,
	[ticketNumber] [varchar](8) NOT NULL,
	[fileNumber] [int] NOT NULL,
	[processingType] [varchar](4) NOT NULL,
	[dataFileId] [uniqueidentifier] NOT NULL,
	[qcStatementCount] [int] NOT NULL,
	[qcPageCount] [int] NOT NULL,
	[netStatementCount] [int] NOT NULL,
	[netPageCount] [int] NOT NULL,
	[processingId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [pkProcessing] PRIMARY KEY CLUSTERED 
(
	[ticketNumber] ASC,
	[fileNumber] ASC,
	[processingType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Processing]  WITH NOCHECK ADD  CONSTRAINT [fkProcessing#DataFile] FOREIGN KEY([ticketNumber], [fileNumber])
REFERENCES [dbo].[DataFile] ([ticketNumber], [fileNumber])
NOT FOR REPLICATION
GO

ALTER TABLE [dbo].[Processing] CHECK CONSTRAINT [fkProcessing#DataFile]
GO
ALTER TABLE [dbo].[Processing] ADD  CONSTRAINT [DF__Processin__tsUpd__2E3BD7D3]  DEFAULT (getdate()) FOR [tsCreated]
GO
ALTER TABLE [dbo].[Processing] ADD  CONSTRAINT [DF__Processin__qcSta__5C02A283]  DEFAULT ((0)) FOR [qcStatementCount]
GO
ALTER TABLE [dbo].[Processing] ADD  CONSTRAINT [DF__Processin__qcPag__5CF6C6BC]  DEFAULT ((0)) FOR [qcPageCount]
GO
ALTER TABLE [dbo].[Processing] ADD  CONSTRAINT [DF__Processin__recon__5DEAEAF5]  DEFAULT ((0)) FOR [netStatementCount]
GO
ALTER TABLE [dbo].[Processing] ADD  CONSTRAINT [DF__Processin__recon__5EDF0F2E]  DEFAULT ((0)) FOR [netPageCount]
GO
ALTER TABLE [dbo].[Processing] ADD  CONSTRAINT [DF_Processing_processingId]  DEFAULT (newid()) FOR [processingId]