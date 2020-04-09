CREATE TABLE [dbo].[PrinterOutputGroup](
	[tsCreated] [datetime] NOT NULL,
	[ticketNumber] [varchar](8) NOT NULL,
	[fileNumber] [int] NOT NULL,
	[setupCode] [varchar](8) NOT NULL,
	[processingId] [uniqueidentifier] NOT NULL,
	[handlingCode] [varchar](4) NOT NULL,
	[duplex] [char](1) NOT NULL,
	[color] [char](1) NOT NULL,
	[statementCount] [int] NOT NULL,
	[pageCount] [int] NOT NULL,
	[archiveName] [varchar](255) NOT NULL,
	[printerOutputGroupId] [uniqueidentifier] NOT NULL,
	[perfMode] [char](1) NOT NULL,
	[perfCode] [varchar](4) NOT NULL,
	[paperSize] [varchar](5) NOT NULL,
	[outerEnvelopeStyle] [varchar](15) NOT NULL,
 CONSTRAINT [pkPrintOutputGroup] PRIMARY KEY CLUSTERED 
(
	[ticketNumber] ASC,
	[fileNumber] ASC,
	[setupCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[PrinterOutputGroup]  WITH CHECK ADD  CONSTRAINT [FK_PrintOutputGroup_Processing] FOREIGN KEY([processingId])
REFERENCES [dbo].[Processing] ([processingId])
GO

ALTER TABLE [dbo].[PrinterOutputGroup] CHECK CONSTRAINT [FK_PrintOutputGroup_Processing]
GO
ALTER TABLE [dbo].[PrinterOutputGroup] ADD  CONSTRAINT [DF__PrintOutputGro__tsUpd__5BED93EA]  DEFAULT (getdate()) FOR [tsCreated]
GO
ALTER TABLE [dbo].[PrinterOutputGroup] ADD  CONSTRAINT [DF__PrintOutputGro__state__5CE1B823]  DEFAULT ((0)) FOR [statementCount]
GO
ALTER TABLE [dbo].[PrinterOutputGroup] ADD  CONSTRAINT [DF__PrintOutputGro__pageC__5DD5DC5C]  DEFAULT ((0)) FOR [pageCount]
GO
ALTER TABLE [dbo].[PrinterOutputGroup] ADD  CONSTRAINT [DF_PrintOutputGroup_archiveName]  DEFAULT (' ') FOR [archiveName]
GO
ALTER TABLE [dbo].[PrinterOutputGroup] ADD  CONSTRAINT [DF_PrintOutputGroup_PrintOutputGroupId]  DEFAULT (newid()) FOR [printerOutputGroupId]
GO
ALTER TABLE [dbo].[PrinterOutputGroup] ADD  CONSTRAINT [DF_PrintOutputGroup_perfMode]  DEFAULT ('') FOR [perfMode]
GO
ALTER TABLE [dbo].[PrinterOutputGroup] ADD  CONSTRAINT [DF_PrintOutputGroup_perCode]  DEFAULT ('') FOR [perfCode]
GO
ALTER TABLE [dbo].[PrinterOutputGroup] ADD  CONSTRAINT [DF_PrintOutputGroup_paperSize]  DEFAULT ('A4') FOR [paperSize]