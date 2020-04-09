CREATE TABLE [dbo].[scsError](
	[errorID] [uniqueidentifier] NOT NULL,
	[tsError] [datetime] NOT NULL,
	[errorMessage] [nvarchar](3800) NOT NULL,
	[msrepl_tran_version] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_scsError] PRIMARY KEY CLUSTERED 
(
	[errorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[scsError] ADD  CONSTRAINT [DF_scsError_tsError]  DEFAULT (getdate()) FOR [tsError]
GO
ALTER TABLE [dbo].[scsError] ADD  CONSTRAINT [MSrepl_tran_version_default_45971009_1025_41AF_8492_19FB60EDAEE7_727673640]  DEFAULT (newid()) FOR [msrepl_tran_version]