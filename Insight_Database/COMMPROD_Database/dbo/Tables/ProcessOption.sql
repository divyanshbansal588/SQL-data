CREATE TABLE [dbo].[ProcessOption](
	[clientCode] [varchar](15) NOT NULL,
	[tsCreated] [datetime] NOT NULL,
	[optionName] [varchar](15) NOT NULL,
	[description] [varchar](100) NOT NULL,
	[processName] [varchar](15) NOT NULL,
	[active] [char](1) NOT NULL,
	[createPrint] [char](1) NOT NULL,
	[createArchive] [char](1) NOT NULL,
	[createPDF] [char](1) NOT NULL,
	[createEBPP] [char](1) NOT NULL,
	[createEmail] [char](1) NOT NULL,
	[handlingCode] [char](1) NOT NULL,
	[plex] [char](1) NOT NULL,
	[inserts] [char](1) NOT NULL,
	[BRE] [char](1) NOT NULL,
	[BREstyle] [varchar](15) NOT NULL,
	[outerEnvelopeStyle] [varchar](15) NOT NULL,
	[paperSize] [varchar](15) NOT NULL,
	[perfMode] [char](1) NOT NULL,
	[perfCode] [varchar](15) NOT NULL,
	[runCampaignComposer] [char](1) NOT NULL,
	[campaignMode] [char](1) NOT NULL,
	[applicationCode] [varchar](20) NOT NULL,
	[color] [char](1) NOT NULL,
	[batchStatements] [char](1) NOT NULL,
 CONSTRAINT [PK_ProcessOption] PRIMARY KEY CLUSTERED 
(
	[clientCode] ASC,
	[optionName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ProcessOption]  WITH CHECK ADD  CONSTRAINT [FK_ProcessOption_Client] FOREIGN KEY([clientCode])
REFERENCES [dbo].[Client] ([clientCode])
GO

ALTER TABLE [dbo].[ProcessOption] CHECK CONSTRAINT [FK_ProcessOption_Client]
GO
ALTER TABLE [dbo].[ProcessOption] ADD  CONSTRAINT [DF_ProcessOption_tsCreated]  DEFAULT (getdate()) FOR [tsCreated]
GO
ALTER TABLE [dbo].[ProcessOption] ADD  CONSTRAINT [DF_ProcessOption_active]  DEFAULT ('I') FOR [active]
GO
ALTER TABLE [dbo].[ProcessOption] ADD  CONSTRAINT [DF_ProcessOption_paperSize]  DEFAULT ('A4') FOR [paperSize]
GO
ALTER TABLE [dbo].[ProcessOption] ADD  CONSTRAINT [DF_ProcessOption_color]  DEFAULT ('F') FOR [color]
GO
ALTER TABLE [dbo].[ProcessOption] ADD  CONSTRAINT [DF_ProcessOption_batchStatements]  DEFAULT ('N') FOR [batchStatements]