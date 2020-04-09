CREATE TABLE [dbo].[PrinterSegment](
	[tsCreated] [datetime] NOT NULL,
	[ticketNumber] [varchar](8) NOT NULL,
	[fileNumber] [int] NOT NULL,
	[setupCode] [varchar](8) NOT NULL,
	[segmentNumber] [int] NOT NULL,
	[printerSegmentId] [uniqueidentifier] NOT NULL,
	[printerOutputGroupId] [uniqueidentifier] NOT NULL,
	[filename] [varchar](255) NOT NULL,
	[description] [varchar](255) NOT NULL,
	[statementCount] [int] NOT NULL,
	[pageCount] [int] NOT NULL,
	[firstPieceNumber] [int] NOT NULL,
	[lastPieceNumber] [int] NOT NULL,
	[pagesToPrint] [int] NOT NULL,
	[pagesPrinted] [int] NOT NULL,
	[printingStatus] [varchar](4) NOT NULL,
	[tsPrintingStarted] [datetime] NULL,
	[tsPrintingEnded] [datetime] NULL,
	[printerId] [varchar](50) NOT NULL,
	[inserterOutputGroupId] [uniqueidentifier] NULL,
	[insertingStatus] [varchar](4) NOT NULL,
	[tsInsertingStarted] [datetime] NULL,
	[tsInsertingEnded] [datetime] NULL,
	[inserterId] [varchar](50) NOT NULL,
 CONSTRAINT [PK_PrinterSegment] PRIMARY KEY CLUSTERED 
(
	[ticketNumber] ASC,
	[fileNumber] ASC,
	[setupCode] ASC,
	[segmentNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[PrinterSegment]  WITH CHECK ADD  CONSTRAINT [FK_PrinterSegment_InserterOutputGroup] FOREIGN KEY([inserterOutputGroupId])
REFERENCES [dbo].[InserterOutputGroup] ([inserterOutputGroupId])
GO

ALTER TABLE [dbo].[PrinterSegment] CHECK CONSTRAINT [FK_PrinterSegment_InserterOutputGroup]
GO
ALTER TABLE [dbo].[PrinterSegment]  WITH CHECK ADD  CONSTRAINT [FK_PrinterSegment_PrintOutputGroup] FOREIGN KEY([printerOutputGroupId])
REFERENCES [dbo].[PrinterOutputGroup] ([printerOutputGroupId])
GO

ALTER TABLE [dbo].[PrinterSegment] CHECK CONSTRAINT [FK_PrinterSegment_PrintOutputGroup]
GO
ALTER TABLE [dbo].[PrinterSegment] ADD  CONSTRAINT [DF_PrinterSegment_tsCreated]  DEFAULT (getdate()) FOR [tsCreated]
GO
ALTER TABLE [dbo].[PrinterSegment] ADD  CONSTRAINT [DF_PrinterSegment_primtSegmentId]  DEFAULT (newid()) FOR [printerSegmentId]
GO
ALTER TABLE [dbo].[PrinterSegment] ADD  CONSTRAINT [DF_PrinterSegment_statementCount]  DEFAULT ((0)) FOR [statementCount]
GO
ALTER TABLE [dbo].[PrinterSegment] ADD  CONSTRAINT [DF_PrinterSegment_pageCount]  DEFAULT ((0)) FOR [pageCount]
GO
ALTER TABLE [dbo].[PrinterSegment] ADD  CONSTRAINT [DF_PrinterSegment_firstPieceNumber]  DEFAULT ((0)) FOR [firstPieceNumber]
GO
ALTER TABLE [dbo].[PrinterSegment] ADD  CONSTRAINT [DF_PrinterSegment_lastPieceNumber]  DEFAULT ((0)) FOR [lastPieceNumber]
GO
ALTER TABLE [dbo].[PrinterSegment] ADD  CONSTRAINT [DF_PrinterSegment_pagesToPrint]  DEFAULT ((0)) FOR [pagesToPrint]
GO
ALTER TABLE [dbo].[PrinterSegment] ADD  CONSTRAINT [DF_PrinterSegment_pagesPrinted]  DEFAULT ((0)) FOR [pagesPrinted]
GO
ALTER TABLE [dbo].[PrinterSegment] ADD  CONSTRAINT [DF_PrinterSegment_printingStatus]  DEFAULT ('') FOR [printingStatus]
GO
ALTER TABLE [dbo].[PrinterSegment] ADD  CONSTRAINT [DF_PrinterSegment_printerId]  DEFAULT ('') FOR [printerId]
GO
ALTER TABLE [dbo].[PrinterSegment] ADD  CONSTRAINT [DF_PrinterSegment_insertingStatus]  DEFAULT ('') FOR [insertingStatus]
GO
ALTER TABLE [dbo].[PrinterSegment] ADD  CONSTRAINT [DF_PrinterSegment_inserterId]  DEFAULT ('') FOR [inserterId]