CREATE TABLE [dbo].[PrinterPiece](
	[tsCreated] [datetime] NOT NULL,
	[ticketNumber] [varchar](8) NOT NULL,
	[fileNumber] [int] NOT NULL,
	[pieceNumber] [int] NOT NULL,
	[clientCode] [varchar](15) NOT NULL,
	[accountNumber] [varchar](25) NOT NULL,
	[documentId] [uniqueidentifier] NOT NULL,
	[printerSegmentId] [uniqueidentifier] NOT NULL,
	[name] [varchar](500) NOT NULL,
	[documentDate] [date] NOT NULL,
	[documentType] [varchar](50) NOT NULL,
	[startPage] [int] NOT NULL,
	[pageCount] [int] NOT NULL,
	[sheetCount] [int] NOT NULL,
	[weight] [money] NOT NULL,
	[enclosures] [varchar](50) NOT NULL,
	[inserterStatus] [char](1) NOT NULL,
	[trayNumber] [int] NOT NULL,
	[trayFlag] [char](1) NOT NULL,
 CONSTRAINT [PK_PrinterPiece] PRIMARY KEY CLUSTERED 
(
	[ticketNumber] ASC,
	[pieceNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[PrinterPiece]  WITH CHECK ADD  CONSTRAINT [FK_PrinterPiece_PrinterSegment] FOREIGN KEY([printerSegmentId])
REFERENCES [dbo].[PrinterSegment] ([printerSegmentId])
GO

ALTER TABLE [dbo].[PrinterPiece] CHECK CONSTRAINT [FK_PrinterPiece_PrinterSegment]
GO
ALTER TABLE [dbo].[PrinterPiece] ADD  CONSTRAINT [DF_PrinterPiece_tsCreated]  DEFAULT (getdate()) FOR [tsCreated]
GO
ALTER TABLE [dbo].[PrinterPiece] ADD  CONSTRAINT [DF_PrinterPiece_name]  DEFAULT ('') FOR [name]
GO
ALTER TABLE [dbo].[PrinterPiece] ADD  CONSTRAINT [DF_PrinterPiece_documentType]  DEFAULT ('') FOR [documentType]
GO
ALTER TABLE [dbo].[PrinterPiece] ADD  CONSTRAINT [DF_PrinterPiece_startPage]  DEFAULT ((0)) FOR [startPage]
GO
ALTER TABLE [dbo].[PrinterPiece] ADD  CONSTRAINT [DF_PrinterPiece_pageCount]  DEFAULT ((0)) FOR [pageCount]
GO
ALTER TABLE [dbo].[PrinterPiece] ADD  CONSTRAINT [DF_PrinterPiece_sheetCount]  DEFAULT ((0)) FOR [sheetCount]
GO
ALTER TABLE [dbo].[PrinterPiece] ADD  CONSTRAINT [DF_PrinterPiece_enclosures]  DEFAULT ('') FOR [enclosures]
GO
ALTER TABLE [dbo].[PrinterPiece] ADD  CONSTRAINT [DF_PrinterPiece_inserterStatus]  DEFAULT ('') FOR [inserterStatus]
GO
ALTER TABLE [dbo].[PrinterPiece] ADD  CONSTRAINT [DF_PrinterPiece_trayNumber]  DEFAULT ((0)) FOR [trayNumber]
GO
ALTER TABLE [dbo].[PrinterPiece] ADD  CONSTRAINT [DF_PrinterPiece_trayFlag]  DEFAULT ('') FOR [trayFlag]