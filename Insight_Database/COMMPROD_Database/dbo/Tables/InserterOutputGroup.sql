CREATE TABLE [dbo].[InserterOutputGroup](
	[tsCreated] [datetime] NOT NULL,
	[ticketNumber] [varchar](8) NOT NULL,
	[fileNumber] [int] NOT NULL,
	[setupCode] [varchar](8) NOT NULL,
	[printerOutputGroupId] [uniqueidentifier] NOT NULL,
	[statementCount] [int] NOT NULL,
	[pageCount] [int] NOT NULL,
	[inserterOutputGroupId] [uniqueidentifier] NOT NULL,
	[outerEnvelopeSize] [varchar](15) NOT NULL,
 CONSTRAINT [PK_InserterOutputGroup] PRIMARY KEY CLUSTERED 
(
	[ticketNumber] ASC,
	[fileNumber] ASC,
	[setupCode] ASC,
	[outerEnvelopeSize] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[InserterOutputGroup]  WITH CHECK ADD  CONSTRAINT [FK_InsertingOutputGroup_PrintOutputGroup] FOREIGN KEY([printerOutputGroupId])
REFERENCES [dbo].[PrinterOutputGroup] ([printerOutputGroupId])
GO

ALTER TABLE [dbo].[InserterOutputGroup] CHECK CONSTRAINT [FK_InsertingOutputGroup_PrintOutputGroup]
GO
ALTER TABLE [dbo].[InserterOutputGroup] ADD  CONSTRAINT [DF__InsertingOutputGro__tsUpd__5BED93EA]  DEFAULT (getdate()) FOR [tsCreated]
GO
ALTER TABLE [dbo].[InserterOutputGroup] ADD  CONSTRAINT [DF__InsertingOutputGro__state__5CE1B823]  DEFAULT ((0)) FOR [statementCount]
GO
ALTER TABLE [dbo].[InserterOutputGroup] ADD  CONSTRAINT [DF__InsertingOutputGro__pageC__5DD5DC5C]  DEFAULT ((0)) FOR [pageCount]
GO
ALTER TABLE [dbo].[InserterOutputGroup] ADD  CONSTRAINT [DF_InsertingOutputGroup_InsertingOutputGroupId]  DEFAULT (newid()) FOR [inserterOutputGroupId]