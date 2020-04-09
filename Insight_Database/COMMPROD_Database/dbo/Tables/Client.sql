CREATE TABLE [dbo].[Client](
	[clientCode] [varchar](15) NOT NULL,
	[name] [varchar](100) NOT NULL,
	[tsCreated] [datetime] NOT NULL,
	[transmitStatus] [char](1) NOT NULL,
	[ipFilter] [varchar](500) NOT NULL,
	[active] [char](1) NOT NULL,
	[varianceThreshold] [int] NOT NULL,
 CONSTRAINT [PK_Client] PRIMARY KEY CLUSTERED 
(
	[clientCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Client] ADD  CONSTRAINT [DF_Client_tsCreated]  DEFAULT (getdate()) FOR [tsCreated]
GO
ALTER TABLE [dbo].[Client] ADD  CONSTRAINT [DF_Client_transmitStatus]  DEFAULT ('T') FOR [transmitStatus]
GO
ALTER TABLE [dbo].[Client] ADD  CONSTRAINT [DF_Client_ipFilter]  DEFAULT ('') FOR [ipFilter]
GO
ALTER TABLE [dbo].[Client] ADD  CONSTRAINT [DF_Client_active]  DEFAULT ('Y') FOR [active]
GO
ALTER TABLE [dbo].[Client] ADD  CONSTRAINT [DF_Client_varianceThreshold]  DEFAULT ((0)) FOR [varianceThreshold]