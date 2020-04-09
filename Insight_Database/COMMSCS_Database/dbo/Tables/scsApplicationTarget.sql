CREATE TABLE [dbo].[scsApplicationTarget](
	[targetID] [uniqueidentifier] NOT NULL,
	[applicationCode] [varchar](20) NOT NULL,
	[sequence] [int] NOT NULL,
	[targetCode] [varchar](50) NOT NULL,
	[targetName] [varchar](500) NOT NULL,
	[messageAreaWidth] [money] NOT NULL,
	[messageAreaHeight] [money] NOT NULL,
	[msrepl_tran_version] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_scsApplicationTarget_1] PRIMARY KEY CLUSTERED 
(
	[targetID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[scsApplicationTarget]  WITH CHECK ADD  CONSTRAINT [FK_scsApplicationTarget_scsApplication] FOREIGN KEY([applicationCode])
REFERENCES [dbo].[scsApplication] ([applicationCode])
GO

ALTER TABLE [dbo].[scsApplicationTarget] CHECK CONSTRAINT [FK_scsApplicationTarget_scsApplication]
GO
ALTER TABLE [dbo].[scsApplicationTarget] ADD  CONSTRAINT [DF_scsApplicationTarget_targetID]  DEFAULT (newid()) FOR [targetID]
GO
ALTER TABLE [dbo].[scsApplicationTarget] ADD  CONSTRAINT [DF_scsApplicationTarget_sequence]  DEFAULT ((1)) FOR [sequence]
GO
ALTER TABLE [dbo].[scsApplicationTarget] ADD  CONSTRAINT [DF_scsApplicationTarget_messageAreaWidth]  DEFAULT ((0)) FOR [messageAreaWidth]
GO
ALTER TABLE [dbo].[scsApplicationTarget] ADD  CONSTRAINT [DF_scsApplicationTarget_messageAreaHeight]  DEFAULT ((0)) FOR [messageAreaHeight]
GO
ALTER TABLE [dbo].[scsApplicationTarget] ADD  CONSTRAINT [MSrepl_tran_version_default_77F6A542_40AE_458E_B0DF_2B0453728D79_793769885]  DEFAULT (newid()) FOR [msrepl_tran_version]