CREATE TABLE [dbo].[scsField#ValueList](
	[fieldId] [uniqueidentifier] NOT NULL,
	[valueListId] [uniqueidentifier] NOT NULL,
	[exclusive] [char](1) NOT NULL,
	[validate] [char](1) NOT NULL,
	[msrepl_tran_version] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PKscsField#ValueList] PRIMARY KEY CLUSTERED 
(
	[fieldId] ASC,
	[valueListId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[scsField#ValueList] ADD  CONSTRAINT [DF_scsField#ValueList_validate]  DEFAULT ('N') FOR [validate]
GO
ALTER TABLE [dbo].[scsField#ValueList] ADD  CONSTRAINT [MSrepl_tran_version_default_629EF2BD_F000_4D14_85D0_79FCCA97CD92_905770284]  DEFAULT (newid()) FOR [msrepl_tran_version]